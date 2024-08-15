# frozen_string_literal: true

class CardComponent < ViewComponent::Base
  renders_one :footer

  def initialize(title:, variant: nil, html_options: {})
    @title = title
    @variant = variant
    @html_options = html_options
  end

  attr_reader :title, :variant, :html_options
end
