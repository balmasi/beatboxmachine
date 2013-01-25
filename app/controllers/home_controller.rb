class HomeController < ApplicationController
	def index
		echonest = Echonest('PCQ8GKW2DJXO2HVNU')
		debugger
    echonest.get_beats('')
		#analysis = echonest.track.analysis(filename)
		#beats    = analysis.beats
		#segments = analysis.segments
	end
end
