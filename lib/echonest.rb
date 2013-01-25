class Echonest
 include HTTParty
  BASE_URL = "http://developer.echonest.com/api/v4/track"
  base_uri BASE_URL
  

  attr_accessor :secret_key

  def initialize(api_key)
	@secret_key = api_key
  end  
	
  def upload(filename)
	f = File.open(filename,'rb')
	debugger
	audio_content = f.read
	f.close
	headers = { "Content-Type" => "application/octet-stream" }
	query = {filetype: "wav",body: audio_content}
	response = Echonest.post('upload/', query: query, headers: headers)
	# Return Response or Error
	if response.success?
		response
	else
		raise response.response
	end
  end

  def profile(params = {})
  	params[:api_key] ||= @secret_key
  	params[:id] ||= 'TRTLKZV12E5AC92E11'
  	params[:bucket] = 'audio_summary'
	response = self.class.get('/profile/', query: params)
	# Return Response or Error
	if response.success?
		debugger
		analysis = self.class.get(response["response"]["track"]["audio_summary"]["analysis_url"])
		debugger
		analysis
	else
		raise response.response
	end
  end

end