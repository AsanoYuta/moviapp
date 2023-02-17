class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :profile_image

  has_many :favorites, dependent: :destroy

  has_many :movie_comments, dependent: :destroy

  validates :name, uniqueness: true

  validates :name, length: { in: 2..20 }

  def get_profile_image(width, height)
  unless profile_image.attached?
    file_path = Rails.root.join('app/assets/images/no_image.jpg')
    profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
  end
  profile_image.variant(resize_to_limit: [width, height]).processed
  end

  def self.search_for(content, method)
      User.where('name LIKE ?', '%' + content + '%')
  end

  def active_for_authentication?
    super && (is_deleted == "in_use")
  end

  def self.guest
   find_or_create_by!(name: 'guestuser' ,email: 'guest@example.com') do |user|
   user.password = SecureRandom.urlsafe_base64
   user.name = "guestuser"
  end
  end

  enum is_deleted: { in_use: false, withdrawal: true }

end
