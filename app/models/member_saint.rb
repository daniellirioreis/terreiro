class MemberSaint < ActiveRecord::Base
  belongs_to :member
  has_enumeration_for :line, with: Saint, create_helpers: true
end
