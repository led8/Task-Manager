class Task < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: { maximum: 20 }
  validates :content, presence: true
  validates :progress, presence: true, inclusion: { in: %w[Terminer En\ cours A\ faire] }
end
