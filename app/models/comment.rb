class Comment < ActiveRecord::Base

belongs_to :post, :foreign_key => "post_id"
belongs_to :announcement, :foreign_key => "announcement_id"
validates_presence_of :title, :content

end
