class Routine < ActiveRecord::Base
  attr_accessible :routine_id, :user_id, :dance_id, :number
  belongs_to :user, :class_name => "User"
  belongs_to :dance, :class_name => "Dance"
  default_scope :order => 'routines.created_at ASC'
end
