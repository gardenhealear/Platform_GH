class UsersController < ApplicationController

  def show
    if @current_user.try(:admin?)
      flash[:error] = "Accés interdit"
      return redirect_to request.referrer || root_path
    end
    @users = User.all
  end

  def logout
   session[:user_id] = nil
   flash[:info] = "A très bientôt."
   redirect_to "/pages/home"
 end

  def check
    @current_user = User.where(lastname: params[:lastname], mdp: params[:mdp]).first
    if @current_user
      session[:user_id] = @current_user.id
      flash[:info] = "Vous êtes en ligne :)"
      redirect_to "/pages/home"
    else
      session[:user_id] = nil
      flash[:info] = "Tu n'es pas celui que tu dis :("
      redirect_to "/users/login"
    end
  end
end
