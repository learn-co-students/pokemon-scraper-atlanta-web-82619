require 'pry'

class Pokemon
    attr_accessor :name, :type, :db
    attr_reader :id

    def initialize (id: nil, name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db
    end

    def self.save (name, type, db)
        insert_query = "INSERT INTO pokemon(
            name, type)
            VALUES (?, ?);"

        db.execute(insert_query, name, type)
    end

    def self.find (id, db)
        select_query = "SELECT *
        FROM pokemon
        WHERE id = ?
        LIMIT 1;"

        pokemon_from_db = db.execute(select_query, id)[0]
        pokemon = Pokemon.new(id: id, name: pokemon_from_db[1], type: pokemon_from_db[2], db: db)
    end
        
        
        
end
# binding.pry