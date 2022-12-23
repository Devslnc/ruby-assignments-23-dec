class Person < ApplicationRecord
  has_one :address, dependent: :destroy
  has_many :drives, class_name: :Drive, dependent: :destroy
  has_many :vehicles, through: :drives
end

class Address < ApplicationRecord
  belongs_to :person
end

class Vehicle < ApplicationRecord
  has_many :drives, class_name: :Drive, dependent: :destroy
  has_many :persons, through: :drives
end

class Drive < ApplicationRecord
  belongs_to :person
  belongs_to :vehicle
end

class Student < Person
  attr_accessor :student_number
end

class Professor < Person
  attr_accessor :salary
end
