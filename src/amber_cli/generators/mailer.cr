require "./field.cr"

module AmberCli
  class Mailer < Generator
    command :mailer
    directory "#{__DIR__}/../templates/mailer"

    def initialize(name, fields)
      super(name, fields)
    end
  end
end
