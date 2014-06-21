require_relative '../../config/application.rb'

class JoinListsTags < ActiveRecord::Migration
  def change
    create_table :lists_tags do | col |
      col.integer :list_id
      col.integer :tag_id
      col.timestamps
    end
  end
end
