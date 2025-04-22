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
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.deepPurple),
              child: Text('Menu', style: TextStyle(color: Colors.white, fontSize: 24)),
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
