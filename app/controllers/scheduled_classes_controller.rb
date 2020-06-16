class ScheduledClassesController < ApplicationController

   def index
      @scheduled_classes = current_user.gym_classes.find_by(id: params[:gym_class_id]).scheduled_classes
   end

   def new
      @class = current_user.gym_classes.find_by(id: params[:gym_class_id])
      @scheduled_class = @class.scheduled_classes.build
   end

   def create
      @scheduled_class = current_user.scheduled_classes.build(scheduled_class_params)
      @scheduled_class.gym_class_id = params[:gym_class_id]
      binding.pry
      @scheduled_class.save
      redirect_to gym_class_scheduled_classes_path
   end


end

private


def scheduled_class_params
   params.require(:scheduled_class).permit(:time, :member_id)
end
