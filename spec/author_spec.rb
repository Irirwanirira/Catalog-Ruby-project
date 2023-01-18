describe Author do
    before :each do
      @author = Author.new('Team', 'Jose')
    end
    describe 'testing initialize' do
      it 'creates a new Author instance' do
        expect(@author).to be_an_instance_of(Author)
      end
    end
  
    describe 'testing First name' do
      it 'expects first name to return a string' do
        expect(@author.first_name).to eql 'Team'
      end
    end
  
    describe 'testing second name' do
      it 'expects second name to return a string' do
        expect(@author.last_name).to eql 'Jose'
      end
    end

    describe 'testing for add_item' do
        let(:item) { double('item', items: []) }
        it 'creates an instance of Items' do
          expect(@author.add_items(item)).to be_an_instance_of(Item)
        end
    end
end