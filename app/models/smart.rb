class Smart < ActiveRecord::Base
  validates :name, :uniqueness => true
  validates :name, :presence => true
  validates :description, :length => {:minimum => 20}
  validates :price, :numericality =>{:greater_than_or_equal_to => 0.01}
  validates :image_url, :format => {
      :with => /\.(gif|jpg|png)$/i, #las expresiones regulares tambien se pueden denominar con los limites literales %r{....}
      :message => 'must be a URL for GIF, JPG or PNG image.'
  }
  has_many :line_items
  before_destroy :ensure_not_referenced_by_any_line_item

  def ensure_not_referenced_by_any_line_item
    if line_items.first
      #agrega un mensaje de error a nivel del objeto, no a nivel del atributo
      errors(:base, "Existe line items dependientes del smart")
      return false
    else
      return true
    end
  end
end
