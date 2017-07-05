require_relative 'car'

class CarPark
  attr_reader :capacity, :cars

  def initialize(capacity)
    @capacity = capacity
    @cars = []
  end

  def places_left
    capacity - cars.count
  end

  def receive(cars)
    if cars.is_a? Array
      cars.each do |car|
        park_car(car)
      end
    else
      park_car(cars)
    end
  end

  def retrieve(amount)
    cars.pop(amount)
  end

  def brands
    found_brands = []
    cars.each do |car|
      found_brands << car.brand unless found_brands.include? car.brand
    end
    found_brands
  end

  def brands_stats
    stats = Hash.new(0)
    cars.each do |car|
      stats[car.brand] += 1
    end
    stats
  end

  private

  def park_car(car)
    cars << car if places_left.positive?
  end
end
