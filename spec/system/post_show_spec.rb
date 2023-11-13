require 'rails_helper'

RSpec.describe 'Post show page', type: :system do
  let!(:user) { create(:user, posts_counter: 0) }
  let!(:post) { create(:post, author: user) }
  let!(:comment) { create(:comment, post:, author: user) }

  before do
    visit user_post_path(post.author, post)
  end

  it 'displays the post title' do
    expect(page).to have_content(post.title)
  end

  it 'displays who wrote the post' do
    expect(page).to have_content("by #{user.name}")
  end

  it 'displays the number of comments the post has' do
    expect(page).to have_content("Comments: #{post.comments_counter},")
  end

  it 'displays the number of likes the post has' do
    expect(page).to have_content("Likes: #{post.likes_counter}")
  end

  it 'displays the post body' do
    expect(page).to have_content(post.content)
  end

  it 'displays the name of each commentor' do
    expect(page).to have_content(comment.author.name)
  end

  it 'displays the comment each commentor left' do
    puts 'commmmmm'
    puts comment.content
    expect(page).to have_content(comment.content)
  end

  it 'redirects to the user show page when clicking the username of a commentor' do
    click_link(comment.author.name)
    expect(page).to have_current_path(user_path(comment.author))
  end
end
