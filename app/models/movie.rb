require 'hpricot'
class Movie < ActiveRecord::Base
  has_and_belongs_to_many :actors
  validates_uniqueness_of :title

  def self.parse_xml file
    Hpricot.buffer_size = 262144 # Annoying hpricot bug. Should switch to nokogiri

    # Retrieve all movie entries
    Hpricot( file ).search("//movie").each do |movie_data|

      # Create the movie if it's new
      movie = Movie.find_or_create_by_title(:title => movie_data.attributes["title"])

      # Retrieve all the movie's actors
      movie_data.search("//actor").each do |actor|

        # Create the actor if s/he is new
        movie.actors << Actor.find_or_create_by_name( :name => actor.attributes["name"] )
      end
    end
  end

  def to_s
    title
  end
end
