require_relative 'nameable'
class BaseDecorator < Nameable
  def initialize(nameableObj)
    @nameableObj = nameableObj
  end

  def correct_name
    @nameableObj.correct_name
  end
end

class CapitalizeDecorator < BaseDecorator
  def correct_name
    @nameableObj.correct_name.capitalize
  end
end

class TrimmerDecorator < BaseDecorator
  def correct_name
    @nameableObj.correct_name[0,10]
  end
end