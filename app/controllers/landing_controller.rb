class LandingController < ApplicationController
	def callback
		response = Instagram.get_access_token(params[:code], redirect_uri: ENV['REDIRECT_URI'])
		session[:access_token] = response.access_token
		response = HTTParty.get('https://api.instagram.com/v1/users/self/followed-by?access_token=1191025.62f86cf.1e0a88ccf53e48b680d754beb05ea653')
		@user_data = response['data']
		# binding.pry
	end
end