class PlansController < ApplicationController
    before_action :set_q, only: [:index, :search]
    before_action :move_to_signed_in

    def search
        @results = @q.result
        @plans = Plan.all
        render "index"
    end

    def index
        @plan = Plan.new
        @plans = Plan.all
        @avg_review = .where(review_id: @reviews)
        .group(:review_id)
        .average(:evaluation)
        .transform_values { |evaluation| evaluation.round(2) }
        @avg_review = @plan.user.reviews.average(:evaluation).round(2)
        @sum_plan = Plan.count(:id)
        @min_price = @plan.user.plans.minimum(:price)
    end


    def show
        @plan = Plan.find(params[:id])
        @user = User.find(@plan.user_id)
        @article = @plan.user.articles.order(created_at: :desc)
        @reviews = @user.reviews.order("created_at DESC")
        @avg_review = @plan.user.reviews.average(:evaluation).round(2)
        @relationship = Relationship.find_by(id: params[:id])
        @min_price = @plan.user.plans.minimum(:price)
            unless @reviews.present?
            @avg_score = 0
            @avg_score_percentage = 0
            else
            @avg_score = @reviews.average(:evaluation).present? ? @reviews.average(:evaluation).round(2) : 0
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

    def edit
        @plan = Plan.find(params[:id])
    end

    def new
        @plan = Plan.new
    end

    def create
        @plan = Plan.new(plan_params)
        @plan.user_id=current_user.id
        if @plan.save # もし保存ができたら
            logger.debug("成功")
            redirect_to plan_path(@plan.id)  # 投稿画面に遷移
        else  # できなければ
            logger.debug("失敗")
            logger.debug(@article.errors.full_messages)
            render :new 
        end 
    end

    def update
        begin
            #logger.debug("article_id:" + params[:article_id])
            @plan = Plan.find(params[:id])
            if @plan.update(plan_params)
                logger.debug("成功")
                redirect_to plan_path(@plan.id)
            else
                logger.debug("失敗")
                logger.debug(@article.errors.full_messages)
                render :edit
            end
        rescue => e
            logger.debug(e)
        end
    end

    def show_plan_detail
        @plan = Plan.find(params[:id])
        @user = User.find(@plan.user_id)
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

    

    private


    def move_to_signed_in
        unless user_signed_in?
        #サインインしていないユーザーはログインページが表示される
        redirect_to  '/users/sign_in'
        end
    end

    def set_q
        @q = Plan.ransack(params[:q])
    end

    def plan_params
        params.require(:plan).permit(:title, :can_do, :youtube, :body, :status, :consent, :plan_name, :price, :plan_detail, :video, :chat).merge(user_id: current_user.id)
    end
end
