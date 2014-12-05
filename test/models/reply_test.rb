require 'test_helper'

class ReplyTest < ActiveSupport::TestCase
  setup do
    @valid_attributes = {
      name: 'valid name',
      contacts: {
        phone: '0631111111',
        email: 'valid.email@gmail.com'
      },
      city: 'valid city',
      english: {
        spoken: 2,
        tech: 2,
      },
      salary: '1000-1500$',
      work_type: 0,
      work_hours: nil,
      vacancy_id: nil
    }
  end

  test "create valid reply object with valid attributes given" do
    reply = Reply.create @valid_attributes
    assert reply.persisted?
  end

  test "fails to create vacancy object with invalid attributes" do
    invalid_attributes = @valid_attributes.merge name: nil # must be present
    reply = Reply.create invalid_attributes
    assert_not reply.persisted?

    invalid_attributes = invalid_attributes.merge name: 'n' # too short
    reply = Reply.create invalid_attributes
    assert_not reply.persisted?

    invalid_attributes = invalid_attributes.merge name: 'too long name' * 100 # too long
    reply = Reply.create invalid_attributes
    assert_not reply.persisted?

    invalid_attributes = invalid_attributes.merge({
      name: 'valid name',
      city: nil # must be present
    })
    reply = Reply.create invalid_attributes
    assert_not reply.persisted?

    invalid_attributes = invalid_attributes.merge city: nil # must be present
    reply = Reply.create invalid_attributes
    assert_not reply.persisted?

    invalid_attributes = invalid_attributes.merge city: 'Ci' # too short
    reply = Reply.create invalid_attributes
    assert_not reply.persisted?

    invalid_attributes = invalid_attributes.merge city: 'Too long city name' * 50 # too long
    reply = Reply.create invalid_attributes
    assert_not reply.persisted?

    invalid_attributes = invalid_attributes.merge({
      city: 'Valid city name',
      work_type: nil # must be present
    })
    reply = Reply.create invalid_attributes
    assert_not reply.persisted?

    invalid_attributes = invalid_attributes.merge work_type: nil # must be present
    reply = Reply.create invalid_attributes
    assert_not reply.persisted?

    invalid_attributes = invalid_attributes.merge work_type: -1 # too small
    reply = Reply.create invalid_attributes
    assert_not reply.persisted?

    invalid_attributes = invalid_attributes.merge work_type: 2 # too large
    reply = Reply.create invalid_attributes
    assert_not reply.persisted?

    invalid_attributes = invalid_attributes.merge work_hours: 0 # too small
    reply = Reply.create invalid_attributes
    assert_not reply.persisted?

    invalid_attributes = invalid_attributes.merge work_hours: 25 # too large
    reply = Reply.create invalid_attributes
    assert_not reply.persisted?
  end

  test 'validates "contacts" field properly' do
    reply = Reply.create @valid_attributes
    reply.contacts.merge phone: nil # must be present
    assert reply.invalid?

    reply.contacts.merge phone: '+380631234567' # wrong format
    assert reply.invalid?
  end

  test 'validates "english" field properly' do
    reply = Reply.create @valid_attributes

    reply.english.merge spoken: nil # must be present
    assert reply.invalid?

    reply.english.merge spoken: -1 # too small
    assert reply.invalid?

    reply.english.merge spoken: Reply::SPOKEN_ENGLISH_LEVELS # too large
    assert reply.invalid?

    reply.english.merge spoken: 1.5 # should be an integer
    assert reply.invalid?

    reply.english.merge spoken: 'Advanced' # should be a number
    assert reply.invalid?

    reply.english.merge({
      spoken: 2,
      tech: nil # should be present
    })
    assert reply.invalid?

    reply.english.merge tech: 0 # too small
    assert reply.invalid?

    reply.english.merge tech: Reply::TECH_ENGLISH_LEVELS + 1 # too large
    assert reply.invalid?

    reply.english.merge tech: 2.3 # should be an integer
    assert reply.invalid?

    reply.english.merge tech: 'Fluent' # should be a number
    assert reply.invalid?
  end
end
