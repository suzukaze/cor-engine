
#include "rts_object_system.h"

#include "cocos2d.h"
#include "CCGLProgramStateCache.h"
#include "cor_system/sources/logger.h"
#include "cor_type/sources/primitive/box.h"
#include "cor_cocos2dx_converter/sources/type_converter.h"

namespace cor
{
    namespace cocos2dx_converter
    {
        struct RtsObjectSystemItnl
        {
            
        };
        
        RtsObjectSystem::RtsObjectSystem() : itnl(new RtsObjectSystemItnl())
        {
            
        }
        
        RtsObjectSystem::~RtsObjectSystem()
        {
            
        }

        void RtsObjectSystem::setup_rts_rendering_state()
        {
            cocos2d::Director::getInstance()->setDepthTest(false);
            cocos2d::Director::getInstance()->setAlphaBlending(true);

        }

        cocos2d::GLProgram* rts_object_system_alpha_test_shader = NULL;
        cocos2d::GLProgram* rts_object_system_round_shader = NULL;


#define STRINGIFY(A)  #A

        void rts_object_system_load_shader()
        {
            {
                static const char* my_frag_shader = STRINGIFY(

                    \n#ifdef GL_ES\n
                    precision lowp float;
                    \n#endif\n

                        varying vec4 v_fragmentColor;
                    varying vec2 v_texCoord;
                    /*uniform float cc_alpha_value;*/

                    void main()
                    {
                        vec4 texColor = texture2D(CC_Texture0, v_texCoord);
                        float cc_alpha_value = 0.5;
                        if(texColor.a <= cc_alpha_value)
                            discard;

                        texColor.a = 1.0;
                        gl_FragColor = texColor * v_fragmentColor;
                    }
                );

                if(!rts_object_system_alpha_test_shader)
                {
                    auto ss = cocos2d::GLProgram::createWithByteArrays(cocos2d::ccPositionTextureColor_noMVP_vert, my_frag_shader);
                    rts_object_system_alpha_test_shader = ss;
                }
                else
                {
                    auto ss = rts_object_system_alpha_test_shader;
                    ss->reset();
                    ss->initWithByteArrays(cocos2d::ccPositionTextureColor_noMVP_vert, my_frag_shader);
                }

            }
            

            {
                const char* my_vert_shader = STRINGIFY(
                    attribute vec4 a_position;
                    attribute vec2 a_texCoord;
                    attribute vec4 a_color;

                    \n#ifdef GL_ES\n
                        varying lowp vec4 v_fragmentColor;
                    varying mediump vec2 v_texCoord;
                    \n#else\n
                        varying vec4 v_fragmentColor;
                    varying vec2 v_texCoord;
                    \n#endif\n

                        void main()
                    {
                        gl_Position = CC_PMatrix * a_position;
                        gl_Position.x *= 400.0;
                        gl_Position.y *= 240.0;
                        gl_Position.xy = floor(gl_Position.xy + vec2(0.5, 0.5));
                        gl_Position.x /= 400.0;
                        gl_Position.y /= 240.0;
                        v_fragmentColor = a_color;
                        v_texCoord = a_texCoord;
                    }
                );

                if(!rts_object_system_round_shader)
                {
                    auto ss = cocos2d::GLProgram::createWithByteArrays(my_vert_shader, cocos2d::ccPositionTextureColor_noMVP_frag);
                    rts_object_system_round_shader = ss;
                }
                else
                {
                    auto ss = rts_object_system_round_shader;
                    ss->reset();
                    ss->initWithByteArrays(my_vert_shader, cocos2d::ccPositionTextureColor_noMVP_frag);
                }

            }
            
        }

        void RtsObjectSystem::setup_sprite_alphatest(cocos2d::Sprite* sprite)
        {
            static cocos2d::GLProgramState* s = NULL;
            if(!s)
            {
                rts_object_system_load_shader();
                s = cocos2d::GLProgramStateCache::getInstance()->getGLProgramState(rts_object_system_alpha_test_shader);
                s->retain();
            }
            sprite->setGLProgramState(s);
        }

