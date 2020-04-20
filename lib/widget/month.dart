import 'package:flutter/material.dart';
import '../widget/graph.dart';

class Month extends StatefulWidget {
  @override
  _MonthState createState() => _MonthState();
}

class _MonthState extends State<Month> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          _expenses(),
          _graph(),
          Container(
            color: Colors.black.withOpacity(.1),
            height: 10,
          ),
          _list(),
        ],
      ),
    );
  }

  //Configurando total de gastos
  Widget _expenses() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Column(
        children: [
          Text(
            'R\$ 1000.00',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          Text('Total de gastos'),
        ],
      ),
    );
  }

  //Gráfico
  Widget _graph() {
    return Container(
      height: 180,
      child: Graph(),
    );
  }

  //Itens da lista
  Widget _item(IconData icon, String name, int percent, double value) {
    return ListTile(
      leading: Icon(
        icon,
        size: 32,
      ),
      title: Text(
        name,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
      ),
      subtitle: Text(
        '$percent% das despesas',
        style: TextStyle(fontStyle: FontStyle.italic),
      ),
      trailing: Container(
        decoration: BoxDecoration(color: Colors.purple.withOpacity(0.2)),
        child: Padding(
          padding: EdgeInsets.fromLTRB(8, 12, 8, 12),
          child: Text(
            'R\$ $value',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }

  //Lista de despesas
  Widget _list() {
    return Expanded(
        child: ListView.separated(
      itemCount: 15,
      itemBuilder: (BuildContext context, index) =>
          _item(Icons.shopping_cart, 'Shopping', 14, 1110.25),
      separatorBuilder: (BuildContext context, index) {
        return Container(
          color: Colors.black.withOpacity(.1),
          height: 2,
        );
      },
    ));
  }
}
