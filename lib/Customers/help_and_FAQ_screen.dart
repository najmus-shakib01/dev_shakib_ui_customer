import 'package:flutter/material.dart';

class HelpAndFaqScreen extends StatefulWidget {
  const HelpAndFaqScreen({super.key});

  @override
  State<HelpAndFaqScreen> createState() => _HelpAndFaqScreenState();
}

class _HelpAndFaqScreenState extends State<HelpAndFaqScreen> {
  final List<bool> faqExpandState = [false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFDF4),

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
                "assets/help_and_FAQ_screen/image/referable_logo.png",
                height: 32,
              ),
              Image.asset(
                "assets/help_and_FAQ_screen/icon/menu.png",
                height: 26,
              ),
            ],
          ),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeaderSection(),
              const SizedBox(height: 20),
              const SearchBox(),
              const SizedBox(height: 25),
              const PopularTopicsWrapper(),
              const SizedBox(height: 30),
              FaqSection(
                expandState: faqExpandState,
                onToggle: (index) {
                  setState(() {
                    faqExpandState[index] = !faqExpandState[index];
                  });
                },
              ),
              const SizedBox(height: 30),
              const SupportContactBox(),
              const SizedBox(height: 25),
              const BackButtonSection(),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),

      bottomNavigationBar: Container(
        height: 88,
        padding: const EdgeInsets.only(top: 6),
        decoration: const BoxDecoration(color: Colors.white),
        child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _navItem("assets/help_and_FAQ_screen/icon/home.png", "Home"),
              _navItem("assets/help_and_FAQ_screen/icon/leaderboard.png", "Leaderboard"),
              _activeReferItem(),
              _navItem("assets/help_and_FAQ_screen/icon/earnings.png", "Earnings"),
              _navItem("assets/help_and_FAQ_screen/icon/profile.png", "Profile"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _navItem(String icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(icon, height: 26),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.black87)),
      ],
    );
  }

  Widget _activeReferItem() {
    return Column(
      children: [
        Container(
          height: 52,
          width: 52,
          decoration: const BoxDecoration(
            color: Color(0xFFFFC44D),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Image.asset(
              "assets/help_and_FAQ_screen/icon/refer.png",
              height: 24,
            ),
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          "Refer",
          style: TextStyle(fontSize: 12, color: Colors.black87),
        )
      ],
    );
  }
}

// -------------------------
// Header Section
// -------------------------
class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text("Help & FAQ", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
        SizedBox(height: 6),
        Text(
          "Find answers to common questions & get support",
          style: TextStyle(fontSize: 15, color: Colors.black54),
        ),
      ],
    );
  }
}

// -------------------------
// Search Box
// -------------------------
class SearchBox extends StatelessWidget {
  const SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.black12),
      ),
      child: Row(
        children: const [
          Expanded(
            child: Text("Search for help topics", style: TextStyle(fontSize: 16, color: Colors.grey)),
          ),
          Icon(Icons.search, color: Colors.grey),
        ],
      ),
    );
  }
}

// -------------------------
// Popular Topics Wrapper
// -------------------------
class PopularTopicsWrapper extends StatelessWidget {
  const PopularTopicsWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: const PopularTopicsSection(),
    );
  }
}

// -------------------------
// Popular Topics Section
// -------------------------
class PopularTopicsSection extends StatelessWidget {
  const PopularTopicsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Popular Topics", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        const SizedBox(height: 18),

        Row(
          children: const [
            Expanded(
              child: TopicBox(
                title: "Stripe Setup",
                imagePath: "assets/help_and_FAQ_screen/icon/stripe.png",
                bgColor: Color(0xFFFFF3D6),
              ),
            ),
            SizedBox(width: 15),
            Expanded(
              child: TopicBox(
                title: "Track Referrals",
                imagePath: "assets/help_and_FAQ_screen/icon/track.png",
                bgColor: Color(0xFFF5ECFF),
              ),
            ),
          ],
        ),

        const SizedBox(height: 15),

        Row(
          children: const [
            Expanded(
              child: TopicBox(
                title: "Payment",
                imagePath: "assets/help_and_FAQ_screen/icon/payment.png",
                bgColor: Color(0xFFFFE6E0),
              ),
            ),
            SizedBox(width: 15),
            Expanded(
              child: TopicBox(
                title: "Invite Friends",
                imagePath: "assets/help_and_FAQ_screen/icon/invite.png",
                bgColor: Color(0xFFFFEAEA),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// -------------------------
// Topic Box with Image
// -------------------------
class TopicBox extends StatelessWidget {
  final String title;
  final String imagePath;
  final Color bgColor;

  const TopicBox({
    super.key,
    required this.title,
    required this.imagePath,
    required this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.black12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(
              color: bgColor,
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Image.asset(imagePath),
            ),
          ),
          const SizedBox(height: 10),
          Text(title, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}

// -------------------------
// FAQ Section
// -------------------------
class FaqSection extends StatelessWidget {
  final List<bool> expandState;
  final Function(int) onToggle;

  const FaqSection({
    super.key,
    required this.expandState,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.black12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 16, top: 8, bottom: 10),
            child: Text("Frequently Asked Questions",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),

          _faqItem(index: 0, title: "How do I set up my Stripe account?", expanded: expandState[0]),
          _faqItem(index: 1, title: "Where can I see my referral status?", expanded: expandState[1]),
          _faqItem(index: 2, title: "When will I receive my referral payments?", expanded: expandState[2]),
          _faqItem(index: 3, title: "How do I change my profile information?", expanded: expandState[3]),
        ],
      ),
    );
  }

  Widget _faqItem({
    required int index,
    required String title,
    required bool expanded,
  }) {
    return Column(
      children: [
        ListTile(
          title: Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          trailing: Icon(
            expanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
            color: const Color(0xFFFFA84C),
            size: 28,
          ),
          onTap: () => onToggle(index),
        ),

        if (expanded)
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text("This is example expanded content.",
                style: TextStyle(fontSize: 14, color: Colors.black87)),
          ),

        Divider(height: 1, color: Colors.grey.shade300),
      ],
    );
  }
}

// -------------------------
// Need More Help Section
// -------------------------
class SupportContactBox extends StatelessWidget {
  const SupportContactBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF4E6),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(
                "assets/help_and_FAQ_screen/icon/support.png",
                height: 34,
              ),
              const SizedBox(width: 10),
              const Text(
                "Need more help?",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            "Our support team is ready to assist you with any questions",
            style: TextStyle(fontSize: 15, color: Colors.black87),
          ),
          const SizedBox(height: 15),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14)),
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              child: const Text("Contact Support", style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}

// -------------------------
// Back Button Section
// -------------------------
class BackButtonSection extends StatelessWidget {
  const BackButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: const Color(0xFFFFEFE0),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.orange.shade200),
      ),
      child: const Center(
        child: Text(
          "Back",
          style: TextStyle(
            fontSize: 18,
            color: Colors.orange,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