        void RtsObjectSystem::setup_sprite_round(cocos2d::Sprite* sprite)
        {
            static cocos2d::GLProgramState* s = NULL;
            if(!s)
            {
                rts_object_system_load_shader();
                s = cocos2d::GLProgramStateCache::getInstance()->getGLProgramState(rts_object_system_round_shader);
                s->retain();
            }
            sprite->setGLProgramState(s);
        }

        void RtsObjectSystem::setup_avoid_blur_texture(cocos2d::Texture2D* texture)
        {
            cocos2d::Texture2D::TexParams p;
            p.minFilter = GL_NEAREST;
            p.magFilter = GL_LINEAR;
            p.wrapS = GL_CLAMP_TO_EDGE;
            p.wrapT = GL_CLAMP_TO_EDGE;
            texture->setTexParameters(p);
        }

        cocos2d::Rect RtsObjectSystem::node_rect(cocos2d::Node* node)
        {
            auto bb = node->getBoundingBox();
            type::Matrix4x4F mat;
            convert(node->getNodeToWorldTransform(), mat);
            auto imat = mat.affine_inverse();
            type::Box2F b(type::Vector2F(bb.origin.x, bb.origin.y), type::Vector2F(bb.size.width, bb.size.height));
            type::Box2F ab;

            type::Box2F tb;
            if(bb.size.width > 0)
            {
                //tb.set_rect(imat, b);
                ab = b;
            }

            node->enumerateChildren("//.*", [&](cocos2d::Node* n){
                type::Matrix4x4F m;
                convert(n->getParent()->getNodeToWorldTransform(), m);

                type::Matrix4x4F tm;
                tm = imat * m;

                auto bb = n->getBoundingBox();
                type::Box2F b(type::Vector2F(bb.origin.x, bb.origin.y), type::Vector2F(bb.size.width, bb.size.height));
                type::Box2F tb;
                tb.set_rect(tm, b);
                ab.add_rect(tb);

                return false;
            });

            return cocos2d::Rect(ab.p.x, ab.p.y, ab.w.x, ab.w.y);
            
        }

        cocos2d::Rect RtsObjectSystem::nodes_rect(cocos2d::Vector<cocos2d::Node*> nodes)
        {
            //depricated
            if(nodes.size() > 0)
            {
                type::Box2F aab;


                for(auto node : nodes)
                {
                    auto bb = node->getBoundingBox();
                    type::Matrix4x4F mat;
                    convert(node->getNodeToWorldTransform(), mat);
                    auto imat = mat.affine_inverse();
                    type::Box2F b(type::Vector2F(bb.origin.x, bb.origin.y), type::Vector2F(bb.size.width, bb.size.height));
                    type::Box2F ab;
                    type::Box2F tb;
                    tb.set_rect(imat, b);
                    ab = tb;


                    node->enumerateChildren("//.*", [&](cocos2d::Node* n){
                        type::Matrix4x4F m;
                        convert(n->getParent()->getNodeToWorldTransform(), m);

                        type::Matrix4x4F tm;
                        tm = imat * m;

                        auto bb = n->getBoundingBox();
                        type::Box2F b(type::Vector2F(bb.origin.x, bb.origin.y), type::Vector2F(bb.size.width, bb.size.height));
                        type::Box2F tb;
                        tb.set_rect(tm, b);
                        ab.add_rect(tb);

                        return false;
                    });

                    tb.set_rect(mat, b);
                    ab = tb;

                    aab.add_rect(ab);
                }

                auto ab = aab;
                return cocos2d::Rect(ab.p.x, ab.p.y, ab.w.x, ab.w.y);
            }
            return cocos2d::Rect();
            
        }

        void RtsObjectSystem::on_active()
        {
            rts_object_system_load_shader();
        }


    }
}
