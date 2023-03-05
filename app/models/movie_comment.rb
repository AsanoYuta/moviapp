class MovieComment < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  def avg_score
    unless self.comments.empty?
      comfort.average(:rate_id).round(1)
    else
      0.0
    end
  end
  validates :comment, presence: true
end
