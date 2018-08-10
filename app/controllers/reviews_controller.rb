class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  def index
    @reviews = Review.all
  end

  def show
    authorize @review
  end

  def new
    @review = Review.new
    authorize @review

  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @review.booking = Booking.find(params[:booking_id])
    @review.save!
    authorize @review
    if @review.save
      redirect_to booking_path(@review.booking)
    else
      render :new
    end

  end

  def edit
  end

  def update
    @review.update(review_params)
    authorize @review
    if @review.save
      redirect_to booking_review(@review)
    else
      render :edit
    end
  end

  def destroy
    @review.destroy
    authorize @review
    redirect_to dashboard_path
  end

private

  def set_review
    @review = Review.find(params[:id])
  end
  def review_params
      params.require(:review).permit(:content, :rating, :user_id, :booking_id)
  end
end
