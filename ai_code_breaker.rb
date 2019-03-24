class AiCodeBreaker

    attr_reader :code

    def initialize 
       @code = []
       generate_code 'initial_guess'
       @already_guessed = Array.new + @code
       @almosts = Hash.new
       set_guess_index_history @code
    end

    def generate_code results
        if results == 'initial_guess' 
            until @code.length == 4
                random_number = rand(10)
                @code << random_number unless @code.include? random_number
            end
        else #analize old guess and make an improved guess. 
            set_guess_index_history @code
            @new_guess = [nil,nil,nil,nil] 
            @occupied_indicies = []
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
        @almosts[@code[index]] << index
        for i in 0..3
            if (results[i] == true) || (i == index) || (@occupied_indicies.include? i) || (@almosts[@code[index]].include? i)
                next
            else
                @new_guess[i] = @code[index]
                @occupied_indicies << i 
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

    def set_guess_index_history input
        input.each do |number|
            if  @almosts[number] == nil
                @almosts[number] = []
            end
        end
    end

end