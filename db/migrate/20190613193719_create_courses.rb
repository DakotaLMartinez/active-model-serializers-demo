class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :name
      t.string :instructor_name
      t.string :subject

      t.timestamps
    end
  end
end
