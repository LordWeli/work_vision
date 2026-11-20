class LoginSerializer < ActiveModel::Serializer
  attributes :id, :provider, :logged, :created_at
end
