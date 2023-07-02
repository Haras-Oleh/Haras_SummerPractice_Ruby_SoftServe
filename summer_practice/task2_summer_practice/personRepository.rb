#Ось уже даний файлик і ця частина коду визначає клас PersonRepository, який представляє сховище для об'єктів класу Person. 
#Він має методи для додавання, редагування, видалення та отримання об'єктів Person зі сховища.
require_relative "person"

#У конструкторі класу PersonRepository створюється порожній масив @people, який використовується для зберігання об'єктів Person.
class PersonRepository
  def initialize
    @people = []
  end

  #Метод add_person(person) додає переданий об'єкт person до сховища. Перед додаванням виконується перевірка, чи переданий об'єкт 
  #є екземпляром класу Person. Якщо перевірка пройдена, об'єкт додається до масиву @people. 
  #Якщо перевірка не пройдена, викидається помилка ArgumentError.
  def add_person(person)
    if person.is_a?(Person)
      @people << person
    else
      raise ArgumentError, "Person must be a member of Person.Class"
    end
  end

  #Метод edit_person_by_inn(inn, new_first_name, new_last_name, new_birth_date) здійснює редагування об'єкту Person за вказаним ІНН.
  #Знаходиться об'єкт за ІНН за допомогою методу get_byINN(inn). Якщо об'єкт знайдений, його атрибути first_name, last_name та birth_date змінюються на передані значення.
  # Якщо об'єкт не знайдений, виводиться повідомлення про невдалу спробу.
  def edit_person_by_inn(inn, new_first_name, new_last_name, new_birth_date)
    person = get_byINN(inn)
    if person
      person.first_name = new_first_name
      person.last_name = new_last_name
      person.birth_date = new_birth_date
    else
      puts "Person not found for INN: #{inn}"
    end
  end

#Метод delete_person_by_inn(inn) видаляє об'єкт Person зі сховища за вказаним ІНН. 
#Об'єкт знаходиться за ІНН за допомогою методу get_byINN(inn). 
#Якщо об'єкт знайдений, він видаляється з масиву @people. Якщо об'єкт не знайдений, виводиться повідомлення про невдалу спробу.
  def delete_person_by_inn(inn)
    person = get_byINN(inn)
    if person
      @people.delete(person)
      puts "Person with INN #{inn} deleted."
    else
      puts "Person not found for INN: #{inn}"
    end
  end

  #Метод show_people виводить на екран всі об'єкти Person зі сховища. Використовується ітерація по масиву @people, 
  #і для кожного об'єкта виводяться значення атрибутів first_name, last_name, inn та birth_date.
  def show_people
    @people.each do |person|
      puts "First Name: #{person.first_name}, Last Name: #{person.last_name}, INN: #{person.inn}, Date Of Birth: #{person.birth_date}"
    end
  end

  #Метод get_all повертає масив усіх об'єктів Person, що знаходяться в сховищі. Просто повертає значення масиву @people.
  def get_all
    @people
  end

  #Метод get_byINN(inn) знаходить об'єкт Person в сховищі за його ІНН. Використовується метод find масиву @people, 
  #який шукає перший об'єкт, для якого умова person.inn == inn є істинною.
  # Якщо об'єкт знайдений, він повертається з методу. Якщо об'єкт не знайдений, повертається значення nil
  def get_byINN(inn)
    @people.find { |person| person.inn == inn }
  end

  #Метод get_by_part_name(name_part) знаходить об'єкти Person в сховищі, чиє ім'я або прізвище містить певну частину name_part.
  # Використовується метод select масиву @people, який застосовує умову person.first_name.include?(name_part) || 
  # || person.last_name.include?(name_part) для кожного об'єкта. 
  # Якщо умова є істинною, об'єкт додається до нового масиву, який повертається з методу.
  def get_by_part_name(name_part)
    @people.select { |person| person.first_name.include?(name_part) || person.last_name.include?(name_part) }
  end

  #Метод get_by_date_range(date_from, date_to) знаходить об'єкти Person в сховищі, які народилися в межах певного діапазону дат. 
  #У методі використовуються умовні оператори для перевірки, чи задані обидві дати (date_from і date_to), або одна з них, або жодна. 
  #Залежно від цього виконується відповідний фільтр об'єктів Person з масиву @people. 
  #Об'єкти, що задовольняють умову, додаються до нового масиву, який повертається з методу.
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

#У показаному коді створюється об'єкт PersonRepository з ім'ям pr. Потім до сховища pr додаються п'ять об'єктів Person за
# допомогою методу add_person. Після цього викликаються декілька методів для виведення та отримання об'єктів зі сховища.
# Результати виводяться на екран за допомогою функцій puts та p.
pr = PersonRepository.new
pr.add_person(Person.new("Bogdan", "Diadko", "AS0123456789", "2003-07-04"))
pr.add_person(Person.new("Natali", "Orban", "AZ9875642310", "1983-09-10"))
pr.add_person(Person.new("Andrew", "Zelenchuk", "AZ0654789321", "2003-12-12"))
pr.add_person(Person.new("Oleh", "Haras", "OI4563210789", "2003-07-04"))
pr.add_person(Person.new("Volodia", "Zelensky", "AU0123456789", "1978-01-25"))

pr.show_people
puts "\n"
p pr.get_byINN("OI4563210789")
puts "\n"
p pr.get_by_part_name("u")
puts "\n"
p pr.get_by_date_range(Date.parse("1983-07-04"), Date.parse("2003-07-04"))