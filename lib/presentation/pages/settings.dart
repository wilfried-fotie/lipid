import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lipid/presentation/pages/onboarding.dart';
import 'package:lipid/presentation/screens/settings/Resubscribe.dart';
import 'package:lipid/presentation/screens/settings/about_us.dart';
import 'package:lipid/presentation/screens/settings/personnal_info.dart';
import 'package:lipid/presentation/screens/settings/refund.dart';
import 'package:lipid/presentation/screens/settings/security.dart';
import 'package:lipid/presentation/theme/design_systems.dart';
import 'package:lipid/services/shared_prefs/onboarding.dart';

import '../../data/providers/users_api.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UsersApi _api = UsersApi();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text("Settings",
            style: kLinkSmall.copyWith(color: kPrimaryColorOne)),
      ),
      body: ListView(
        children: [
          Icon(CupertinoIcons.person_alt_circle_fill,
              size: 90, color: kGreyOne),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              "Raphael Kimberly",
              style: kLinkSmall.copyWith(color: kPrimaryColorTwo),
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Center(
            child: Text(
              "raphael@gmail.com",
              style: kLinkXSmall.copyWith(
                  fontWeight: FontWeight.w500, color: kPrimaryColorThree),
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Center(
            child: Text(
              "12 Months",
              style:
                  kLinkXSmall.copyWith(fontSize: 10, color: kPrimaryColorOne),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const Resubscribe()));
              },
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 12,
              ),
              title: Text("Resubscribe",
                  style: kLinkSmall.copyWith(color: kPrimaryColorThree)),
              leading: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      color: kPrimaryColorOne,
                      borderRadius: const BorderRadius.all(Radius.circular(5))),
                  child: const Icon(
                    CupertinoIcons.creditcard_fill,
                    size: 20,
                    color: Colors.white,
                  ))),
          ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const PersonnalInfo()));
              },
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 12,
              ),
              title: Text("Personal information",
                  style: kLinkSmall.copyWith(color: kPrimaryColorThree)),
              leading: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: const Icon(
                    Icons.person,
                    size: 20,
                  ))),
          ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const Security()));
              },
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 12,
              ),
              title: Text("Security and Password",
                  style: kLinkSmall.copyWith(color: kPrimaryColorThree)),
              leading: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      color: kAltFive,
                      borderRadius: const BorderRadius.all(Radius.circular(5))),
                  child: const Icon(
                    Icons.shield,
                    size: 20,
                    color: Colors.white,
                  ))),
          ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const AboutUs()));
              },
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 12,
              ),
              title: Text("About us",
                  style: kLinkSmall.copyWith(color: kPrimaryColorThree)),
              leading: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      color: kPrimaryColorThree,
                      borderRadius: const BorderRadius.all(Radius.circular(5))),
                  child: const Icon(
                    Icons.info_sharp,
                    size: 20,
                    color: Colors.white,
                  ))),
          ListTile(
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 12,
              ),
              title: Text("Terms and conditions",
                  style: kLinkSmall.copyWith(color: kPrimaryColorThree)),
              leading: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      color: kAltFor,
                      borderRadius: const BorderRadius.all(Radius.circular(5))),
                  child: const Icon(
                    Icons.info_sharp,
                    size: 20,
                    color: Colors.white,
                  ))),
          ListTile(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => const Refund()));
              },
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 12,
              ),
              title: Text("Reimbursement/Refund",
                  style: kLinkSmall.copyWith(color: kPrimaryColorThree)),
              leading: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      color: kPrimaryColorFor,
                      borderRadius: const BorderRadius.all(Radius.circular(5))),
                  child: const Icon(
                    CupertinoIcons.creditcard_fill,
                    size: 20,
                    color: Colors.white,
                  ))),
          ListTile(
              onTap: () async {
                await _api.logout().then((value) {
                  OnBoardingPreferences.toggleStatus();
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const MyHomePage(title: 'LIPID')),
                      (route) => false);
                });
              },
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 12,
              ),
              title: Text("Disconnect",
                  style: kLinkSmall.copyWith(color: kPrimaryColorThree)),
              leading: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      color: kPrimaryColorTwo,
                      borderRadius: const BorderRadius.all(Radius.circular(5))),
                  child: const Icon(
                    Icons.logout,
                    size: 20,
                    color: Colors.white,
                  ))),
        ],
      ),
    );
  }
}
