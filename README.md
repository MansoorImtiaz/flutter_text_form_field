# Text Form Field Flutter

A highly customizable Flutter text form field widget that supports various label behaviors, styling
options, and validation features.

## Features

- Multiple label behavior styles (never, auto, always, external)
- Comprehensive theming support
- Built-in form validation
- Customizable borders and colors
- Support for prefix and suffix icons
- Error handling and display
- Responsive design support

## Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  text_form_field_flutter: ^0.0.1

## Examples

## Basic Usage

TextFormFieldFlutter(
  labelText: 'Username',
  hintText: 'Enter your username',
)

Email Field with Validation
TextFormFieldFlutter(
  labelText: 'Email',
  hintText: 'Enter your email',
  keyboardType: TextInputType.emailAddress,
  prefixIcon: Icon(Icons.email),
  validator: (value) {
    bool isEmailValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"
    ).hasMatch(value ?? '');
    
    if (value == null || value.isEmpty) {
      return 'Email is required';
    } else if (!isEmailValid) {
      return 'Enter a valid email';
    }
    return null;
  },
)

Password Field
TextFormFieldFlutter(
  labelText: 'Password',
  hintText: 'Enter your password',
  obscureText: true,
  prefixIcon: Icon(Icons.lock),
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    } else if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  },
)

Custom Styling
TextFormFieldFlutter(
  labelText: 'Custom Field',
  hintText: 'Enter text',
  fillColor: Colors.grey[200],
  borderRadius: 8.0,
  labelColor: Colors.blue,
  borderColor: Colors.blue,
  labelFontSize: 16.0,
  hintFontSize: 14.0,
)

Different Label Behaviors
// External Label
TextFormFieldFlutter(
  labelText: 'External Label',
  hintText: 'Enter text',
  labelBehaviorStyles: LabelBehaviorStyles.labelExternal,
)

// Floating Label
TextFormFieldFlutter(
  labelText: 'Floating Label',
  hintText: 'Enter text',
  labelBehaviorStyles: LabelBehaviorStyles.labelAuto,
)

// Always Floating Label
TextFormFieldFlutter(
  labelText: 'Always Floating',
  hintText: 'Enter text',
  labelBehaviorStyles: LabelBehaviorStyles.labelAlways,
)

Complete Form Example
class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormFieldFlutter(
            labelText: 'Email',
            hintText: 'Enter your email',
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            prefixIcon: Icon(Icons.email),
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'Please enter email';
              }
              return null;
            },
          ),
          SizedBox(height: 16),
          TextFormFieldFlutter(
            labelText: 'Password',
            hintText: 'Enter your password',
            controller: _passwordController,
            obscureText: true,
            prefixIcon: Icon(Icons.lock),
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'Please enter password';
              }
              return null;
            },
          ),
          SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState?.validate() ?? false) {
                // Form is valid, process the data
                print('Email: ${_emailController.text}');
                print('Password: ${_passwordController.text}');
              }
            },
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}

Available Properties
PropertyTypeDescriptionlabelTextStringThe text to display as the field labelhintTextStringPlaceholder text when field is emptyvalidatorFunction?Function that returns error message or nulllabelBehaviorStylesLabelBehaviorStylesControls how the label behavesfillColorColor?Background color of the fieldborderColorColor?Color of the field borderlabelColorColor?Color of the label texthintColorColor?Color of the hint textborderRadiusdouble?Radius of the field cornerslabelFontSizedouble?Size of the label texthintFontSizedouble?Size of the hint textprefixIconWidget?Icon shown before the inputsuffixIconWidget?Icon shown after the inputobscureTextboolWhether to hide the input textreadOnlyboolWhether the field is read-only

Contributing
Contributions are welcome! If you find a bug or want a feature, please create an issue.
License
MIT License

Copyright (c) 2025 Mansoor Imtiaz

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is furnished
to do so.

Would you like me to:
1. Add more examples?
2. Include specific use cases?
3. Add screenshots of the widget in action?
4. Create a more detailed API reference?
