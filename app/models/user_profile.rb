class UserProfile < ApplicationRecord
  belongs_to :user

  has_one :service
  has_one :hour

  has_many :contents

  has_one_attached :avatar

  # Adicionar tabela para verificação com has_one_attached de imagem
end
