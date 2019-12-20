# require_relative 'oystercard'
require_relative 'journey_log'

class Journey
   

    attr_reader :entry_station, :exit_station

    def initialize
        @entry_station = nil 
        @exit_station = nil 
    end

    def starts(station) 
        @entry_station = station 
    end

    def ends(station) 
        @exit_station = station 
    end

    def reset 
      @entry_station = nil  
      @exit_station = nil  
    end

end