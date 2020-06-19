class MembersController < ApplicationController
   before_action :logged_in?
   before_action :current_gym_member, only: [:show, :edit]
   
   def index
      @members = current_gym.members.ordered
   end

   def new
      @member = current_gym.members.build
   end

   def create
      @member = current_gym.members.build(member_params)
      if @member.save
         redirect_to @member
      else
         render :new
      end
   end

   def show
      redirect_to members_path unless @member
   end

   def edit
      redirect_to members_path unless @member   
   end

   def update
      redirect_to members_path and return unless @member
      if @member.update(member_params)
         redirect_to @member
      else
         render :edit
      end
   end

   private

   def current_gym_member
      @member = current_gym.members.find_by(id: params[:id])
   end

   def member_params
      params.require(:member).permit(:first_name, :last_name ,:email,:phone_number)
   end
end
