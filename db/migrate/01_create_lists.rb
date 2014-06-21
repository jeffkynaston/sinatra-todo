require_relative '../../config/application.rb'

class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do | col |
      col.string :name
      col.string :description
      col.integer :complete, default: 0
      col.date :due_by
      col.timestamps
    end
  end
end