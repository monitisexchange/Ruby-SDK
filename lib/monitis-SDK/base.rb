class Base 

  BASE_URL = "http://www.monitis.com/api"
  SANDBOX_URL = "http://sandbox.monitis.com/api"
  VERSION = "2"

  attr_accessor :apikey, :secretkey, :authtoken, :endpoint
   
  def initialize(apikey, secretkey, use_production = false)
    @apikey, @secretkey = apikey, secretkey
    @endpoint = use_production ? BASE_URL : SANDBOX_URL
    @authtoken = getAuthToken
  end
 
  def get(action, options = {})
    res = HTTParty.get(@endpoint, build_get_request(action, options))
    parse_response(res)
  end
  
  def post(action, options = {})
  	res = HTTParty.post(@endpoint, :body => build_request(action, options))
	  parse_response(res)
  end

  def parse_response(response)
    if response.body
      Crack::JSON.parse(response.body)
    end  
  end

  def build_request(action, options={})
    options.merge!({
         :apikey => @apikey,
         :version => VERSION,
         :validation => "token",
 	       :timestamp => Time.now.strftime("%Y-%m-%d %H:%m:%S"),
         :authToken => @authtoken,
         :action => action
    })
  end
  
  def build_get_request(action, options = {})
    options = {:query => build_request(action, options)}
   # pp options
  end  
    
  def getAuthToken()
    if @authtoken.nil?
      options = {
        :query => {
          :action => "authToken",
          :apikey => @apikey,
          :secretkey => @secretkey
        }
      }
      res = HTTParty.get(@endpoint, options)
      @authtoken = parse_response(res).fetch("authToken")
    else
      @authtoken
    end
    pp @authtoken
  end

#    Crack::JSON.parse(json).fetch("authToken")
end