# Provided, don't edit
require 'directors_database'
require 'pry'


# A method we're giving you. This "flattens"  Arrays of Arrays so: [[1,2],
# [3,4,5], [6]] => [1,2,3,4,5,6].

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

 counter = 0 
 final_arr = []
 
 while movies_collection.length > counter
  current_movie_hash = movie_with_director_name(name, movies_collection[counter]) 
  final_arr.push(current_movie_hash)
  counter +=1
 end
 final_arr
  end
  
  
  
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



def gross_per_studio(collection)

   counter = 0 
   final_hash_studio_gross = {}
   
   while collection.length > counter do 
     current_studio = collection[counter][:studio]
      if !final_hash_studio_gross[current_studio]
        final_hash_studio_gross[current_studio] = collection[counter][:worldwide_gross]
      else 
        final_hash_studio_gross[current_studio] += collection[counter][:worldwide_gross]
      end
      counter += 1
    end
    final_hash_studio_gross
  end

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


def movies_with_directors_set(source)
  
  counter = 0 
  final_array = []
   
  while source.length > counter do
  current_director_portfolio = movies_with_director_key(source[counter][:name], source[counter][:movies])
  final_array.push(current_director_portfolio)
  counter += 1
  end
final_array
end



#       counter2 = 0 
#       final_hash[:movies] = []
#     while source[counter].length > counter2 do

#       final_array[:movies].push(source[counter2][:movies])
    
#       counter2 += 1
#   end
    
#   # push the directors name as the first key in the Hash
#     # as the second key we'll push title key with movie vlaue 
#     # 
    
#   counter += 1 

#   end
# binding.pry
  
#     final_hash
# end
  
  
  # GOAL: For each director, find their :movies Array and stick it in a new Array
  #
  # INPUT:
  # * source: An Array of Hashes containing director information including
  # :name and :movies
  #
  # RETURN:
  #
  # Array of Hashes containing all of a director's movies. Each hash will need
  # to have a :director_name key added to it.


# ----------------    End of Your Code Region --------------------
# Don't edit the following code! Make the methods above work with this method
# call code. You'll have to "see-saw" to get this to work!

def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)
end
