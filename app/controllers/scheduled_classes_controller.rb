class ScheduledClassesController < ApplicationController
   before_action :logged_in?
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
      create_nil_member_scheduled_class unless scheduled_class_params[:member_id].blank?
      binding.pry
      if @scheduled_class.save
         redirect_to gym_class_scheduled_classes_path and return
      else
         render :new
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

      def create_nil_member_scheduled_class
         sc = @class.scheduled_classes.create(scheduled_class_params)
         sc.member_id = nil
         sc.gym = current_gym
         sc.save
      end

end

