class TipsReviewsController < ApplicationController
  def index
    @q = TipsReview.ransack(params[:q])
    @tips_reviews = @q.result(:distinct => true).includes(:review, :user).page(params[:page]).per(10)

    render("tips_review_templates/index.html.erb")
  end

  def show
    @tips_review = TipsReview.find(params.fetch("id_to_display"))

    render("tips_review_templates/show.html.erb")
  end

  def new_form
    @tips_review = TipsReview.new

    render("tips_review_templates/new_form.html.erb")
  end

  def create_row
    @tips_review = TipsReview.new

    @tips_review.user_id = params.fetch("user_id")
    @tips_review.review_id = params.fetch("review_id")
    @tips_review.amount = params.fetch("amount")

    if @tips_review.valid?
      @tips_review.save

      redirect_back(:fallback_location => "/tips_reviews", :notice => "Tips review created successfully.")
    else
      render("tips_review_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_review
    @tips_review = TipsReview.new

    @tips_review.user_id = params.fetch("user_id")
    @tips_review.review_id = params.fetch("review_id")
    @tips_review.amount = params.fetch("amount")

    if @tips_review.valid?
      @tips_review.save

      redirect_to("/reviews/#{@tips_review.review_id}", notice: "TipsReview created successfully.")
    else
      render("tips_review_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @tips_review = TipsReview.find(params.fetch("prefill_with_id"))

    render("tips_review_templates/edit_form.html.erb")
  end

  def update_row
    @tips_review = TipsReview.find(params.fetch("id_to_modify"))

    @tips_review.user_id = params.fetch("user_id")
    @tips_review.review_id = params.fetch("review_id")
    @tips_review.amount = params.fetch("amount")

    if @tips_review.valid?
      @tips_review.save

      redirect_to("/tips_reviews/#{@tips_review.id}", :notice => "Tips review updated successfully.")
    else
      render("tips_review_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_review
    @tips_review = TipsReview.find(params.fetch("id_to_remove"))

    @tips_review.destroy

    redirect_to("/reviews/#{@tips_review.review_id}", notice: "TipsReview deleted successfully.")
  end

  def destroy_row_from_user
    @tips_review = TipsReview.find(params.fetch("id_to_remove"))

    @tips_review.destroy

    redirect_to("/users/#{@tips_review.user_id}", notice: "TipsReview deleted successfully.")
  end

  def destroy_row
    @tips_review = TipsReview.find(params.fetch("id_to_remove"))

    @tips_review.destroy

    redirect_to("/tips_reviews", :notice => "Tips review deleted successfully.")
  end
end
