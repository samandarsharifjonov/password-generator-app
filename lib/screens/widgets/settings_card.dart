import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsCard extends StatefulWidget {
  final int passwordLength;
  final bool includeNumbers;
  final bool includeSpecialChars;
  final ValueChanged<int> onLengthChanged;
  final ValueChanged<bool> onNumbersChanged;
  final ValueChanged<bool> onSpecialCharsChanged;

  const SettingsCard({
    super.key,
    required this.passwordLength,
    required this.includeNumbers,
    required this.includeSpecialChars,
    required this.onLengthChanged,
    required this.onNumbersChanged,
    required this.onSpecialCharsChanged,
  });

  @override
  State<SettingsCard> createState() => _SettingsCardState();
}

class _SettingsCardState extends State<SettingsCard> {
  late int _passwordLength;
  late bool _includeNumbers;
  late bool _includeSpecialChars;

  @override
  void initState() {
    super.initState();
    _passwordLength = widget.passwordLength;
    _includeNumbers = widget.includeNumbers;
    _includeSpecialChars = widget.includeSpecialChars;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Sozlamalar",
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: Color(0xFF444444),
            ),
          ),
          SizedBox(height: 30.h),
          Text(
            "Parol uzunligi: $_passwordLength",
            style: TextStyle(fontSize: 16.sp, color: Color(0xFF666666)),
          ),
          Slider(
            min: 6,
            max: 20,
            divisions: 14,
            value: _passwordLength.toDouble(),
            label: _passwordLength.toString(),
            onChanged: (value) {
              setState(() {
                _passwordLength = value.toInt();
              });
              widget.onLengthChanged(_passwordLength);
            },
          ),
          SwitchListTile(
            title: Text(
              "Raqamlarni qo'shish",
              style: TextStyle(color: Color(0xFF666666), fontSize: 16.sp),
            ),
            value: _includeNumbers,
            activeColor: Color(0xFF6B4EE0),
            contentPadding: EdgeInsets.zero,
            onChanged: (value) {
              setState(() {
                _includeNumbers = value;
              });
              widget.onNumbersChanged(_includeNumbers);
            },
          ),
          SwitchListTile(
            title: Text(
              "Belgilarni qo'shish",
              style: TextStyle(color: Color(0xFF666666), fontSize: 16.sp),
            ),
            value: _includeSpecialChars,
            activeColor: Color(0xFF6B4EE0),
            contentPadding: EdgeInsets.zero,
            onChanged: (value) {
              setState(() {
                _includeSpecialChars = value;
              });
              widget.onSpecialCharsChanged(_includeSpecialChars);
            },
          ),
        ],
      ),
    );
  }
}
