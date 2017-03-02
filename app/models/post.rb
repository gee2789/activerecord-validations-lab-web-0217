class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :click_bait

  def click_bait
    click_bait_titles = [
      /Won't Believe/i,
      /Secret/i,
      /Top [0-9]*/i,
      /Guess/i
    ]
    if click_bait_titles.none? { |pat| pat.match title }
      errors.add(:title, "must be clickbait")
    end
  end

end
