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
  static const screenPadding = EdgeInsets.symmetric(horizontal: 24, vertical: 16);
  static const cardPadding = EdgeInsets.all(20);
  static const sectionSpacing = SizedBox(height: 24);
  static const itemSpacing = SizedBox(height: 16);
}

/// ---------- Data Models ----------
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

/// ---------- Screen Root ----------
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
    );
  }
}

/// ---------- Header ----------
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
          style: TextStyle(
            fontSize: 14,
            color: AppColors.textSecondary,
            height: 1.4,
          ),
        ),
      ],
    );
  }
}

/// ---------- Total Earnings Card ----------
class TotalEarningsCard extends StatelessWidget {
  const TotalEarningsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return _BaseCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _CardHeaderRow(),
          const SizedBox(height: 16),
          const _EarningsRow(),
          const SizedBox(height: 20),
          SizedBox(
            height: 170,
            width: double.infinity,
            child: CustomPaint(
              painter: _EarningsChartPainter(),
            ),
          ),
        ],
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
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: const Size(0, 0),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
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
            letterSpacing: 0.5,
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

/// Simple custom painter to mimic the blue & orange lines of the chart.
class _EarningsChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint axisPaint = Paint()
      ..color = AppColors.divider
      ..strokeWidth = 1.2;

    // X-axis
    canvas.drawLine(
      Offset(0, size.height - 4),
      Offset(size.width, size.height - 4),
      axisPaint,
    );

    final Path bluePath = Path();
    final Path orangePath = Path();

    // Sample points (relative) tuned by eye to look like screenshot (approx)
    final pointsBlue = <Offset>[
      Offset(size.width * 0.02, size.height * 0.70),
      Offset(size.width * 0.18, size.height * 0.62),
      Offset(size.width * 0.32, size.height * 0.55),
      Offset(size.width * 0.46, size.height * 0.47),
      Offset(size.width * 0.60, size.height * 0.40),
      Offset(size.width * 0.75, size.height * 0.30),
      Offset(size.width * 0.90, size.height * 0.33),
    ];

    final pointsOrange = <Offset>[
      Offset(size.width * 0.02, size.height * 0.80),
      Offset(size.width * 0.18, size.height * 0.76),
      Offset(size.width * 0.32, size.height * 0.82),
      Offset(size.width * 0.46, size.height * 0.78),
      Offset(size.width * 0.60, size.height * 0.75),
      Offset(size.width * 0.75, size.height * 0.73),
      Offset(size.width * 0.90, size.height * 0.70),
    ];

    if (pointsBlue.isNotEmpty) {
      bluePath.moveTo(pointsBlue.first.dx, pointsBlue.first.dy);
      for (var p in pointsBlue.skip(1)) {
        bluePath.lineTo(p.dx, p.dy);
      }
    }

    if (pointsOrange.isNotEmpty) {
      orangePath.moveTo(pointsOrange.first.dx, pointsOrange.first.dy);
      for (var p in pointsOrange.skip(1)) {
        orangePath.lineTo(p.dx, p.dy);
      }
    }

    final Paint bluePaint = Paint()
      ..color = AppColors.earningsBlue
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final Paint orangePaint = Paint()
      ..color = AppColors.earningsOrangeLine
      ..strokeWidth = 2.5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawPath(orangePath, orangePaint);
    canvas.drawPath(bluePath, bluePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// ---------- Completed Referrals Section ----------
class CompletedReferralsSection extends StatelessWidget {
  final List<ReferralCampaign> campaigns;

  const CompletedReferralsSection({
    super.key,
    required this.campaigns,
  });

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
        ...campaigns
            .map(
              (c) => Padding(
                padding: const EdgeInsets.only(bottom: 14),
                child: CompletedReferralCard(campaign: c),
              ),
            )
            .toList(),
      ],
    );
  }
}

class CompletedReferralCard extends StatelessWidget {
  final ReferralCampaign campaign;

  const CompletedReferralCard({
    super.key,
    required this.campaign,
  });

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
          style: const TextStyle(
            fontSize: 14,
            color: AppColors.textSecondary,
          ),
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
        color: const Color(0xFFFFD4B1), // approx light orange background
        borderRadius: BorderRadius.circular(999),
      ),
      child: FractionallySizedBox(
        alignment: Alignment.centerLeft,
        widthFactor: 1.0, // full bar to indicate completed
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
        Row(
          children: const [
            Icon(
              Icons.check_circle,
              size: 20,
              color: AppColors.positiveGreen,
            ),
            SizedBox(width: 6),
            Text(
              'Completed',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: AppColors.positiveGreen,
              ),
            ),
          ],
        ),
        const Spacer(),
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: const Size(0, 0),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
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

/// ---------- View All Earnings Button ----------
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

/// ---------- Shared Base Card ----------
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
          // Approx shadow to match UI (light, soft)
          BoxShadow(
            color: Color(0x26000000), // 15% black
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: AppSpacing.cardPadding,
        child: child,
      ),
    );
  }
}
