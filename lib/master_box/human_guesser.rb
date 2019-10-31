class HumanGuesser
    attr_reader :code
    
    def initialize
        @code = []
    end

    def guess
        puts "What is your guess?"
        @code.clear
        begin
            reply = gets.chomp[0..3].match(/\d+/)[0]
            raise unless reply.length == 4
        rescue
            puts "Invalid response. Try again."
            retry 
        end
        @code = reply.split('').map! { |str| str.to_i }
    end
end