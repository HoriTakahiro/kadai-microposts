class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :micropost
  
  def favorite(other_micropost)
    unless self.microposts == other_micropost
      self.favorites.find_or_create_by(micropost_id: other_micropost.id)
    end
  end
  
  def unfavorite(other_micropost)
    favorite = self.favorites.find_by(micropost_id: other_micropost.id)
    favorite.destroy if favorite
  end
  
  def favorite?(other_micropost)
    self.favorites.include?(other_micropost)
  end
end
