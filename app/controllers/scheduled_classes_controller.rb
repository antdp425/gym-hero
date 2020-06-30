class ScheduledClassesController < ApplicationController
   before_action :logged_in?
   before_action :create_class
   before_action :create_time, only: [:new, :destroy]
   before_action :create_scheduled_class, only: [:new]

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
         redirect_to gym_class_scheduled_classes_path
      else
         render :new
      end
   end

   def destroy
      redirect_to gym_classes_path and return unless @class
      @scheduled_class = @class.scheduled_classes.this_session(@time)
      if @scheduled_class.destroy_all
         flash.notice = "#{@class.name} for #{@time.to_datetime.strftime("%B %d, %Y at %I:%M %p")} was cancelled. ✅"
         redirect_to dashboard_path
      else
         flash.notice = "Unable to cancel #{@class.name} for #{@time.to_datetime.strftime("%B %d, %Y at %I:%M %p")} at this time, please try again later. ⚠️"
         redirect_to dashboard_path
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

