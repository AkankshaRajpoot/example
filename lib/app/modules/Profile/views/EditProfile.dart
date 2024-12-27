import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_x/helpers/ColorPalette.dart';
import 'package:ui_x/helpers/TextStyl.dart';
import 'package:ui_x/widgets/buttons/Button.dart';
import 'package:ui_x/widgets/forms/FormInput.dart';
import 'package:ui_x/widgets/forms/FormInputDate.dart';
import 'package:ui_x/widgets/forms/FormSelect.dart';
import '../../../shared/views/errors/NotConnectedErrorPage.dart';
import '../../../shared/views/layouts/MasterLayout.dart';
import '../../../shared/views/layouts/ResponsiveUi.dart';
import '../../../shared/views/widgets/LoadingIconWidget.dart';
import '../controllers/ProfileController.dart';

class EditProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (ProfileController controller) {
        return !controller.isConnected
            ? NotConnectedErrorPage()
            : controller.isBusy
            ? LoadingIconWidget(message: "Please wait...")
            : ResponsiveUi(
          mobile: MobileEditProfile(
            controller: controller,
          ),
          tablet: TabletEditProfile(
            controller: controller,
          ),
        );
      },
    );
  }
}

///+++++++++++++++++++++++++
///Mobile
///+++++++++++++++++++++++++
class MobileEditProfile extends StatelessWidget {
  const MobileEditProfile({super.key, required this.controller});

  final ProfileController controller;

  @override
  Widget build(BuildContext context) {
    return MasterLayout(
      backgroundColor: kcBackground,
      title: "My Profile",
      titleSpacing: 0,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.bottomCenter,
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        height: 150,
                        decoration: BoxDecoration(
                          color: kcDarkGray,
                        ),
                      ),
                      Positioned(
                        bottom: -55,
                        child: Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                              color: kcOffWhite,
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assets/placeholders/user-female.png"),
                                  fit: BoxFit.contain)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "First Name",
                          style: TextStyl.bodySm
                              ?.copyWith(color: kcDarkAlt, fontSize: 15),
                        ),
                        SizedBox(height: 5),
                        FormInput.text(
                          //controller: controller.firstNameInput,
                          placeholder: "First Name",
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Last Name",
                          style: TextStyl.bodySm
                              ?.copyWith(color: kcDarkAlt, fontSize: 15),
                        ),
                        SizedBox(height: 5),
                        FormInput.text(
                          //  controller: controller.lastNameInput,
                          placeholder: "Last Name",
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Phone",
                          style: TextStyl.bodySm
                              ?.copyWith(color: kcDarkAlt, fontSize: 15),
                        ),
                        SizedBox(height: 5),
                        FormInput.number(
                          //controller: controller.phoneInput,
                          placeholder: "Phone",
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Email",
                          style: TextStyl.bodySm
                              ?.copyWith(color: kcDarkAlt, fontSize: 15),
                        ),
                        SizedBox(height: 5),
                        FormInput.email(
                          // controller: controller.emailInput,
                          placeholder: "Email",
                        ),
                        SizedBox(height: 10),
                        Text(
                          "DOB",
                          style: TextStyl.bodySm
                              ?.copyWith(color: kcDarkAlt, fontSize: 15),
                        ),
                        SizedBox(height: 5),
                        FormInputDate(
                          onChanged: (set) {
                            controller.selectedDate(set);
                          },
                          value: controller.dob,
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Gender",
                          style: TextStyl.bodySm
                              ?.copyWith(color: kcDarkAlt, fontSize: 15),
                        ),
                        SizedBox(height: 5),
                        Obx(
                              () =>
                              FormSelect(
                                options: <DropdownMenuItem>[
                                  DropdownMenuItem(
                                    child: Text(
                                      'Select Gender',
                                      style: TextStyl.bodySm,
                                    ),
                                    value: '0',
                                  ),
                                  DropdownMenuItem(
                                    child: Text(
                                      'Male',
                                      style: TextStyl.bodySm,
                                    ),
                                    value: '1',
                                  ),
                                  DropdownMenuItem(
                                    child: Text(
                                      'Female',
                                      style: TextStyl.bodySm,
                                    ),
                                    value: '2',
                                  ),
                                ],
                                value: controller.selectedGender,
                                onChanged: (value) =>
                                    controller.onSelectGender(value),
                              ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Button.block(
            key: UniqueKey(),
            variant: ButtonVariant.PRIMARY,
            flat: true,
            label: "Update",
            onTap: (set)async {
              set.setBusy(true).setDisabled(true);
              await controller.patch(refresh: true);
              set.setBusy(false).setDisabled(false);
            },
          )
        ],
      ),
    );
  }
}

