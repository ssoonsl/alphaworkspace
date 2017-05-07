# Swapping puzzle
# Swaps all pieces on either ends of the middle _ piece
# e.g. puzzle_size 7: R R R _ L L L --> L L L _ R R R
# (R pieces are destined to be on the right and L pieces on the left)

# Computational complexity: O(n^2 + n + n/2) ~= O(n^2) (I think?!)

# initialize global variables
$debug = 0

$board = []
$boardwin = []
$turn = []

$puzzle_size = 99
$moves_max = 0

def calculate_moveset
  # check that puzzle size is valid
  if $puzzle_size % 2 == 0 || $puzzle_size < 3
    raise "Invalid puzzle size"
  end

  # calculate number of playing pieces per size
  $moves_max = ($puzzle_size - 1) / 2

  # populate $turn array with moveset (i.e. the piece to move at i'th turn)
  # e.g. puzzle_size 7: $turn = R LL RRR LLL RRR LL R
  # moveset for first half (excluding mid)
  for i in (1..$moves_max)
    i.times do
      if i % 2 > 0
        $turn << "R"
      else
        $turn << "L"
      end
    end
  end

  # moveset for mid
  turn_mid = []
  $moves_max.times do
    if $moves_max % 2 == 0
      turn_mid << "R"
    else
      turn_mid << "L"
    end
  end

  # finalized moveset
  $turn += turn_mid + $turn.reverse

  p $moves_max if $debug == 1
  p $turn if $debug == 1
  p $turn.size if $debug == 1

  end

def initialize_board
  # initialize playing board
  $moves_max.times do
    $board << "R"
  end
  $board << "_"
  $moves_max.times do
    $board << "L"
  end

  # determine win config
  $boardwin = $board.reverse

  # draw board: R pieces should end up on the right, L pieces should end up on the left
  puts $board.join(" ")
end

# check against win config
def win_check
  if $board == $boardwin
    true
  else
    false
  end
end

def play
  # keep track of the number of move_only turns that need to be executed
  # if jump is executed instead of a mere move, the game will halt at the next turn
  move_only = $moves_max - 1

  # iterate over moveset array
  $turn.each_with_index { |e, i|
    puts "turn #{i}:" if $debug == 1
    if e == "R"
      # R's turn
      # move not jump if next turn is L and there are still move_only moves left
      if $turn[i + 1] == "L" && move_only > 0
        puts "moving #{e}" if $debug == 1
        swap(($board.index("_") - 1), $board.index("_"))
        move_only -= 1
        next
      end
      # if not a move_only turn, always try to jump first
      puts "trying to jump #{e}" if $debug == 1
      if $board[$board.index("_") - 2] == "R"
        swap(($board.index("_") - 2), $board.index("_"))
      # if jump is not possible, then move
      elsif $board[$board.index("_") - 1] == "R"
        swap(($board.index("_") - 1), $board.index("_"))
      else
        raise "move failed at i == #{i}"
      end
    else
      # L's turn
      # move not jump if next turn is R and there are still move_only moves left
      if $turn[i + 1] == "R" && move_only > 0
        puts "moving #{e}" if $debug == 1
        swap(($board.index("_") + 1), $board.index("_"))
        move_only -= 1
        next
      end
      # if not a move_only turn, always try to jump first
      puts "trying to jump #{e}" if $debug == 1
      if $board[$board.index("_") + 2] == "L"
        swap(($board.index("_") + 2), $board.index("_"))
      # if jump is not possible, then move
      elsif $board[$board.index("_") + 1] == "L"
        swap(($board.index("_") + 1), $board.index("_"))
      else
        raise "move failed at i == #{i}"
      end
    end
  }
end

# swaps piece with space and prints board
def swap(piece_pos, space_pos)
  puts "#{$board[piece_pos]}: from pos #{piece_pos} to #{space_pos}" if $debug == 1

  $board[space_pos] = $board[piece_pos]
  $board[piece_pos] = "_"
  puts $board.join(" ")

end

def main
  calculate_moveset
  initialize_board
  play
  if win_check
    puts "ftw!"
  else
    puts "no win; go debug"
  end
end

main
