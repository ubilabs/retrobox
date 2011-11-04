# Use this setup block to configure all options available in SimpleForm.
SimpleForm.setup do |config|
  # Wrappers are used by the form builder to generate a complete input.
  # You can remove any component from the wrapper, change the order or even
  # add your own to the stack. The options given to the wrappers method
  # are used to wrap the whole input (if any exists).

  config.wrappers :inline, :class => 'clearfix', :error_class => :error do |b|
    b.use :placeholder
    b.use :label
    b.use :tag => 'div', :class => 'input' do |ba|
      ba.use :input
      ba.use :error, :tag => :span, :class => :'help-inline'
      ba.use :hint,  :tag => :span, :class => :'help-block'
    end
  end

  # How the label text should be generated altogether with the required text.
  config.label_text = lambda { |label, required| "#{label} #{required}" }

  # Tell browsers whether to use default HTML5 validations (novalidate option).
  # Default is enabled.
  config.browser_validations = false

  # Default class for buttons
  config.button_class = 'btn large'
end
