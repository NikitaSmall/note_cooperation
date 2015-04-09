class CreateUserMarks < ActiveRecord::Migration
  def change
    create_table :user_marks do |t|

      t.timestamps
    end
  end
end
