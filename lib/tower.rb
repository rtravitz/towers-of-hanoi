class Tower
  attr_reader :posts
  def initialize(posts = {"A" => [3,2,1], "B" => [], "C" => []})
    @posts = posts
  end

  def move!(from = "A", to = "C", extra = "B") #add args / modify method signature if you like
    #Rules
    #1.   Move the biggest thing that you can
    #2.   Go as far to the right as you can without
    #     returning to the post that you occupied.
    #3.   Freeze the ring when it reaches its final position.
    #4.   Recurse if the final conditions are not yet met.

  end

  

  def find_largest_that_can_move
    [3,2,1].each do |piece|
      if piece_can_move?(@posts[find_piece(piece)], piece)
        return find_piece(piece)
      end
    end
  end

  def find_piece(desired, search_posts = @posts)
    search_posts.invert.map do |key, value|
      value if key.include?(desired)
    end.compact.first
  end

  def piece_can_move?(key, piece)
    piece <= key.min ? true : false
  end

  def valid_move?(proposed_move)
    proposed_move == proposed_move.sort.reverse ? true : false
  end
end

t = Tower.new
t.move!
t.posts
{"A" => [], "B" => [], "C" => [3,2,1]}
