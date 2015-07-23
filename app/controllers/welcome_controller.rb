class WelcomeController < ApplicationController
	def index
		return head :ok unless request.referer.present?
		url.increment
		render :json => { :hits => url.hits }
	end

	private

	def session_id
		session[:identifier] ||= SecureRandom.hex
		session[:identifier]
	end

	def ip_address
		request.remote_ip
	end

	def url
		return @url if @url
		uri = URI(request.referer)
		url = Url.find_or_create_by(:host => uri.host, :path => uri.path)
	end

	def cache_key
		"host-#{host}/path-#{path}"
	end

end
