class Array
    def has_doubles?
        new_array = []
        boolean = false
        self.each do |item|
            if new_array.include? item
                boolean = !boolean
                break
            end
            new_array << item 
        end
        boolean
    end
end