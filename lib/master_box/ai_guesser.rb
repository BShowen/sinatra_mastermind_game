class AiGuesser
    attr_reader :code

    def initialize 
        @code = []
        @already_guessed = Array.new 
        @new_guess = [nil,nil,nil,nil] 
        @occupied_indicies = Array.new
        generate_code 'initial_guess'
        @previous_indices = Hash.new([])
        set_previous_indices @code
    end

    def generate_code results
        if results == 'initial_guess' 
            until @code.length == 4
                random_number = rand(10)
                @code << random_number unless @code.include? random_number #cant have two of the same numbers. 
            end
            @already_guessed += @code
        else #analize old guess and make an improved guess. 
            set_previous_indices @code
            results.each_index do |index|
                case results[index] 
                when true
                    save_to_current_position(index)
                when false
                    next
                when 'almost'
                    save_guess_change_position(index,results)
                end
            end
            nil_check
            reset_for_next_guess
        end
    end

    def save_to_current_position index
        @new_guess[index] = @code[index]
        @occupied_indicies << index 
    end

    def save_guess_change_position index, results 
        @previous_indices[@code[index]] << index
        for new_index in 0..3
            if (results[new_index] == true) || (new_index == index) || (@occupied_indicies.include? new_index) || (@previous_indices[@code[index]].include? new_index)
                next
            else
                @new_guess[new_index] = @code[index]
                @occupied_indicies << new_index 
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
        if @new_guess.include? nil
            index = @new_guess.index nil 
            until @new_guess[index] != nil
                new_number = rand(10)
                @new_guess[index] = new_number unless @already_guessed.include? new_number
            end
            @already_guessed << new_number
            nil_check if @new_guess.include? nil     
        end
    end

    def set_previous_indices input
        input.each do |number|
            @previous_indices[number] += []
        end
    end
end