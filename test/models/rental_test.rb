require "test_helper"

describe Rental do
  let(:rental) { rentals(:two) }
  let(:customer) { customers(:hana) }
  let(:movie) { movies(:toalltheboys) }

  describe "validations" do
    it "is valid when all fields are present" do
      result = rental.valid?

      expect(result).must_equal true
    end

    it "requires a checkout date" do
      rental.checkout_date = nil

      valid_rental = rental.valid?

      expect(valid_rental).must_equal false
      expect(rental.errors.messages).must_include :checkout_date
      expect(rental.errors.messages[:checkout_date]).must_equal ["can't be blank"]
    end
  end

  describe "relations" do
    it "has a movie" do
      rental.must_respond_to :movie
      rental.movie.must_be_kind_of Movie
    end

    it "has a customer" do
      rental.must_respond_to :customer
      rental.customer.must_be_kind_of Customer
    end

    it "requires a movie" do
      rental.movie = nil

      valid_rental = rental.valid?

      expect(valid_rental).must_equal false
      expect(rental.errors.messages).must_include :movie
      expect(rental.errors.messages[:movie]).must_equal ["must exist"]
    end

    it "requires a customer" do
      rental.customer = nil

      valid_rental = rental.valid?

      expect(valid_rental).must_equal false
      expect(rental.errors.messages).must_include :customer
      expect(rental.errors.messages[:customer]).must_equal ["must exist"]
    end
  end

  # describe "custom methods" do
  #   it "sets checkout date to current date" do
  #     new_rental = Rental.new
  #     expect(new_rental.checkout_date).must_equal Date.current
  #   end

  #   it "sets due date to a week from today / checkout date" do
  #     new_rental = Rental.new
  #     expect(new_rental.due_date).must_equal new_rental.checkout_date + 7
  #   end
  # end
end
