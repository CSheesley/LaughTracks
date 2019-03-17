class Comedian < ActiveRecord::Base
  has_many :specials

  validates :name, presence: true
  validates :age, presence: true

  def self.populate_by(params)
    @comedians = Comedian.all
    if @comedians.pluck(:age).include?(params[:age].to_i)
      @comedians = Comedian.where(age: params[:age])
    else
      @comedians = Comedian.all
    end
  end

  def self.average_age
    average(:age)
  end

  def self.hometowns
    towns_string = " "
    pluck(:home_town).uniq.sort.each do |town|
      towns_string << town << " | "
      end
    towns_string
  end
end
