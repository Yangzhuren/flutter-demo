import 'package:flutter/material.dart';

class Production {
  final String name;

  const Production({this.name});
}

typedef void CartChangeCallBack(Production production, bool inCart);

class ShoppingListItem extends StatelessWidget {
  final Production production;
  final bool inCart;
  final CartChangeCallBack onCartChanged;

  ShoppingListItem(this.production, {this.inCart, this.onCartChanged});

  Color _getColor(BuildContext context) {
    return inCart ? Colors.black54 : Theme.of(context).primaryColor;
  }

  TextStyle _getTextStyle(BuildContext context) {
    if (!inCart) return null;
    return new TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      onTap: () {
        onCartChanged(production, !inCart);
      },
      title: new Text(
        production.name,
        style: _getTextStyle(context),
      ),
      leading: new CircleAvatar(
        backgroundColor: _getColor(context),
        child: new Text(production.name[0]),
      ),
    );
  }
}

class ShoppingList extends StatefulWidget {
  final List<Production> productions;

  ShoppingList({Key key, this.productions}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new _ShoppingListState();
  }
}

class _ShoppingListState extends State<ShoppingList> {
  Set<Production> _shoppingCarts = new Set();

  void _handleCartChanged(Production production, bool inCart) {
    SnackBarAction action;
    String title;
    if (inCart) {
      title = '是否移出购物车？';
      action = new SnackBarAction(
          label: '是',
          onPressed: () {
            setState(() {
              _shoppingCarts.add(production);
            });
          });
    } else {
      title = '是否加入购物车？';
      action = new SnackBarAction(
          label: '是',
          onPressed: () {
            setState(() {
              _shoppingCarts.remove(production);
            });
          });
    }
    Scaffold.of(_context).showSnackBar(new SnackBar(
      content: new Text(title),
      action: action,
    ));
  }

  BuildContext _context;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Shopping List'),
      ),
      body: new Builder(builder: (BuildContext contextInner) {
        _context = contextInner;
        return new ListView(
          padding: new EdgeInsets.symmetric(vertical: 8.0),
          children: widget.productions.map((Production production) {
            return new ShoppingListItem(production,
                inCart: _shoppingCarts.contains(production),
                onCartChanged: _handleCartChanged);
          }).toList(),
        );
      }),
      drawer: new Drawer(child: new Text('menu1'), semanticLabel: 'Memu'),
      floatingActionButton: new FloatingActionButton(onPressed: null),
    );
  }
}
