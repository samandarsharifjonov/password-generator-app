import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:passwordgenerate/bloc/password_bloc.dart';
import 'package:passwordgenerate/screens/widgets/password_display_card.dart';
import 'package:passwordgenerate/screens/widgets/buttons.dart';
import 'package:passwordgenerate/screens/widgets/settings_card.dart';
import 'package:flutter/services.dart';

import '../../bloc/password_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int passwordLength = 20;
  bool includeNumbers = true;
  bool includeSpecialChars = true;

  Color _getStrengthColor(PasswordStrength strength) {
    switch (strength) {
      case PasswordStrength.weak:
        return Colors.red;
      case PasswordStrength.medium:
        return Colors.orange;
      case PasswordStrength.strong:
        return Colors.green;
      case PasswordStrength.veryStrong:
        return Colors.blue;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Parol Generator",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 20.sp),
        ),
        backgroundColor: Color(0xFF6B4EE0),
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF6B4EE0),
              Color(0xFF9683EC),
              Color(0xFF9683EC),
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(20.r),
          child: Column(
            children: [
              SizedBox(
                height: 30.h,
              ),
              // Password display card
              PasswordDisplayCard(),
              SizedBox(
                height: 15.h,
              ),
              BlocBuilder<PasswordBloc, PasswordState>(
                builder: (context, state) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        state.strength == PasswordStrength.weak
                            ? "Kuchsiz Parol"
                            : state.strength == PasswordStrength.medium
                                ? "O'rtacha parol"
                                : state.strength == PasswordStrength.strong
                                    ? "Kuchli parol"
                                    : "O'ta kuchli parol",
                        style: TextStyle(color: Colors.white, fontSize: 15.sp),
                      ),
                      Container(
                        height: 20.h,
                        width: 20.w,
                        decoration: BoxDecoration(
                            color: _getStrengthColor(state.strength),
                            borderRadius: BorderRadius.circular(100.r),
                          border: Border.all(
                            width: 1.w,
                            color: Colors.white,
                          )

                        ),
                      )
                    ],
                  );
                },
              ),

              SizedBox(
                height: 15.h,
              ),
              // Settings card
              SettingsCard(
                passwordLength: passwordLength,
                includeNumbers: includeNumbers,
                includeSpecialChars: includeSpecialChars,
                onLengthChanged: (value) {
                  setState(() {
                    passwordLength = value;
                  });
                },
                onNumbersChanged: (value) {
                  setState(() {
                    includeNumbers = value;
                  });
                },
                onSpecialCharsChanged: (value) {
                  setState(() {
                    includeSpecialChars = value;
                  });
                },
              ),
              SizedBox(
                height: 20.h,
              ),

              Spacer(),
              // Buttons
              Buttons(
                  passwordLength: passwordLength,
                  includeNumbers: includeNumbers,
                  includeSpecialChars: includeSpecialChars),

              SizedBox(
                height: 30.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
