module ApplicationHelper

  def logo
    image_tag("mobstone.png", :alt => "Sample App")
  end

  # Return a title on a per-page basis.
  def title
    base_title = "MobStone"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
end
