module ApplicationHelper
  
  # Return a title on a per-page basis.
  def title
    base_title = "Watford Events"
    if @title.nil?
      base_title
    else
      "#{@title} « #{base_title}"
    end
  end
  
  def logo
    image_tag("rails.png", :alt => "Logo alternative text", :class=> "round")
  end
end
