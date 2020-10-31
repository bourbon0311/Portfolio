class SearchsController < ApplicationController
def result_user
   @search_users = User.search(params[:search])
 end
end
