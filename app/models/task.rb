class Task < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :content, presence: true
  validates :progress, presence: true, inclusion: { in: %w[Terminer En\ cours A\ faire] }
end
