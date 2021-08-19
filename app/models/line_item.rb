class LineItem < ActiveRecord::Base
  belongs_to :instrument
  belongs_to :cart

  def total_price
    instrument.price.to_i * quantity.to_i
  end
end
