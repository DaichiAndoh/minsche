class SchedulesController < ApplicationController
  def index
    @group = Group.find(params[:group_id])
    @relationship = Relationship.find_by(member_id: current_member.id, group_id: @group.id)
    @creator = Member.find_by(id: @group.first_creator_id)
    @schedules = @group.schedules
  end

  def show
    @group = Group.find(params[:group_id])
    @schedule = Schedule.find(params[:id])
    @relationship = Relationship.find_by(member_id: current_member.id, group_id: @group.id)
  end

  def create
    @group = Group.find(params[:group_id])
    @schedule = @group.schedules.build(schedule_params)
    if @schedule.save
      flash[:success] = '予定を追加しました。'
      redirect_to group_schedules_path(@group)
    else
      flash[:danger] = '予定を追加できませんでした。'
      render :new
    end
  end

  def new
    @group = Group.find(params[:group_id])
    @schedule = @group.schedules.build
  end

  def edit
    @group = Group.find(params[:group_id])
    @schedule = Schedule.find(params[:id])
  end

  def update
    @group = Group.find(params[:group_id])
    @schedule = Schedule.find(params[:id])
    if @schedule.update(schedule_params)
      flash[:success] = '予定を編集しました。'
      redirect_to group_schedules_path(@group)
    else
      flash[:danger] = '予定を編集できませんでした。'
      render :edit
    end
  end

  def destroy
    @group = Group.find(params[:group_id])
    @destroyed_schedule = Schedule.find(params[:id])
    @destroyed_schedule.destroy
    
    flash[:success] = '予定は正常に削除されました'
    redirect_to group_schedules_path(@group)
  end
  
  private
  
  def schedule_params
    params.require(:schedule).permit(:title, :start_time, :end_time, :place, :detail)
  end
end
