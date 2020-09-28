class Person < ApplicationRecord
  enum kind: { buyer: 0, provider: 1 }
end
