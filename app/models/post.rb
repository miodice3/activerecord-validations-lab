class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    validate :is_clickbait?
  
    CLICKBAIT_PATTERNS = [
      /Won't Believe/i,
      /Secret/i,
      /Top [0-9]*/i,
      /Guess/i
    ]
  
    def is_clickbait?
      if CLICKBAIT_PATTERNS.none? { |pat| pat.match title }
        errors.add(:title, "must be clickbait")
      end
    end
end
# validates :name, presence: true
# validates :name, uniqueness: true
# validates :phone_number, length: { is: 10 }
# validates :name, length: { minimum: 2 }
# validates :bio, length: { maximum: 500 }
# validates :password, length: { in: 6..20 }
# validates :registration_number, length: { is: 6 }

#expected `#<Post id: nil, title: "True Facts", content: "Lorem ipsum dolor sit amet, consectetur adipiscing...", summary: "Abstract.", category: "Fiction", created_at: nil, updated_at: nil>.invalid?` to return true, got false
