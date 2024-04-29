import 'package:coffee_shop/common/app_color.dart';
import 'package:coffee_shop/common/images.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const _LayaltyCard(),
        const SizedBox(
          height: 15,
        ),
        _SettingsCard(
          leanding: profile,
          trailing: edit,
          subtitle: 'Имя',
          title: 'Даниил',
        ),
        const SizedBox(
          height: 15,
        ),
        _SettingsCard(
          leanding: profile,
          trailing: edit,
          subtitle: 'Почта',
          title: 'pahomovdaniil02@yandex.ru',
        ),
        const SizedBox(
          height: 15,
        ),
        _SettingsCard(
          leanding: order,
          title: 'Заказы',
        ),
      ],
    );
  }
}

class _SettingsCard extends StatelessWidget {
  const _SettingsCard({
    this.leanding,
    this.trailing,
    required this.title,
    this.subtitle,
  });

  final Widget? leanding;
  final Widget? trailing;
  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      decoration: BoxDecoration(
        color: loyaltyCardColor,
        border: Border.all(color: primary),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: leanding ??
                const SizedBox(
                  width: 5,
                ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                subtitle == null
                    ? const SizedBox()
                    : Text(
                        subtitle!,
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                Text(
                  title,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: trailing ??
                const SizedBox(
                  width: 5,
                ),
          ),
        ],
      ),
    );
  }
}

class _LayaltyCard extends StatelessWidget {
  const _LayaltyCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 15,
        right: 15,
        top: 15,
        bottom: 15,
      ),
      decoration: BoxDecoration(
        color: primary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Карта лояльноси',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(color: textColor),
              ),
              Text(
                '4 / 8',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(color: textColor),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Container(
            decoration: BoxDecoration(
              color: loyaltyCardColor,
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.all(10),
            child: Row(
              children: List.generate(
                8,
                (index) => Expanded(
                  child: index < 4 ? coffeCupSelect : coffeCupUnSelect,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
