class Country

  attr_accessor :id, :name, :continent, :main_language, :population, :cities

  def self.open_connection
    conn = PG.connect( dbname: 'places')
  end

  def save
    conn = Country.open_connection

    if !self.id
      sql = "INSERT INTO countries (name, continent, main_language, population) VALUES ('#{self.name}', '#{self.continent}', '#{self.main_language}', '#{self.population}')"
    else
      sql = "UPDATE countries SET name='#{self.name}', continent='#{self.continent}', main_language='#{self.main_language}', population='#{self.population}' WHERE id=#{self.id}"
    end

    conn.exec(sql)
  end

  def self.all

    conn = self.open_connection
    sql = "SELECT countries.id, countries.name, countries.continent, countries.main_language, countries.population, cities.name AS city FROM countries LEFT JOIN cities ON  cities.country_id = countries.id"
    results = conn.exec(sql)

    countries = results.map do |country|
      self.hydrate country
    end

    countries

  end
# ///////////
  def self.find id
    conn = self.open_connection
    sql = "SELECT * FROM countries WHERE id=#{id}"
    results = conn.exec(sql)

    country = self.hydrate results[0]

    country
  end

  def self.find_with_cities id
    conn = self.open_connection
    sql = "SELECT cities.id, cities.name, cities.capital, cities.place_of_interest, cities.country_id, countries.id, countries.name, countries.continent FROM countries LEFT JOIN cities ON cities.country_id = country_id WHERE countries.id=#{id}"
    results = conn.exec(sql)

    country = self.hydrate results[0]

    country
  end

  def self.destroy id
    conn = self.open_connection
    sql = "DELETE FROM countries WHERE id=#{id}"
    conn.exec(sql)
  end

  def self.hydrate country_data
    country = Country.new

    country.id = country_data['id']
    country.name = country_data['name']
    country.continent = country_data['continent']
    country.main_language = country_data['main_language']
    country.population = country_data['population']
    country.cities = [country_data['city']]

    country
  end

end
