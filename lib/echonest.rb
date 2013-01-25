class Echonest
 include HTTParty
  BASE_URL = "http://developer.echonest.com/api/v4/track/profile"
  base_uri BASE_URL
  

  attr_accessor :secret_key

  def initialize(api_key)
	@secret_key = api_key
  end  
	
  def request(method,params = {})
  	params[:format] ||= 'json'
  	params[:id] ||= 'TRTLKZV12E5AC92E11'
  	params[:api_key] ||= @secret_key

	if method == :post
		#self.class.post
		response = {}
	else
		response = self.class.get('/', query: params)
	end
	
	# Return Response or Error
	if response.success?
		response
	else
		raise response.response
	end
  end

end