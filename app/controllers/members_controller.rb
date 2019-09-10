class MembersController < ApplicationController
  before_action :require_user_logged_in, only: :index
  
  def index
    @group = Group.find(params[:group_id])
    @relationship = Relationship.find_by(member_id: current_member.id, group_id: @group.id)
    @creator = Member.find_by(id: @group.first_creator_id)
    @members = @group.members
    @member = current_member
  end
  
  def new
    @member = Member.new
  end

  def create
    @member = Member.new(member_params)
    
    if @member.save
      flash[:success] = '登録しました'
      redirect_to login_path
    else
      flash.now[:danger] = '登録に失敗しました'
      render :new
    end
  end
  
  def destroy
    @member = current_member
    @group = Group.find(params[:group_id])
    @relationship = Relationship.find_by(member_id: @member.id, group_id: @group.id)
    @relationship.destroy
    
    flash[:success] = 'グループから退出しました'
    redirect_to root_url
  end
  
  private

  def member_params
    params.require(:member).permit(:name, :email, :password, :password_confirmation)
  end
end
