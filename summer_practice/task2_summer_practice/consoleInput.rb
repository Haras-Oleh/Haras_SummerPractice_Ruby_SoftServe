#Даний файлик з моїм кодом містить набір методів для отримання введення з консолі з різними обмеженнями та перевірками

#Цей рядочок просто визначає шлях до першого завдання.
FIRST_TASK_PATH = "./summer_practice/task1_summer_practice"
# 'C:\Users\freed\Desktop\desktop\RUBY_LABS\summer_practice\task1_summer_practice'

#Цей рядок включає модуль з файлу, який знаходиться за шляхом FIRST_TASK_PATH. 
#Модуль містить набір методів для отримання введення з консолі.
require FIRST_TASK_PATH

#Метод get_string_input отримує рядок введення з консолі, перевіряє, що введений рядок містить тільки букви 
#українського або англійського алфавіту, і повертає цей рядок.
module ConsoleInput
  def get_string_input()
    input = nil
    until input && input.match?(/\A[a-zа-щьюяґєіїA-ZА-ЩЬЮЯҐЄІЇ]+\z/)
      print "Input alphabetic value: "
      input = gets.chomp
    end
    input
  end

  #Метод get_name_input отримує рядок введення з консолі, перевіряє, що введений рядок 
  #має правильний формат для імені (наприклад, "Anna-Maria"), і повертає цей рядок.
  def get_name_input()
    input = nil
    until input && valid_name?(input)
      print "Input name-typed value (ex. Anna-Maria): "
      input = gets.chomp
    end
    input
  end

  #Метод get_integer_input отримує рядок введення з консолі, перевіряє, 
  #що введений рядок складається тільки з цифр, і повертає це значення у вигляді цілого числа (input.to_i).
  def get_integer_input()
    input = nil
    until input && input.match?(/\A[0-9]+\z/)
      print "Input integer value: "
      input = gets.chomp
    end
    input.to_i
  end

  #Метод get_inn_input призначений для отримання вхідних даних від користувача, 
  #пов'язаних з ІНН , та перевіряє їх на валідність за допомогою функції valid_inn?()
  def get_inn_input()
    input = nil
    until input && valid_inn?(input)
      print "Input inn-typed value (ex. AZ0123456789): "
      input = gets.chomp
    end
    input
  end


  def valid_date_format?(input)
    /^\d{4}-\d{2}-\d{2}$/.match?(input) && Date.parse(input)
  rescue ArgumentError
    false
  end

  #Метод get_date_input() отримує вхідні дані від користувача, пов'язані з датою, 
  #і перевіряє їх на відповідність формату та коректність за допомогою функції valid_date_format?()
  def get_date_input()
    input = nil
    until input && valid_date_format?(input)
      print "Input valid date value in yyyy-mm-dd format: "
      input = gets.chomp
    end
    Date.parse(input)
  end

  private :valid_date_format?
end
