#Даний файлик з моїм кодом містить набір методів для отримання введення з консолі з різними обмеженнями та перевірками

#Цей рядочок просто визначає шлях до першого завдання.
FIRST_TASK_PATH = "./summer_practice/task1_summer_practice"
# 'C:\Users\freed\Desktop\desktop\RUBY_LABS\summer_practice\task1_summer_practice'

#Цей рядок включає модуль з файлу, який знаходиться за шляхом FIRST_TASK_PATH. 
#Модуль містить набір методів для отримання введення з консолі.
require FIRST_TASK_PATH

module ConsoleInput
  def get_string_input()
    input = nil
    until input && input.is_a?(String)
      print "Input string value: "
      input = gets.chomp
    end
    input
  end

  def get_name_input()
    input = nil
    until input && valid_name?(input)
      print "Input name-typed value (ex. Anna-Maria): "
      input = gets.chomp
    end
    input
  end

  def get_integer_input()
    input = nil
    until input && input.match?(/\A[0-9]+\z/)
      print "Input integer value: "
      input = gets.chomp
    end
    input.to_i
  end

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
