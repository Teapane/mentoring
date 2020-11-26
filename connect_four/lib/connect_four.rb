#assume a board like this.
# [
#   %w| nil nil nil nil nil nil |,
#   %w| nil nil nil red red nil |,
#   %w| nil nil nil red black nil |,
#   %w| black nil red nil black nil |,
#   %w| red red red red black black |,
#   %w| black red black black red black |
# ]
class ConnectFour
  class << self

    def winner(board)
      check_row(board)
    end

    private

    def check_row(board)
      board.each do |row|
        return find_row_winner(row).first unless find_row_winner(row).nil?
      end
    end

    def find_row_winner(row)
      row.each_cons(4).find do |color|
        color.uniq.size == 1 && color.first != nil
      end
    end
  end
end
