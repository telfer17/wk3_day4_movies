require_relative('../db/sql_runner')

class Movie

  attr_reader :id
  attr_accessor :title, :genre

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @title = options["title"]
    @genre = options["genre"]
  end

  def save()
    sql = "INSERT INTO movies (
    title,
    genre
  )
  VALUES (
    $1, $2
  )
  RETURNING id"
  values = [@title, @genre]
  movie = SqlRunner.run(sql, values).first
  @id = movie['id'].to_i
  end

  def update
    sql = "UPDATE movies SET (title, genre)
    = ($1, $2)
    WHERE id = $3"
    values = [@title, @genre, @id]
    SqlRunner.run(sql, values)
  end

  def delete
    sql = "DELETE FROM movies WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end


  def stars
    sql = "SELECT stars.* FROM stars INNER JOIN castings
    ON castings.star_id = stars.id
    WHERE movie_id = $1"
    values = [@id]
    stars = SqlRunner.run(sql, values)
    return result = stars.map { |star_data| Star.new(star_data) }
  end







  def self.all()
    sql = "SELECT * FROM movies"
    values = []
    movies = SqlRunner.run(sql, values)
    return result = movies.map {|movie_data| Movie.new(movie_data)}
  end

  def self.delete_all()
    sql = "DELETE FROM movies"
    values = []
    SqlRunner.run(sql, values)
  end


end
