class Product < ApplicationRecord
  acts_as_paranoid
  validates_presence_of :title, :description, :price

  has_many :price_histories, dependent: :destroy
  before_update :price_has_changed?

  def original_price
    if price_histories.empty?
      price.to_f
    else
      price_histories.first.price.to_f
    end
  end

  def percentage_difference
    percentage = ((price * 100).to_f / original_price).to_f.round(2)
    if percentage > 100
      "<i class=\"fa fa-plus increase\" data-html=\"true\">&nbsp;#{(percentage - 100).round(2)}%</i>".html_safe
    elsif percentage < 100
      "<i class=\"fa fa-minus down decrease\" data-html=\"true\">&nbsp;#{(100 - percentage).round(2)}%</i>".html_safe
    end
  end

  private
  def price_has_changed?
    if price_changed?
      price_histories.create(price: price_was)
    end
  end
end
