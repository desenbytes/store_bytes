import 'package:flutter/material.dart';
import 'package:store_bytes/tiles/drawe_tile.dart';

class CustomDrawer extends StatelessWidget {

  final PageController pageController;

  CustomDrawer(this.pageController);

  @override
  Widget build(BuildContext context) {

    Widget _buildDrawerBack() => Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors:[
                Color.fromARGB(255, 203, 236, 241),
                Colors.white
              ],
              //Inicio do gradiente.
              begin: Alignment.topCenter, //Começa no canto superior esquerdo
              end: Alignment.bottomCenter // Termina no canto inferior direito.
          )
      ),
    );
    return Drawer(
      child: Stack(
        children: <Widget>[
          _buildDrawerBack(),
          ListView(
            padding: EdgeInsets.only(left: 32.0, top: 16.0),
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 8.0),
                padding: EdgeInsets.fromLTRB(0.0, 16.0, 16.0, 8.0),
                height: 170.0,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 8.0,
                      bottom: 0.0,
                      //Titulo do Drawer
                      child: Text("Delivery Bar", style: TextStyle(fontSize: 34.0
                      ,fontWeight: FontWeight.bold),),
                    ),
                    Positioned(
                      left: 0.0,
                      bottom: 0.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Olá", style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold
                          ),
                          ),
                          GestureDetector(
                            child: Text("Entre ou cadastre-se",style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold
                            ),),
                            onTap: (){

                            },
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Divider(),
              DrawerTile(Icons.home, "Inicio", pageController, 0),
              DrawerTile(Icons.local_bar, "Produtos",pageController, 1),
              DrawerTile(Icons.location_on, "Encontre uma loja",pageController, 2),
              DrawerTile(Icons.playlist_add_check, "Meus Pedidos",pageController, 3),
            ],
          )
        ],
      ),
    );
  }
}
