require 'rails_helper'

RSpec.describe 'User show page', type: :system do
  let!(:user) { create(:user, posts_counter: 0) }
  let!(:post) { create(:post, author: user) }

  before do
    user.update(posts_counter: user.posts.count)

    create_list(:post, 5, author: user)
    visit user_path(user)
  end

  it "displays the user's profile picture" do
    expect(page).to have_css("img[src*='#{user.photo}']")
  end

  it "displays the user's username" do
    expect(page).to have_content(user.name)
  end

  it 'displays the number of posts the user has written' do
    expect(page).to have_content("posts: #{user.posts.count}")
  end

  it "displays the user's bio" do
    expect(page).to have_content(user.bio)
  end

  it 'displays the first 3 posts of the user' do
    user.posts.last(3).each do |post|
      expect(page).to have_content(post.title)
    end
  end

  it "displays a button to view all of the user's posts" do
    expect(page).to have_link("View User's Posts", href: user_posts_path(user))
  end

  it "redirects to the user's posts index page when clicking 'View All Posts'" do
    click_link("View User's Posts")
    expect(page).to have_current_path(user_posts_path(user))
  end

  it "redirects to a post's show page when clicking a user's post" do
    visit user_posts_path(user)
    click_link(post.title)
    expect(page).to have_current_path(user_post_path(user, post))
  end
end
