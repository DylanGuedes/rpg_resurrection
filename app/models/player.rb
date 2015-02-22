class Player < ActiveRecord::Base
  include ApplicationHelper
  include RpgHelper
  has_one :role
  has_many :battles
  has_one :helm
  has_one :armor
  has_one :weapon
  belongs_to :user

  def playable?
    !self.role.nil?
  end

  def hp_in_percentage
    in_percentage self.hp_max, self.hp_min
  end

  def mp_in_percentage
    in_percentage self.mp_max, self.mp_min
  end

  def exp_in_percentage
    in_percentage LEVEL_EXP[self.level - 1], self.exp
  end

  def can_purchase? item
    unless self.gold > item.price
      false
    end
  end
end
