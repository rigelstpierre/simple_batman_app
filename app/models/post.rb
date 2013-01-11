class Post < ActiveRecord::Base
  attr_accessible :content, :title
  has_many :comments
  has_many :attachments

  def as_json(options ={})
    {
      :id => id,
      :content => content,
      :title => title,
      :created_at => created_at,
      :updated_at => updated_at
    }
  end

end
