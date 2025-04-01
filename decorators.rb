require_relative 'nameable'
class BaseDecorator < Nameable
  def initialize(nameable_obj)
    super()
    @nameable_obj = nameable_obj
  end

  def correct_name
    @nameable_obj.correct_name
  end
end

class CapitalizeDecorator < BaseDecorator
  def correct_name
    @nameable_obj.correct_name.capitalize
  end
end

class TrimmerDecorator < BaseDecorator
  def correct_name
    @nameable_obj.correct_name[0, 10]
  end
end
