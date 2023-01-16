class Item
    attr_accessor: 

    def initialize(date, genre, author, source, label, archived: true)
        @id = rand(1...1000)
        @genre = genre
        @author = author
        @source = source
        @label = label 
        @publish_date = date
        @archived = archived
        
    end

    def can_be_archive?()
    @archived = archived
    end

    def move_to_archive()

    end


end