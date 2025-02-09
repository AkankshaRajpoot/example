import 'package:flutter/material.dart';

import '../../helpers/TextStyl.dart';
import '../../helpers/theme/ColorPaletteGerman.dart';

class FormInput extends StatelessWidget {
  final TextEditingController? controller;
  final String? placeholder;
  final String? labelText;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final Widget? leading;
  final bool isPassword;
  final TextInputType type;
  final int rows;
  final TextInputAction action;
  final bool? autoFocus;
  final bool onlyRead;
  final Widget? suffix;

  const FormInput({
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
    this.suffix,
    this.action = TextInputAction.next,
    this.type = TextInputType.text,
  })  : isPassword = false,
        super(key: key);

  const FormInput.text({
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
    this.suffix,
    this.action = TextInputAction.next,
    this.type = TextInputType.text,
  })  : isPassword = false,
        super(key: key);

  const FormInput.password({
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
    this.suffix,
    this.action = TextInputAction.next,
    this.type = TextInputType.text,
  })  : isPassword = true,
        super(key: key);

  const FormInput.number({
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
    this.suffix,
    this.action = TextInputAction.next,
    this.type = TextInputType.number,
  })  : isPassword = false,
        super(key: key);

  const FormInput.email({
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
    this.suffix,
    this.action = TextInputAction.next,
    this.type = TextInputType.emailAddress,
  })  : isPassword = false,
        super(key: key);

  const FormInput.datetime({
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
    this.suffix,
    this.action = TextInputAction.next,
    this.type = TextInputType.datetime,
  })  : isPassword = false,
        super(key: key);

  const FormInput.url({
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
    this.suffix,
    this.action = TextInputAction.next,
    this.type = TextInputType.url,
  })  : isPassword = false,
        super(key: key);

  const FormInput.multiline({
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
    this.suffix,
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
        fillColor: kcOffWhite.withOpacity(0.6),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(20),
        ),
        hintText: placeholder,
        labelText: labelText,
        prefixIcon: leading,
        suffix: suffix,
       suffixStyle: TextStyl.bodySm?.copyWith(color: kcBlack,fontSize: 15)
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
