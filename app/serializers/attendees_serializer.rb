class AttendeesSerializer < ActiveModel::Serializer
  attributes :first_name, :last_name, :profession, :age, :wealth_rating, :notes
  belongs_to :user, serializer: UserSerializer
end
