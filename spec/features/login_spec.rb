feature "Can login" do
  scenario "login successfully" do
       User.create(email: "maker@maker.com", password: "12345@") 
       visit("/login")
       fill_in("email", with: "maker@maker.com")
       fill_in("password", with: "12345@" )
       click_button("login")
       expect(current_path).to eq "/spaces"
       expect(page).to have_content "sign out"
       
  end

  scenario "login unsuccessfully" do
    visit("/login")
    fill_in("email", with: "maker@maker.com")
    fill_in("password", with: "12345@" )
    click_button("login")
    expect(current_path).to eq "/login"
    expect(page).to have_content "login unsuccessful"
    
end

end