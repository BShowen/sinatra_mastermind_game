class AiGuesser
    attr_reader :code

    def initialize 
        @code = []
        @already_guessed = Array.new 
        @new_guess = [nil,3,8,nil] 
        @occupied_indicies = Array.new []
        generate_initial_guess
        @previous_indices = Hash.new([]) 
    end

    # analize old guess and make an improved guess. 
    def new_guess(previous_guess_results)
        set_previous_indices
        previous_guess_results.each_index do |index|
            case previous_guess_results[index] 
            when :green
                save_to_current_position(index)     
            when :red
                next
            when :blue
                save_guess_change_position(index, previous_guess_results)
            end
        end
        nil_check
        reset_for_next_guess
    end

    private
    def generate_initial_guess
        until @code.length == 4
            random_number = rand(10)

            # cant have two of the same numbers. 
            @code << random_number unless @code.include? random_number 
        end
        @already_guessed += @code
    end

    # store the index of each number in the guess so new_guess() will never generate the same guess. 
    def set_previous_indices 
        @code.each_with_index do |number, index|
            @previous_indices[number] += [index]
        end
    end

    def save_to_current_position(index)
        @new_guess[index] = @code[index]
        @occupied_indicies << index 
    end

    def save_guess_change_position(previous_index, guess_results)
        @previous_indices[@code[previous_index]] += [previous_index]
        for index in 0..3
            if guess_results[index] == :green || index == previous_index || @occupied_indicies.include?(index) || @previous_indices[ @code[previous_index] ].include?(index)
                next
            else #for the code below you can simpy use the method save_to_current_position()
                @new_guess[index] = @code[previous_index] 
                @occupied_indicies << index 
                break
            end
        end
    end

    def reset_for_next_guess
        @code = @new_guess 
        @new_guess = [nil,nil,nil,nil]
        @occupied_indicies.clear
    end

    def nil_check
        if @new_guess.include?(nil)
            index = @new_guess.index(nil)
            until @new_guess[index] != nil
                new_number = rand(10)
                @new_guess[index] = new_number unless @already_guessed.include?(new_number)
            end
            @already_guessed << new_number
            nil_check if @new_guess.include?(nil)     
        end
    end
end