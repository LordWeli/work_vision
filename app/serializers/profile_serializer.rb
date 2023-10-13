class ProfileSerializer < BaseSerializer
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
    many_items(object.hours, HourSerializer)
  end

  def contents
    many_items(object.contents, ContentSerializer)
  end
end
