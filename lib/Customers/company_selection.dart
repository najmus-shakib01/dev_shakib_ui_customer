import 'package:flutter/material.dart';

class AppColors {
  static const Color screenBackground = Color(0xFFFFF7EC);
  static const Color cardBackground = Colors.white;
  static const Color bonusBackground = Color(0xFFFFF1E4);
  static const Color primary = Color(0xFFFF7A1A);
  static const Color primarySoft = Color(0xFFFFE1CC);
  static const Color activeChipBg = Color(0xFFE5F7EC);
  static const Color activeChipText = Color(0xFF1A9B52);
  static const Color pendingChipBg = Color(0xFFFFF1E3);
  static const Color pendingChipText = Color(0xFFB76A1C);
  static const Color textPrimary = Color(0xFF222222);
  static const Color textSecondary = Color(0xFF777777);
  static const Color bottomNavBackground = Colors.white;
}

class AppTextStyles {
  static const TextStyle screenTitle = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
    height: 1.2,
  );

  static const TextStyle screenSubtitle = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
    height: 1.4,
  );

  static const TextStyle cardTitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );

  static const TextStyle cardSubtitle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
  );

  static const TextStyle chipText = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle sectionLabel = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
  );

  static const TextStyle bonusAmount = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );

  static const TextStyle primaryButtonText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle secondaryButtonText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle navLabel = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
  );

  static const TextStyle navLabelActive = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w700,
    color: AppColors.primary,
  );
}

enum CompanyStatus { active, pending }

class ReferralEarningsDashboardScreen extends StatelessWidget {
  const ReferralEarningsDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 252, 247, 241),
      body: SafeArea(
        child: Column(
          children: [
            const _TopBar(),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(24, 16, 24, 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Select a Company', style: AppTextStyles.screenTitle),
                    SizedBox(height: 8),
                    Text(
                      'Choose which company you want to refer friends for',
                      style: AppTextStyles.screenSubtitle,
                    ),
                    SizedBox(height: 16),

                    CompanyCard(
                      logoAsset:
                          'assets/company_selection/icon/solar_service.png',
                      companyName: 'Convert Solar',
                      companyType: 'Solar Service',
                      status: CompanyStatus.active,
                      referralAmount: '\$20 per ref',
                      primaryActionLabel: 'Refer Friends',
                      bonusIconAsset: 'assets/company_selection/icon/gift.png',
                    ),
                    SizedBox(height: 16),

                    CompanyCard(
                      logoAsset:
                          'assets/company_selection/icon/roofing_company.png',
                      companyName: 'Convert Solar',
                      companyType: 'Roofing Company',
                      status: CompanyStatus.active,
                      referralAmount: '\$20 per ref',
                      primaryActionLabel: 'Refer Friends',
                      bonusIconAsset: 'assets/company_selection/icon/gift.png',
                    ),
                    SizedBox(height: 16),

                    CompanyCard(
                      logoAsset:
                          'assets/company_selection/icon/hvac_company.png',
                      companyName: 'Cool HVAC',
                      companyType: 'HVAC Company',
                      status: CompanyStatus.active,
                      referralAmount: '\$20 per ref',
                      primaryActionLabel: 'Refer Friends',
                      bonusIconAsset: 'assets/company_selection/icon/gift.png',
                    ),
                    SizedBox(height: 16),

                    CompanyCard(
                      logoAsset:
                          'assets/company_selection/icon/pest_company.png',
                      companyName: 'EcoSmart Solution',
                      companyType: 'Pest Control Company',
                      status: CompanyStatus.pending,
                      referralAmount: '\$20 per ref',
                      primaryActionLabel: 'Pending',
                      bonusIconAsset: 'assets/company_selection/icon/timer.png',
                      isPrimarySubtle: true,
                    ),

                    SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const _CustomBottomNavigationBar(),
    );
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SizedBox(
            height: 48,
            child: Row(
              children: [
                Image.asset(
                  'assets/company_selection/image/referable_logo.png',
                  height: 28,
                  fit: BoxFit.contain,
                ),
                const Spacer(),
                Image.asset(
                  'assets/company_selection/icon/menu.png',
                  height: 22,
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ),
        ),

        Container(height: 1, color: Colors.black.withOpacity(0.1)),
      ],
    );
  }
}

class CompanyCard extends StatelessWidget {
  const CompanyCard({
    super.key,
    required this.logoAsset,
    required this.companyName,
    required this.companyType,
    required this.status,
    required this.referralAmount,
    required this.primaryActionLabel,
    required this.bonusIconAsset,
    this.isPrimarySubtle = false,
  });

  final String logoAsset;
  final String companyName;
  final String companyType;
  final CompanyStatus status;
  final String referralAmount;
  final String primaryActionLabel;
  final String bonusIconAsset;
  final bool isPrimarySubtle;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Color.fromARGB(255, 236, 235, 235),
          width: 2.0,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
            child: _CardHeader(
              logoAsset: logoAsset,
              companyName: companyName,
              companyType: companyType,
              status: status,
            ),
          ),

          ReferralBonusRow(
            amountText: referralAmount,
            iconAsset: bonusIconAsset,
            isTimer: bonusIconAsset.contains("timer"),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
            child: _CardActions(
              primaryLabel: primaryActionLabel,
              isPrimarySubtle: isPrimarySubtle,
            ),
          ),
        ],
      ),
    );
  }
}

