class ScheduledClassesController < ApplicationController
   def new
      @class = current_user.gym_classes.find_by(id: params[:gym_class_id])
      @scheduled_class = @class.scheduled_classes.build
   end

   def create
      @scheduled_class = current_user.scheduled_classes.build(scheduled_class_params)
      @scheduled_class.gym_id = current_user.id
      @scheduled_class.gym_class_id = params[:gym_class_id]
      @scheduled_class.save
      redirect_to dashboard_path
   end

end

def current_gym_scheduled_class
   current_user.scheduled_classes
end

def scheduled_class_params
   params.require(:scheduled_class).permit(:time, :member_id)
end
