# TODO: 特別な処理をしていない場合、PlansController にリクエストを飛ばせるよう、route を編集し、コントローラを集約する

module Users
  class PlansController < ApplicationController
    def index
      @user = User.find(params[:user_id])
      @plans = @user.plans
      @careers = @user.careers
      @article = @user.articles.order(created_at: :desc)
      @reviews = @user.reviews.order("created_at DESC")
      if @reviews.present?
        @avg_score = @reviews.average(:evaluation).present? ? @reviews.average(:evaluation).round(1) : 0
        @avg_score_percentage = @reviews.average(:evaluation).round(1).to_f * 100 / 5
      else
        @avg_score = 0
        @avg_score_percentage = 0
      end
      @current_entry = Entry.where(user_id: current_user.id)
      @another_entry = Entry.where(user_id: @user.id)
      @room = Room.new

      unless @user.id == current_user.id
        @current_entry.each do |current|
          @another_entry.each do |another|
            if current.room_id == another.room_id
              @is_room = true
              @room_id = current.room_id
            end
          end
        end
        unless @is_room
          @room = Room.new
          @entry = Entry.new
        end
      end
    end

    def show
      @user = User.find(params[:user_id])
      @smallplan = Smallplan.find(params[:id])
      @plan = @smallplan.plan
      @article = @plan.user.articles.order(created_at: :desc)
      @reviews = @user.reviews.order("created_at DESC")
      @relationship = Relationship.find_by(id: params[:id])
      @min_price = @plan.smallplans.minimum(:price)
      if @reviews.present?
        @avg_score = @reviews.average(:evaluation).present? ? @reviews.average(:evaluation).round(1) : 0
        @avg_review = @plan.user.reviews.average(:evaluation).round(1)
        @avg_score_percentage = @reviews.average(:evaluation).round(1).to_f * 100 / 5
      else
        @avg_score = 0
        @avg_score_percentage = 0
        @avg_review = 0
      end
      @current_entry = Entry.where(user_id: current_user.id)
      @another_entry = Entry.where(user_id: @user.id)
      @room = Room.new
      unless @user.id == current_user.id
        @current_entry.each do |current|
          @another_entry.each do |another|
            if current.room_id == another.room_id
              @is_room = true
              @room_id = current.room_id
            end
          end
        end
        unless @is_room
          @room = Room.new
          @entry = Entry.new
        end
      end
    end

    def new
      @plan = Plan.new
    end

    def create
      @plan = Plan.new(plan_params)
      @plan.user_id = current_user.id
      if @plan.save # もし保存ができたら
        redirect_to plan_path(@plan.id) # 投稿画面に遷移
      else  # できなければ
        render :new
      end
    end

    def edit
      @plan = Plan.find(params[:id])
    end

    def update
      @user = User.find(params[:user_id])
      @plan = Plan.find(params[:id])
      @plan.assign_attributes(plan_params)
      @plan.user_id = current_user.id
      @plan.smallplans.map { |smallplan| smallplan.user_id = current_user.id }
      if @plan.save!
        redirect_to user_plans_path(@user.id)
      else
        render :edit
      end
    end

    def destroy
      @smallplan = Smallplan.find(params[:id])
      @smallplan.destroy
      redirect_to user_plans_path(params[:user_id])
    end

    private

    def plan_params
      params.require(:plan)
            .permit(
              :title, :can_do, :youtube,
              :body,
              smallplans_attributes: [:id,
                                      :plan_name, :price, :plan_detail,
                                      :video, :chat]
            )
    end
  end
end
