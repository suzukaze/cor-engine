

class OperatorTest

  def initialize
  
    v0 = Vector3F.create 1, 2, 3
    
    Logger.debug "v0 = #{v0.x}, #{v0.y}, #{v0.z}"
    
    v1 = v0.asterisk_1 3
    
    Logger.debug "v1 = #{v1.x}, #{v1.y}, #{v1.z}"
  
    
    #v1 = v0 * 3
    #
    #Logger.debug "v1 = #{v1.x}, #{v1.y}, #{v1.z}"
  
    
  end

end

OperatorTest.new

