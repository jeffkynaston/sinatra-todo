require_relative '../../config/application.rb'

class JoinTasksTags < ActiveRecord::Migration
  def change
    create_table :tasks_tags do | col |
      col.integer :task_id
      col.integer :tag_id
      col.timestamps
    end
  end
end
