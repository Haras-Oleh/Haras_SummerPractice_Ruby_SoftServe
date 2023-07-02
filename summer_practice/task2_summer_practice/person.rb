#Загалом,якщо говорити про мій клас Person,то він забезпечує можливість створювати об'єкти, що представляють особисті дані людини, 
#та виконувати перевірку валідності й зміну цих даних.
require_relative "consoleInput"

#Даний код визначає клас Person, який включає модулі ConsoleInput та Validation. 
#Клас Person має атрибути first_name, last_name, inn та birth_date, які є доступними лише для читання (завдяки методу attr_reader).
class Person
  include ConsoleInput
  include Validation

  #У конструкторі класу Person виконується ініціалізація об'єкта з використанням введених значень first_name, last_name, inn та birth_date. 
  #За допомогою публічних методів first_name=, last_name=, inn= та birth_date= можна змінювати значення відповідних атрибутів.
  attr_reader :first_name, :last_name, :inn, :birth_date

  def initialize(first_name, last_name, inn, birth_date)
    set_first_name(first_name)
    set_last_name(last_name)
    set_inn(inn)
    set_birth_date(birth_date)
  end

  def first_name=(new_first_name)
    set_first_name(new_first_name)
  end

  def last_name=(new_last_name)
    set_last_name(new_last_name)
  end

  def inn=(new_inn)
    set_inn(new_inn)
  end

  def birth_date=(new_birth_date)
    set_birth_date(new_birth_date)
  end

  private

  #Приватні методи set_first_name, set_last_name, set_inn та set_birth_date виконують перевірку валідності переданих значень
  # та присвоюють їх атрибутам об'єкта Person. Якщо значення не відповідають вимогам валідації, виводиться відповідне
  # повідомлення про помилку, після чого користувач повинен ввести відповідне коректне значення з використанням методів,
  # таких як get_name_input(), get_string_input(), get_inn_input() та get_date_input() з модулю ConsoleInput.
  def set_first_name(value)
    if valid_name?(value)
      @first_name = value
    else
      puts "Invalid first name"
      @first_name = get_name_input()
    end
  end

  def set_last_name(value)
    if valid_name?(value)
      @last_name = value
    else
      puts "Invalid last name"
      @last_name = get_string_input()
    end
  end

  def set_inn(value)
    if valid_inn?(value)
      @inn = value
    else
      puts "Invalid inn"
      @inn = get_inn_input()
    end
  end

  def set_birth_date(value)
    if valid_date_format?(value)
      value = Date.parse(value)
      if after_date?(value)
        @birth_date = value
      else
        puts "Wrong birth date"
        @birth_date = get_date_input()
      end
    else
      puts "Wrong date format"
      @birth_date = get_date_input()
    end
  end
end

