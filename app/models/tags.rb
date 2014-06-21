require_relative '../../config/application.rb'

class Tags < ActiveRecord::Base
  has_many :lists_tags
  has_many :lists, through: :lists_tags

  has_many :tasks_tags
  has_many :tasks, through: :tasks_tags
end
