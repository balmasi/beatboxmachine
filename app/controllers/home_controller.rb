class HomeController < ApplicationController
	def index
    echonest = Echonest.new('PCQ8GKW2DJXO2HVNU')
    @response = echonest.request(:get)
    
	end
end
