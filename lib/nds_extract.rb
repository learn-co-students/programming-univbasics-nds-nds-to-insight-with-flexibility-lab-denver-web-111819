# Provided, don't edit
require 'directors_database'

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
  movie_data[:director_name] = director_name

  {
    :title => movie_data[:title],
    :worldwide_gross => movie_data[:worldwide_gross],
    :release_year => movie_data[:release_year],
    :studio => movie_data[:studio],
    :director_name => movie_data[:director_name]
  }
end


# Your code after this point

def movies_with_director_key(name, movies_collection)
  collection_with_name_key = []

  movies_collection.each { |movie| collection_with_name_key << movie_with_director_name(name, movie) }

  collection_with_name_key
end


def gross_per_studio(collection)
  studio_grosses = {}
  row_index = 0
#binding.pry
  while row_index < collection.length do
    studio_name = collection[row_index][:studio]
    if !studio_grosses[studio_name]
      studio_grosses[studio_name] = collection[row_index][:worldwide_gross]
    else
      studio_grosses[studio_name] += collection[row_index][:worldwide_gross]
    end

    row_index += 1
  end

  studio_grosses
end

def movies_with_directors_set(source)
  directors_movies = []

  source.each do |director|
    one_directors_movies = []

    director[:movies].each do |film|
      movie = {}
      movie[:director_name] = director[:name]
      movie[:title] = film[:title]
      movie[:studio] = film[:studio]
      movie[:worldwide_gross] = film[:worldwide_gross]
      one_directors_movies << movie
    end

   directors_movies << one_directors_movies
  end

  directors_movies
end

# ----------------    End of Your Code Region --------------------
# Don't edit the following code! Make the methods above work with this method
# call code. You'll have to "see-saw" to get this to work!

def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)
end
