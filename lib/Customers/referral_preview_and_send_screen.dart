import 'package:flutter/material.dart';

class ReferralPreviewAndSendScreen extends StatelessWidget {
  const ReferralPreviewAndSendScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2EFE7),

      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(72),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFFF8F4E9),
            border: Border(
              bottom: BorderSide(
                color: Colors.black.withOpacity(0.12),
                width: 1,
              ),
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                "assets/referral_preview_and_send_screen/image/referable_logo.png",
                height: 32,
              ),
              Image.asset(
                "assets/referral_preview_and_send_screen/icon/menu.png",
                height: 26,
              ),
            ],
          ),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              _HeaderTexts(),
              SizedBox(height: 20),
              _MainWhiteCard(),
              SizedBox(height: 30),
              _ReferralDetailsCard(),
              SizedBox(height: 30),
              _SendMessageButton(),
            ],
          ),
        ),
      ),

      bottomNavigationBar: Container(
        height: 85,
        decoration: const BoxDecoration(color: Colors.white),
        child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _navItem(
                "assets/referral_preview_and_send_screen/icon/home.png",
                "Home",
                false,
              ),
              _navItem(
                "assets/referral_preview_and_send_screen/icon/leaderboard.png",
                "Leaderboard",
                false,
              ),
              _activeReferItem(),
              _navItem(
                "assets/referral_preview_and_send_screen/icon/earnings.png",
                "Earnings",
                false,
              ),
              _navItem(
                "assets/referral_preview_and_send_screen/icon/profile.png",
                "Profile",
                false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HeaderTexts extends StatelessWidget {
  const _HeaderTexts();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          "Preview and Send",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 4),
        Text(
          "Check your message and send to your referral.",
          style: TextStyle(fontSize: 16, color: Colors.black54),
        ),
      ],
    );
  }
}

class _MainWhiteCard extends StatelessWidget {
  const _MainWhiteCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        children: const [
          _ReceiverSection(),
          SizedBox(height: 20),
          _GrayMessageBox(),
          SizedBox(height: 20),
          _ConvertSolarBlock(),
          SizedBox(height: 20),
          _LargePreviewImage(),
        ],
      ),
    );
  }
}

class _ReceiverSection extends StatelessWidget {
  const _ReceiverSection();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipOval(
          child: Image.asset(
            "assets/referral_preview_and_send_screen/image/james_davis.png",
            height: 56,
            width: 56,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 12),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "To: James Davis",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 4),
            Text(
              "+1 (555) 123-4567",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ],
    );
  }
}

class _GrayMessageBox extends StatelessWidget {
  const _GrayMessageBox();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xffF0F0F0),
        borderRadius: BorderRadius.circular(14),
      ),
      child: const Text(
        "Hi James, I just got new Solar Panels installed by Convert Solar and they "
        "are working amazing. My power bill is literally \$7. The install was fast, "
        "easy, and I'm already saving money on my power bill. You should 100% talk "
        "to them and see if it makes sense for your house.",
        style: TextStyle(fontSize: 16, height: 1.35, color: Colors.black87),
      ),
    );
  }
}

class _ConvertSolarBlock extends StatelessWidget {
  const _ConvertSolarBlock();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF2EFE7),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              "assets/referral_preview_and_send_screen/icon/solar_icon.png",
              height: 52,
              width: 52,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Convert Solar",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 4),
              Text(
                "Solar Services",
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _LargePreviewImage extends StatelessWidget {
  const _LargePreviewImage();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: Image.asset(
            "assets/referral_preview_and_send_screen/image/house_solar.png",
            height: 210,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),

        const SizedBox(height: 8),

        Row(
          children: [
            Image.asset(
              "assets/referral_preview_and_send_screen/icon/copy.png",
              height: 22,
            ),
            const SizedBox(width: 6),

            const Text(
              "1 attachment",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ],
    );
  }
}

class _ReferralDetailsCard extends StatelessWidget {
  const _ReferralDetailsCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.07),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                "Referral details",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 8),
              Image.asset(
                "assets/referral_preview_and_send_screen/icon/edit.png",
                height: 26,
              ),
            ],
          ),

          const SizedBox(height: 20),

          const _DetailRow(label: "Company", value: "Convert Solar"),
          const _DetailRow(label: "Referral Name", value: "James Davis"),
          const _DetailRow(label: "Email", value: "jw@gmail.com"),
          const _DetailRow(label: "Phone", value: "+1 (555) 123-4567"),
          const _DetailRow(label: "Address", value: "Jacksonville, FL"),
        ],
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  final String label;
  final String value;

  const _DetailRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}

class _SendMessageButton extends StatelessWidget {
  const _SendMessageButton();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 52,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xffFF6A00),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () {},
            child: const Text(
              "Send Message",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),

        const SizedBox(height: 8),

        const Text(
          "This will open your phone's messaging app",
          style: TextStyle(fontSize: 14, color: Colors.grey),
        ),
      ],
    );
  }
}

Widget _navItem(String icon, String label, bool active) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(icon, height: 26),
      const SizedBox(height: 4),
      Text(
        label,
        style: TextStyle(
          fontSize: 13,
          color: active ? const Color(0xff635BFF) : Colors.black87,
          fontWeight: active ? FontWeight.bold : FontWeight.w500,
        ),
      ),
    ],
  );
}

Widget _activeReferItem() {
  return Column(
    children: [
      Container(
        height: 55,
        width: 55,
        decoration: const BoxDecoration(
          color: Color(0xffFF6A00),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Image.asset(
            "assets/referral_preview_and_send_screen/icon/refer.png",
            height: 30,
          ),
        ),
      ),

      const SizedBox(height: 4),

      const Text(
        "Refer",
        style: TextStyle(
          fontSize: 13,
          color: Color(0xffFF6A00),
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
  );
}
