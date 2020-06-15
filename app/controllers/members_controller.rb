class MembersController < ApplicationController
   before_action :logged_in?
   
   def index
      @members = current_user.members.all.count
   end

   def new
      @member = current_user.members.build
   end

   def create
      @member = current_user.members.build(member_params)
      if @member.save
         redirect_to @member
      else
         render :new
      end
   end

   def show
      redirect_to members_path unless @member = current_user_member
   end

   def edit
      redirect_to members_path unless @member = current_user_member   
   end

   def update
      redirect_to members_path and return unless @member = current_user_member
      @member.update(member_params)
      redirect_to @member
   end

   private

   def current_user_member
      current_user.members.find_by(id: params[:id])
   end

   def member_params
      params.require(:member).permit(:name,:email,:age,:phone_number)
   end
end
