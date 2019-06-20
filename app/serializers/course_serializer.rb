class CourseSerializer < ActiveModel::Serializer
  attributes :id, :name, :instructor_name, :subject, :pretty_created_date
  has_many :students, serializer: CourseStudentSerializer
end
