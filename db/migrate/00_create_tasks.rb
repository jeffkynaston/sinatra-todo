require_relative '../../config/application.rb'

class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do | col |
      col.string :name
      col.string :description
      col.date :due_by
      col.integer :complete, default: 0
      col.integer :list_id
      col.timestamps
    end
  end
end