require_relative( 'models/movie' )
require_relative( 'models/star' )
require_relative( 'models/casting' )

require( 'pry-byebug' )

Casting.delete_all()
Star.delete_all()
Movie.delete_all()

movie1 = Movie.new ({"title" => "Rocky", "genre" => "Drama"})
movie1.save()

movie2 = Movie.new ({"title" => "The Godfather", "genre" => "Crime"})
movie2.save()

movie3 = Movie.new ({"title" => "Scarface", "genre" => "Crime"})
movie3.save()

star1 = Star.new ({"first_name" => "Sylvester", "last_name" => "Stalone"})
star1.save()

star2 = Star.new ({"first_name" => "Marlon", "last_name" => "Brando"})
star2.save()

star3 = Star.new ({"first_name" => "Al", "last_name" => "Pacino"})
star3.save()

casting1 = Casting.new ({"movie_id" => movie1.id, "star_id" => star1.id, "fee" => 100000})
casting1.save()

casting2 = Casting.new ({"movie_id" => movie2.id, "star_id" => star2.id, "fee" => 200000})
casting2.save()

casting3 = Casting.new ({"movie_id" => movie3.id, "star_id" => star3.id, "fee" => 300000})
casting3.save()

movie3.genre = "action"
movie3.update()

star1.first_name = "Sly"
star1.update()

casting2.fee = 250000
casting2.update()

# movie2.delete()
# star1.delete()
# casting3.delete()


binding.pry
nil
