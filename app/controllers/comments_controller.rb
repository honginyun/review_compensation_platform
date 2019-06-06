class CommentsController < ApplicationController
  def index
    @q = Comment.ransack(params[:q])
    @comments = @q.result(:distinct => true).includes(:review, :commenter, :vote_comments).page(params[:page]).per(10)

    render("comment_templates/index.html.erb")
  end

  def show
    @vote_comment = VoteComment.new
    @comment = Comment.find(params.fetch("id_to_display"))

    render("comment_templates/show.html.erb")
  end

  def new_form
    @comment = Comment.new

    render("comment_templates/new_form.html.erb")
  end

  def create_row
    @comment = Comment.new

    @comment.review_id = params.fetch("review_id")
    @comment.commenter_id = params.fetch("commenter_id")
    @comment.comment = params.fetch("comment")
    @comment.comment_vote = params.fetch("comment_vote")

    if @comment.valid?
      @comment.save

      redirect_back(:fallback_location => "/comments", :notice => "Comment created successfully.")
    else
      render("comment_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_review
    @comment = Comment.new

    @comment.review_id = params.fetch("review_id")
    @comment.commenter_id = params.fetch("commenter_id")
    @comment.comment = params.fetch("comment")
    @comment.comment_vote = params.fetch("comment_vote")

    if @comment.valid?
      @comment.save

      redirect_to("/reviews/#{@comment.review_id}", notice: "Comment created successfully.")
    else
      render("comment_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @comment = Comment.find(params.fetch("prefill_with_id"))

    render("comment_templates/edit_form.html.erb")
  end

  def update_row
    @comment = Comment.find(params.fetch("id_to_modify"))

    @comment.review_id = params.fetch("review_id")
    @comment.commenter_id = params.fetch("commenter_id")
    @comment.comment = params.fetch("comment")
    @comment.comment_vote = params.fetch("comment_vote")

    if @comment.valid?
      @comment.save

      redirect_to("/comments/#{@comment.id}", :notice => "Comment updated successfully.")
    else
      render("comment_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_review
    @comment = Comment.find(params.fetch("id_to_remove"))

    @comment.destroy

    redirect_to("/reviews/#{@comment.review_id}", notice: "Comment deleted successfully.")
  end

  def destroy_row_from_commenter
    @comment = Comment.find(params.fetch("id_to_remove"))

    @comment.destroy

    redirect_to("/users/#{@comment.commenter_id}", notice: "Comment deleted successfully.")
  end

  def destroy_row
    @comment = Comment.find(params.fetch("id_to_remove"))

    @comment.destroy

    redirect_to("/comments", :notice => "Comment deleted successfully.")
  end
end
