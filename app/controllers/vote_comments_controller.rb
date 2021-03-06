class VoteCommentsController < ApplicationController
  before_action :current_user_must_be_vote_comment_voter, :only => [:edit_form, :update_row, :destroy_row]

  def current_user_must_be_vote_comment_voter
    vote_comment = VoteComment.find(params["id_to_display"] || params["prefill_with_id"] || params["id_to_modify"] || params["id_to_remove"])

    unless current_user == vote_comment.voter
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = VoteComment.ransack(params[:q])
    @vote_comments = @q.result(:distinct => true).includes(:voter, :comment).page(params[:page]).per(10)

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

  def create_row_from_comment
    @vote_comment = VoteComment.new

    @vote_comment.voter_id = params.fetch("voter_id")
    @vote_comment.comment_id = params.fetch("comment_id")

    if @vote_comment.valid?
      @vote_comment.save

      redirect_to("/comments/#{@vote_comment.comment_id}", notice: "VoteComment created successfully.")
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

    
    @vote_comment.comment_id = params.fetch("comment_id")

    if @vote_comment.valid?
      @vote_comment.save

      redirect_to("/vote_comments/#{@vote_comment.id}", :notice => "Vote comment updated successfully.")
    else
      render("vote_comment_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_voter
    @vote_comment = VoteComment.find(params.fetch("id_to_remove"))

    @vote_comment.destroy

    redirect_to("/users/#{@vote_comment.voter_id}", notice: "VoteComment deleted successfully.")
  end

  def destroy_row_from_comment
    @vote_comment = VoteComment.find(params.fetch("id_to_remove"))

    @vote_comment.destroy

    redirect_to("/comments/#{@vote_comment.comment_id}", notice: "VoteComment deleted successfully.")
  end

  def destroy_row
    @vote_comment = VoteComment.find(params.fetch("id_to_remove"))

    @vote_comment.destroy

    redirect_to("/vote_comments", :notice => "Vote comment deleted successfully.")
  end
end
