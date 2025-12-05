import 'package:flutter/material.dart';

class AppColors {
  static const background = Color(0xFFFFF8EC);
  static const cardBackground = Colors.white;
  static const primaryOrange = Color(0xFFFF7A00);
  static const secondaryOrange = Color(0xFFFF9500);
  static const softOrangeButton = Color(0xFFFFE8D2);
  static const textPrimary = Color(0xFF141414);
  static const textSecondary = Color(0xFF555555);
  static const earningsBlue = Color(0xFF1F6BFF);
  static const earningsOrangeLine = Color(0xFFFFA53A);
  static const positiveGreen = Color(0xFF15A24A);
  static const divider = Color(0xFFE0E0E0);
}

class AppSpacing {
  static const screenPadding = EdgeInsets.symmetric(
    horizontal: 24,
    vertical: 16,
  );
  static const cardPadding = EdgeInsets.all(20);
  static const sectionSpacing = SizedBox(height: 24);
  static const itemSpacing = SizedBox(height: 16);
}

class ReferralCampaign {
  final String title;
  final String dateRange;
  final String earnings;
  final int referrals;

  const ReferralCampaign({
    required this.title,
    required this.dateRange,
    required this.earnings,
    required this.referrals,
  });
}

class CompanyInsightPage extends StatelessWidget {
  const CompanyInsightPage({super.key});

  List<ReferralCampaign> get _campaigns => const [
    ReferralCampaign(
      title: 'Summer Referral Drive',
      dateRange: 'Jun 1 - Aug 31, 2025',
      earnings: '\$450',
      referrals: 9,
    ),
    ReferralCampaign(
      title: 'Spring Tech Conference',
      dateRange: 'Mar 15 - May 20, 2025',
      earnings: '\$325',
      referrals: 6,
    ),
    ReferralCampaign(
      title: 'New Year Kickoff',
      dateRange: 'Jan 1 - Feb 28, 2025',
      earnings: '\$275',
      referrals: 5,
    ),
    ReferralCampaign(
      title: 'Summer Referral Drive',
      dateRange: 'Nov 15 - Dec 31, 2025',
      earnings: '\$190',
      referrals: 4,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

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
                "assets/company_insight/image/referable_logo.png",
                height: 32,
              ),
              Image.asset("assets/company_insight/icon/menu.png", height: 26),
            ],
          ),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: AppSpacing.screenPadding.copyWith(bottom: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _HeaderSection(),
              AppSpacing.sectionSpacing,
              const TotalEarningsCard(),
              AppSpacing.sectionSpacing,
              CompletedReferralsSection(campaigns: _campaigns),
              AppSpacing.sectionSpacing,
              const ViewAllEarningsButton(),
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
              _navItem("assets/company_insight/icon/home.png", "Home", false),
              _navItem(
                "assets/company_insight/icon/leaderboard.png",
                "Leaderboard",
                false,
              ),
              _activeReferItem(),
              _navItem(
                "assets/company_insight/icon/earnings.png",
                "Earnings",
                false,
              ),
              _navItem(
                "assets/company_insight/icon/profile.png",
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

Widget _navItem(String icon, String label, bool isActive) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(
        icon,
        height: 26,
        color: isActive ? AppColors.secondaryOrange : null,
      ),
      const SizedBox(height: 4),
      Text(
        label,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: isActive ? AppColors.secondaryOrange : AppColors.textSecondary,
        ),
      ),
    ],
  );
}

Widget _activeReferItem() {
  return Container(
    height: 56,
    width: 56,
    decoration: const BoxDecoration(
      color: AppColors.secondaryOrange,
      shape: BoxShape.circle,
    ),
    child: Center(
      child: Image.asset(
        "assets/company_insight/icon/refer.png",
        height: 28,
        color: Colors.white,
      ),
    ),
  );
}

class _HeaderSection extends StatelessWidget {
  const _HeaderSection();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Company Insight',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
        SizedBox(height: 6),
        Text(
          'View your completed referrals and earnings',
          style: TextStyle(fontSize: 14, color: AppColors.textSecondary),
        ),
      ],
    );
  }
}

class TotalEarningsCard extends StatelessWidget {
  const TotalEarningsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFFFDF8),
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 12,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _CardHeaderRow(),
            const SizedBox(height: 16),
            const _EarningsRow(),
            const SizedBox(height: 20),

            Container(
              height: 165,
              width: double.infinity,
              decoration: BoxDecoration(color: const Color(0xFFF3F1EC)),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              child: CustomPaint(painter: _EarningsChartPainter()),
            ),
          ],
        ),
      ),
    );
  }
}

class _CardHeaderRow extends StatelessWidget {
  const _CardHeaderRow();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Text(
            'Total Earnings',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            'View Details',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.secondaryOrange,
            ),
          ),
        ),
      ],
    );
  }
}

