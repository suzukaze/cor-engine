
class RtsButton

  attr_accessor :sprite
  attr_accessor :arg_sprite
  attr_accessor :texture_all_sprite
  attr_accessor :texture_all_sprite_parent
  attr_accessor :text_labels
  attr_accessor :all_nodes
  attr_accessor :rect
  attr_accessor :text_scale
  attr_accessor :align
  
  def initialize(options = {})
    
    texture_name = options[:texture] || "data_test_2/button_bg.png"
    text = options[:text]
    rect = options[:rect]
    self.rect = rect
    
    self.align = options[:align] || :center
    
    texture = RtsSprite.get_texture texture_name
    
    spa = nil
    if options[:texture_all]
      spa = Node.create
      tspa = RtsSprite.create_sprite_from_all options[:texture_all]
      RtsObjectSystem.setup_sprite_round tspa
      self.texture_all_sprite = tspa
      self.texture_all_sprite_parent = spa
      spa.add_child tspa
    elsif options[:texture]
      spa = Sprite.create_with_texture(texture)
    end
    
    self.all_nodes = []
    s = options[:sprite]
    if s
      self.arg_sprite = s
    end
    if s && spa
      s.add_child spa
    elsif !s && spa
      s = spa
    elsif !s
      s = Node.create
    end
    
    @on_tap = nil
    
    listener = EventListenerTouchOneByOne::create
    unless options[:disable_swallow]
      listener.set_swallow_touches true
    end
    
    old_l = nil
    
    listener.on_touch_began = Proc.new do |t, e|
      lp = t.get_location
      
      prnt = s.get_parent
      unless rect
        rect = Rts.u.node_rect s
        self.rect = rect
      end
      if rect
        prnt = s
      end
      clp = prnt.convert_to_node_space lp
      bb = rect || s.get_bounding_box
      
      if @on_tap && bb.contains_point(clp)
        old_l = lp
      end
    end
    
    listener.on_touch_moved = Proc.new do |t, e|
      l = t.get_location
      if old_l && l.get_distance(old_l) > 3.0 * 4
        old_l = nil
      end
    end
    
    listener.on_touch_ended = Proc.new do |t, e|
      
      
      if old_l && @on_tap
        @on_tap.call t, e
      end
      
      old_l = nil
    end
    
    ed = s.get_event_dispatcher
    ed.add_event_listener_with_scene_graph_priority listener, s
    
    Rts.u.each_node s do |n, level|
      ed = n.get_event_dispatcher
      l = listener.clone
      ed.add_event_listener_with_scene_graph_priority l, n
    end
    
    self.text_scale = options[:text_scale] || 0.7
    
    self.sprite = s
    self.all_nodes << s
    if s
      s.get_children.each do |cs|
        self.all_nodes << cs
      end
    end
    
    unless rect
      rect = Rts.u.node_rect s
      self.rect = rect
    end
    
    self.text_labels = []
    self.set_text text
  end
  
  def set_texture_all(name)
    if self.texture_all_sprite
      self.texture_all_sprite.remove_from_parent
      tspa = RtsSprite.create_sprite_from_all name
      self.texture_all_sprite = tspa
      self.texture_all_sprite_parent.add_child tspa
      return self.texture_all_sprite_parent
    else
      spa = Node.create
      tspa = RtsSprite.create_sprite_from_all options[:texture_all]
      self.texture_all_sprite = tspa
      self.texture_all_sprite_parent = spa
      spa.add_child tspa
      self.sprite.add_child spa
      return spa
    end
  end
  
  def set_text(text)
  
    s = self.sprite
    rect = self.rect
    align = self.align
    
    self.text_labels.each do |l|
      self.all_nodes.delete l
      l.remove_from_parent
    end
    self.text_labels = []
    if text
      text = text.to_s
      texts = text.split("\n")
    
      sb = rect || s.get_bounding_box
      sc = self.text_scale
    
      texts.each do |text|
        t = RtsSprite.create_label_atlas text
        
        tb = t.get_bounding_box
        
        p = Vec2.create
        p.x = sb.origin.x + (sb.size.width - tb.size.width * sc) / 2
        p.y = sb.origin.y + (sb.size.height - tb.size.height * sc) / 2
        
        t.set_position p
        t.set_scale sc
        
        s.add_child t
        self.text_labels << t
        self.all_nodes << t
      end
      
      h = 0
      aw = 0
      self.text_labels.each do |t|
        tb = t.get_bounding_box
        
        h = [h, tb.size.height].max
        aw = [aw, tb.size.width].max
      end
      
      ah = self.text_labels.length * h
      
      self.text_labels.each_with_index do |t, i|
        tb = t.get_bounding_box
        p = Vec2.create
        if align == :left
          p.x = sb.origin.x
        elsif align == :center
          p.x = sb.origin.x + (sb.size.width - tb.size.width) / 2
        elsif align == :right
          p.x = sb.origin.x + sb.size.width - tb.size.width
        end
        p.y = sb.origin.y + (sb.size.height - ah) / 2 + ((self.text_labels.length - i - 1) * h)
        
        t.set_position p
      end
      
    end
    
  end
  
  def self.create_default_sp9(texture_sp9, r, options = {})
    sp = RtsSprite.create_sprite_9 :texture => texture_sp9 || "data_test_2/sp9bg.png", :rect => r
    options[:sprite] = sp
    RtsButton.new options
  end
  
  def self.create_empty(options = {})
    options[:sprite] = Node.create
    RtsButton.new options
  end
  
  def set_z_order z
    ct = 0
    self.all_nodes.each do |n|
      n.set_global_z_order z #+ ct
      #n.set_global_z_order 0.0
      ct += 1
    end
    Rts.u.each_node self.sprite do |n|
      n.set_global_z_order z 
    end
  end
  
  def on_tap(&block)
    @on_tap = block
  end
  
  def call_on_tap
    @on_tap.call
  end
  
  def add_child button
    self.sprite.add_child button.sprite
  end
  
  def remove
    self.sprite.remove_from_parent
  end

end


