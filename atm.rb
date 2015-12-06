class Atm
  attr_accessor :current_msg

  def clear_screen
    system 'clear'
  end

  def welcome_message
    clear_screen
    puts "Welcome to the ATM.\n" +
    "The card Machine is currently not working.\n" +    
    "Please select an option.\n" +
    "1) Log in to existing account\n" +
    "2) Start new account"
  end

  def operate
    welcome_message  
    user_input = nil
    loop do
      user_input = gets.chomp
      break if %w(1 2).include? user_input
      puts "That's not a valid option."
      puts "Please use '1' or '2'"
    end

    case user_input
    when "1"
      log_in_attempt
    when "2"
      create_account
    end
  end

  def log_in_attempt
    puts "Please enter your account number."
    prompt_for_user_number
    loop do 

    end
  end

  def create_account
    first_name_input = nil
    last_name_input = nil
    initial_deposit = nil
    loop do
      clear_screen
      confirm_info = nil
      puts "Create an account"

      puts "Please enter your first name"
      first_name_input = gets.chomp
      puts "First name: #{first_name_input}"

      puts "Please enter your last name"
      last_name_input = gets.chomp

      puts "Last name: #{last_name_input}"

      puts "Please enter your intial deposit"

      loop do 
        initial_deposit = gets.chomp
        break if initial_deposit.to_i.to_s == initial_deposit
        puts "Please enter a valid number in whole dollars."
      end

      info_confirm = nil
      loop do
        puts "First name: #{first_name_input}"
        puts "Last name: #{last_name_input}"
        puts "Initial deposit: $ #{initial_deposit}\n"
        puts "Is this correct?"
        puts "Y"
        puts "N"
        info_confirm = gets.chomp.downcase
        break if %w(y n).include?(info_confirm)
      end
      break if info_confirm == 'y'
    end

    new_account = Account.new(first_name_input, last_name_input, initial_deposit, Account.new_account_number)
    puts "Your account number is #{new_account.number}"
  end

  def prompt_for_user_number
    puts "Please enter your account number."
    account_number_input = nil
    loop do
    account_number_input = gets.chomp
    if account_number_input.length != 10
      puts "Your Account number should be 6 digits long"
      next
    end
    break if Account.accounts.include?(account_number_input)
    end
  end
end


class Account
  @@accounts = []
  attr_accessor :first_name, :last_name, :deposit, :number

  def initialize(first_name, last_name, deposit, number)
    @first_name = first_name
    @last_name = last_name
    @deposit = deposit
    @number = number
  end

  def self.new_account_number
    new_account_num = nil
    loop do
      new_account_num = Random.new_seed.to_s[0..5]
      break unless @@accounts.include?(new_account_num)
    end
    new_account_num
  end

end


atm = Atm.new

atm.operate

