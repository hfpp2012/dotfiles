# encoding: utf-8

##
# Backup Generated: my_backup
# Once configured, you can run the backup with the following command:
#
# $ backup perform -t my_backup [-c <path_to_configuration_file>]
#
# For more information about Backup's components, see the documentation at:
# http://meskyanichi.github.io/backup
#
Model.new(:my_backup, 'Description for my_backup') do

  ##
  # PostgreSQL [Database]
  #
  database PostgreSQL do |db|
    # To dump all databases, set `db.name = :all` (or leave blank)
    db.name               = "yingxing_pro"
    db.username           = "postgres"
    db.password           = "hfpp2012H"
    db.host               = "localhost"
    db.port               = 5432
    db.socket             = "/var/run/postgresql/"
    # When dumping all databases, `skip_tables` and `only_tables` are ignored.
    # db.skip_tables        = ["skip", "these", "tables"]
    # db.only_tables        = ["only", "these", "tables"]
    db.additional_options = ["-xc", "-E=utf8"]
  end

  store_with Local do |local|
    local.path       = "~/backups/"
    local.keep       = 5
  end


  ##
  # Gzip [Compressor]
  #
  compress_with Gzip

end
