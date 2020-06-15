class GymClassesController < ApplicationController
   before_action :logged_in?

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
      redirect_to gym_classes_path unless @class = current_user_gym_class
   end

   def edit
      redirect_to gym_classes_path unless @class = current_user_gym_class
   end

   def update
      redirect_to gym_classes_path and return unless @class = current_user_gym_class
      @class.update(class_params)
      redirect_to @class
   end

   private

   def current_user_gym_class
      current_user.gym_classes.find_by(id: params[:id])
   end

   def class_params
      params.require(:gym_class).permit(:name,:description,:duration,:max_size)
   end
end
