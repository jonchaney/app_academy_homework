require_relative 'db_connection'
require 'active_support/inflector'

# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject

  def self.columns
    @columns ||= DBConnection.execute2(<<-SQL
        SELECT
          *
        FROM
         "#{table_name}"
      SQL
      ).first.map(&:to_sym)
  end

  def self.finalize!
    # debugger
    self.columns.each do |label|

      define_method(label) do
        self.attributes[label]
      end

      define_method("#{label}=") do |val|
        self.attributes[label] = val
      end

    end
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    @table_name ||= "#{self.to_s.tableize}"
  end

  def self.all
    parse_all(DBConnection.execute(<<-SQL
                SELECT
                  "#{self.table_name}".*
                FROM
                  "#{self.table_name}"
                SQL
             ))
  end

  def self.parse_all(results)
    results.map do |options|
      self.new(options)
    end
  end

  def self.find(id)
    obj = DBConnection.execute(<<-SQL, id)
      SELECT
        "#{self.table_name}".*
      FROM
        "#{self.table_name}"
      WHERE
        "#{self.table_name}".id = ?
      SQL
      parse_all(obj).first
  end

  def initialize(params = {})
    params.each do |attr_name, value|
      unless self.class.columns.include?("#{attr_name}".to_sym)
        raise "unknown attribute '#{attr_name}'"
      else
        self.send("#{attr_name}=".to_sym, value)
      end
    end
  end

  def attributes
    @attributes ||= {}
  end

  def attribute_values
    self.class.columns.map { |attr| self.send(attr) }
  end

  def insert
    columns = self.class.columns.drop(1)
    col_names = columns.map(&:to_s).join(", ")
    question_marks = (["?"] * columns.count).join(", ")

    DBConnection.execute(<<-SQL, *attribute_values.drop(1))
       INSERT INTO
         #{self.class.table_name} (#{col_names})
       VALUES
         (#{question_marks})
     SQL

     self.id = DBConnection.last_insert_row_id
  end

  def update
    # ...
  end

  def save
    # ...
  end

end
