import 'package:flutter/material.dart';

class NotificationSettingsScreen extends StatefulWidget {
  const NotificationSettingsScreen({super.key});

  @override
  State<NotificationSettingsScreen> createState() =>
      _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState
    extends State<NotificationSettingsScreen> {
  bool allNotifications = true;
  bool payoutUpdates = true;
  bool referralUpdates = true;
  bool quietHours = true;

  double startHour = 22;
  double endHour = 7;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F5EE),

      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(75),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFFFAF6ED),
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
                "assets/notification_settings/image/referable_logo.png",
                height: 33,
              ),
              Image.asset(
                "assets/notification_settings/icon/menu.png",
                height: 28,
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: Container(
        height: 90,
        decoration: const BoxDecoration(color: Colors.white),
        child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _navItem(
                "assets/notification_settings/icon/home.png",
                "Home",
                false,
              ),
              _navItem(
                "assets/notification_settings/icon/leaderboard.png",
                "Leaderboard",
                false,
              ),
              _activeReferItem(),
              _navItem(
                "assets/notification_settings/icon/earnings.png",
                "Earnings",
                false,
              ),
              _navItem(
                "assets/notification_settings/icon/profile.png",
                "Profile",
                false,
              ),
            ],
          ),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 25),

              const Center(
                child: Text(
                  "Notification Settings",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
              ),

              const SizedBox(height: 25),

              _NotificationCard(
                title: "Push Notifications",
                description:
                    "Customize which notifications you receive from ReferralHub",
                children: [
                  _SwitchTile(
                    title: "All Notifications",
                    subtitle: "Enable or disable all notifications",
                    value: allNotifications,
                    onChanged: (val) => setState(() => allNotifications = val),
                  ),
                  _SwitchTile(
                    title: "Payout Updates",
                    subtitle: "Get notified when you receive a payout",
                    value: payoutUpdates,
                    onChanged: (val) => setState(() => payoutUpdates = val),
                  ),
                  _SwitchTile(
                    title: "Referral Status Changes",
                    subtitle: "Updates when referrals change status",
                    value: referralUpdates,
                    onChanged: (val) => setState(() => referralUpdates = val),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              _NotificationCard(
                title: "Notification Schedule",
                children: [
                  _SwitchTile(
                    title: "Quiet Hours",
                    subtitle: "No notifications during selected hours",
                    value: quietHours,
                    onChanged: (val) => setState(() => quietHours = val),
                  ),

                  const _DashedDivider(),
                  const SizedBox(height: 12),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Start Time",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      _TimeLabel(hour: startHour),
                    ],
                  ),

                  Slider(
                    min: 0,
                    max: 23,
                    activeColor: Colors.orange,
                    inactiveColor: Colors.grey.shade300,
                    value: startHour,
                    onChanged: quietHours
                        ? (val) => setState(() => startHour = val)
                        : null,
                  ),

                  const _DashedDivider(),
                  const SizedBox(height: 12),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "End Time",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      _TimeLabel(hour: endHour),
                    ],
                  ),

                  Slider(
                    min: 0,
                    max: 23,
                    activeColor: Colors.orange,
                    inactiveColor: Colors.grey.shade300,
                    value: endHour,
                    onChanged: quietHours
                        ? (val) => setState(() => endHour = val)
                        : null,
                  ),
                ],
              ),

              const SizedBox(height: 25),

              _InfoNote(),

              const SizedBox(height: 25),

              Center(
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Save Preferences",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _navItem(String iconPath, String label, bool active) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 8),
        Image.asset(iconPath, height: 28),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: active ? Colors.orange : Colors.black,
          ),
        ),
      ],
    );
  }

  Widget _activeReferItem() {
    return Container(
      height: 62,
      width: 62,
      decoration: const BoxDecoration(
        color: Color(0xFFF5A623),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Image.asset(
          "assets/notification_settings/icon/refer.png",
          height: 30,
        ),
      ),
    );
  }
}

class _NotificationCard extends StatelessWidget {
  final String title;
  final String? description;
  final List<Widget> children;

  const _NotificationCard({
    required this.title,
    this.description,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),

          if (description != null) ...[
            const SizedBox(height: 6),
            Text(
              description!,
              style: TextStyle(fontSize: 15, color: Colors.grey.shade600),
            ),
          ],

          const SizedBox(height: 15),

          ...children,
        ],
      ),
    );
  }
}

class _SwitchTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool value;
  final Function(bool) onChanged;

  const _SwitchTile({
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  subtitle,
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                ),
              ],
            ),
          ),
          Switch(
            value: value,
            activeColor: Colors.white,
            activeTrackColor: Colors.orange,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}

class _TimeLabel extends StatelessWidget {
  final double hour;

  const _TimeLabel({required this.hour});

  @override
  Widget build(BuildContext context) {
    final int h = hour.round();
    final String period = h >= 12 ? "PM" : "AM";
    final int displayHour = h == 0 ? 12 : (h > 12 ? h - 12 : h);

    return Text(
      "${displayHour.toString().padLeft(2, '0')}:00 $period",
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    );
  }
}

class _DashedDivider extends StatelessWidget {
  const _DashedDivider();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double dashWidth = 6;
        double dashSpace = 6;
        int dashCount = (constraints.maxWidth / (dashWidth + dashSpace))
            .floor();

        return Row(
          children: List.generate(dashCount, (_) {
            return Padding(
              padding: EdgeInsets.only(right: dashSpace),
              child: Container(
                width: dashWidth,
                height: 1.2,
                color: Colors.grey.shade300,
              ),
            );
          }),
        );
      },
    );
  }
}

class _InfoNote extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 247, 232, 210),
        borderRadius: BorderRadius.circular(14),
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: 8,
              decoration: const BoxDecoration(
                color: Color(0xFFF5A623),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(14),
                  bottomLeft: Radius.circular(14),
                ),
              ),
            ),

            const SizedBox(width: 14),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.info_outline,
                      size: 22,
                      color: Color(0xFFF5A623),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        "You'll still receive important account notifications even if you disable push notifications. To manage email notifications, visit your Profile & Settings.",
                        style: TextStyle(
                          fontSize: 15,
                          height: 1.4,
                          color: Colors.grey.shade900,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
