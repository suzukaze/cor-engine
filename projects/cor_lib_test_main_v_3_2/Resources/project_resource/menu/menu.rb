
class CorMenu
  
  attr_accessor :layer
  attr_accessor :scene
  attr_accessor :action_manager_fast
  
  def initialize
    
    self.layer = Project.get_current_layer
    self.scene = Project.get_current_scene
    
    director = Director.get_instance
    @visible_size = director.get_visible_size
    @origin = director.get_visible_origin
  
    self.action_manager_fast = self.layer.get_action_manager
    
    #label = CorSprite.create_label_atlas "test"
    #label.set_position 100, 100
    
    
    #self.scene.add_child label
    list = [
      {
        :text => "graph/graph.rb",
        :proc => (Proc.new do
          GraphTest.new
        end),
      },
      {
        :text => "basic/basic.rb",
        :proc => (Proc.new do
          BasicTest.new
        end),
      },
      {
        :text => "math/operator.rb",
        :proc => (Proc.new do
          OperatorTest.new
        end),
      },
      {
        :text => "triangle.rb",
        :proc => (Proc.new do
          TriangleTest.new
        end),
      },
      {
        :text => "sound/sound.rb",
        :proc => (Proc.new do
          SoundTest.new
        end),
      },
      
    ]
    
    lv = CorListView.new list, {:size => Size.create(@visible_size.width - 100, @visible_size.height)} do |data|
      r = Rect.create(-96 * 4 / 2, -96 / 2, 96 * 4, 96)
      sp = CorSprite.create_sprite_9 :texture => "menu/sp9bg_dark.png", :rect => r
      button = CorPanel.new :text => data[:text], :rect => r, 
        :font_name => "fonts/MTLc3m.ttf",
        :text_scale => 1.0, :sprite => sp, :disable_swallow => true
      button.sprite.set_scale 1.0
      button.on_tap do |t, e|
        Project.start_ruby_project_proc &data[:proc]
      end
      
      button.sprite
    end
    
    lv.node.set_position 0, 0
    
    self.scene.add_child lv.node
    
  end

end