class _EarningsRow extends StatelessWidget {
  const _EarningsRow();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: const [
        Text(
          '\$1,247.50',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
        SizedBox(width: 8),
        Padding(
          padding: EdgeInsets.only(bottom: 4),
          child: Text(
            '+\$125 this month',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.positiveGreen,
            ),
          ),
        ),
      ],
    );
  }
}

class _EarningsChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final axisPaint = Paint()
      ..color = const Color.fromARGB(255, 244, 239, 239)
      ..strokeWidth = 1.4;

    canvas.drawLine(
      Offset(0, size.height - 6),
      Offset(size.width, size.height - 6),
      axisPaint,
    );

    final blue = Paint()
      ..color = AppColors.earningsBlue
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final orange = Paint()
      ..color = AppColors.earningsOrangeLine
      ..strokeWidth = 2.3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final bluePath = Path();
    final orangePath = Path();

    final pointsBlue = <Offset>[
      Offset(size.width * .02, size.height * .78),
      Offset(size.width * .18, size.height * .70),
      Offset(size.width * .32, size.height * .62),
      Offset(size.width * .46, size.height * .50),
      Offset(size.width * .60, size.height * .38),
      Offset(size.width * .75, size.height * .30),
      Offset(size.width * .90, size.height * .34),
    ];

    final pointsOrange = <Offset>[
      Offset(size.width * .02, size.height * .82),
      Offset(size.width * .18, size.height * .78),
      Offset(size.width * .32, size.height * .86),
      Offset(size.width * .46, size.height * .82),
      Offset(size.width * .60, size.height * .79),
      Offset(size.width * .75, size.height * .77),
      Offset(size.width * .90, size.height * .74),
    ];

    bluePath.moveTo(pointsBlue[0].dx, pointsBlue[0].dy);
    for (final p in pointsBlue.skip(1)) {
      bluePath.lineTo(p.dx, p.dy);
    }

    orangePath.moveTo(pointsOrange[0].dx, pointsOrange[0].dy);
    for (final p in pointsOrange.skip(1)) {
      orangePath.lineTo(p.dx, p.dy);
    }

    canvas.drawPath(orangePath, orange);
    canvas.drawPath(bluePath, blue);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class CompletedReferralsSection extends StatelessWidget {
  final List<ReferralCampaign> campaigns;

  const CompletedReferralsSection({super.key, required this.campaigns});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Completed Referrals',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 16),
        ...campaigns.map(
          (c) => Padding(
            padding: const EdgeInsets.only(bottom: 14),
            child: CompletedReferralCard(campaign: c),
          ),
        ),
      ],
    );
  }
}

class CompletedReferralCard extends StatelessWidget {
  final ReferralCampaign campaign;

  const CompletedReferralCard({super.key, required this.campaign});

  @override
  Widget build(BuildContext context) {
    return _BaseCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _CampaignHeaderRow(campaign: campaign),
          const SizedBox(height: 6),
          _CampaignMetaRow(campaign: campaign),
          const SizedBox(height: 10),
          const _CompletionProgressBar(),
          const SizedBox(height: 10),
          const _CompletionFooterRow(),
        ],
      ),
    );
  }
}

class _CampaignHeaderRow extends StatelessWidget {
  final ReferralCampaign campaign;
  const _CampaignHeaderRow({required this.campaign});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            campaign.title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
        ),
        Text(
          campaign.earnings,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
      ],
    );
  }
}

class _CampaignMetaRow extends StatelessWidget {
  final ReferralCampaign campaign;

  const _CampaignMetaRow({required this.campaign});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            campaign.dateRange,
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.textSecondary,
            ),
          ),
        ),
        Text(
          '${campaign.referrals} referrals',
          style: const TextStyle(fontSize: 14, color: AppColors.textSecondary),
        ),
      ],
    );
  }
}

class _CompletionProgressBar extends StatelessWidget {
  const _CompletionProgressBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6,
      decoration: BoxDecoration(
        color: const Color(0xFFFFD4B1),
        borderRadius: BorderRadius.circular(999),
      ),
      child: FractionallySizedBox(
        alignment: Alignment.centerLeft,
        widthFactor: 1,
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.primaryOrange,
            borderRadius: BorderRadius.circular(999),
          ),
        ),
      ),
    );
  }
}

class _CompletionFooterRow extends StatelessWidget {
  const _CompletionFooterRow();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.check_circle,
          size: 20,
          color: AppColors.positiveGreen,
        ),
        const SizedBox(width: 6),
        const Text(
          'Completed',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: AppColors.positiveGreen,
          ),
        ),
        const Spacer(),
        TextButton(
          onPressed: () {},
          child: const Text(
            'View Details',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.secondaryOrange,
            ),
          ),
        ),
      ],
    );
  }
}

class ViewAllEarningsButton extends StatelessWidget {
  const ViewAllEarningsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.softOrangeButton,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () {},
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Center(
                child: Text(
                  'View All Earnings',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.secondaryOrange,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _BaseCard extends StatelessWidget {
  final Widget child;
  const _BaseCard({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color(0x26000000),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Padding(padding: AppSpacing.cardPadding, child: child),
    );
  }
}
