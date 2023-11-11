require 'rails_helper'
RSpec.describe 'Users', type: :system do
  before do
    driven_by(:rack_test)
  end
  it 'displays usernames of other users' do
    visit users_path
    User.all.each do |user|
      expect(page).to have_content(user.username)
    end
  end
  it 'displays profiles pictures of other users' do
    visit users_path
    User.all.each do |user|
      expect(page).to have_content(user.photo)
    end
  end
  it 'displays the number of posts for each user' do
    visit users_path
    User.all.each do |user|
      expect(page).to have_content("Posts: #{user.posts_count}")
    end
  end
  it 'redirects to user show page when clicking on a user' do
    user = create(:user)
    visit root_path
    find("a[href='/users/#{user.id}']").click
    expect(page).to have_current_path(user_path(user))
  end
end
