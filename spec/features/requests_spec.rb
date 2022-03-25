feature "request" do

  scenario "submit a request for specific space" do
    # visit('/spaces')
    # User.create(email: "maker@maker.com", password: "12345@")
    
    # Space.create(name: "1 bed castle", description: "This place rocks!", price_per_night: 100, available_from: '2022-01-01', available_to: '2022-10-01', email: 'maker@maker.com')
    # # add in available dates from and to
    # click_on "Request to Book"
    # expect(current_path).to eq '/requests'
    # expect(page).to have_content "1 bed castle"
    # # expect(page).to have_content "Not confirmed"

    visit("/")
      fill_in("email", with: "maker@maker.com")
      fill_in("password", with: "12345@" )
      click_button("sign up")
      click_button 'List a new Space'
      fill_in("name", with: "1 bed castle")
      fill_in("description", with: "it's a cool house/castle")
      fill_in("price", with: 100)
      fill_in("available_from", with: "2022/03/01")
      fill_in("available_to", with: "2022/03/28")
      click_button("List my Space")
      click_on "1 bed castle"
      fill_in('request_from', with: 2022/03/01)
      fill_in('request_to', with: 2022/03/02)
      click_on 'Request to Book'
      expect(current_path).to eq '/requests'
  end

  scenario "landlord to confirm the request for a specific space" do
    User.create(email: "maker@maker.com", password: "12345@")
    space = Space.create(name: "1 bed castle", description: "This place rocks!", price_per_night: 100, available_from: '2022-01-01', available_to: '2022-10-01', email: 'maker@maker.com')
    request = Request.create(space_id: space.id, start_date:'2022-01-01', end_date:'2022-01-03')
    visit('/requests')
    click_on '1 bed castle'
    expect(page).to have_content 'Request for 1 bed castle'
    click_on 'Confirm'
    expect(current_path).to eq '/requests'
    # expect(page).to_not have_content '1 bed castle'
  end
end 
end 