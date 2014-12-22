﻿

def cor_file_list
  [
    {
      :project => "cor_type",
      :path => "math/vector2",
      :namespace => ["cor", "type"],
      :action => [:sync, :force_create, :delete][0],
    },
    {
      :project => "cor_type",
      :path => "math/vector3",
      :namespace => ["cor", "type"],
      :action => [:sync, :force_create, :delete][0],
    },
    {
      :project => "cor_type",
      :path => "math/vector4",
      :namespace => ["cor", "type"],
      :action => [:sync, :force_create, :delete][0],
    },
    {
      :project => "cor_type",
      :path => "math/matrix4x4",
      :namespace => ["cor", "type"],
      :action => [:sync, :force_create, :delete][0],
    },
    {
      :project => "cor_type",
      :path => "primitive/box",
      :namespace => ["cor", "type"],
      :action => [:sync, :force_create, :delete][0],
    },
    {
      :project => "cor_type",
      :path => "primitive/o_box",
      :namespace => ["cor", "type"],
      :action => [:sync, :force_create, :delete][0],
    },
    {
      :project => "cor_type",
      :path => "primitive/sphere",
      :namespace => ["cor", "type"],
      :action => [:sync, :force_create, :delete][0],
    },
    {
      :project => "cor_type",
      :path => "primitive/o_sphere",
      :namespace => ["cor", "type"],
      :action => [:sync, :force_create, :delete][0],
    },
    {
      :project => "cor_type",
      :path => "collision/collision_2d",
      :namespace => ["cor", "type"],
      :action => [:sync, :force_create, :delete][0],
    },
    {
      :project => "cor_algorithm",
      :path => "utilities",
      :namespace => ["cor", "algorithm"],
      :action => [:sync, :force_create, :delete][0],
    },
    {
      :project => "cor_algorithm",
      :path => "bit_operation",
      :namespace => ["cor", "algorithm"],
      :action => [:sync, :force_create, :delete][0],
    },
    {
      :project => "cor_data_structure",
      :path => "array_pool",
      :namespace => ["cor", "data_structure"],
      :action => [:sync, :force_create, :delete][0],
    },
    {
      :project => "cor_data_structure",
      :path => "tree_pool",
      :namespace => ["cor", "data_structure"],
      :action => [:sync, :force_create, :delete][0],
    },
    {
      :project => "cor_data_structure",
      :path => "basic/shared_ptr_table",
      :namespace => ["cor", "data_structure"],
      :action => [:sync, :force_create, :delete][0],
      :no_template => true,
    },
    {
      :project => "cor_data_structure",
      :path => "geometry/r_tree_pool",
      :namespace => ["cor", "data_structure"],
      :action => [:sync, :force_create, :delete][0],
    },
    {
      :project => "cor_data_structure",
      :path => "geometry/uniform_grid",
      :namespace => ["cor", "data_structure"],
      :action => [:sync, :force_create, :delete][0],
    },
    {
      :project => "cor_data_structure",
      :path => "ai/priority_queue",
      :namespace => ["cor", "data_structure"],
      :action => [:sync, :force_create, :delete][0],
    },
    {
      :project => "cor_data_structure",
      :path => "ai/stack_decoder",
      :namespace => ["cor", "data_structure"],
      :action => [:sync, :force_create, :delete][0],
    },
    {
      :project => "cor_data_structure",
      :path => "ai/cost_grid_space",
      :namespace => ["cor", "data_structure"],
      :action => [:sync, :force_create, :delete][0],
    },
    {
      :project => "cor_system",
      :path => "job_queue",
      :namespace => ["cor", "system"],
      :action => [:sync, :force_create, :delete][0],
    },
    {
      :project => "cor_system",
      :path => "thread_pool",
      :namespace => ["cor", "system"],
      :action => [:sync, :force_create, :delete][0],
    },
    {
      :project => "cor_system",
      :path => "parallel_processor",
      :namespace => ["cor", "system"],
      :action => [:sync, :force_create, :delete][0],
    },
    {
      :project => "cor_system",
      :path => "allocation_monitor",
      :namespace => ["cor", "system"],
      :action => [:sync, :force_create, :delete][0],
    },
    {
      :project => "cor_system",
      :path => "cor_time",
      :namespace => ["cor", "system"],
      :action => [:sync, :force_create, :delete][0],
      :no_template => true,
    },
    {
      :project => "cor_cocos2dx_converter",
      :path => "type_converter",
      :namespace => ["cor", "cocos2dx_converter"],
      :action => [:sync, :force_create, :delete][0],
    },
    {
      :project => "cor_cocos2dx_converter",
      :path => "step_size_scene",
      :namespace => ["cor", "cocos2dx_converter"],
      :action => [:sync, :force_create, :delete][0],
      :no_template => true,
    },
    {
      :project => "cor_cocos2dx_converter",
      :path => "easy_http_client",
      :namespace => ["cor", "cocos2dx_converter"],
      :action => [:sync, :force_create, :delete][0],
      :no_template => true,
    },
    {
      :project => "cor_cocos2dx_converter",
      :path => "collision_2d_node",
      :namespace => ["cor", "cocos2dx_converter"],
      :action => [:sync, :force_create, :delete][0],
      :no_template => true,
    },
    {
      :project => "cor_cocos2dx_converter",
      :path => "textured_triangle_node",
      :namespace => ["cor", "cocos2dx_converter"],
      :action => [:sync, :force_create, :delete][0],
      :no_template => true,
    },
    {
      :project => "cor_cocos2dx_converter",
      :path => "cocos2dx_experimental",
      :namespace => ["cor", "cocos2dx_converter"],
      :action => [:sync, :force_create, :delete][0],
    },
    {
      :project => "cor_cocos2dx_converter",
      :path => "rts/rts_object_sensor",
      :namespace => ["cor", "cocos2dx_converter"],
      :action => [:sync, :force_create, :delete][0],
      :no_template => true,
    },
    {
      :project => "cor_cocos2dx_converter",
      :path => "rts/rts_object",
      :namespace => ["cor", "cocos2dx_converter"],
      :action => [:sync, :force_create, :delete][0],
      :no_template => true,
    },
    {
      :project => "cor_cocos2dx_converter",
      :path => "rts/rts_object_group",
      :namespace => ["cor", "cocos2dx_converter"],
      :action => [:sync, :force_create, :delete][0],
      :no_template => true,
    },
    {
      :project => "cor_cocos2dx_converter",
      :path => "rts/rts_object_system",
      :namespace => ["cor", "cocos2dx_converter"],
      :action => [:sync, :force_create, :delete][0],
      :no_template => true,
    },
    {
      :project => "cor_cocos2dx_converter",
      :path => "rts/rts_object_cost_grid_space",
      :namespace => ["cor", "cocos2dx_converter"],
      :action => [:sync, :force_create, :delete][0],
      :no_template => true,
    },
    #{
    #  :project => "cor_cocos2dx_converter",
    #  :path => "rts/rts_object_cost_grid_space_experimental",
    #  :namespace => ["cor", "cocos2dx_converter"],
    #  :action => [:sync, :force_create, :delete][0],
    #  :no_template => true,
    #},
    {
      :project => "cor_mruby_interface",
      :path => "mruby_experimental",
      :namespace => ["cor", "mruby_interface"],
      :action => [:sync, :force_create, :delete][0],
    },
    {
      :project => "cor_mruby_interface",
      :path => "mruby_array",
      :namespace => ["cor", "mruby_interface"],
      :action => [:sync, :force_create, :delete][0],
    },
    {
      :project => "cor_mruby_interface",
      :path => "mruby_ref_container",
      :namespace => ["cor", "mruby_interface"],
      :action => [:sync, :force_create, :delete][0],
      :no_template => true,
    },
    {
      :project => "cor_cocos2dx_mruby_interface",
      :path => "sprite_experimental",
      :namespace => ["cor", "cocos2dx_mruby_interface"],
      :action => [:sync, :force_create, :delete][0],
    },
    {
      :project => "cor_cocos2dx_mruby_interface",
      :path => "cocos_mruby_ref",
      :namespace => ["cor", "cocos2dx_mruby_interface"],
      :action => [:sync, :force_create, :delete][0],
      :no_template => true,
    },
    {
      :project => "cor_cocos2dx_mruby_interface",
      :path => "cocos2dx_experimental",
      :namespace => ["cor", "cocos2dx_mruby_interface"],
      :action => [:sync, :force_create, :delete][0],
      :no_template => true,
    },
    {
      :project => "cor_cocos2dx_mruby_interface",
      :path => "cocos_weak_ptr",
      :namespace => ["cor", "cocos2dx_mruby_interface"],
      :action => [:sync, :force_create, :delete][0],
    },
    {
      :project => "cor_cocos2dx_mruby_interface",
      :path => "cocos_value",
      :namespace => ["cor", "cocos2dx_mruby_interface"],
      :action => [:sync, :force_create, :delete][0],
      :no_template => true,
    },
    {
      :project => "cor_cocos2dx_mruby_interface",
      :path => "cocos_array",
      :namespace => ["cor", "cocos2dx_mruby_interface"],
      :action => [:sync, :force_create, :delete][0],
      :no_template => true,
    },
    {
      :project => "cor_cocos2dx_mruby_interface",
      :path => "mruby_script_engine",
      :namespace => ["cor", "cocos2dx_mruby_interface"],
      :action => [:sync, :force_create, :delete][0],
    },
    {
      :project => "cor_project_structure",
      :path => "application",
      :namespace => ["cor", "project_structure"],
      :action => [:sync, :force_create, :delete][0],
    },
    {
      :project => "cor_project_structure",
      :path => "project_group_scene",
      :namespace => ["cor", "project_structure"],
      :action => [:sync, :force_create, :delete][0],
    },
    {
      :project => "cor_project_structure",
      :path => "project_group",
      :namespace => ["cor", "project_structure"],
      :action => [:sync, :force_create, :delete][0],
    },
    {
      :project => "cor_project_structure",
      :path => "project_base",
      :namespace => ["cor", "project_structure"],
      :action => [:sync, :force_create, :delete][0],
    },
    {
      :project => "cor_project_structure",
      :path => "project_mruby_call",
      :namespace => ["cor", "project_structure"],
      :action => [:sync, :force_create, :delete][0],
      :no_template => true,
    },
    
    

  ]
end


