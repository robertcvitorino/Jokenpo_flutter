import 'dart:math';

import 'package:flutter/material.dart';


class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {

   var _imagemApp = AssetImage("images/padrao.png");
   var _mensagem ='Escolha uma opção abaixo';

   void _opcaoSelecionada(String escolhaUsuario){
      var opcoes = ['pedra','papel','tesoura'];
      var numero = Random().nextInt(3);
      var escolhaApp =opcoes[numero];

      switch(escolhaApp){
        case 'pedra':
              setState(() {
              this._imagemApp =AssetImage("images/pedra.png");
              });
          break;
        case 'papel':
          setState(() {
            this._imagemApp =AssetImage("images/papel.png");
          });
          break;
        case 'tesoura':
          setState(() {
            this._imagemApp =AssetImage("images/tesoura.png");
          });
          break;
      }
        if(
            (escolhaUsuario=='pedra'&& escolhaApp =='tesoura')||
            (escolhaUsuario=='tesoura'&& escolhaApp =='papel')||
            (escolhaUsuario=='papel'&& escolhaApp =='pedra')
        ){
          this._mensagem='Venceu a maquina :D';
        }else if(
            (escolhaApp=='pedra'&& escolhaUsuario =='tesoura')||
            (escolhaApp=='tesoura'&& escolhaUsuario=='papel')||
            (escolhaApp=='papel'&& escolhaUsuario =='pedra')

        ){
          this._mensagem='O aplicativo venceu :C';
        }else{
          this._mensagem =' Ocorreu empate';
        }
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jokenpo'),
        backgroundColor: Colors.blueAccent,
      ),
      body:Center(
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            //Padding(padding: EdgeInsets.all(2)),

            Padding(
                padding: EdgeInsets.only(
                    top:35,bottom: 20
                ),
                child: Text(
                    'Escolha do aplicativo',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                ),
            ),

            Image(
              image: this._imagemApp,
            ),

            Padding(
                padding: EdgeInsets.only(top: 35,bottom: 25)
            ,child:
            Text(
              this._mensagem,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[

               GestureDetector(
                 onTap: ()=> _opcaoSelecionada('pedra'),
                 child:
                 Image.asset('images/pedra.png', height: 100,),
               ),
                GestureDetector(
                  onTap: ()=> _opcaoSelecionada('papel'),
                  child:
                  Image.asset('images/papel.png',height: 100,),
                ),
                GestureDetector(
                  onTap: ()=> _opcaoSelecionada('tesoura'),
                  child:
                  Image.asset('images/tesoura.png',height: 100,),
                ),
              ],
            ),
          ],
        ),
      )
    );
  }
}
