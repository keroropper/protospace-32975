class Prototype < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_one_attached :image

  # validates :title, presence: true
  # validates :catch_copy, presence: true
  # validates :concept, presence: true
  # validates :image, presence: true

  validates_presence_of :title;
  validates_presence_of :catch_copy;
  validates_presence_of :concept;
  validates_presence_of :image;
end
