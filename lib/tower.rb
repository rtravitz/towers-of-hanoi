class Tower
  attr_reader :posts
  def initialize(posts = {"A" => [3,2,1], "B" => [], "C" => []})
    @posts = posts
  end

  def solve
    if @posts["C"] == [3,2,1]
      puts "Solved! #{posts}"
    else
      move!
      solve
    end
  end

  def move!
    origin_post = find_largest_that_can_move
    destination_post = find_farthest_possible_move(origin_post)
    piece = @posts[origin_post].pop
    @posts[destination_post].push(piece)
    #Rules
    #1.   Move the biggest thing that you can
    #2.   Go as far to the right as you can without
    #     returning to the post that you occupied.
    #3.   Freeze the ring when it reaches its final position.
    #4.   Recurse if the final conditions are not yet met.

  end

  def find_farthest_possible_move(origin)
    pillars = ["A", "B", "C"]
    pillars.delete(origin)
    pillars.reverse!
    piece = @posts[origin].last
    pillars.each do |pillar|
      proposed_pillar = @posts[pillar].dup
      proposed_move = proposed_pillar.push(piece)
      if valid_move?(proposed_move)
        return pillar
      else
        false
      end
    end
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
    if piece <= key.min
      true
    else
      false
    end
  end

  def valid_move?(proposed_move)
    proposed_move == proposed_move.sort.reverse ? true : false
  end
end
