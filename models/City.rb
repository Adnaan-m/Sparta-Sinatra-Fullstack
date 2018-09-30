class City

  attr_accessor :id, :name, :capital, :place_of_interest, :country_id, :country

  def self.open_conection
    conn = PG.connect( dbname: 'places' )
  end

  # In the controller, we'll call the save method like Movie.save, so we can use self. to access the properties of the Movie (eg title, year, actors)
  def save
    conn = City.open_conection

    # IF the class instance that we're running the save method on does NOT have an ID then create, else update
    if !self.id
      sql = "INSERT INTO cities (name, capital, place_of_interest) VALUES ('#{self.name}', '#{self.capital}', '#{self.place_of_interest}')"
    else
      sql = "UPDATE cities SET name='#{self.name}', capital='#{self.capital}',place_of_interest='#{self.place_of_interest}' WHERE id='#{self.id}'"
    end

    conn.exec(sql)

  end

  def self.all

    conn = self.open_conection
    sql = "SELECT * FROM cities ORDER BY id"
    results = conn.exec(sql)

    cities = results.map do |city|
      self.hydrate city
    end
    cities

  end

  def self.all_with_country
    conn = self.open_conection
    sql = "SELECT cities.id, cities.name, cities.capital, cities.place_of_interest, cities.country_id, countries.id, countries.name, countries.continent FROM cities JOIN countries ON cities.country_id = countries.id"
    results = conn.exec(sql)

    cities = results.map do |city|
      self.hydrate city
    end

    cities
  end

  def self.find id

    conn = self.open_conection
    sql = "SELECT * FROM cities WHERE id=#{id}"

    results = conn.exec(sql)

    city = self.hydrate results[0]

    city

  end

  def self.find_with_country id

    conn = self.open_conection

    sql = "SELECT cities.id, cities.name, cities.capital, cities.place_of_interest, cities.country_id, countries.id, countries.name, countries.continent FROM countries JOIN cities ON cities.country_id = countries.id WHERE countries.id=#{id}"

    results = conn.exec(sql)

    city = self.hydrate results[0]

    city

  end

  def self.destroy id
    conn = self.open_conection
    sql = "DELETE FROM cities WHERE id=#{id}"
    conn.exec(sql)
  end

  def self.hydrate city_data
    city = City.new

    city.id = city_data['id']
    city.name = city_data['name']
    city.capital = city_data['capital']
    city.place_of_interest = city_data['place_of_interest']
    city.country_id = city_data['country_id']


    city

  end

end
