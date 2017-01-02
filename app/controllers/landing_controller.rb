class LandingController < ApplicationController
	def callback
		response = Instagram.get_access_token(params[:code], redirect_uri: ENV['REDIRECT_URI'])
		session[:access_token] = response.access_token
		following_response = HTTParty.get("https://api.instagram.com/v1/users/self/follows?access_token=#{session[:access_token]}")
		followers_response = HTTParty.get("https://api.instagram.com/v1/users/self/followed-by?access_token=#{session[:access_token]}")
		@following_data = following_response['data']
		@followers_data = followers_response['data']
		@users_not_following_back = @following_data - @followers_data
		# binding.pry 
	end
end