class _CardHeader extends StatelessWidget {
  const _CardHeader({
    required this.logoAsset,
    required this.companyName,
    required this.companyType,
    required this.status,
  });

  final String logoAsset;
  final String companyName;
  final String companyType;
  final CompanyStatus status;

  @override
  Widget build(BuildContext context) {
    final bool isActive = status == CompanyStatus.active;

    return Row(
      children: [
        Container(
          width: 56,
          height: 56,
          decoration: const BoxDecoration(shape: BoxShape.circle),
          child: Center(
            child: Image.asset(
              logoAsset,
              width: 40,
              height: 40,
              fit: BoxFit.contain,
            ),
          ),
        ),
        const SizedBox(width: 12),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(companyName, style: AppTextStyles.cardTitle),
              const SizedBox(height: 3),
              Text(companyType, style: AppTextStyles.cardSubtitle),
            ],
          ),
        ),

        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          decoration: BoxDecoration(
            color: isActive ? AppColors.activeChipBg : AppColors.pendingChipBg,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            isActive ? "Active" : "Pending",
            style: AppTextStyles.chipText.copyWith(
              color: isActive
                  ? AppColors.activeChipText
                  : AppColors.pendingChipText,
            ),
          ),
        ),
      ],
    );
  }
}

class ReferralBonusRow extends StatelessWidget {
  const ReferralBonusRow({
    super.key,
    required this.amountText,
    required this.iconAsset,
    required this.isTimer,
  });

  final String amountText;
  final String iconAsset;
  final bool isTimer;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 68,
      decoration: BoxDecoration(color: AppColors.bonusBackground),

      child: Row(
        children: [
          const SizedBox(width: 16),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Referral Bonus", style: AppTextStyles.sectionLabel),
              const SizedBox(height: 4),
              Text(amountText, style: AppTextStyles.bonusAmount),
            ],
          ),

          const Spacer(),

          Image.asset(
            iconAsset,
            width: isTimer ? 22 : 26,
            height: isTimer ? 22 : 26,
          ),

          const SizedBox(width: 16),
        ],
      ),
    );
  }
}

class _CardActions extends StatelessWidget {
  const _CardActions({
    required this.primaryLabel,
    required this.isPrimarySubtle,
  });

  final String primaryLabel;
  final bool isPrimarySubtle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SecondaryButton(label: "View Details", onPressed: () {}),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: PrimaryButton(
            label: primaryLabel,
            subtle: isPrimarySubtle,
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    required this.subtle,
  });

  final String label;
  final bool subtle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: subtle ? AppColors.primarySoft : AppColors.primary,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
        child: Text(
          label,
          style: AppTextStyles.primaryButtonText.copyWith(
            color: subtle ? AppColors.primary : Colors.white,
          ),
        ),
      ),
    );
  }
}

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: AppColors.primary, width: 1.4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
        child: Text(
          label,
          style: AppTextStyles.secondaryButtonText.copyWith(
            color: AppColors.primary,
          ),
        ),
      ),
    );
  }
}

class _CustomBottomNavigationBar extends StatelessWidget {
  const _CustomBottomNavigationBar();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 96,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned.fill(
            top: 16,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.bottomNavBackground,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  _BottomNavItem(
                    asset: 'assets/company_selection/icon/home.png',
                    label: 'Home',
                    isActive: false,
                  ),
                  _BottomNavItem(
                    asset: 'assets/company_selection/icon/leaderboard.png',
                    label: 'Leaderboard',
                    isActive: false,
                  ),
                  SizedBox(width: 56),
                  _BottomNavItem(
                    asset: 'assets/company_selection/icon/earnings.png',
                    label: 'Earnings',
                    isActive: false,
                  ),
                  _BottomNavItem(
                    asset: 'assets/company_selection/icon/profile.png',
                    label: 'Profile',
                    isActive: false,
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            top: -10,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Image.asset(
                      'assets/company_selection/icon/refer.png',
                      width: 26,
                      height: 26,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                const Text("Refer", style: AppTextStyles.navLabelActive),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _BottomNavItem extends StatelessWidget {
  const _BottomNavItem({
    required this.asset,
    required this.label,
    required this.isActive,
  });

  final String asset;
  final String label;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(asset, width: 22, height: 22),
        const SizedBox(height: 4),
        Text(
          label,
          style: isActive
              ? AppTextStyles.navLabelActive
              : AppTextStyles.navLabel,
        ),
      ],
    );
  }
}
