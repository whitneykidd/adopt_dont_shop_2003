require 'rails_helper'

RSpec.describe "create shelter pet", type: feature do
  describe "when I go to the shelter pet index page"
    it "can click link to make new adoptable pet" do
      shelter1 = Shelter.create(name: "Find-a-Friend",
                                address: "123 North Street",
                                city: "Denver",
                                state: "CO",
                                zip: 80223 )

      # pet1 = Pet.create(image: "https://ichef.bbci.co.uk/wwfeatures/live/976_549/images/live/p0/7z/n7/p07zn7p7.jpg",
      #                   name: "Milo",
      #                   age: "2",
      #                   sex: "Male",
      #                   shelter_id: shelter1.id)
     visit "/shelters/#{shelter1.id}/pets"

     click_link "Create Pet"

     expect(current_path).to eq("/shelters/#{shelter1.id}/pets/new")

     fill_in "Image", with: "https://canineweekly.com/wp-content/uploads/2017/10/big-fluffy-dog-breeds-1024x683.jpg"
     fill_in "Name", with: "Noodle"
     fill_in "Description", with: "Big beautiful orphan"
     fill_in "Approximate Age", with: "5"
     fill_in "Sex", with: "Female"

     click_button "Create Pet"

     expect(current_path).to eq("/shelters/#{shelter1.id}/pets")
    end
end

# As a visitor
# When I visit a Shelter Pets Index page
# Then I see a link to add a new adoptable pet for that shelter "Create Pet"
# When I click the link
# I am taken to '/shelters/:shelter_id/pets/new' where I see a form to add a new adoptable pet
# When I fill in the form with the pet's:
# - image
# - name
# - description
# - approximate age
# - sex ('female' or 'male')
# And I click the button "Create Pet"
# Then a `POST` request is sent to '/shelters/:shelter_id/pets',
# a new pet is created for that shelter,
# that pet has a status of 'adoptable',
# and I am redirected to the Shelter Pets Index page where I can see the new pet listed
