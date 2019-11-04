class HumanGuesser
    attr_accessor :code
    
    def initialize
        @code = []
    end

    def set_code(code)
        @code = code.split('').map!(&:to_i) 
    end
end