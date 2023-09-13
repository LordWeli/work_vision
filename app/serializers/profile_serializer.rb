class ProfileSerializer < ActiveModel::Serializer
  attributes :fullname, :slug_name, :age, :description,
    :user, :service, :hours, :contents

  def user
    UserSerializer.new(object.user)
  end

  def service
    return if object.service.blank?

    ServiceSerializer.new(object.service)
  end

  def hours
    return if object.hours.blank?

    HourSerializer.new(object.hours)
  end

  def contents
    return if object.contents.blank?

    ContentSerializer.new(object.contents)
  end
end
