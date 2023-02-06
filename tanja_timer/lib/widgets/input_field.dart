// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:tanja_timer/extensions/custom_text_style.dart';

// class CustomInputField extends StatefulWidget {
//   final String? placeholder;
//   final double width;
//   final TextInputAction? textInputAction;
//   final FormFieldValidator<String>? validator;
//   final void Function(String)? onChanged;
//   final void Function(bool)? onFocusChanged;

//   const CustomInputField({
//     super.key,
//     required this.width,
//     this.placeholder,
//     this.onChanged,
//     this.textInputAction,
//     this.validator,
//     this.onFocusChanged,
//   });

//   @override
//   State<CustomInputField> createState() => _CustomInputFieldState();
// }

// class _CustomInputFieldState extends State<CustomInputField> {
//   late GlobalKey<FormState> _formKey;
//   final FocusNode _focusNode = FocusNode();
//   bool _hasText = false;

//   @override
//   void initState() {
//     super.initState();
//     _formKey = GlobalKey<FormState>();
//     _focusNode.addListener(_listenToFocusNode);
//   }

//   @override
//   void dispose() {
//     _focusNode.removeListener(_listenToFocusNode);
//     _focusNode.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
//       child: Row(
//         children: [
//           Form(
//             key: _formKey,
//             child: SizedBox(
//               width: 200,
//               height: 36,
//               child: TextFormField(
//                 focusNode: _focusNode,
//                 textInputAction: TextInputAction.next,
//                 keyboardType: TextInputType.number,
//                 onChanged: (text) {
//                   if (_hasText && text.isEmpty) _toggleHasText();
//                   if (!_hasText && text.isNotEmpty) _toggleHasText();

//                   if (text.isNotEmpty && widget.validator != null) {
//                     final valid = widget.validator!(text) == null;
//                     if (valid) {
//                       _formKey.currentState?.validate();
//                     }
//                   }
//                   if (widget.onChanged != null) widget.onChanged!(text);
//                 },
//                 validator: widget.validator,
//                 style: CustomTextStyles.of(context).regular14.copyWith(height: 1.5),
//                 decoration: InputDecoration(
//                   contentPadding: const EdgeInsets.symmetric(vertical: 1, horizontal: 8),
//                   hintText: widget.placeholder,
//                   hintStyle: CustomTextStyles.of(context).regular14.copyWith(height: 2.45),
//                   errorStyle: CustomTextStyles.of(context).regular14.apply(color: Colors.redAccent),
//                   border: const OutlineInputBorder(borderSide: BorderSide.none),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   void _toggleHasText() {
//     _hasText = !_hasText;
//     setState(() {});
//   }

//   void _listenToFocusNode() {
//     if (_focusNode.hasFocus == false) {
//       _formKey.currentState?.validate();
//       widget.onFocusChanged?.call(false);
//     } else {
//       widget.onFocusChanged?.call(true);
//     }
//   }
// }

// String? validateNotEmpty(String? value) {
//   String? validateText;
//   if (value == null || value.trim().isEmpty) {
//     validateText = 'validation_error';
//   }
//   return validateText;
// }
