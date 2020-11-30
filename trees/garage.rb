require 'pry'
class Garage
  def initialize()
    @cars = []
    @motorcycles = []
    @car_spots = @cars.length
    @motorcycle_spots= @motorcycles.length
  end

  def add_vehicle(vehicle)
    if vehicle.type == 'car'
      @cars << vehicle
    else
      @motorcycles << vehicle
    end
  end

  def self.get_cost(time)

  end

  def self.on_exit
  end

  def self.get_available_spots(type)
  end
end

class Vehicle
  attr_accessor :type, :rate, :plate
  def initialize(type, rate, plate="")
    @type = type
    @rate = rate
    @plate = plate
  end
end
