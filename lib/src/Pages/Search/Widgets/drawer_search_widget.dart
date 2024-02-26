import 'package:bisne/src/Pages/Search/search_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../core/Utils/colors.dart';

class DrawerSearchWidget extends StatelessWidget {
  DrawerSearchWidget({super.key});

  final SearchPageController _searchPageController =
      Get.find<SearchPageController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 35),
      child: Drawer(
        width: context.width > 400 ? context.width * 0.6 : context.width * 0.7,
        child: Material(
            color: Colors.white,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text('FILTRAR RESULTADOS',
                          style:
                              TextStyle(color: Color.fromRGBO(0, 0, 0, 0.451))),
                      InkWell(
                        child: const Text('LIMPIAR',
                            style: TextStyle(color: bisneColorPrimary)),
                        onTap: () {},
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  filterType('CATEGORÍAS', 'Todas', 'categories'),
                  const SizedBox(
                    height: 20.0,
                  ),
                  filterType('PROVINCIAS', 'Todas', 'provinces'),
                  const SizedBox(
                    height: 20.0,
                  ),
                  filterType('MUNICIPIOS', 'Todos', 'municipalities'),
                  const SizedBox(
                    height: 20.0,
                  ),
                  filterType('MONEDA', 'CUP', 'currencyTypes'),
                  Expanded(child: Container()),
                  applyFiltresButton(),
                  const SizedBox(
                    height: 5,
                  )
                ],
              ),
            )),
      ),
    );
  }

  Container applyFiltresButton() {
    return Container(
      constraints: const BoxConstraints(maxWidth: 200),
      margin: const EdgeInsets.only(bottom: 10),
      child: ElevatedButton(
          style: const ButtonStyle(
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)))),
              backgroundColor: MaterialStatePropertyAll(bisneColorPrimary)),
          onPressed: () => {},
          child: Row(
            children: [
              const Expanded(
                child: Center(
                  child: Text(
                    "APLICAR FLITROS",
                    style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1)),
                  ),
                ),
              ),
              SvgPicture.asset('assets/Icons/arrow_rigth_icon.svg')
            ],
          )),
    );
  }

  Row filterType(String filterName, String defaultValue, String listName) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(filterName),
        Obx(
          () => DropdownButton<dynamic>(
            underline: Container(),
            value: _searchPageController.getProperty(listName).value.isEmpty
                ? defaultValue
                : _searchPageController.getProperty(listName).value,
            isDense: true,
            style: const TextStyle(color: Color.fromRGBO(23, 26, 22, 0.549)),
            alignment: Alignment.centerRight,
            icon: Container(
              margin: const EdgeInsets.only(left: 5),
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(50)),
                child: Center(
                  child: SvgPicture.asset('assets/Icons/arrow_rigth_icon.svg'),
                ),
              ),
            ),
            items: setMenuItems(_searchPageController, listName),
            onChanged: (value) {
              _searchPageController.getProperty(listName).value =
                  value as String;
            },
          ),
        ),
      ],
    );
  }
}

List<DropdownMenuItem<dynamic>> setMenuItems(
    SearchPageController controller, property) {
  return controller
      .getListProperty(property)
      .map((property) => DropdownMenuItem<dynamic>(
            value: property,
            child: Text(property),
          ))
      .toList();
}
