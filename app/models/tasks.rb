require_relative '../../config/application.rb'

class Tasks < ActiveRecord::Base
  belongs_to :list
  has_many :tasks_tags
  has_many :tags, through: :tasks_tags

end
