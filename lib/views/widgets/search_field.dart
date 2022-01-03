import 'package:artisan/core/helper/utils/pallets.dart';
import 'package:flutter/material.dart';

class SearchAndFilter extends StatelessWidget {
  final String? hint;
  final TextEditingController? textEditingController;
  final Function()? filter;
  final Function()? onPressed;
  final Function(String)? onSubmitted;
  final Function(String)? onChanged;
  final bool? showFilter;
  final bool? readOnly;
  final Function()? onTap;
  final IconData? icon;

  const SearchAndFilter({
    Key? key,
    this.hint,
    this.textEditingController,
    this.filter,
    this.onPressed,
    this.onSubmitted,
    this.onChanged,
    this.onTap,
    this.icon,
    this.showFilter = true,
    this.readOnly = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: textEditingController,
        cursorColor: Pallets.blue,
        onSubmitted: onSubmitted,
        onChanged: onChanged,
        readOnly: readOnly!,
        onTap: onTap,
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: Pallets.grey1000),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Pallets.grey1000),
            borderRadius: BorderRadius.circular(8.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Pallets.grey1000),
            borderRadius: BorderRadius.circular(8.0),
          ),
          filled: true,
          hintStyle:
              TextStyle(color: Colors.grey[500], fontWeight: FontWeight.w500),
          hintText: hint,
          suffixIcon: IconButton(
              onPressed: onPressed, icon: Icon(icon ?? Icons.search)),
          fillColor: Colors.transparent,
        ));
  }
}
