require 'rails_helper'

RSpec.describe Wiki, type: :model do
    let(:wiki) {Wiki.create!(title: "New Wiki Title", body: "Wiki Body for days", private: false)}
  
    describe "attributes" do
        it "has title, body, and private attributes" do
            expect(wiki).to have_attributes(title: "New Wiki Title", body: "Wiki Body for days", private: false)
        end
    end
end
