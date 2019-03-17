class Computer

    def initialize 
        @code = []
        generate_random_code
    end

    def generate_random_code
        until @code.length == 4
            random_number = rand(6)+1
            @code << random_number unless @code.include? random_number
        end
    end

end