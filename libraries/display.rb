class Display

    def initialize 
      # We are going to hardcode some things here :
      @history_size = 40
      @ultimate_line_length = 38
     
      @display_history = Array.new(@history_size, " ")


    end

    #-------------------------------
    
    def window(lower_range, number_of_lines)
    
        @display_history.slice(lower_range, number_of_lines)       

    end

    #-------------------------------

    def set_display(location, display_output, new_line = false)

        if location > @history_size-1
          location = @history_size-1
        end

        if !new_line
          @display_history[location] += display_output

        else
          @display_history[location] = display_output
        end
  
    end

    #-------------------------------

    def history_line(line_number)

      if line_number >= @history_size
           @display_history[@history_size-1]
      else
           @display_history[line_number]
      end

    end

    #-------------------------------


    def add_to_history(message_string)

        history_counter = 0

        while history_counter < @history_size do

          temporary_string = @display_history[history_counter+1]
          @display_history[history_counter] = temporary_string
          history_counter += 1

        end

        @display_history[history_counter-1] = message_string

    end

    #-------------------------------

    def reset_display()
        
        end_of_array = @display_history.length()-1

        for counter in 0..end_of_array
   
           @display_history[counter] = " "

        end

    end

    #-------------------------------

    def format_and_display(string_to_format)

        line_count = 0

        while string_to_format.length > @ultimate_line_length do

          temp_string = string_to_format.slice(0, @ultimate_line_length)
    
          temp_string = temp_string.gsub("\n","  ")
          
          self.set_display(line_count, temp_string)

          string_to_format = string_to_format.slice(@ultimate_line_length, string_to_format.length)

          line_count += 1
          
        end

        self.set_display(line_count, string_to_format)

        line_count
    
    end

    #-------------------------------

    def get_history_size()

      @history_size

    end

end # Of class
