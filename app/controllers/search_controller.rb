class SearchController < ApplicationController

  def index
    @users = User.all
    @users = User.search(params[:search]) unless params[:search].blank?
  
    respond_to do |format|
      format.html # index.html.haml
    end
  end

end