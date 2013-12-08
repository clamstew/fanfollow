class Ride < ActiveRecord::Base

  has_many :passengers
  belongs_to :car
  belongs_to :event

end
