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
      debugShowCheckedModeBanner: false, // Tira a faixa vermelha de DEBUG
      home: ProductPage(),
    );
  }
}

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late SpringSimulation _spring;

  @override
  void initState() {
    super.initState();

    // Cria a animação física com mola
    _spring = SpringSimulation(
      SpringDescription(
        mass: 1,
        stiffness: 100,
        damping: 10,
      ),
      0,
      1,
      0,
    );

    _controller = AnimationController.unbounded(vsync: this);
  }

  void _addToCart() {
    _controller.animateWith(_spring);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cartão com Salto Físico"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(0, -100 * _controller.value),
              child: child,
            );
          },
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: SizedBox(
              width: 250,
              height: 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Produto Incrível",
                      style: TextStyle(fontSize: 20)),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: _addToCart,
                    child: const Text("Adicionar ao Carrinho"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
