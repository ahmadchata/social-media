module PostHelper
  def display_errors(post)
    return unless post.errors.full_messages.any?

    content_tag :p, "Post could not be saved. #{post.errors.full_messages.join('. ')}", class: 'errors'
  end

  def show_posts(current_user)
    userfriends = current_user.friends
    my_posts = []
    userfriends.each do |friends|
      friends.posts.each do |post|
        my_posts << post
      end
    end
    current_user.posts.each do |post|
      my_posts << post
    end
    my_posts.reverse
  end
end
