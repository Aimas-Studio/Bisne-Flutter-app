import 'package:bisne/src/core/presentation/themes/colors.dart';
import 'package:bisne/src/core/presentation/widgets/buttons/main_button_widget.dart';
import 'package:bisne/src/core/presentation/widgets/buttons/secundary_button_widget.dart';
import 'package:bisne/src/core/presentation/widgets/custom_app_bar.dart';
import 'package:bisne/src/core/presentation/widgets/texts/texts_widgets.dart';
import 'package:bisne/src/models/home/infrastructure/services/category_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FilterPage extends StatelessWidget {
  const FilterPage({super.key});
  final String section = 'Populares';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      backgroundColor: fontAppColor2,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Category Text
                  Container(
                    alignment: Alignment.centerLeft,
                    child: const BoldAppText(
                      text: 'Categoría',
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  //Category Icons
                  FutureBuilder(
                    future: CategoryProvider.cargarData(),
                    builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                      return SizedBox(
                        height: 125,
                        child: PageView(
                          padEnds: false,
                          controller: PageController(viewportFraction: 0.25),
                          scrollDirection: Axis.horizontal,
                          children: _setCategories(
                              snapshot.hasData ? snapshot.data! : [], section),
                        ),
                      );
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 15),
                    child: BoldAppText(
                      text: 'Precio',
                      color: Colors.black,
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          height: 50,
                          child: const TextField(
                            textAlign: TextAlign.start,
                            decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 12),
                                border: InputBorder.none,
                                hintText: 'Mínimo',
                                hintStyle: TextStyle(fontSize: 20),
                                alignLabelWithHint: true),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          height: 50,
                          child: const TextField(
                            textAlign: TextAlign.start,
                            decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 12),
                                hintStyle: TextStyle(fontSize: 20),
                                border: InputBorder.none,
                                hintText: 'Máximo',
                                alignLabelWithHint: true),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 15),
                    child: BoldAppText(
                      text: 'Ubicación',
                      color: Colors.black,
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white,
                            ),
                            height: 50,
                            child: DropdownMenu(
                              textStyle: const TextStyle(fontSize: 20),
                              hintText: 'Provincia',
                              inputDecorationTheme: const InputDecorationTheme(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(left: 20)),
                              menuHeight: 150,
                              width: MediaQuery.of(context).size.width - 60,
                              trailingIcon: const Icon(
                                Icons.keyboard_arrow_down_rounded,
                                size: 30,
                              ),
                              menuStyle: const MenuStyle(
                                  side: MaterialStatePropertyAll(
                                      BorderSide.none)),
                              dropdownMenuEntries: const [
                                DropdownMenuEntry(
                                    value: 'La Habana', label: 'La Habana'),
                                DropdownMenuEntry(
                                  value: 'Mayabeque',
                                  label: 'Mayabeque',
                                ),
                                DropdownMenuEntry(
                                  value: 'Artemisa',
                                  label: 'Artemisa',
                                ),
                                DropdownMenuEntry(
                                  value: 'Pinar del Río',
                                  label: 'Pinar del Río',
                                ),
                                DropdownMenuEntry(
                                  value: 'Matanzas',
                                  label: 'Matanzas',
                                ),
                                DropdownMenuEntry(
                                  value: 'Cienfuegos',
                                  label: 'Cienfuegos',
                                ),
                                DropdownMenuEntry(
                                  value: 'Villa Clara',
                                  label: 'Villa Clara',
                                ),
                                DropdownMenuEntry(
                                  value: 'Santi Spíritus',
                                  label: 'Santi Spíritus',
                                ),
                                DropdownMenuEntry(
                                  value: 'Camagüey',
                                  label: 'Camagüey',
                                ),
                                DropdownMenuEntry(
                                  value: 'Las Tunas',
                                  label: 'Las Tunas',
                                ),
                                DropdownMenuEntry(
                                  value: 'Holguín',
                                  label: 'Holguín',
                                ),
                                DropdownMenuEntry(
                                  value: 'Santiago de Cuba',
                                  label: 'Santiago de Cuba',
                                ),
                                DropdownMenuEntry(
                                  value: 'Granma',
                                  label: 'Granma',
                                ),
                                DropdownMenuEntry(
                                  value: 'Guantánamo',
                                  label: 'Guantánamo',
                                ),
                                DropdownMenuEntry(
                                  value: 'Isla de la Juventud',
                                  label: 'Isla de la Juventud',
                                ),
                              ],
                            )),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white,
                            ),
                            height: 50,
                            child: DropdownMenu(
                              hintText: 'Municipio',
                              textStyle: const TextStyle(fontSize: 20),
                              inputDecorationTheme: const InputDecorationTheme(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(left: 20),
                              ),
                              menuHeight: 150,
                              width: MediaQuery.of(context).size.width - 60,
                              trailingIcon: const Icon(
                                Icons.keyboard_arrow_down_rounded,
                                size: 30,
                              ),
                              menuStyle: const MenuStyle(
                                  side: MaterialStatePropertyAll(
                                      BorderSide.none)),
                              dropdownMenuEntries: const [
                                DropdownMenuEntry(
                                    value: 'La Habana', label: 'La Habana'),
                                DropdownMenuEntry(
                                  value: 'Mayabeque',
                                  label: 'Mayabeque',
                                ),
                                DropdownMenuEntry(
                                  value: 'Artemisa',
                                  label: 'Artemisa',
                                ),
                                DropdownMenuEntry(
                                  value: 'Pinar del Río',
                                  label: 'Pinar del Río',
                                ),
                                DropdownMenuEntry(
                                  value: 'Matanzas',
                                  label: 'Matanzas',
                                ),
                                DropdownMenuEntry(
                                  value: 'Cienfuegos',
                                  label: 'Cienfuegos',
                                ),
                                DropdownMenuEntry(
                                  value: 'Villa Clara',
                                  label: 'Villa Clara',
                                ),
                                DropdownMenuEntry(
                                  value: 'Santi Spíritus',
                                  label: 'Santi Spíritus',
                                ),
                                DropdownMenuEntry(
                                  value: 'Camagüey',
                                  label: 'Camagüey',
                                ),
                                DropdownMenuEntry(
                                  value: 'Las Tunas',
                                  label: 'Las Tunas',
                                ),
                                DropdownMenuEntry(
                                  value: 'Holguín',
                                  label: 'Holguín',
                                ),
                                DropdownMenuEntry(
                                  value: 'Santiago de Cuba',
                                  label: 'Santiago de Cuba',
                                ),
                                DropdownMenuEntry(
                                  value: 'Granma',
                                  label: 'Granma',
                                ),
                                DropdownMenuEntry(
                                  value: 'Guantánamo',
                                  label: 'Guantánamo',
                                ),
                                DropdownMenuEntry(
                                  value: 'Isla de la Juventud',
                                  label: 'Isla de la Juventud',
                                ),
                              ],
                            )),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: SecundaryButton(
                          onPressed: () => {},
                          text: const RegularAppText(
                            text: 'Eliminar todos',
                            color: iconAppColor,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      Expanded(
                        child: MainButton(
                          onPressed: () => {},
                          text: const RegularAppText(
                            text: 'Aplicar filtros',
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _setCategories(List<dynamic> categories, String section) {
    return categories.map((category) {
      return InkWell(
        onTap: () {
          section = category["name"];
        },
        child: Column(
          children: [
            SvgPicture.asset(category["icon"], height: 75),
            Center(
                child: Text(
              category["name"],
              textAlign: TextAlign.center,
            ))
          ],
        ),
      );
    }).toList();
  }
}