///+++++++++++++++++++++++++
///Tablet
///+++++++++++++++++++++++++
class TabletEditProfile extends StatelessWidget {
  const TabletEditProfile({super.key, required this.controller});

  final ProfileController controller;

  @override
  Widget build(BuildContext context) {
    return MasterLayout(
      backgroundColor: kcBackground,
      title: "My Profile",
      titleSpacing: 0,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.bottomCenter,
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        height: 150,
                        decoration: BoxDecoration(
                          color: kcDarkGray,
                        ),
                      ),
                      Positioned(
                        bottom: -55,
                        child: Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                              color: kcOffWhite,
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assets/placeholders/user-female.png"),
                                  fit: BoxFit.contain)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "First Name",
                          style: TextStyl.bodySm
                              ?.copyWith(color: kcDarkAlt, fontSize: 15),
                        ),
                        SizedBox(height: 5),
                        FormInput.text(
                          //controller: controller.firstNameInput,
                          placeholder: "First Name",
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Last Name",
                          style: TextStyl.bodySm
                              ?.copyWith(color: kcDarkAlt, fontSize: 15),
                        ),
                        SizedBox(height: 5),
                        FormInput.text(
                          //  controller: controller.lastNameInput,
                          placeholder: "Last Name",
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Phone",
                          style: TextStyl.bodySm
                              ?.copyWith(color: kcDarkAlt, fontSize: 15),
                        ),
                        SizedBox(height: 5),
                        FormInput.number(
                          //controller: controller.phoneInput,
                          placeholder: "Phone",
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Email",
                          style: TextStyl.bodySm
                              ?.copyWith(color: kcDarkAlt, fontSize: 15),
                        ),
                        SizedBox(height: 5),
                        FormInput.email(
                          // controller: controller.emailInput,
                          placeholder: "Email",
                        ),
                        SizedBox(height: 10),
                        Text(
                          "DOB",
                          style: TextStyl.bodySm
                              ?.copyWith(color: kcDarkAlt, fontSize: 15),
                        ),
                        SizedBox(height: 5),
                        FormInputDate(
                          onChanged: (set) {
                            controller.selectedDate(set);
                          },
                          value: controller.dob,
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Gender",
                          style: TextStyl.bodySm
                              ?.copyWith(color: kcDarkAlt, fontSize: 15),
                        ),
                        SizedBox(height: 5),
                        Obx(
                              () =>
                              FormSelect(
                                options: <DropdownMenuItem>[
                                  DropdownMenuItem(
                                    child: Text(
                                      'Select Gender',
                                      style: TextStyl.bodySm,
                                    ),
                                    value: '0',
                                  ),
                                  DropdownMenuItem(
                                    child: Text(
                                      'Male',
                                      style: TextStyl.bodySm,
                                    ),
                                    value: '1',
                                  ),
                                  DropdownMenuItem(
                                    child: Text(
                                      'Female',
                                      style: TextStyl.bodySm,
                                    ),
                                    value: '2',
                                  ),
                                ],
                                value: controller.selectedGender,
                                onChanged: (value) =>
                                    controller.onSelectGender(value),
                              ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Button.block(
            key: UniqueKey(),
            variant: ButtonVariant.PRIMARY,
            flat: true,
            label: "Update",
            onTap: (btn) {
              Get.back();
            },
          )
        ],
      ),
    );
  }
}
