require 'directors_database'
require "pry"

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

def movies_with_director_key(name, movies_collection)
  newArray = []
  movies_collection.each {|x| newArray.push(movie_with_director_name(name, x))}
  newArray
end


def gross_per_studio(collection)
newHash = {}
collection.each{|x| newHash[x[:studio]] ? newHash[x[:studio]] += x[:worldwide_gross] : newHash[x[:studio]] = x[:worldwide_gross]}
p newHash
end 

def movies_with_directors_set(source)
  outer_array = []
   source.each{|x| outer_array.push(movies_with_director_key(x[:name], x[:movies]))}
  outer_array
  
end

def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)
end
