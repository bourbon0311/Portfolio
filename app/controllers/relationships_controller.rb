class RelationshipsController < ApplicationController

   def follow
   	current_user.follow(params[:id])
   	redirect_to request.referrer
   end

   def unfollow
   	current_user.unfollow(params[:id])
   	redirect_to request.referrer
   end

   def follower
   	@user = User.find(params[:user_id])
   	@followers = @user.following_user
   end

   def followed
   	@user = User.find(params[:user_id])
   	@followed = @user.follower_user
   end

end
