import 'package:flutter/material.dart';
// import 'customers/referral_program_registration_screen.dart';
import 'package:dev_shakib_ui/Customers/Terms_Service.dart';
void main() {
  runApp(const ReferableApp());
}

class ReferableApp extends StatelessWidget {
  const ReferableApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Referable',
      // home: const ReferralProgramRegistrationScreen(),
      home: const TermsOfServiceScreen(),
    );
  }
}
