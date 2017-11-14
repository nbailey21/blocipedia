class CollaboratorsController < ApplicationController
    
    def new
        @collaborator = Collaborator.new
    end
    
    def create
        wiki = Wiki.find(params[:wiki_id])
        user = User.find(params[:user_id])
        @collaborator = Collaborator.new(wiki_id: wiki.id, user_id: user.id)
        
        if @collaborator.save
            flash[:notice] = "Collaborator added to Wiki"
        else
            flash[:alert] = "Unable to add collaborator."
        end
        
        redirect_to [wiki]
    end
    
    def destroy
        @wiki = Wiki.find(params[:wiki_id])
        @collaborator = Collaborator.find(params[:id])
        
        if @collaborator.destroy
  		    flash[:notice] = "User was successfully removed as collaborator."
  		    redirect_to @wiki
  	    else
  		    flash.now[:alert] = "There was an error removing the collaborator."
  		    render :show
  	    end
    end
    
end
