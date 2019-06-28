require "birthday_list"
require "date"

describe Birthday do

  describe "#add_info" do
    it "accepts two arguments, names & birthday and outputs a success message" do
      expect(subject.add_info("Harry", "10-12-1988")).to eq("added Harry 10-12-1988 to your list of friends!")
    end
  end

  describe "#stored_friends" do
    context "passing stored_friends with one one friend" do 
      it "stores the names & bdays passed to it" do
        expect(subject.stored_friends("Harry", "10-12-1988")).to include("Harry" => "10-12-1988")
      end
    end

    context "passing stored_friends with two one friend" do 
      it "stores the both sets of names & bdays passed to it" do
        subject.add_info("Harry", "10-12-1988")
        expect(subject.stored_friends("James", "07-12-1985")).to include("Harry" => "10-12-1988", "James" => "07-12-1985")
      end
    end
  end

  describe "#print_all_friends_birthdays" do
    it "prints out all of the names & birthdays in the friends_list" do
      subject.add_info("Boris", "01-01-1965")
      subject.add_info("Henny Relish", "01-01-2007")
      expect(subject.print_all_friends_birthdays).to eq("Boris's birthday is 01-01-1965,\nHenny Relish's birthday is 01-01-2007")
    end
  end

  describe "#current_day_month" do
    it "returns the current day and month in dd-mm string format" do
      expect(subject.current_day_month).to eq(DateTime.now.strftime("%d-%m"))
    end
  end

  describe "#check_for_birthdays_today" do
    context "with one friend" do
      it "prints out the name in the friends_list whose birthday it is today" do
        subject.add_info("Boris", "28-06-1965")
        subject.add_info("Henny Relish", "01-01-2007")
        expect(subject.check_for_birthdays_today).to eq("Boris")
      end
    end

    context "with two friends" do
      it "prints out the name of the friends_list whose birthday it is today" do
        subject.add_info("Boris Billy", "28-06-1965")
        subject.add_info("Harry Riley", "28-06-1988")
        subject.add_info("Henny Relish", "01-01-2007")
        expect(subject.check_for_birthdays_today).to eq("Boris Billy,\nHarry Riley")
      end
    end
  end
end