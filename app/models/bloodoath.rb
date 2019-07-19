class BloodOath

       # * `BloodOath#initiation_date`* returns a `String` that is the initiation date of this blood oath in the format _YYYY-MM-DD_.
       attr_reader :initiation_date, :cult, :follower

    @@all = []


    def initialize (initiation_date, cult, follower)
        @initiation_date = initiation_date
        @cult = cult
        @follower = follower

        @@all << self
    end

    #* `BloodOath.all`* returns an `Array` of all the blood oaths
    def self.all
        @@all
    end

end