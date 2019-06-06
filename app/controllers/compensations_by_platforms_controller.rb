class CompensationsByPlatformsController < ApplicationController
  def index
    @q = CompensationsByPlatform.ransack(params[:q])
    @compensations_by_platforms = @q.result(:distinct => true).includes(:review).page(params[:page]).per(10)

    render("compensations_by_platform_templates/index.html.erb")
  end

  def show
    @compensations_by_platform = CompensationsByPlatform.find(params.fetch("id_to_display"))

    render("compensations_by_platform_templates/show.html.erb")
  end

  def new_form
    @compensations_by_platform = CompensationsByPlatform.new

    render("compensations_by_platform_templates/new_form.html.erb")
  end

  def create_row
    @compensations_by_platform = CompensationsByPlatform.new

    @compensations_by_platform.compensation_amount = params.fetch("compensation_amount")
    @compensations_by_platform.review_id = params.fetch("review_id")
    @compensations_by_platform.compensated = params.fetch("compensated")
    @compensations_by_platform.notes = params.fetch("notes")

    if @compensations_by_platform.valid?
      @compensations_by_platform.save

      redirect_back(:fallback_location => "/compensations_by_platforms", :notice => "Compensations by platform created successfully.")
    else
      render("compensations_by_platform_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @compensations_by_platform = CompensationsByPlatform.find(params.fetch("prefill_with_id"))

    render("compensations_by_platform_templates/edit_form.html.erb")
  end

  def update_row
    @compensations_by_platform = CompensationsByPlatform.find(params.fetch("id_to_modify"))

    @compensations_by_platform.compensation_amount = params.fetch("compensation_amount")
    @compensations_by_platform.review_id = params.fetch("review_id")
    @compensations_by_platform.compensated = params.fetch("compensated")
    @compensations_by_platform.notes = params.fetch("notes")

    if @compensations_by_platform.valid?
      @compensations_by_platform.save

      redirect_to("/compensations_by_platforms/#{@compensations_by_platform.id}", :notice => "Compensations by platform updated successfully.")
    else
      render("compensations_by_platform_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @compensations_by_platform = CompensationsByPlatform.find(params.fetch("id_to_remove"))

    @compensations_by_platform.destroy

    redirect_to("/compensations_by_platforms", :notice => "Compensations by platform deleted successfully.")
  end
end
