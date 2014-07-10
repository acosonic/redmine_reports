class MultiQuery
  def initialize
  end

  def exec_query(query)
    ActiveRecord::Base.connection.select(query)
  end
end
