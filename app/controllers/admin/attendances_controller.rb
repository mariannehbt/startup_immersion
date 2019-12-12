class Admin::AttendancesController < Admin::BaseController
  before_action :get_event
  before_action :set_attendance, only: [:show, :edit, :update, :destroy]
  before_action :has_applied?, only: [:new, :create]

  # GET /attendances
  # GET /attendances.json
  def index
    @attendances = @event.attendances
  end

  private
    def get_event
      @event = Event.find(params[:event_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_attendance
      @attendance = @event.attendances.find(params[:id])
    end

    def has_applied?
      if @event.users.include?(current_user)
        flash[:danger] = 'You have already applied'
        redirect_to user_path(current_user)
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attendance_params
      params.require(:attendance).permit(:user_id, :event_id, :motivation, :comment)
    end
end
