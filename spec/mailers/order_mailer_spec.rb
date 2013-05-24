require "spec_helper"

describe OrderMailer do
  describe "customer" do
    let(:mail) { OrderMailer.customer }

    it "renders the headers" do
      mail.subject.should eq("Customer")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

  describe "admin" do
    let(:mail) { OrderMailer.admin }

    it "renders the headers" do
      mail.subject.should eq("Admin")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
