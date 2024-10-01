class Patient < ApplicationRecord
    validates :name, presence: true
    validates :age, presence: true, numericality: { greater_than: 0 }
    validates :gender, presence: true
    validates :contact, presence: true
  end