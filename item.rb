class Item
    attr_reader :author
    def initialize(author, archived, published_date)
        @id = Random.rand(1..1000)
        @author = author
        @archived = archived
        @published_date = published_date
    end

    def can_be_archived
        @published_date>10
    end

    def add_author(author)
        @author = author
    end
end
