class LoginController < ApplicationController
  def index
    p params
    begin
      @user = User.find(0)
    rescue
      @user = User.new({id:0, name:"hoge", pass:"hoge"})
    end
    render json: @user
  end

  def create
    begin
      @user = User.find_by name: params[:name]
    rescue
      p "rescue"
      p user_params
      @user = User.new(user_params)
    end
    log_in @user
    render json: @user
  end

  private
  def user_params
    params.require(:user).permit(:name, :pass)
  end
end
