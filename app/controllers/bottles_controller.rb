class BottlesController < ApplicationController

  def new
  end

  def create_select_bottle
      @user_select_bottle = UserSelectBottle.new
      @user_select_bottle.bottle_id = params[:bottle1,:bottle2,:bottle3,:bottle4]
      @user_select_bottle.user_id = current_user.id
      # 何を新しく保存するか指定
      if @user_select_bottle.save!
        logger.debug("成功")
      end
      
  end

  def result 
  end
  
end
