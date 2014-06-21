require_relative '../../config/application.rb'

class Lists < ActiveRecord::Base
  has_many :tasks
  has_many :lists_tags
  has_many :tags, through: :lists_tags

end
