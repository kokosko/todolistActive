class Task < ActiveRecord::Base

  include RankedModel
  ranks :row_order

  validates :title, presence:true

end
