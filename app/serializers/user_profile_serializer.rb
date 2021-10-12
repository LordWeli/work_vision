class UserProfileSerializer < ActiveModel::Serializer
  attributes :id, :fullname, :slug_name, :age, :description,
    :user, :service, :hour, :content
end
