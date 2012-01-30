class User < Base

  def initialize
    #@default_options=	{:authToken=>getAuthToken}
    #  puts @default_options
  end
      
  def getUserKey(username, password)
    query = {
      :action => "userkey",
      :userName => username,
      :password => pasword
    }
    res = get("userkey", query)
  end
  
end