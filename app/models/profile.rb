class Profile < ApplicationRecord
  belongs_to :user

  has_one :service
  has_one :hour
  has_one :verification
  has_one :contact

  has_many :contents

  has_one_attached :avatar

  validates :document, uniqueness: true

  validate :document_validate, if: ->(obj){ obj.document.present? }

  def document_validate
    errors.add(:document, 'Invalid Document') unless cpf_valid?
  end

  def cpf_valid?
    CPF.valid?(document)
  end
end
