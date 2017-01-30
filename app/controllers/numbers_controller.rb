class NumbersController < ApplicationController
	def index
  	session[:random] = rand(1..100) if !session[:random].present?
	end

	def create

  		flash[:message] = "You got it" 
  		flash[:status] = false

  	    if params[:number].present?
  	    	input_number = params[:number].to_i 

  	    	if input_number < session[:random]
  	    		flash[:message] = "Too Low"

  	    	elsif input_number > session[:random]
 				flash[:messsage] = "Too High" 
 				
 			else
 				flash[:status] = true
			end

 		else 
 			flash[:message] = "Type a number"
 		end
 		redirect_to action: "index"
  	end
end
