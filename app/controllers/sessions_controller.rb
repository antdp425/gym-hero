class SessionsController < ApplicationController
   before_action :dashboard_if_logged_in, only: [:new, :create]

   def new
      @gym = Gym.new
   end

   def create
      if params[:provider].present?
         find_or_create_by_omniauth
      else
         login_traditionally
      end
   end
   
   def destroy
      reset_session
      redirect_to root_path
   end

   private

   def session_params
      params.require(:gym).permit(:email, :password)
   end

   def auth_hash
      request.env["omniauth.auth"]
   end

   def find_or_create_by_omniauth
      gym = Gym.find_or_create_by(uid: auth_hash["uid"])
      if !!gym.id
         session[:user_id] = gym.id
         redirect_to dashboard_path
      else
         gym.email = auth_hash[:info][:email]
         gym.provider_name = auth_hash[:provider]
         gym.using_provider = true
         gym.save(:validate => false)
         session[:user_id] = gym.id
         redirect_to dashboard_path
      end
   end

   def login_traditionally
      @gym = Gym.new(session_params)
      gym = Gym.find_by(email: session_params[:email])
      if gym && gym.authenticate(session_params[:password])
         session[:user_id] = gym.id
         redirect_to dashboard_path
      else
         @gym.errors[:email] << "not found / invalid Password. Please try again"
         render :new
      end
   end

end
