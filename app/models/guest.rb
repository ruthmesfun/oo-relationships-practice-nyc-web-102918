class Guest
    attr_reader :name
    @@all = []

    def initialize(name)
        @name = name

        self.class.all << self
    end

    def self.all
        @@all
    end

    def trips
        Trip.all.select{|trip| trip.guest == self}
    end

    def listings
        trips.map{|trip| trip.listing}
    end

    def trip_count
        trips.count
    end

    def self.pro_traveller
        all.select{|guest| guest.trip_count > 1}
    end

    def self.find_all_by_name(name)
        all.select{|guest| guest.name == name}
    end

    


end