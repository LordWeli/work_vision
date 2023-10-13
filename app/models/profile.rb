# frozen_string_literal: true

class Profile < ApplicationRecord
  belongs_to :user

  has_many :hours
  has_many :contents

  has_one :service
  has_one :verification
  has_one :contact

  has_one_attached :avatar

  validates :document, uniqueness: { case_sensitive: false, allow_nil: true }

  validate :document_validate, if: ->(obj) { obj.document.present? }, on: :update

  validate :verify_document, if: ->(obj) { obj.changes.include?('document') }, on: :update

  private

  def document_validate
    errors.add(:document, 'Invalid Document') unless cpf_valid?
  end

  def verify_document
    errors.add(:document, 'Document already exists') if document_exist?
  end

  def cpf_valid?
    CPF.valid?(document)
  end

  def document_exist?
    changes['document'][0].present?
  end
end
