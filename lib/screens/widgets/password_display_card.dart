import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../bloc/password_bloc.dart';
import '../../bloc/password_state.dart';

class PasswordDisplayCard extends StatelessWidget {
  const PasswordDisplayCard({super.key});

  Color _getStrengthColor(PasswordStrength strength) {
    switch (strength) {
      case PasswordStrength.weak:
        return Colors.red.shade300;
      case PasswordStrength.medium:
        return Colors.orange.shade300;
      case PasswordStrength.strong:
        return Colors.green.shade300;
      case PasswordStrength.veryStrong:
        return Colors.blue.shade300;
    }
  }
  


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PasswordBloc, PasswordState>(
      builder: (context, state) {
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
          child: BlocBuilder<PasswordBloc, PasswordState>(
            builder: (context, state) {
              return Column(
                children: [
                  Text(
                    "Sizning parolingiz",
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    state.password.isEmpty
                        ? "Parol yaratish tugmasini bosing!"
                        : state.password,
                    style: TextStyle(
                      fontSize: state.password.isEmpty ? 14.sp : 18.sp,
                      fontWeight: FontWeight.bold,
                      color: _getStrengthColor(state.strength),//Color(0xFF444444),
                      letterSpacing: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
