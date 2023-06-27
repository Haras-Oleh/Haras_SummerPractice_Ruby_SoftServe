#Завдання 1:
#Create module Validation with methods valid_name?(string ) (valid name example Maria-Anna, max length is 40), valid_inn?(string)
# (valid inn example: AZ1234543456), after_date?(date) (is date may be date of birth)
puts "\n/-------------------------------------------------/"
#У модулі Validation ми визначаємо константу MAX_NAME_LENGTH, що представляє максимальну допустиму довжину для правильного імені (40 в даному випадку).
module Validation
  MAX_NAME_LENGTH = 40

#Метод valid_name? перевіряє, чи надане ім'я не є порожнім, не перевищує максимальну довжину 
#та відповідає регулярному виразу /[A-Za-z\-]+/, який дозволяє літери алфавіту та дефіси.
  def self.valid_name?(name)
    return false if name.nil? || name.empty? || name.length > MAX_NAME_LENGTH

    # Регулярний вираз для перевірки правильності імені
    pattern = /\A[A-Za-z\-]+\z/

    pattern.match?(name)
  end

  #Метод valid_inn? перевіряє, чи наданий ІПН (індивідуальний податковий номер) не є порожнім 
  #та відповідає регулярному виразу /[A-Z]{2}\d{10}/, що складається з двох великих літер, за якими йдуть десять цифр.
  def self.valid_inn?(inn)
    return false if inn.nil? || inn.empty?

    # Регулярний вираз для перевірки правильності ІПН
    pattern = /\A[A-Z]{2}\d{10}\z/

    pattern.match?(inn)
  end

  #Метод after_date? перевіряє, чи надана дата не є нульовою та є дійсним об'єктом типу Date. Потім він порівнює дату з поточною датою (Date.today) 
  #і повертає true, якщо надана дата належить до минулого.
  def self.after_date?(date)
    return false if date.nil? || !date.is_a?(Date)

    date < Date.today
  end
end

puts "\n/-------------------------------------------------/"