require "../../spec_helper"
require "../../support/helpers/cli_helper"
require "../../../src/support/file_encryptor"

include CLIHelper

module AmberCli
  describe "amber encrypt" do
    it "creates a hidden .test.enc file" do
      scaffold_app(TESTING_APP)
      MainCommand.run ["encrypt", "test"]
      File.exists?("config/environments/.test.enc").should be_true
      cleanup
    end

    it "unencrypts .test.enc" do
      scaffold_app(TESTING_APP)
      MainCommand.run ["encrypt", "test"]
      String.new(Support::FileEncryptor.read("./config/environments/.test.enc")).should contain "port: 3000"
      cleanup
    end

    it "creates a 44 characters secret key in .encryption_key" do
      scaffold_app(TESTING_APP)
      MainCommand.run ["encrypt", "test"]
      File.read(".encryption_key").size.should eq 44
      cleanup
    end
  end
end
