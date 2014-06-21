require_relative '../../config/application.rb'

class ListsTag < ActiveRecord::Base
  belongs_to :list
  belongs_to :tag

end