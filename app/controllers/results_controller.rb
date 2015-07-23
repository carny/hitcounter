class ResultsController < ApplicationController
	def index
		@urls = Url.all.order(:host => :asc, :path => :asc)
	end
end
