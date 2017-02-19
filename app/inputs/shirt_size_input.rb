class ShirtSizeInput < SimpleForm::Inputs::Base
  def input(wrapper_options)
    merged_input_options = merge_wrapper_options(input_html_options, wrapper_options)

    template.content_tag :div, merged_input_options do
      template.concat sex_field
      template.concat size_field
    end
  end

  private

  def input_html_classes
    super.push("shirt_size_input")
  end

  def sex_field
    template.content_tag :div do
      @builder.collection_radio_buttons(
        :shirt_fit_sex,
        [
          ["woman", "Women's"],
          ["man", "Men's"],
        ],
        :first,
        :last,
      )
    end
  end

  def size_field
    template.content_tag :div do
      @builder.collection_radio_buttons(
        :shirt_fit_size,
        [
          ["xs", "XS"],
          ["s", "S"],
          ["m", "M"],
          ["l", "L"],
          ["xl", "XL"],
          ["xxl", "XXL"],
          ["xxxl", "XXXL"],
        ],
        :first,
        :last,
      )
    end
  end
end
