class CourseIndexSerializer < ActiveModel::Serializer
  attributes :id, :name, :instructor_name, :subject
end
