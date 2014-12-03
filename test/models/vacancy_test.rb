require 'test_helper'

class VacancyTest < ActiveSupport::TestCase
  test "create valid vacancy object with valid attributes given" do
    vacancy = Vacancy.create({
      name: 'valid name',
      description: 'valid description'
    })
    assert vacancy.persisted?
  end

  test "fails to create vacancy object with invalid attributes" do
    vacancy = Vacancy.create({
      name: 'n', # too short
      description: 'valid description'
    })
    assert_not vacancy.persisted?

    vacancy = Vacancy.create({
      name: 'too long name' * 20, # too long
      description: 'valid description'
    })
    assert_not vacancy.persisted?

    vacancy = Vacancy.create({
      name: nil, # must be present
      description: 'valid description'
    })
    assert_not vacancy.persisted?

    vacancy = Vacancy.create({
      name: 'valid name',
      description: '' # too short
    })
    assert_not vacancy.persisted?

    vacancy = Vacancy.create({
      name: 'valid name',
      description: 'too long description' * 1000 # too long
    })
    assert_not vacancy.persisted?

    vacancy = Vacancy.create({
      name: 'valid name',
      description: nil # must be present
    })
    assert_not vacancy.persisted?
  end
end
