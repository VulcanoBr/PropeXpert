class BaseForm
  extend ActiveModel::Naming
  include ActiveModel::API
  include ActiveModel::AttributeMethods
  include ActiveModel::Serialization
  include ActiveModel::Validations
  include ActiveModel::Attributes
end
