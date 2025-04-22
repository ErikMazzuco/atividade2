import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainApp(),
    );
  }
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _selectedIndex = 0;
  final List<String> cartItems = [];

  void _onNavTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onDrawerSelected(int index) {
    Navigator.pop(context); // Fecha o menu
    _onNavTapped(index);
  }

  void _addToCart(String productName, GlobalKey imageKey) async {
    final overlay = Overlay.of(context);
    final renderBox = imageKey.currentContext?.findRenderObject() as RenderBox?;
    final startOffset = renderBox?.localToGlobal(Offset.zero);

    if (startOffset == null || overlay == null) return;

    final endOffset = Offset(MediaQuery.of(context).size.width - 60, MediaQuery.of(context).size.height - 60);

    final overlayEntry = OverlayEntry(
      builder: (context) {
        return _FlyingItem(
          startPosition: startOffset,
          endPosition: endOffset,
        );
      },
    );

    overlay.insert(overlayEntry);

    await Future.delayed(const Duration(milliseconds: 600));
    overlayEntry.remove();

    setState(() {
      cartItems.add(productName);
    });
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      HomePage(onAddToCart: _addToCart),
      const FavoritesPage(),
      CartPage(cartItems: cartItems),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Loja com Animação'),
        backgroundColor: Colors.deepPurple,
      ),
      drawer: Drawer(
  child: ListView(
    children: [
      UserAccountsDrawerHeader(
        decoration: const BoxDecoration(color: Colors.deepPurple),
        accountName: const Text("Nome da Boneca"),
        accountEmail: const Text("boneca@email.com"),
        currentAccountPicture: const CircleAvatar(
          backgroundImage: NetworkImage('data:image/jpeg;base64,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'), // ou NetworkImage se for de internet
        ),
      ),
      ListTile(
        leading: const Icon(Icons.home),
        title: const Text('Início'),
        onTap: () => _onDrawerSelected(0),
      ),
      ListTile(
        leading: const Icon(Icons.favorite),
        title: const Text('Favoritos'),
        onTap: () => _onDrawerSelected(1),
      ),
      ListTile(
        leading: const Icon(Icons.shopping_cart),
        title: const Text('Carrinho'),
        onTap: () => _onDrawerSelected(2),
      ),
    ],
  ),
),

      body: IndexedStack(
        index: _selectedIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepPurple,
        onTap: _onNavTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Início"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favoritos"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Carrinho"),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final Function(String, GlobalKey) onAddToCart;

  const HomePage({super.key, required this.onAddToCart});

  @override
  Widget build(BuildContext context) {
    final products = ["Tênis Fashion", "Camisa Estilosa", "Calça Confortável", "Jaqueta Cool"];
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final key = GlobalKey();
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            leading: Icon(Icons.shopping_bag, key: key),
            title: Text(products[index]),
            trailing: ElevatedButton(
              onPressed: () => onAddToCart(products[index], key),
              child: const Text("Adicionar"),
            ),
          ),
        );
      },
    );
  }
}

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Nenhum favorito ainda 🫶", style: TextStyle(fontSize: 20)),
    );
  }
}

class CartPage extends StatelessWidget {
  final List<String> cartItems;

  const CartPage({super.key, required this.cartItems});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: cartItems
          .map((item) => ListTile(
                leading: const Icon(Icons.check),
                title: Text(item),
              ))
          .toList(),
    );
  }
}

class _FlyingItem extends StatefulWidget {
  final Offset startPosition;
  final Offset endPosition;

  const _FlyingItem({
    required this.startPosition,
    required this.endPosition,
  });

  @override
  State<_FlyingItem> createState() => _FlyingItemState();
}

class _FlyingItemState extends State<_FlyingItem> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: const Duration(milliseconds: 600), vsync: this);

    _animation = Tween<Offset>(
      begin: widget.startPosition,
      end: widget.endPosition,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (_, __) {
          return Positioned(
            top: _animation.value.dy,
            left: _animation.value.dx,
            child: const Icon(Icons.shopping_bag, size: 32, color: Colors.deepPurple),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
