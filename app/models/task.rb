class Task < ApplicationRecord
  validates :tittle, presence: true, length: {maximum:50}
  validates :description, presence: true, length: {maximum:250}
  validates :status, presence: true, inclusion:{in: %w[in-progress completed pending]}
  validates :priority, presence: true, inclusion:{in:%w[high medium low]}
end
