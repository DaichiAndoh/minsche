class GroupsController < ApplicationController
  def show
    @group = Group.find(params[:id])
    @creator = Member.find_by(id: @group.first_creator_id)
  end
    
  def new
    @group = Group.new
  end
    
  def create
    @group = Group.new(group_params)
    if @group.save
      current_member.be_first_creator(@group)
      flash[:success] = 'グループを作成しました'
      redirect_to group_schedules_path(@group)
    else
      flash[:danger] = 'グループ作成に失敗しました'
      render :new
    end
  end
    
  def edit
    @group = Group.find(params[:id])
  end
      
  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      flash[:success] = 'グループを編集しました'
      redirect_to group_schedules_path(@group)
    else
      flash[:danger] = 'グループを編集できませんでした'
      render :edit
    end
  end
  
  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    
    flash[:success] = 'グループは正常に削除されました'
    redirect_to root_url
  end
  
  def join
  end
  
  def create_join
    code = params[:code]
    password = params[:password]
    @group = Group.find_by(code: code)
    if current_member.join_group(code, password)
      flash[:success] = 'グループに参加しました'
      redirect_to group_schedules_path(@group)
    else
      flash.now[:danger] = 'グループに参加できませんでした'
      render 'join'
    end
  end
  
  private
  
  def group_params
    params.require(:group).permit(:name, :introduction, :code, :password, :password_confirmation)
    # :imageは抜いている
  end
end
