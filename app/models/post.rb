class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction),
    message: "%{value} is not a valid category" }
end
# validates :name, presence: true
# validates :name, uniqueness: true
# validates :phone_number, length: { is: 10 }
# validates :name, length: { minimum: 2 }
# validates :bio, length: { maximum: 500 }
# validates :password, length: { in: 6..20 }
# validates :registration_number, length: { is: 6 }