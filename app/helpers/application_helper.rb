module ApplicationHelper
  def sort_param(param)
    if param.nil?
      :created_at
    else
      param
    end
  end
end
