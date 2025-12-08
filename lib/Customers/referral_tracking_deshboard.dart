import 'package:flutter/material.dart';

class AppColors {
  static const Color screenBackground = Color(0xFFFFFDF5);
  static const Color cardBackground = Colors.white;
  static const Color primaryOrange = Color(0xFFFF8A00);
  static const Color orangeDark = Color(0xFFFF6A00);
  static const Color lightOrangeBackground = Color(0xFFFFF1E0);
  static const Color textPrimary = Color(0xFF111111);
  static const Color textSecondary = Color(0xFF7A7A7A);
  static const Color progressBackground = Color(0xFFE5E5E5);
  static const Color borderSoft = Color(0xFFEFEFEF);
  static const Color chipGreenBackground = Color(0xFFE9FCEB);
  static const Color inProgressChipBackground = Color(0xFFFFF0E3);
  static const Color lostChipBackground = Color(0xFFFFEEF0);
  static const Color dividerGrey = Color(0xFFDDDDDD);
}

class AppTextStyles {
  static const TextStyle pageTitle = TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );

  static const TextStyle totalLabel = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryOrange,
  );

  static const TextStyle cardTitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );

  static const TextStyle smallGrey = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
  );

  static const TextStyle statusChip = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.orangeDark,
  );

  static const TextStyle sectionLabel = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static const TextStyle sectionValue = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColors.primaryOrange,
  );

  static const TextStyle navLabel = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
  );
}

class ReferralTrackingDeshboard extends StatelessWidget {
  const ReferralTrackingDeshboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screenBackground,
      body: SafeArea(
        child: Column(
          children: [
            const _TopBar(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    _HeaderRow(),
                    SizedBox(height: 24),
                    _ReferralProgressCard(),
                    SizedBox(height: 24),
                    _JamesDavisCard(),
                    SizedBox(height: 16),
                    _SarahWilsonCard(),
                    SizedBox(height: 16),
                    _AlexThompsonCard(),
                    SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const _BottomNavBar(),
    );
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: AppColors.screenBackground,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Row(
            children: [
              Image.asset(
                'assets/referral_tracking_deshboard/image/referable_logo.png',
                height: 26,
                fit: BoxFit.contain,
              ),
              const Spacer(),
              Image.asset(
                'assets/referral_tracking_deshboard/icon/menu.png',
                height: 24,
                width: 24,
                fit: BoxFit.contain,
              ),
            ],
          ),
        ),

        Container(
          width: double.infinity,
          height: 1,
          color: const Color(0xFFE6E6E6), 
        ),
      ],
    );
  }
}

class _HeaderRow extends StatelessWidget {
  const _HeaderRow();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('My Referrals', style: AppTextStyles.pageTitle),
        const Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: AppColors.primaryOrange.withOpacity(0.2),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: const Text('Total: \$1,250', style: AppTextStyles.totalLabel),
        ),
      ],
    );
  }
}

class _ReferralProgressCard extends StatelessWidget {
  const _ReferralProgressCard();

  @override
  Widget build(BuildContext context) {
    return _BaseCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                'Referral Progress',
                style: AppTextStyles.sectionLabel,
              ),
              const Spacer(),
              const Text('7/10', style: AppTextStyles.sectionLabel),
            ],
          ),
          const SizedBox(height: 16),
          _ProgressBar(value: 0.7, height: 8),
          const SizedBox(height: 12),
          const Text(
            '3 more referrals to reach Gold tier',
            style: AppTextStyles.smallGrey,
          ),
        ],
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
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color(0xFFEDEDED), 
          width: 1,
        ),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02), 
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: child,
    );
  }
}

class _ProgressBar extends StatelessWidget {
  final double value;
  final double height;

  const _ProgressBar({required this.value, this.height = 6});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        final double fullWidth = constraints.maxWidth;
        final double activeWidth = fullWidth * value.clamp(0.0, 1.0);

