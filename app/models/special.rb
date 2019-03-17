class Special < ActiveRecord::Base
  belongs_to :comedians

  validates :name, presence: true
  validates :run_time, presence: true

  def self.populate_from(comedians)
    Special.where(comedian_id: comedians.pluck(:id))
  end

  def self.average_run_time
    if average(:run_time) then average(:run_time) else 0 end
  end
end
