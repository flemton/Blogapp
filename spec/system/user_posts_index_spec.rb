require 'rails_helper'

RSpec.describe 'User post index page', type: :system do
  let(:user) { create(:user, posts_counter: 5) }
  let!(:posts) { create_list(:post, 10, author: user) }

  before do
    visit user_posts_path(user)
  end

  it "displays the user's profile picture" do
    expect(page).to have_css("img[src*='#{user.photo}']")
  end

  it "displays the user's username" do
    expect(page).to have_content(user.name)
  end

  it 'displays the number of posts the user has written' do
    expect(page).to have_content("umber of posts: #{user.posts_counter}")
  end

  it "displays a post's title" do
    posts.each do |post|
      expect(page).to have_content(post.title)
    end
  end

  it 'displays some of the post body' do
    posts.each do |post|
      expect(page).to have_content(post.content.truncate(50))
    end
  end

  it 'displays the first comments on a post' do
    posts.each do |post|
      post.comments.first(3).each do |comment|
        expect(page).to have_content(comment.content)
      end
    end
  end

  it 'displays how many comments a post has' do
    posts.each do |post|
      expect(page).to have_content("comments: #{post.comments_counter}")
    end
  end

  it 'displays how many likes a post has' do
    posts.each do |post|
      expect(page).to have_content("likes: #{post.likes_counter}")
    end
  end

  it "redirects to a post's show page when clicking on a post" do
    click_link(posts.first.title)
    expect(page).to have_current_path(user_post_path(user, posts.first))
  end

  it 'displays a pagination button' do
    expect(page).to have_css('.button', text: 'Pagination')
  end
end
