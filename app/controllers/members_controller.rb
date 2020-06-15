class MembersController < ApplicationController
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
      @member = current_user.members.find_by(id: params[:id])
   end

   def edit
      @member = current_user.members.find_by(id: params[:id])
   end

   def update
      @member = current_user.members.find_by(id: params[:id])
      @member.update(member_params)
      redirect_to @member
   end

   private
   def member_params
      params.require(:member).permit(:name,:email,:age,:phone_number)
   end
end
