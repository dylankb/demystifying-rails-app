class PostsController < ApplicationController
  def index
    posts = Post.all

    render 'application/list_posts', locals: { posts: posts }
  end

  def show
    post = Post.find(params['id'])
    comment = Comment.new
    comments = post.comments

    render 'application/show_post',
      locals: { post: post, comment: comment, comments: comments }
  end

  def new
    post = Post.new

    render 'application/new_post', locals: { post: post }
  end

  def create
    post = Post.new('title' => params['title'],
                    'body' => params['body'],
                    'author' => params['author'])

    if post.save
      binding.pry
      redirect_to '/posts'
    else
      render 'application/new_post', locals: { post: post }
    end
  end

  def edit
    post = Post.find(params['id'])

    render 'application/edit_post', locals: { post: post }
  end

  def update
    post = Post.find(params['id'])
    post.set_attributes(
      'title' => params['title'],
      'body' => params['body'],
      'author' => params['author']
    )
    if post.save
      redirect_to '/posts'
    else
      render 'application/edit_post', locals: { post: post }
    end
  end

  def destroy
    post = Post.find(params['id'])
    post.destroy

    redirect_to '/posts'
  end
end
