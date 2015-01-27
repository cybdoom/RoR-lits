require 'test_helper'

class ReplyTest < ActiveSupport::TestCase
  setup do
    @valid_attributes = {
      name: 'valid name',
      contacts: [
        {
          'type'   =>  'phone',
          'value'  =>  '+380631234567'
        },
        {
          'type'   =>  'email',
          'value'  =>  'valid.email@gmail.com'
        }
      ],
      city: 'valid city',
      english: {
        spoken: 2,
        technical: 2,
      },
      salary: '1000-1500$',
      work_types: [:remote, :office],
      work_hours: 8,
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
      work_types: nil # must be present
    })
    reply = Reply.create invalid_attributes
    assert_not reply.persisted?

    invalid_attributes = invalid_attributes.merge work_types: nil # must be present
    reply = Reply.create invalid_attributes
    assert_not reply.persisted?
  end

  test 'validates "contacts" field properly' do
    reply = Reply.create @valid_attributes

    valid_contacts = [{'type' => 'email', 'value' => 'cybdoom@gmail.com'}]
    reply.contacts = valid_contacts
    assert reply.valid?

    reply.contacts = valid_contacts + [{'type' => 'phone', 'value' => '12345'}] # wrong phone number
    assert reply.invalid?

    reply.contacts = valid_contacts + [{'type' => 'skype', 'value' => '123'}] # wrong skype login
    assert reply.invalid?

    reply.contacts = valid_contacts + [{'type' => 'email', 'value' => '123@321'}] # wrong email
    assert reply.invalid?

    reply.contacts = [{'type' => 'phone', 'value' => '+380637859498'}] # email is absent
    assert reply.invalid?
  end

  test 'validates "english" field properly' do
    reply = Reply.create @valid_attributes

    reply.english.merge! spoken: nil # must be present
    puts reply.errors.messages
    assert reply.invalid?

    reply.english.merge! spoken: -1 # too small
    assert reply.invalid?

    reply.english.merge! spoken: Reply::SPOKEN_ENGLISH_LEVELS # too large
    assert reply.invalid?

    reply.english.merge! spoken: '1.5' # should be an integer
    assert reply.invalid?

    reply.english.merge! spoken: 'Advanced' # should be a number
    assert reply.invalid?

    reply.english.merge!({
      spoken: 2,
      technical: nil # should be present
    })
    assert reply.invalid?

    reply.english.merge! technical: 0 # too small
    assert reply.invalid?

    reply.english.merge! technical: Reply::TECH_ENGLISH_LEVELS + 1 # too large
    assert reply.invalid?

    reply.english.merge! technical: '2.3' # should be an integer
    assert reply.invalid?

    reply.english.merge! technical: 'Fluent' # should be a number
    assert reply.invalid?
  end
end
