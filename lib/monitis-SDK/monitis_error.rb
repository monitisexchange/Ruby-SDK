class MonitisError < RuntimeError
  def initialize(parent)
    @parent=parent
  end
  
  attr_accessor :parent
  
end