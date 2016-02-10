class UsersController < ApplicationController
  def index
    @users = User.all

    respond_to do |format|
      format.html
      format.json { render json: @users }
    end
  end

  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @user }
    end
  end

  def edit
    @user = User.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @user }
    end
  end

  def update
    @user = User.find(params[:id])

    @user.update user_params

    if @user.save
      respond_to do |format|
        format.html { redirect_to @user }
        format.json { render json: @user, status: :created, location: @user }
      end
    else
      respond_to do |format|
        format.html { render 'edit' }
        format.json { render status: :unprocessable_entity, json: @user.errors }
      end
    end
  end

  def destroy
    @user = User.find(params[:id])

    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_path }
      format.json { head :no_content }
    end
  end

  private
  def user_params
    params.require(:user).permit(:is_admin)
  end
end
