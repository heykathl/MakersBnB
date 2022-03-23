feature "request" do

  scenario "submit a request for specific space" do
    visit('/')
    User.create(email: "maker@maker.com", password: "12345@") 
    Space.create(name: "1 bed castle", description: "This place rocks!", price: 100)
    # add in available dates from and to
    click_on "Request to Book"
    expect(current_path).to eq '/requests'
    expect(page).to have_content "1 bed castle"
    # expect(page).to have_content "Not confirmed"
  end
end 