class Item
    def initialize(id, author, archived, published_date)
        @id = id
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
