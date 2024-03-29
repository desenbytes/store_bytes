import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:transparent_image/transparent_image.dart';


class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Widget _buildBodyBack() => Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors:[
            Color.fromARGB(255, 211, 118, 130),
            Color.fromARGB(255, 253, 181, 168)
          ],
          //Inicio do gradiente.
          begin: Alignment.topLeft, //Começa no canto superior esquerdo
          end: Alignment.bottomRight // Termina no canto inferior direito.
        )
      ),
    );

    //Abaixo usa-se o Stack para colocar os elementos por cima do background
    return Stack(
      children: <Widget>[
        _buildBodyBack(),
        //Barra passa por cima do conteudo, quando deslizar muito ela some.
        CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              floating: true,
              snap: true,
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text("Novidades"),
                centerTitle: true,
              ),
            ),
            /* Ele não vai pbter os dados instantaneamente do firebase, e
            devemos obter assicronamente enquanto nao obtem, precisa mostrar
             algo na tela p/ dizer que esta carregando*/
            FutureBuilder<QuerySnapshot>(
              future: Firestore.instance
              .collection("home").orderBy("pos").getDocuments(),
              builder:(context, snapshot){
                if(!snapshot.hasData)
                  return SliverToBoxAdapter(
                    child: Container(
                      height: 200.0,
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    )
                  );
                else
                  return SliverStaggeredGrid.count(
                      crossAxisCount: 2,
                    mainAxisSpacing: 1.0,
                    crossAxisSpacing: 1.0,
                    staggeredTiles: snapshot.data.documents.map(
                        (doc){
                          return StaggeredTile.count(doc.data["x"], doc.data["y"]);
                        }
                    ).toList(),
                    children: snapshot.data.documents.map(
                        (doc){
                          return FadeInImage.memoryNetwork(
                              placeholder: kTransparentImage,
                              image: doc.data["image"],
                              fit: BoxFit.cover,
                          );
                        }
                    ).toList(),
                  );

              },
            )
          ],
        )

      ],
    );
  }
}
