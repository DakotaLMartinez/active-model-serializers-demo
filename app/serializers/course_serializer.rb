class CourseSerializer < ActiveModel::Serializer
  attributes :id, :name, :instructor_name, :subject
  has_many :students
end
