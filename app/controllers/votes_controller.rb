class VotesController < ApplicationController
  def index
    @q = Vote.ransack(params[:q])
    @votes = @q.result(:distinct => true).includes(:review, :user).page(params[:page]).per(10)

    render("vote_templates/index.html.erb")
  end

  def show
    @vote = Vote.find(params.fetch("id_to_display"))

    render("vote_templates/show.html.erb")
  end

  def new_form
    @vote = Vote.new

    render("vote_templates/new_form.html.erb")
  end

  def create_row
    @vote = Vote.new

    @vote.user_id = params.fetch("user_id")
    @vote.review_id = params.fetch("review_id")
    @vote.upvote = params.fetch("upvote")
    @vote.downvote = params.fetch("downvote")

    if @vote.valid?
      @vote.save

      redirect_back(:fallback_location => "/votes", :notice => "Vote created successfully.")
    else
      render("vote_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_review
    @vote = Vote.new

    @vote.user_id = params.fetch("user_id")
    @vote.review_id = params.fetch("review_id")
    @vote.upvote = params.fetch("upvote")
    @vote.downvote = params.fetch("downvote")

    if @vote.valid?
      @vote.save

      redirect_to("/reviews/#{@vote.review_id}", notice: "Vote created successfully.")
    else
      render("vote_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @vote = Vote.find(params.fetch("prefill_with_id"))

    render("vote_templates/edit_form.html.erb")
  end

  def update_row
    @vote = Vote.find(params.fetch("id_to_modify"))

    @vote.user_id = params.fetch("user_id")
    @vote.review_id = params.fetch("review_id")
    @vote.upvote = params.fetch("upvote")
    @vote.downvote = params.fetch("downvote")

    if @vote.valid?
      @vote.save

      redirect_to("/votes/#{@vote.id}", :notice => "Vote updated successfully.")
    else
      render("vote_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_review
    @vote = Vote.find(params.fetch("id_to_remove"))

    @vote.destroy

    redirect_to("/reviews/#{@vote.review_id}", notice: "Vote deleted successfully.")
  end

  def destroy_row_from_user
    @vote = Vote.find(params.fetch("id_to_remove"))

    @vote.destroy

    redirect_to("/users/#{@vote.user_id}", notice: "Vote deleted successfully.")
  end

  def destroy_row
    @vote = Vote.find(params.fetch("id_to_remove"))

    @vote.destroy

    redirect_to("/votes", :notice => "Vote deleted successfully.")
  end
end
