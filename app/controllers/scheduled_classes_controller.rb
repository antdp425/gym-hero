class ScheduledClassesController < ApplicationController
   before_action :get_class, only: [:new, :create]
   before_action :get_scheduled_class, only: [:new]

   def index
      @scheduled_classes = current_gym.gym_classes.find_by(id: params[:gym_class_id]).scheduled_classes
   end

   def new
   end

   def create
      @scheduled_class = @class.scheduled_classes.build(scheduled_class_params)
      @scheduled_class.gym = current_gym
      binding.pry
      if @scheduled_class.save
         redirect_to gym_class_scheduled_classes_path and return
      else
         render :new
      end
   end


end

private

def get_class
   @class = current_gym.gym_classes.find_by(id: params[:gym_class_id])
end

def get_scheduled_class
   @scheduled_class = @class.scheduled_classes.build
end

def scheduled_class_params
   params.require(:scheduled_class).permit(:time, :member_id)
end
