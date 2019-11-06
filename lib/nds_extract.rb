# Provided, don't edit
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'directors_database'
require 'pp'

# A method we're giving you. This "flattens"  Arrays of Arrays so: [[1,2],
# [3,4,5], [6]] => [1,2,3,4,5,6].

#Takes an array of arrays and flattens it into an array
#Loops through each cell and then adds it to a new array to return
def flatten_a_o_a(aoa)
  result = []
  i = 0

  while i < aoa.length do
    k = 0
    while k < aoa[i].length do
      result << aoa[i][k]
      k += 1
    end
    i += 1
  end

  result
end

#Constructs and returns a hash containing movie data and a director
def movie_with_director_name(director_name, movie_data)
  { 
    :title => movie_data[:title],
    :worldwide_gross => movie_data[:worldwide_gross],
    :release_year => movie_data[:release_year],
    :studio => movie_data[:studio],
    :director_name => director_name
  }
end


# Your code after this point

def movies_with_director_key(name, movies_collection)
  # GOAL: For each Hash in an Array (movies_collection), provide a collection
  # of movies and a directors name to the movie_with_director_name method
  # and accumulate the returned Array of movies into a new Array that's
  # returned by this method.
  #
  # INPUT:
  # * name: A director's name
  # * movies_collection: An Array of Hashes where each Hash represents a movie
  #
  # RETURN:
  #
  # Array of Hashes where each Hash represents a movie; however, they should all have a
  # :director_name key. This addition can be done by using the provided
  # movie_with_director_name method
  
  #dir_name = "Byron Poodle"
  #test_set = [{:title => "TestA"}, {:title => "TestB"}]
  
  movies_collection.length.times do |index|
    movies_collection[index][:director_name] = name
  end
  
  return movies_collection
  
end


def gross_per_studio(collection)
  # GOAL: Given an Array of Hashes where each Hash represents a movie,
  # return a Hash that includes the total worldwide_gross of all the movies from
  # each studio.
  #
  # INPUT:
  # * collection: Array of Hashes where each Hash where each Hash represents a movie
  #
  # RETURN:
  #
  # Hash whose keys are the studio names and whose values are the sum
  # total of all the worldwide_gross numbers for every movie in the input Hash
  
  #test_data = [
  #{ :title => "Movie A", :studio => "Alpha Films", :worldwide_gross => 10 },
  #{ :title => "Movie B", :studio => "Alpha Films", :worldwide_gross => 30 },
  #{ :title => "Movie C", :studio => "Omega Films", :worldwide_gross => 30 }
  #]
  
  studio_gross_hash = {}
  
  collection.length.times do |index|
    if !studio_gross_hash[collection[index][:studio]]
      studio_gross_hash[collection[index][:studio]] = collection[index][:worldwide_gross]
    else
      studio_gross_hash[collection[index][:studio]] += collection[index][:worldwide_gross]
    end
  end
  
  return studio_gross_hash
  
end

def movies_with_directors_set(source)
  # GOAL: For each director, find their :movies Array and stick it in a new Array
  #
  # INPUT:
  # * source: An Array of Hashes containing director information including
  # :name and :movies
  #
  # RETURN:
  #
  # Array of Arrays containing all of a director's movies. Each movie will need
  # to have a :director_name key added to it.
  
  # { :name => "A", :movies => [{ :title => "Test" }] }
  # becomes... [[{:title => "Test1", :director_name => "A"}],
  #...          [{:title => "Test2", :director_name => "B"}],
  #...          [{:title => "Test3", :director_name => "C"}]]
  
  movie_array = []
  
  source.length.times do |cycle_directors|
    source[cycle_directors][:movies].length.times do |cycle_titles|
      temp_array = []
      temp_hash = {}
      
      temp_hash = movie_with_director_name(
        source[cycle_directors][:name],
        source[cycle_directors][:movies][cycle_titles]
      )
      
      temp_array.push(temp_hash)
      movie_array.push(temp_array)
      
    end
  end
  
  return movie_array

end

# ----------------    End of Your Code Region --------------------
# Don't edit the following code! Make the methods above work with this method
# call code. You'll have to "see-saw" to get this to work!

def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)
end


pp flatten_a_o_a(movies_with_directors_set(directors_database))