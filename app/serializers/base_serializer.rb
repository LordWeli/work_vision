# frozen_string_literal: true

class BaseSerializer < ActiveModel::Serializer
  def many_items(items, serializer)
    return if items.blank?

    items.map do |item|
      serializer.new(item)
    end
  end
end
