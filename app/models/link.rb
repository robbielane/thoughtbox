class Link < ActiveRecord::Base
  belongs_to :user
  validates :url, presence: true, :url => true
  validates :title, presence: true

  def toggle
    if self.read
      self.update(read: false)
    else
      self.update(read: true)
    end
  end
end
