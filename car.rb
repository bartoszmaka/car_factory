class Car
  attr_reader :color_name, :brand

  def initialize(brand, args = {})
    @brand = brand.to_s.capitalize
    @color_name = parse_color(args[:color])
  end

  private

  AVAILABLE_COLORS = %i[black red yellow].freeze
  @@color_counter = 0

  def parse_color(given_color)
    given_color.nil? ? pick_color_from_avaible_colors : formatted_color_name(given_color)
  end

  def formatted_color_name(unformatted_data)
    unformatted_data.to_s.split('_').map(&:capitalize).join(' ')
  end

  def pick_color_from_avaible_colors
    picked_color = formatted_color_name(AVAILABLE_COLORS[@@color_counter])
    tick_color_counter
    picked_color
  end

  def tick_color_counter
    @@color_counter = (@@color_counter + 1) % AVAILABLE_COLORS.length
  end
end
