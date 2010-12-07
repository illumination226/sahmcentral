class Post < ActiveRecord::Base
	has_many :comments, :dependent => :destroy
	validates_presence_of :title, :content, :name
	
  def to_param 
  "#{title.parameterize}-#{id}"
  end 
end
