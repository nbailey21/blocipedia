class WikisController < ApplicationController
  include ApplicationHelper
  
  def index
    @wikis = WikiPolicy::Scope.new(current_user, Wiki).resolve
  end

  def show
    @wiki = Wiki.find(params[:id])
    authorize @wiki
  end

  def new
    @wiki = Wiki.new
    authorize @wiki
  end
  
  def create
    @wiki = Wiki.new
    authorize @wiki
    @wiki.title = params[:wiki][:title]
    @wiki.body = params[:wiki][:body]
    @wiki.private = params[:wiki][:private]
    @wiki.user_id = current_user.id
    
    if @wiki.save
      flash[:notice] = "Wiki was saved."
      redirect_to @wiki
    else
      flash.now[:alert] = "There was an error saving the wiki. Try again."
      render :new
    end
  end

  def edit
    @wiki = Wiki.find(params[:id])
    @users = User.all
    authorize @wiki
  end
  
  def update
  	@wiki = Wiki.find(params[:id])
  	authorize @wiki
  	
  	@wiki.title = params[:wiki][:title]
  	@wiki.body = params[:wiki][:body]
  	@wiki.private = params[:wiki][:private]
  	@wiki.user = params[:wiki][:user]
  	@wiki.user_ids = params[:wiki][:user_ids] if params[:wiki][:user_ids].present?
	
  	if @wiki.save
  		flash[:notice] = "Wiki was updated."
  		redirect_to @wiki
  	else
  		flash.now[:alert] = "There was an error saving the wiki. Please try again."
  		render :edit
  	end	
  end
  
  def destroy
    
	  @wiki = Wiki.find(params[:id])
	  authorize @wiki
	
  	if @wiki.destroy
  		flash[:notice] = "\"#{@wiki.title}\" was deleted successfully."
  		redirect_to wikis_path
  	else
  		flash.now[:alert] = "There was an error deleting the post."
  		render :show
  	end
  end
end






