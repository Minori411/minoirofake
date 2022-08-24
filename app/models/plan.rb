class Plan < ApplicationRecord
  MAX_PLANS_COUNT = 2
  belongs_to :user
  validate :plans_count_must_be_within_limit
  has_many :smallplans, dependent: :destroy
  accepts_nested_attributes_for :smallplans, allow_destroy: true

  # belongs_to :review

  def self.search(keyword, price, evaluation, chat, video)
    if keyword.present?
      plan_ids = Plan.where([
                              "title like? OR body like?OR can_do like?", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%"
                            ]).ids
      smallplan_plan_ids = Smallplan.where(["plan_name like? OR plan_detail like?", "%#{keyword}%", "%#{keyword}%"]).pluck(:plan_id)
      user_user_ids = User.where(["name like? OR prefecture like?", "%#{keyword}%", "%#{keyword}%"]).ids
    else
      plan_ids = []
      smallplan_plan_ids = []
      user_user_ids = []
    end

    smallplan = Smallplan.all
    smallplan = smallplan.where('price <= 2000') if price == "1"
    smallplan = smallplan.where('price <= 3000') if price == "2"
    smallplan = smallplan.where('price <= 4000') if price == "3"
    smallplan = smallplan.where('price = 5000') if price == "4"
    
    smallplan = smallplan.where(chat: true) if chat == "1"
    smallplan = smallplan.where(video: true) if video == "1"
    
    reviews_ids = []
    reviews_ids = Review.having('AVG(evaluation) <= 3').group(:reviewee_id).average(:evaluation).keys if evaluation == "1"
    reviews_ids = Review.having('AVG(evaluation) <= 4').group(:reviewee_id).average(:evaluation).keys if evaluation == "2"
    reviews_ids = Review.having('AVG(evaluation) = 5').group(:reviewee_id).average(:evaluation).keys if evaluation == "3"

    # 2と3(★3以下と★4以下)の場合はレビューがないユーザーも対象とする
    if evaluation == "1" || evaluation == "2"
      reviews_ids += User.where.missing(:reviewees).pluck(:id)
    end

    user_ids = User.where(id: reviews_ids).ids
    users = Plan.where(user_id: user_ids).ids
    
    # ない場合は返却
    if smallplan.present?
      small_plan = smallplan.pluck(:plan_id) 
    else
      return []
    end

    logger.warn("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@")
    logger.warn(users)#評価
    logger.warn(user_user_ids)#名前と県名
    logger.warn(small_plan)#料金
    logger.warn(smallplan_plan_ids)#smallplan
    logger.warn(plan_ids)#plan

    result_ids = Plan.all.pluck(:id)
    result_ids = result_ids & plan_ids if plan_ids.length > 0
    result_ids = result_ids & smallplan_plan_ids if smallplan_plan_ids.length > 0
    result_ids = result_ids & user_user_ids  if user_user_ids.length > 0
    result_ids = result_ids & small_plan if small_plan.length > 0
    result_ids = result_ids & users if users.length > 0

    # REVIEW 私も実装した部分ですが、断片的に対象IDを抽出するより、テーブル結合して検索する方法が使えるとよい。
    # joinsやeager_loadで複数のテーブルを結合
    # mergeメソッドで複数のテーブルに条件を指定できる
    # 参考) https://railsguides.jp/active_record_querying.html
    #
    # 例) plan と smallplanをjoinsで結合し、planに対する条件を指定し、そしてsmallplanに対する条件も指定できる
    # Plan.where(xxx)とSmallPlan.where(xxx)をまとめて記述できるようになる
    #
    where(id: (result_ids))
  end

  private

  def plans_count_must_be_within_limit
    errors.add(:base, "plans count limit: #{MAX_PLANS_COUNT}") if user.plans.count >= MAX_PLANS_COUNT
  end
end
