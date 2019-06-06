class VoteCommentsController < ApplicationController
  def index
    @vote_comments = VoteComment.all

    render("vote_comment_templates/index.html.erb")
  end

  def show
    @vote_comment = VoteComment.find(params.fetch("id_to_display"))

    render("vote_comment_templates/show.html.erb")
  end

  def new_form
    @vote_comment = VoteComment.new

    render("vote_comment_templates/new_form.html.erb")
  end

  def create_row
    @vote_comment = VoteComment.new

    @vote_comment.voter_id = params.fetch("voter_id")
    @vote_comment.comment_id = params.fetch("comment_id")

    if @vote_comment.valid?
      @vote_comment.save

      redirect_back(:fallback_location => "/vote_comments", :notice => "Vote comment created successfully.")
    else
      render("vote_comment_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @vote_comment = VoteComment.find(params.fetch("prefill_with_id"))

    render("vote_comment_templates/edit_form.html.erb")
  end

  def update_row
    @vote_comment = VoteComment.find(params.fetch("id_to_modify"))

    @vote_comment.voter_id = params.fetch("voter_id")
    @vote_comment.comment_id = params.fetch("comment_id")

    if @vote_comment.valid?
      @vote_comment.save

      redirect_to("/vote_comments/#{@vote_comment.id}", :notice => "Vote comment updated successfully.")
    else
      render("vote_comment_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @vote_comment = VoteComment.find(params.fetch("id_to_remove"))

    @vote_comment.destroy

    redirect_to("/vote_comments", :notice => "Vote comment deleted successfully.")
  end
end
