module RequestSpecHelper
	def json_parser(data)
		return JSON.parse(data)
	end
	# def http_auth
	# 	user = 'adimn'
	# 	pass = '123'
	# 	request.env["HTTP_AUTHORIZATION"] = ActionController::HttpAuthentication::Basic.encode_credentials(user,pass)
	# end
end