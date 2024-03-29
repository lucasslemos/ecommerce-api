class Admin::V1::CategoriesController < Admin::V1::ApiController
  def index
    @categories = Category.all
  end
  def create
    @category = Category.new
    @category.attributes = category_params

    save_category!
  end

  private

  def category_params
    return {} unless params.has_key?(:category)
    params.require(:category).permit(:id, :name)
  end

  def save_category!
    @category.save!
    render :show
  rescue
    render_error(fields: @category.errors.messages)
  end
end
