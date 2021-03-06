class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length:{minimum: 100}
    validates :summary, length:{maximum:  250}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
    validate :title_is_click_baity?



CLICKBAIT_PATTERNS = [
    /Won't Believe/i,
    /Secret/i,
    /Top [0-9]*/i,
    /Guess/i
  ]

   def title_is_click_baity?
     if CLICKBAIT_PATTERNS.none? { |pat| pat.match title }
      errors.add(:title, "must be clickbait")
       end
      end
    
end