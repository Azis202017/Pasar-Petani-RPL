import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

enum InputType { name, email, password, confirmPassword, address, phoneNumber }

class InputTextField extends StatefulWidget {
  final String labelText;
  final InputType? inputType;
  final TextEditingController controller;
  final TextEditingController? confirmPasswordController;

  const InputTextField({
    Key? key,
    required this.labelText,
    this.inputType,
    required this.controller,
    this.confirmPasswordController,
  }) : super(key: key);

  @override
  State<InputTextField> createState() => _InputTextFieldState();
}

class _InputTextFieldState extends State<InputTextField> {
  bool _isObscure = true;

  void _toggleObscure() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }

  bool _isValidEmail(String email) {
    return EmailValidator.validate(email);
  }

  TextInputType _getKeyboardType(InputType? inputType) {
    switch (inputType) {
      case InputType.name:
        return TextInputType.name;
      case InputType.email:
        return TextInputType.emailAddress;
      case InputType.password:
        return TextInputType.visiblePassword;
      case InputType.confirmPassword:
        return TextInputType.visiblePassword;
      case InputType.address:
        return TextInputType.streetAddress;
      case InputType.phoneNumber:
        return TextInputType.phone;
      default:
        return TextInputType.text;
    }
  }

  String? _getWarningMessage(InputType? inputType, String? value) {
    switch (inputType) {
      case InputType.name:
        if (value == null || value.isEmpty) {
          return 'Nama tidak boleh kosong';
        }
      case InputType.email:
        if (value == null || value.isEmpty) {
          return 'Email tidak boleh kosong';
        } else if (!_isValidEmail(value)) {
          return 'Email tidak valid';
        }
      case InputType.password:
        if (value == null || value.isEmpty) {
          return 'Password tidak boleh kosong';
        } else if (value.length < 8) {
          return 'Password minimal 8 karakter';
        }
      case InputType.confirmPassword:
        if (value == null || value.isEmpty) {
          return 'Konfirmasi password tidak boleh kosong';
        } else if (value != widget.confirmPasswordController!.text) {
          return 'Konfirmasi password tidak sama';
        }
      case InputType.address:
        if (value == null || value.isEmpty) {
          return 'Alamat tidak boleh kosong';
        }
      case InputType.phoneNumber:
        if (value == null || value.isEmpty) {
          return 'Nomor telepon tidak boleh kosong';
        }
      default:
        if (value == null || value.isEmpty) {
          return 'Input tidak boleh kosong';
        }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16 * 0.97),
      child: TextFormField(
        obscureText: widget.inputType == InputType.password
            ? _isObscure
            : widget.inputType == InputType.confirmPassword
                ? _isObscure
                : false,
        obscuringCharacter: '*',
        decoration: InputDecoration(
          labelText: widget.labelText,
          labelStyle: Theme.of(context).textTheme.labelSmall,
          suffixIcon: widget.inputType == InputType.password
              ? IconButton(
                  icon: Icon(
                      _isObscure ? Icons.visibility : Icons.visibility_off),
                  onPressed: _toggleObscure)
              : widget.inputType == InputType.confirmPassword
                  ? IconButton(
                      icon: Icon(
                          _isObscure ? Icons.visibility : Icons.visibility_off),
                      onPressed: _toggleObscure)
                  : null,
          errorStyle: const TextStyle(
            color: Colors.red,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
        style: Theme.of(context).textTheme.labelMedium,
        controller: widget.controller,
        keyboardType: _getKeyboardType(widget.inputType),
        validator: (value) {
          return _getWarningMessage(widget.inputType, value);
        },
      ),
    );
  }
}
