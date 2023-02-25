class Movie < ApplicationRecord
  belongs_to :user, optional: true

  has_many :favorites, dependent: :destroy

  has_many :movie_comments, dependent: :destroy

  has_one_attached :image

  def get_image(width, height)
  unless image.attached?
    file_path = Rails.root.join('app/assets/images/image.no.png')
    image.attach(io: File.open(file_path), filename: 'default-image.png', content_type: 'image/png')
  end
  image.variant(resize_to_limit: [width, height]).processed
  end


  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def self.search_for(content, method)
      Movie.where('title LIKE ?', '%'+content+'%')
  end

end
