module ApplicationHelper
  def icon_tag(symbol, icon_modifier: nil)
    inline_svg "#{symbol}.svg", class: "icon inactive #{icon_modifier}"
  end
end
