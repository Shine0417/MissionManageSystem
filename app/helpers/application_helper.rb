module ApplicationHelper
  def translate(arr, model)
    arr.map { |col| [model.human_attribute_name(col), col] }
  end
end
