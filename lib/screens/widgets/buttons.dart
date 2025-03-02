import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:passwordgenerate/screens/widgets/custom_snackbar.dart';

import '../../bloc/password_bloc.dart';
import '../../bloc/password_event.dart';
import '../../bloc/password_state.dart';

class Buttons extends StatelessWidget {
  final int passwordLength;
  final bool includeNumbers;
  final bool includeSpecialChars;
  const Buttons({super.key, required this.passwordLength, required this.includeNumbers, required this.includeSpecialChars});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 55.h,
          child: ElevatedButton(
            onPressed: () {
              context.read<PasswordBloc>().add(GeneratePassword(
                length: passwordLength,
                includeNumbers: includeNumbers,
                includeSpecialChars: includeSpecialChars,
              ));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF6B4EE0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
              elevation: 2,
            ),
            child:  Text(
              "Parol yaratish",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 15.h,
        ),
        BlocBuilder<PasswordBloc, PasswordState>(
          builder: (context, state) {
            return Visibility(
              visible: state.password.isNotEmpty,
              child: SizedBox(
                width: double.infinity,
                height: 55.h,
                child: ElevatedButton.icon(
                  icon: Icon(Icons.copy, color: Color(0xFF6B4EE0), size: 24.sp,),
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: state.password));
                    CustomSnackBar.show(context, "Parol nusxalandi");
                  },
                  label: Text(
                    "Parolni nusxalash",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Color(0xFF6B4EE0),
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      side: BorderSide(
                          color: Color(0xFF6B4EE0), width: 1.w),
                    ),
                    elevation: 0,
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
