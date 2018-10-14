class Space
    attr_reader :scents
    attr_accessor :robot

    def initialize
        @scents = []
        @robot
    end

    def add_scent(scent)
        @scents << scent
    end

end