        return Container(
          height: height,
          decoration: BoxDecoration(
            color: AppColors.progressBackground,
            borderRadius: BorderRadius.circular(height / 2),
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: activeWidth,
              decoration: BoxDecoration(
                color: AppColors.primaryOrange,
                borderRadius: BorderRadius.circular(height / 2),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _InitialsAvatar extends StatelessWidget {
  final String initials;

  const _InitialsAvatar({required this.initials});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 58,
      height: 58,
      decoration: const BoxDecoration(
        color: AppColors.primaryOrange,
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: Text(
        initials,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
    );
  }
}

class _StatusChip extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final Color textColor;

  const _StatusChip({
    required this.label,
    required this.backgroundColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(26),
      ),
      child: Text(
        label,
        style: AppTextStyles.statusChip.copyWith(color: textColor),
      ),
    );
  }
}

class _StepStatusItem extends StatelessWidget {
  final String assetPath;
  final String label;

  const _StepStatusItem({required this.assetPath, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(assetPath, width: 20, height: 20, fit: BoxFit.contain),
        const SizedBox(width: 4),
        Text(
          label,
          style: AppTextStyles.smallGrey.copyWith(
            color: AppColors.textPrimary,
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}

class _JamesDavisCard extends StatelessWidget {
  const _JamesDavisCard();

  @override
  Widget build(BuildContext context) {
    return _BaseCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const _InitialsAvatar(initials: 'JD'),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('James Davis', style: AppTextStyles.cardTitle),
                  SizedBox(height: 4),
                  Text('Completed 1 day ago', style: AppTextStyles.smallGrey),
                ],
              ),
              const Spacer(),
              const _StatusChip(
                label: 'Won',
                backgroundColor: AppColors.lightOrangeBackground,
                textColor: AppColors.orangeDark,
              ),
            ],
          ),
          const SizedBox(height: 18),
          Row(
            children: const [
              Text('Earning ', style: AppTextStyles.sectionLabel),
              Text('\$250', style: AppTextStyles.sectionValue),
            ],
          ),
          const SizedBox(height: 12),
          const _ProgressBar(value: 1.0),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              _StepStatusItem(
                assetPath: 'assets/referral_tracking_deshboard/icon/right.png',
                label: 'Profile',
              ),
              _StepStatusItem(
                assetPath: 'assets/referral_tracking_deshboard/icon/right.png',
                label: 'Verification',
              ),
              _StepStatusItem(
                assetPath: 'assets/referral_tracking_deshboard/icon/right.png',
                label: 'First Order',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SarahWilsonCard extends StatelessWidget {
  const _SarahWilsonCard();

  @override
  Widget build(BuildContext context) {
    return _BaseCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const _InitialsAvatar(initials: 'SW'),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Sarah Wilson', style: AppTextStyles.cardTitle),
                  SizedBox(height: 4),
                  Text('Joined 1 week ago', style: AppTextStyles.smallGrey),
                ],
              ),
              const Spacer(),
              const _StatusChip(
                label: 'In progress',
                backgroundColor: AppColors.inProgressChipBackground,
                textColor: AppColors.orangeDark,
              ),
            ],
          ),
          const SizedBox(height: 18),
          Row(
            children: const [
              Text('Earning ', style: AppTextStyles.sectionLabel),
              Text('\$150', style: AppTextStyles.sectionValue),
            ],
          ),
          const SizedBox(height: 12),
          const _ProgressBar(value: 0.6),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              _StepStatusItem(
                assetPath: 'assets/referral_tracking_deshboard/icon/right.png',
                label: 'Profile',
              ),
              _StepStatusItem(
                assetPath: 'assets/referral_tracking_deshboard/icon/right.png',
                label: 'Verification',
              ),
              _StepStatusItem(
                assetPath:
                    'assets/referral_tracking_deshboard/icon/process.png',
                label: 'First Order',
              ),
            ],
          ),
          const SizedBox(height: 16),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: AppColors.primaryOrange, width: 1),
              ),
              child: const Text(
                'Remind',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryOrange,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AlexThompsonCard extends StatelessWidget {
  const _AlexThompsonCard();

  @override
  Widget build(BuildContext context) {
    return _BaseCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const _InitialsAvatar(initials: 'AT'),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Alex Thompson', style: AppTextStyles.cardTitle),
                  SizedBox(height: 4),
                  Text('Joined 2 days ago', style: AppTextStyles.smallGrey),
                ],
              ),
              const Spacer(),
              const _StatusChip(
                label: 'Lost',
                backgroundColor: AppColors.lostChipBackground,
                textColor: Color(0xFFE54646),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Row(
            children: const [
              Text('Earning ', style: AppTextStyles.sectionLabel),
              Text('\$0', style: AppTextStyles.sectionValue),
            ],
          ),
          const SizedBox(height: 12),
          const _ProgressBar(value: 0.15),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              _StepStatusItem(
                assetPath:
                    'assets/referral_tracking_deshboard/icon/process.png',
                label: 'Profile',
              ),
              _StepStatusItem(
                assetPath: 'assets/referral_tracking_deshboard/icon/lost.png',
                label: 'Verification',
              ),
              _StepStatusItem(
                assetPath: 'assets/referral_tracking_deshboard/icon/lost.png',
                label: 'First Order',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _BottomNavBar extends StatelessWidget {
  const _BottomNavBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        border: const Border(
          top: BorderSide(color: AppColors.borderSoft, width: 1),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 4,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          _BottomNavItem(
            assetPath: 'assets/referral_tracking_deshboard/icon/home.png',
            label: 'Home',
            isSelected: false,
          ),
          _BottomNavItem(
            assetPath:
                'assets/referral_tracking_deshboard/icon/leaderboard.png',
            label: 'Leaderboard',
            isSelected: false,
          ),
          _BottomNavItem(
            assetPath: 'assets/referral_tracking_deshboard/icon/refer.png',
            label: 'Refer',
            isSelected: true,
          ),
          _BottomNavItem(
            assetPath: 'assets/referral_tracking_deshboard/icon/earnings.png',
            label: 'Earnings',
            isSelected: false,
          ),
          _BottomNavItem(
            assetPath: 'assets/referral_tracking_deshboard/icon/profile.png',
            label: 'Profile',
            isSelected: false,
          ),
        ],
      ),
    );
  }
}

class _BottomNavItem extends StatelessWidget {
  final String assetPath;
  final String label;
  final bool isSelected;

  const _BottomNavItem({
    required this.assetPath,
    required this.label,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    final Color labelColor = isSelected
        ? AppColors.primaryOrange
        : AppColors.textSecondary;

    Widget iconWidget = Image.asset(
      assetPath,
      width: 24,
      height: 24,
      fit: BoxFit.contain,
    );

    if (isSelected) {
      iconWidget = Container(
        width: 44,
        height: 44,
        decoration: const BoxDecoration(
          color: AppColors.primaryOrange,
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        child: Image.asset(
          assetPath,
          width: 22,
          height: 22,
          fit: BoxFit.contain,
          color: Colors.white,
        ),
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        iconWidget,
        const SizedBox(height: 4),
        Text(label, style: AppTextStyles.navLabel.copyWith(color: labelColor)),
      ],
    );
  }
}
