class WelcomeController < ApplicationController
   def index      
        #Sigueme          
		@search = $client.search("#hack4good -rt", :lang => "es").take(3).collect 
        
        #Segundo Ejemplo
		username = 'danigattoni_'
		options = {:count => 3, :include_rts => true}
		@search2  = $client.user_timeline(username, options)
        
        #Tercer Ejemplo
		topics = ["rails","request"]
        @search3 = $client.search(topics.join(","), :include_rts => false).take(3).collect

        #Cuarto Ejemplo
        @search4 = $client.search("reciclaje -rt",:result_type=>'recent',:geocode=>"-33.4691199,-70.641997,100km").take(18).collect

   end
end
