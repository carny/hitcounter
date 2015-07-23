class WelcomeController < ApplicationController
	def index
		return head :ok unless request.referer.present?
		Visit.create(:host => host, :path => path, :ip_address => ip_address, :session => session_id)
		render :plain => 'Thank you!'
	end

	private

	def session_id
		session[:identifier] ||= SecureRandom.hex
		session[:identifier]
	end

	def ip_address
		request.remote_ip
	end

	def host
		URI(request.referer).host
	end

	def path
		URI(request.referer).path
	end

	def cache_key
		"host-#{host}/path-#{path}"
	end

end
