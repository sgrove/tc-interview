class Actor < ActiveRecord::Base
  has_and_belongs_to_many :movies
  validates_uniqueness_of :name

=begin
 Instructions:
  1.) Populate @movies_to_check with all actor_1's movies
  2.) Get all the actors from @movies_to_check, add to @actors unless already present
  3.) Is actor_2 in @actors?
  4a.) If so, return current level
  4b.) If not, move @movies_to_check to @movies_checked
  5.) Populate @movies_to_check with all the movies from actors in @actors
  6.) Remove entries from @movies_to_check that are in @movies_checked
  7.) Go to step 2
=end  
  def steps_to actor_2
    movies_to_check = []
    movies_checked  = []
 
    level = 0

    # Check Level 0
    movies_to_check = movies

    until movies_to_check.empty?
      # Get all actors from an array of movies
      actors = movies_to_check.collect{ |m| m.actors }.flatten.uniq
      return level if actors.include? actor_2

      # No hits at this level, mark these movies as checked
      movies_checked  = movies_checked | movies_to_check # Set union between two arrays, combine and make unique
      movies_to_check = actors.collect{ |a| a.movies }.flatten.uniq.reject { |m| movies_checked.include? m }

      # Going one level deeper, so increase level counter
      level += 1
    end

    return false # Could easily be nil, but false looks better on the frontend
  end

  def to_s
    name
  end
end
