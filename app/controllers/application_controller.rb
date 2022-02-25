class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    protect_from_forgery with: :null_session  # このアクションを追加
  def after_sign_in_path_for(resource)
    "/user/#{current_user.id}"
  end

  def after_sign_out_path_for(resource)
    logout_path
  end

  protected

  # 入力フォームからアカウント名情報をDBに保存するために追加
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:userstyle,:url,:nickname,:uer_image,:email,:introduction,:career,:certificate,:disability_certificate])
  end

end
