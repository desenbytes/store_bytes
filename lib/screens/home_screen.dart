import 'package:flutter/material.dart';
import 'package:store_bytes/tabs/home_tab.dart';
import 'package:store_bytes/tabs/produtcs_tab.dart';
import 'package:store_bytes/widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {

  final _pageController = PageController();// Controlador de nav. paginas

  @override
  Widget build(BuildContext context) {



    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),//Bloqueia a navegação do touch
      children: <Widget>[
        Scaffold(
          body: HomeTab(),
          drawer: CustomDrawer(_pageController),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text("Produtos"),
            centerTitle: true,
          ),
          drawer: CustomDrawer(_pageController),
          body: ProductsTab(),
        ),
        Container(color: Colors.yellow,),
        Container(color: Colors.green,),
      ],
    );
  }
}
