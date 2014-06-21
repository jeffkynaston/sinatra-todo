require_relative '../../config/application.rb'

class TasksTag < ActiveRecord::Base
  belongs_to :task
  belongs_to :tag
end