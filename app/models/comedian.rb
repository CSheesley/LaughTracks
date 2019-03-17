class Comedian < ActiveRecord::Base
  has_many :specials

  validates :name, presence: true
  validates :age, presence: true

  def self.populate_by(params)
    if params.present?
      @comedians = Comedian.where(age: params[:age]).order(:name)
    else
      @comedians = Comedian.all.order(:name)
    end
  end

  def self.average_age
    if average(:age) then average(:age) else 0 end
  end

  def self.hometowns
    towns_string = " "
    pluck(:home_town).uniq.sort.each do |town|
      towns_string << town << " | "
      end
    towns_string
  end
end
