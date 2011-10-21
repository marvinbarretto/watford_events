class RelationshipsController < ApplicationController
  
  before_filter :authenticate
  
  def create
    # system often used to debug:
    # raise params.inspect
    @user = User.find(params[:relationship][:followed_id])
    current_user.follow!(@user)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end

  end
  
  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow!(@user)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end

    # Two ways of doing this
    # relationship = Relationship.find(params[:id]).destroy
    # redirect_to relationship.followed    
  end
end