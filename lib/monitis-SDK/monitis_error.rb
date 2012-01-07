class MonitisError < RuntimeError
  
  attr_accessor :parent
  
  def initialize(parent)
    @parent = parent
  end
  
end