require_relative "person"
require_relative 'errors'

class PersonRepository
  attr_reader :people

  def initialize
    @people = []
  end

  def add_person(person)
    if person.is_a?(Person)
      existing_person = @people.find { |p| p.inn == person.inn }
      if existing_person
        raise PersonAlreadyExist.new(person.inn)
      else
        @people << person
      end
    else
      raise ArgumentError, "Person must be a member of Person.Class"
    end
  end

  def edit_person_by_inn(inn, new_person)
    person = get_byINN(inn)
    if person
      person.first_name = new_person.first_name
      person.last_name = new_person.last_name
      person.birth_date = new_person.birth_date
    else
      raise PersonNotFoundError.new(inn)
    end
  end

  def delete_person_by_inn(inn)
    person = get_byINN(inn)
    if person
      @people.delete(person)
    else
      raise PersonNotFoundError.new(inn)
    end
  end

  def get_all
    @people
  end

  def get_byINN(inn)
    @people.find { |person| person.inn == inn }
  end

  def get_by_part_name(name_part)
    name_part = name_part.downcase

    @people.select do |person|
      person.first_name.downcase.include?(name_part) || person.last_name.downcase.include?(name_part)
    end
  end

  def get_by_date_range(date_from, date_to)
    if date_from.nil? && date_to.nil?
      @people
    elsif date_from.nil?
      @people.select { |person| person.birth_date <= date_to }
    elsif date_to.nil?
      @people.select { |person| person.birth_date >= date_from }
    else
      @people.select { |person| person.birth_date >= date_from && person.birth_date <= date_to }
    end
  end
end