class ApplicationController < ActionController::Base
  def hello_world
    name = params['name'] || 'World'
    render 'application/hello_world', locals: { name: name }
  end

  def create_comment
    post     = Post.find(params['post_id'])
    comments = post.comments
    # post.build_comment to set the post_id
    comment  = post.build_comment('body' => params['body'], 'author' => params['author'])
    if comment.save
      # redirect for success
      redirect_to "/show_post/#{params['post_id']}"
    else
      # render form again with errors for failure
      render(
        'application/show_post',
        locals: { post: post, comment: comment, comments: comments }
      )
    end
  end

  def delete_comment
    post = Post.find(params['post_id'])
    post.delete_comment(params['comment_id'])
    redirect_to "/show_post/#{params['post_id']}"
  end

  def list_comments
    comments = Comment.all

    render 'application/list_comments', locals: { comments: comments }
  end
end
