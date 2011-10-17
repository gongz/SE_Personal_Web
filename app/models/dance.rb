class Dance < ActiveRecord::Base

  attr_accessible :name, :level, :info, :id, :laststep
  has_many :reverse_routine, :foreign_key => "dance_id",
                           :dependent => :destroy

end
