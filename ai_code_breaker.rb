class AiCodeBreaker

    attr_reader :code

    def initialize 
       @code = []
       generate_code 'initial_guess'
       @already_guessed = [] + @code
    end
    
    def generate_code results
        if results == 'initial_guess' 
            until @code.length == 4
                random_number = rand(9)+1
                @code << random_number unless @code.include? random_number
            end
        else #this is a new guess after analizing the previous guess attempt. 
            # human_code = [1,2,3,4]
            # @code = [6,3,8,4]
            #results = [false, almost,false, true]
            @new_guess = [nil,nil,nil,nil] 
            @occupied_indicies = []
            results.each_with_index do |the_hint , index|
                case results[index] 
                when true
                    @new_guess[index] = @code[index]
                    @occupied_indicies << index 
                when false
                    next
                when 'almost'
                    for i in 0..3
                        if results[i] == true
                            next
                        elsif i == index # i equals index(where 'almost' was found)
                            next
                        elsif @occupied_indicies.include? i
                            next
                        else
                            @new_guess[i] = @code[index]
                            @occupied_indicies << i 
                            break
                        end
                    end
                end
            end
            nil_check
            @code = []
            @code = @new_guess 
            @new_guess = [nil,nil,nil,nil]
            @occupied_indicies.clear
        end

    end

    def nil_check
        if @new_guess.include? nil
            index = @new_guess.index nil #index = 2
            until @new_guess[index] != nil
                new_number = rand(9)+1
                # @new_guess[index] = new_number unless @already_guessed.include? new_number
                if @already_guessed.include? new_number
                    next
                else
                    @new_guess[index] = new_number
                end
                @already_guessed << new_number 
            end
            nil_check if @new_guess.include? nil     
        end
    end

end