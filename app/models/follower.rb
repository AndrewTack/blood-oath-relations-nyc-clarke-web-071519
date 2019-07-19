class Follower

    #* `Follower#name`* returns a `String` that is the follower's name
    #* `Follower#age`* returns a `Fixnum` that is the age of the follower
    #* `Follower#life_motto`* returns a `String` that is the follower's life motto
    attr_reader :name, :age, :life_motto

    @@all = []

    def initialize (name, age, life_motto)
        @name = name
        @age = age
        @life_motto = life_motto

        @@all << self

    end

    #* `Follower.all`* returns an `Array` of all the followers

    def self.all
        @@all
    end

    #* `Follower#cults`* returns an `Array` of this follower's cults
    def cults
       followers_bloodoaths = BloodOath.all.select {|bloodoath| bloodoath.follower == self }
       followers_bloodoaths.map {|bloodoath| bloodoath.cult}
    end

    #* `Follower#join_cult`* takes in an argument of a `Cult` instance and adds this follower to the cult's list of followers
    def join_cult(cult)
        BloodOath.new(Date.today.to_s, cult, self)
    end

    #* `Follower.of_a_certain_age`* takes a `Fixnum` argument that is an age and returns an `Array` of followers who are the given age or older
  def self.of_a_certain_age(age)
    self.all.select {|follower| follower.age >= age}
  end

  #* `Follower#my_cults_slogans`* prints out all of the slogans for this follower's cults
  def my_cults_slogans
    cults.each {|cult| puts cult.slogan }
  end

  #* `Follower.most_active`* returns the `Follower` instance who has joined the most cults
  def self.most_active   
    self.all.max_by {|follower| follower.cults.length} 
  end

  #* `Follower.top_ten`* returns an `Array` of followers; they are the ten most active followers


end
