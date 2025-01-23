require 'pg'
class PG_client
  private_class_method :new
  
  def exec(query)
    client.exec(query)
  end
  
  def exec_params(query)
    client.exec_params(query)
  end

  def close
    client.close
  end

  @instance = nil 

  def self.instance
    @instance ||= new
  end

  private
  attr_accessor :client

  def initialize
    self.client = PG.connect(
      dbname: 'students',
      user: 'mariamasenko',
      password: '1234',
      host: 'localhost',
      port: 5432
    )
  end
end
