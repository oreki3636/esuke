

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :points, dependent: :destroy
  has_many :todolists, dependent: :destroy
  has_many :group_users, dependent: :destroy
  has_many :groups, through: :group_users

  validates :password, length: { minimum: 6 }, if: :password_required?
  validates :name, presence: true

  has_one_attached :profile_image

  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end


  def active_for_authentication?
    super && !is_deleted
  end

  #パスワードが必要な場合にのみバリデーションが実行されるようになる
  def password_required?
    new_record? || password.present?
  end

end
