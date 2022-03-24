feature 'can make a space' do
    scenario 'list a space successfully' do
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
        expect(current_path).to eq '/spaces'
        expect(page).to have_content '1 bed castle'
    end
end