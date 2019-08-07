class MembersController < ApplicationController
  def new
    @member = Member.new
  end

  def create
    @member = Member.new(member_params)
    
    if @member.save
      flash[:success] = '登録しました。'
      redirect_to login_path
    else
      flash.now[:danger] = '登録に失敗しました。'
      render :new
    end
  end
  
  private

  def member_params
    params.require(:member).permit(:name, :email, :password, :password_confirmation)
  end
end
