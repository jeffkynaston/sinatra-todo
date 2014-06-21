require_relative '../../config/application.rb'

class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do | col |
      col.string :name
      col.string :description
      col.timestamps
    end
  end
end
