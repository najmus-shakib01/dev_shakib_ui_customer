import 'package:flutter/material.dart';

class ReferralProgramRegistrationScreen extends StatelessWidget {
  const ReferralProgramRegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(
        0xFFF8F5EF,
      ), 
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              _buildHeader(),
              const SizedBox(height: 20),
              _InviteBanner(),
              const SizedBox(height: 25),
              const _RegistrationForm(),
              const SizedBox(height: 35),
              const _SubmitButton(),
              const SizedBox(height: 15),
              const _AlreadyHaveAccountButton(),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: const [
        Text(
          "Referable",
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 6),
        Text(
          "Join our referral community",
          style: TextStyle(fontSize: 16, color: Colors.black54),
        ),
      ],
    );
  }
}

class _InviteBanner extends StatelessWidget {
  const _InviteBanner();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF3E4), 
        borderRadius: BorderRadius.circular(14),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08), 
            blurRadius: 12,
            spreadRadius: 1,
            offset: const Offset(0, 4), 
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Row(
            children: [
              Text("🎁  ", style: TextStyle(fontSize: 20)),
              Text(
                "You've been invited!",
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFFEB5A1E),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            "Complete your registration to start earning rewards through our referral program.",
            style: TextStyle(fontSize: 14, color: Colors.black87),
          ),
        ],
      ),
    );
  }
}

class _RegistrationForm extends StatefulWidget {
  const _RegistrationForm();

  @override
  State<_RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<_RegistrationForm> {
  bool agree = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _FieldLabel("Customer Name"),
          const SizedBox(height: 8),
          const _InputField(hintText: "Enter full name"),
          const SizedBox(height: 18),

          const _FieldLabel("Email Address"),
          const SizedBox(height: 8),
          const _InputField(hintText: "customer@example.com"),
          const SizedBox(height: 18),

          const _FieldLabel("Phone Number"),
          const SizedBox(height: 8),
          const _InputField(hintText: "(555) 123-4567"),
          const SizedBox(height: 18),

          Row(
            children: [
              Checkbox(
                value: agree,
                onChanged: (v) => setState(() => agree = v ?? false),
                activeColor: const Color(0xFFEB5A1E), 
              ),
              Expanded(
                child: Wrap(
                  children: const [
                    Text("I agree to the "),
                    Text(
                      "Terms of Service",
                      style: TextStyle(
                        color: Color(0xFFEB5A1E),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(" and "),
                    Text(
                      "Privacy Policy",
                      style: TextStyle(
                        color: Color(0xFFEB5A1E),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _FieldLabel extends StatelessWidget {
  final String text;
  const _FieldLabel(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: Color(0xFF083A2F), 
      ),
    );
  }
}

class _InputField extends StatelessWidget {
  final String hintText;

  const _InputField({required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFD8D8D8)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Color(0xFFEB5A1E),
          ), // orange approx
        ),
      ),
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 22),
      height: 54,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFEB5A1E), 
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        onPressed: () {},
        child: const Text(
          "Sign Up & Accept Invitation",
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class _AlreadyHaveAccountButton extends StatelessWidget {
  const _AlreadyHaveAccountButton();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 22),
      height: 54,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFFFE8D9), 
          foregroundColor: const Color(0xFFEB5A1E),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        onPressed: () {},
        child: const Text(
          "I Already Have an Account",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
