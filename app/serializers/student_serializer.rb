class StudentSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :created_at, :updated_at
  belongs_to :course
end
