import 'package:coffee_shop/common/app_color.dart';
import 'package:coffee_shop/common/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _LayaltyCard(),
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
    super.key,
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
                    ? SizedBox()
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
  const _LayaltyCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 27.5,
        right: 27.5,
        top: 16.75,
        bottom: 20,
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
            padding: const EdgeInsets.all(15),
            child: Row(
              children: List.generate(
                8,
                (index) => Padding(
                  padding: EdgeInsets.only(right: index != 7 ? 15 : 0),
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
