import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_x/helpers/ColorPalette.dart';
import 'package:ui_x/helpers/TextStyl.dart';

class SearchLocationDialog extends StatelessWidget {
  final String? placeholder;
  final dynamic value;
  final Function(dynamic)? onChanged;
  final List<DropDownItems> options;

  SearchLocationDialog({
    Key? key,
    this.placeholder = "Input hint",
    this.value,
    this.onChanged,
    required this.options,
  }) : super(key: key);

  final SearchLocationDialogController controller = SearchLocationDialogController.instance;

  @override
  Widget build(BuildContext context) {
    final Size screen = Get.size;
    controller.setOptions(options);
    if (value != null) {
      controller.setSelectedValue(value);
    }
    return GestureDetector(
      onTap: () {
        Get.dialog(
          Dialog(
            child: Obx(
              () => Scaffold(
                appBar: AppBar(
                  backgroundColor: kcWhite,
                  title: Text('$placeholder'),
                  leading: GestureDetector(
                      onTap: () => Get.back(),
                      child: Icon(
                        Icons.arrow_back,
                        color: kcBlack,
                      )),
                  titleSpacing: 0,
                ),
                body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          fillColor: kcWhite,
                          hintText: controller.selectedValue.value != null ? controller.selectedValue.label : placeholder,
                        ),
                        onChanged: (value) {
                          controller.search(value);
                        },
                      ),
                      Expanded(
                          child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 8,
                            ),
                            ...List.generate(controller.options.length, (index) {
                              DropDownItems dropDownItem = controller.options[index];
                              return InkWell(
                                onTap: () {
                                  controller.setSelectedValue(dropDownItem.value);
                                  // log.w('Details @@ ${dropDownItem.value}');
                                  if (onChanged != null) onChanged!(dropDownItem.value);
                                  Get.back();
                                  controller.setOptions(options);
                                  controller.searchInput.clear();
                                },
                                child: Container(
                                  width: screen.width,
                                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                  margin: EdgeInsets.only(bottom: 2),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: kcWhite.withOpacity(0.75),
                                  ),
                                  child: Text(
                                    '${dropDownItem.label}',
                                    style: TextStyle(color: kcBlack),
                                  ),
                                ),
                              );
                            })
                          ],
                        ),
                      ))
                    ],
                  ),
                ),
              ),
            ),
            insetPadding: EdgeInsets.zero,
          ),
        );
      },
      child: Obx(
        () => Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Choose City",
                style: TextStyl.bodySm?.copyWith(color: kcDarkAlt, fontSize: 12),
              ),
              SizedBox(height: 5),
              Text(
                "${controller.selectedValue.value != null ? controller.selectedValue.label : placeholder}",
                style: TextStyl.bodySm?.copyWith(color: kcBlack, fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SearchLocationDialogController extends GetxController {
  static SearchLocationDialogController get instance {
    if (!Get.isRegistered<SearchLocationDialogController>()) Get.create(() => SearchLocationDialogController());
    return Get.find<SearchLocationDialogController>();
  }

  ///Observables
  var _selectedValue = DropDownItems().obs;
  var _options = <DropDownItems>[].obs;
  var _tempOptions = <DropDownItems>[].obs;

  ///Getter
  DropDownItems get selectedValue => _selectedValue.value;

  List<DropDownItems> get options => _options;

  final TextEditingController searchInput = TextEditingController();

  /// Set Selected Value
  void setSelectedValue(dynamic value) {
    _selectedValue(_options.where((op) => op.value == value).first);
  }

  /// Set Options
  void setOptions(List<DropDownItems> opts) {
    _tempOptions.assignAll(opts);
    _options.assignAll(opts);
  }

  void search(String term) {
    if (term.length > 0) {
      _options.assignAll(_tempOptions.where((element) {
        var _str = element.label!.toLowerCase();
        return _str.contains('${term.toLowerCase()}');
      }));
    } else {
      _options.assignAll(_tempOptions);
    }
  }
}

class DropDownItems {
  final dynamic value;
  final String? label;

  DropDownItems({this.value, this.label});
}
