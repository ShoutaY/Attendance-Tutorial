class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    #debugger # インスタンス変数を定義した直後にこのメソッドが実行されます。
  end
  
  def new
     @user = User.new # ユーザーオブジェクトを生成し、インスタンス変数に代入します。
  end
  
  def create
     @user = User.new(user_params)
    if @user.save
      flash[:success] = '新規作成に成功しました。'
      redirect_to @user
      # 保存に成功した場合は、ここに記述した処理が実行されます。
    else
      render :new
    end
  end
  
  private
#Strong Parametersの個所
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
