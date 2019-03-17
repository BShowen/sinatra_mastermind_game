class Computer

    def initialize 
        @code = []
        generate_random_code
    end

    def generate_random_code
        until @code.length == 4
            random_number = rand(9)+1
            @code << random_number unless @code.include? random_number
        end
    end

    def attempt_a_crack players_guess
        results = @code.each do |num|
            puts "index"
            if players_guess.include? num
                puts "correct guess and location" if @code.index(num) == players_guess.index(num)
                puts "correct guess wrong location" if @code.index(num) != players_guess.index(num)
            else
                puts "wrong guess"
            end
        end
    end 

end