class HomeController < ApplicationController
	def index
    echonest = Echonest.new('PCQ8GKW2DJXO2HVNU')
    @response = echonest.profile()
    #@r2 = echonest.upload('/home/balmasi/sandbox/beatboxmachine/app/assets/audio/beatbox.wav')

	end
end
