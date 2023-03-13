import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Geek Djenika"),
              accountEmail: Text("djenikaa@gmail.com"),
              currentAccountPicture: Center(
                child: CircleAvatar(
                  child: Icon(CupertinoIcons.profile_circled),
                ),
              ),
            ),
            Card(
              elevation: 2,
              color: Colors.teal,
              child: ListTile(
                leading: Icon(
                  CupertinoIcons.profile_circled,
                  color: Colors.white,
                ),
                title: Text("Mon profil",style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.width * .04
                ),),
              ),
            ),
            Card(
              elevation: 2,
              color: Colors.teal,
              child: ListTile(
                leading: Icon(
                  CupertinoIcons.lock_circle,
                  color: Colors.white,
                ),
                title: Text("Mot de passe",style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.width * .04
                ),),
              ),
            ),
            Card(
              elevation: 2,
              color: Colors.teal,
              child: ListTile(
                leading: Icon(
                  CupertinoIcons.info_circle,
                  color: Colors.white,
                ),
                title: Text("Mes infos",style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.width * .04
                ),),
              ),
            ),
            Card(
              elevation: 2,
              color: Colors.teal,
              child: ListTile(
                leading: Icon(
                  Icons.exit_to_app_outlined,
                  color: Colors.white,
                ),
                title: Text("Deconnexion",style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.width * .04
                ),),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.teal[100],
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: GridView.count(
          crossAxisCount: 2,
          children: const [
            MesMenus(
              title: 'Accueil',
              icon: Icons.account_balance_outlined,
              couleurIco: Colors.black87,
            ),
            MesMenus(
              title: 'Outils',
              icon: CupertinoIcons.cube,
              couleurIco: Colors.brown,
            ),
            MesMenus(
              title: 'Apprendre',
              icon: Icons.school_outlined,
              couleurIco: Colors.blueGrey,
            ),
            MesMenus(
              title: 'Perso',
              icon: CupertinoIcons.person_crop_square_fill,
              couleurIco: Colors.teal,
            ),
            MesMenus(
              title: 'Mes recueils',
              icon: Icons.local_library_outlined,
              couleurIco: Colors.indigoAccent,
            ),
            MesMenus(
              title: 'Poubelle',
              icon: CupertinoIcons.trash,
              couleurIco: Colors.red,
            ),
            MesMenus(
              title: 'Voitures',
              icon: Icons.local_car_wash_rounded,
              couleurIco: Colors.cyan,
            ),
            MesMenus(
              title: 'Infos',
              icon: Icons.info_outlined,
              couleurIco: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}

class MesMenus extends StatelessWidget {
  const MesMenus(
      {Key? key,
      required this.title,
      required this.icon,
      required this.couleurIco})
      : super(key: key);

  final String title;
  final IconData icon;
  final Color couleurIco;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {},
        splashColor: Colors.teal,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: MediaQuery.of(context).size.height * .09,
                color: couleurIco,
              ),
              Text(
                title.toUpperCase(),
                style: TextStyle(
                    color: couleurIco,
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.width * .038),
              )
            ],
          ),
        ),
      ),
    );
  }
}
