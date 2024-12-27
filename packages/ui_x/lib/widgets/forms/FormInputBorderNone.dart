import 'package:flutter/material.dart';

import '../../helpers/theme/ColorPaletteGerman.dart';

class FormInputBorderNone extends StatelessWidget {
  final TextEditingController? controller;
  final String? placeholder;
  final String? labelText;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final Icon? leading;
  final bool isPassword;
  final TextInputType type;
  final int rows;
  final TextInputAction action;
  final bool? autoFocus;
  final bool onlyRead;

  const FormInputBorderNone({
    Key? key,
    this.controller,
    this.placeholder = "Input hint",
    this.labelText,
    this.validator,
    this.leading,
    this.autoFocus,
    this.onlyRead = false,
    this.rows = 1,
    this.onSaved,
    this.action = TextInputAction.next,
    this.type = TextInputType.text,
  })  : isPassword = false,
        super(key: key);

  const FormInputBorderNone.text({
    Key? key,
    this.controller,
    this.placeholder = "Input hint",
    this.validator,
    this.labelText,
    this.leading,
    this.autoFocus,
    this.onlyRead = false,
    this.rows = 1,
    this.onSaved,
    this.action = TextInputAction.next,
    this.type = TextInputType.text,
  })  : isPassword = false,
        super(key: key);

  const FormInputBorderNone.password({
    Key? key,
    this.controller,
    this.placeholder = "Input hint",
    this.labelText,
    this.validator,
    this.leading,
    this.autoFocus,
    this.onlyRead = false,
    this.rows = 1,
    this.onSaved,
    this.action = TextInputAction.next,
    this.type = TextInputType.text,
  })  : isPassword = true,
        super(key: key);

  const FormInputBorderNone.number({
    Key? key,
    this.controller,
    this.placeholder = "Input hint",
    this.labelText,
    this.validator,
    this.leading,
    this.autoFocus,
    this.onlyRead = false,
    this.rows = 1,
    this.onSaved,
    this.action = TextInputAction.next,
    this.type = TextInputType.number,
  })  : isPassword = false,
        super(key: key);

  const FormInputBorderNone.email({
    Key? key,
    this.controller,
    this.placeholder = "Input hint",
    this.labelText,
    this.validator,
    this.leading,
    this.autoFocus,
    this.onlyRead = false,
    this.rows = 1,
    this.onSaved,
    this.action = TextInputAction.next,
    this.type = TextInputType.emailAddress,
  })  : isPassword = false,
        super(key: key);

  const FormInputBorderNone.datetime({
    Key? key,
    this.controller,
    this.placeholder = "Input hint",
    this.labelText,
    this.validator,
    this.leading,
    this.onlyRead = false,
    this.autoFocus,
    this.rows = 1,
    this.onSaved,
    this.action = TextInputAction.next,
    this.type = TextInputType.datetime,
  })  : isPassword = false,
        super(key: key);

  const FormInputBorderNone.url({
    Key? key,
    this.controller,
    this.placeholder = "Input hint",
    this.labelText,
    this.validator,
    this.leading,
    this.autoFocus,
    this.onlyRead = false,
    this.rows = 1,
    this.onSaved,
    this.action = TextInputAction.next,
    this.type = TextInputType.url,
  })  : isPassword = false,
        super(key: key);

  const FormInputBorderNone.multiline({
    Key? key,
    this.controller,
    this.placeholder = "Input hint",
    this.labelText,
    this.validator,
    this.leading,
    this.autoFocus,
    this.onlyRead = false,
    this.rows = 4,
    this.onSaved,
    this.action = TextInputAction.next,
    this.type = TextInputType.multiline,
  })  : isPassword = false,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: type,
      minLines: type == TextInputType.multiline ? rows : 1,
      maxLines: type == TextInputType.multiline ? null : 1,
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 1.5,
            color: kcDarkAlt.withOpacity(0.2),
          ),
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 1.5,
            color: kcDarkAlt.withOpacity(0.2),
          ),
        ),
        disabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 1.5,
            color: kcDarkAlt.withOpacity(0.2),
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 1.5,
            color: kcDarkAlt.withOpacity(0.2),
          ),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 0,vertical: 10),
        hintText: placeholder,
        labelText: labelText,
        prefixIcon: leading,
      ),
      autofocus: autoFocus ?? false,
      readOnly: onlyRead,
      obscureText: isPassword,
      validator: validator,
      onSaved: onSaved,
      textInputAction: action,
    );
  }
}
