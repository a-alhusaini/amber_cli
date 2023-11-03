require "./migration"

module AmberCli
  class EmptyMigration < Migration
    command :migration
    directory "#{__DIR__}/../templates/migration/empty"
  end
end
