class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  accepts_nested_attributes_for :line_items
  before_update :remove_empty_line_items
  
  protected
  def remove_empty_line_items
    self.line_items.each do |ln|
      ln.destroy if ln.count == 0
    end
  end
end
