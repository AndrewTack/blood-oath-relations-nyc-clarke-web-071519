class Cult

    #`Cult#name` returns a `String` that is the cult's name
    #`Cult#location`returns a `String` that is the city where the cult is located
    #`Cult#founding_year` returns a `Fixnum` that is the year the cult was founded
    #`Cult#slogan` returns a `String` that is this cult's slogan

    attr_reader :name, :location, :founding_year, :slogan

    @@all = []

    def initialize (name, location, founding_year, slogan)
        @name = name
        @location = location
        @founding_year = founding_year
        @slogan = slogan

        @@all << self

    end

    # `Cult.all` * returns an `Array` of all the cults
    def self.all
        @@all
    end

    #* `Cult#recruit_follower`takes in an argument of a `Follower` instance and adds them to this cult's list of followers
    def recruit_follower(follower)
        BloodOath.new(Date.today.to_s, self, follower)
    end

    #* `Cult#cult_population`* returns a `Fixnum` that is the number of followers in this cult
    def cult_population
        cult_population_array = []
        BloodOath.all.each do |bloodoath|
            if bloodoath.cult == self
            cult_population_array << bloodoath.follower
            end
        end
        # With Select Method 
        # BloodOath.all.select {|bloodoath| bloodoath.cult == self}.length
        cult_population_array.length
    end

    #* `Cult.find_by_name` * takes a `String` argument that is a name and returns a `Cult` instance whose name matches that argument
    def self.find_by_name(name)
        self.all.find {|cult| cult.name == name }
    end

    #* `Cult.find_by_location`* takes a `String` argument that is a location and returns an `Array` of cults that are in that location
    def self.find_by_location(location)
        self.all.select {|cult| cult.location == location}
    end

    #* `Cult.find_by_founding_year`* takes a `Fixnum` argument that is a year and returns all of the cults founded in that year
    def self.find_by_founding_year(year)
        self.all.select {|cult| cult.founding_year == year}
    end

end