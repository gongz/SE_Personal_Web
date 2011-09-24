class Dance < ActiveRecord::Base

  attr_accessible :name, :level, :info, :id
  has_many :reverse_routine, :foreign_key => "dance_id",
                           :dependent => :destroy

end
