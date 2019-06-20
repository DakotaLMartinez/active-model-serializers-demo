class Course < ApplicationRecord
  has_many :students

  def pretty_created_date 
    created_at.strftime("%b %e, %l:%M %p")
  end
end
