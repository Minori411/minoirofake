class UsersController < ApplicationController
  def following
    # @userがフォローしているユーザー
    @user  = User.find(params[:id])
    @users = @user.following
    render 'show_follow'
  end

  def followers
    # @userをフォローしているユーザー
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'show_follower'
  end

  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  def create
    @user = User.new(user_params) # 実装は終わっていないことに注意!
    if @user.save
      # 保存の成功をここで扱う。
      redirect_to root_path
    else
      render 'new'
    end
  end

  def update
    @user = User.find(current_user.id)
    Rails.logger.debug(user_params)
    if @user.update(user_params)
      redirect_to profile_path, success: t('defaults.message.edited', item: User.model_name.human)
    else
      flash.now['danger'] = t('defaults.message.not_edited', item: User.model_name.human)
      render :edit
    end
  end

  def withdrawal
    @user = User.find(params[:id])
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @user.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:twitter, :image, :name, :email, :password, :password_confirmation, :userstyle, :prefecture, :introduction, :url,
                                 :disability_passport, :certificate, :level, :experience, :icon,
                                 careers_attributes: [:started_at,
                                                      :end_at, :content])
  end
end
