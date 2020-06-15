class GymClassesController < ApplicationController
   def index
      @classes = current_user.gym_classes.all.count
   end

   def new
      @class = current_user.gym_classes.build
   end

   def create
      @class = current_user.gym_classes.build(class_params)
      if @class.save
         redirect_to @class
      else
         render :new
      end
   end

   def show
      @class = current_user.gym_classes.find_by(id: params[:id])
   end

   def edit
      @class = current_user.gym_classes.find_by(id: params[:id])
   end

   def update
      @class = current_user.gym_classes.find_by(id: params[:id])
      @class.update(class_params)
      redirect_to @class
   end

   private
   def class_params
      params.require(:gym_class).permit(:name,:description,:duration,:max_size)
   end
end
