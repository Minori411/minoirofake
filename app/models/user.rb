class User < ApplicationRecord
  has_many :articles, dependent: :destroy 
  has_many :reviews
  has_many :following_relationships, foreign_key: "follower_id", class_name: "Relationship",  dependent: :destroy
  has_many :following, through: :following_relationships
  has_many :follower_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy
  has_many :followers, through: :follower_relationships
  has_many :entries, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :user_select_bottles, dependent: :destroy
  has_many :plan, dependent: :destroy
  has_many :contract

  mount_uploader :image, ImageUploader
  
  def self.search(keyword)
    where(["name like?","%#{keyword}%"])
  end

  #フォローしているかを確認するメソッド
  def following?(user)
      following_relationships.find_by(following_id: user.id)
  end

  #フォローするときのメソッド
  def follow(user)
    following_relationships.create!(following_id: user.id)
  end

  #フォローを外すときのメソッド
  def unfollow(user)
    following_relationships.find_by(following_id: user.id).destroy
  end

  def followed_by?(user_id)
    following_relationships.where(following_id: user_id).exists?
  end  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable,
          :confirmable, :trackable
          
  soft_deletable # <- kakurenbo-putiを使えるようにする

  

  # 論理削除に対応するため、validationをカスタマイズする
  validates :email, presence: true, length: { maximum: 255 }
  validates_format_of :email, with: Devise.email_regexp, if: :will_save_change_to_email?
  validates :password, presence: true, confirmation: true, length: { in: Devise.password_length }, on: :create
  validates :password, confirmation: true, length: { in: Devise.password_length }, allow_blank: true, on: :update

  # データベース認証時に使われるメソッドを上書きして、
  # without_soft_destroyedを追加する
  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    self.without_soft_destroyed.where(conditions.to_h).first
  end

  def active_for_authentication?
    super && (is_deleted == false)
  end

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
    end
  end

end
