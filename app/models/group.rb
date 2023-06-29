class Group < ApplicationRecord
  has_many :group_user, dependent: :destroy
  has_many :user, through: :group_users

  validates :name, presence: true
  validates :introduction, presence: true
  has_one_attached :image

  # imageを呼び出した時に中身が空だったら、assets/images/no_image.jpgを呼び出す

  def get_image
    (image.attached?) ? image : 'no_image.jpeg'
  end

end
