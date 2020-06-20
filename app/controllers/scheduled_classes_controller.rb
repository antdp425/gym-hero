class ScheduledClassesController < ApplicationController
   before_action :logged_in?
   before_action :create_class
   before_action :create_time, :create_scheduled_class, only: [:new]

   def index
      redirect_to gym_classes_path and return unless @class
      @scheduled_classes = @class.scheduled_classes.upcoming_classes
   end

   def new
   end

   def create
      @scheduled_class = @class.scheduled_classes.build(scheduled_class_params)
      @scheduled_class.gym = current_gym
      create_nil_member_scheduled_class unless scheduled_class_params[:member_id].blank?
      if @scheduled_class.save
         redirect_to gym_class_scheduled_classes_path and return
      else
         render :new
      end
   end

   private
   
      def create_class
         @class = current_gym.gym_classes.find_by(id: params[:gym_class_id])
      end

      def create_time
         @time = params[:time].to_datetime.strftime("%Y-%m-%dT%k:%M") if params[:time].present?
      end
   
      def create_scheduled_class
         @scheduled_class = @class.scheduled_classes.build
      end
   
      def scheduled_class_params
         params.require(:scheduled_class).permit(:time, :member_id)
      end

      def create_nil_member_scheduled_class
         sc = @class.scheduled_classes.create(scheduled_class_params)
         sc.member_id = nil
         sc.gym = current_gym
         sc.save
      end

end

