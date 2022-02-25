class TicTacToe
    attr_accessor :board

    WIN_COMBINATIONS = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,4,8],
        [2,4,6],
        [0,3,6],
        [1,4,7],
        [2,5,8]
    ]

    def initialize
        @board = Array.new(9," ")
    end
    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end
    def input_to_index(userInput)
        input = userInput.to_i - 1
    end
    def move(input,token = "X")
        board[input] = token
    end
    def position_taken?(pos)
        board[pos] != " " ? true : false
    end
    def valid_move?(pos)
        if !position_taken?(pos) && pos <= 8 && pos >= 0
            return true
        else  
            return false
        end
    end
    def turn_count
        counter = 0
        @board.each do |cell|
            if cell == "X" || cell == "O"
                counter += 1 
            end
        end
    return counter
    end
    def current_player
        (turn_count + 1).odd? ? "X" : "O"
    end
    def turn
        puts "What's the move? "
        userInput = gets.chomp
        pos = input_to_index(userInput)
        if valid_move?(pos)
            @board[pos] = current_player
            display_board
        else
            puts "Invalid move."
            turn
        end
    end
    def won?
        WIN_COMBINATIONS.each do |combo|
            if @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X"
                return combo
            elsif @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
                return combo
            else
                false
            end
        end
        false
    end
    def full?
        if @board.detect{|pos| pos == " "}
          return false
        else
          return true
        end
    end
    def draw?
        if full? == true && won?  == false
          return true
        else
          return false
        end
    end
    def over?
        if draw? == true || won? != false
          return true
        else
          return false
        end
    end
    def winner
        if won? != false
          if @board[won?[0]] == "X"
            return "X"
          else
            return "O"
          end
        else
          return nil
        end
    end
    def play
        until over?
            turn
        end
        if won?
            puts "Congratulations #{winner}!"
        else
            puts "Cat's Game!"
        end
    end
end