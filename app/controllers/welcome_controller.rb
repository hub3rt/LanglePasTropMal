class WelcomeController < ApplicationController
  def index
  	if user_signed_in?
	  	@annonces = Annonce.all
	  	render "annonces/index"
	end
  end
end
