class GymClassesController < ApplicationController
   before_action :logged_in?
   before_action :current_gym_gym_class, only: [:show, :edit, :update, :destroy]

   def index
      params[:q] ? (@classes = current_gym.gym_classes.search(params[:q])) : (@classes = current_gym.gym_classes.ordered)
   end

   def new
      @class = current_gym.gym_classes.build
      @class.scheduled_classes.build
   end

   def create
      @class = current_gym.gym_classes.build(class_params)
      @class.scheduled_classes.last.gym = current_gym if !params[:id].present?
      if @class.save
         redirect_to @class
      else
         render :new
      end
   end

   def show
      redirect_to gym_classes_path unless @class
   end

   def edit
      redirect_to gym_classes_path unless @class
   end

   def update
      redirect_to gym_classes_path and return unless @class
      if @class.update(class_params)
         redirect_to @class
      else
         render :edit
      end
   end

   def destroy
      redirect_to gym_classes_path and return unless @class
      @class.destroy
         if @class.destroyed?
            flash.notice = "#{@class.name} was successfully deleted. ✅"
            redirect_to gym_classes_path
         else
            flash.notice = "Unable to delete at this time, please try again later. ⚠️"
            redirect_to gym_classes_path
         end
   end

   private

   def current_gym_gym_class
      @class = current_gym.gym_classes.find_by(id: params[:id])
   end

   def class_params
      params.require(:gym_class).permit(
         :name,
         :description,
         :duration,
         :max_size, 
         scheduled_classes_attributes:[:time])
   end
end
