module Trestle
  module Mobility
    module Fields
      class TextAreaSimplemde < Trestle::Form::Field
        def defaults
          super.merge(rows: 20 || options[:rows])
        end

        def field
          custom_class = options[:custom_class] || ''
          label = options[:label] || name.to_s.humanize
          locales = options[:locales] || I18n.available_locales.sort
          selected = options[:selected] || Trestle.config.mobility.selected.call || locales.first
          deepl_query_params =  options[:deepl_query_params] || {}

          @template.render partial: "trestle/mobility/text_area_simplemde",
                           locals: {
                             options: options,
                             field_name: name,
                             label: label,
                             locales: locales,
                             custom_class: custom_class,
                             selected: selected,
                             deepl_query_params: deepl_query_params
                           }
        end
      end
    end
  end
end
