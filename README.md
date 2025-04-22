# Atividade 2 - Flutter – Cartão com salto físico

Este projeto foi desenvolvido para a disciplina de **Dispositivos Móveis** com o objetivo de demonstrar o uso de **animações físicas no Flutter**, através de um **cartão de produto que salta com efeito de mola** ao ser adicionado ao carrinho.

## 🎯 Objetivo 

1. Criar um `StatefulWidget` com `SingleTickerProviderStateMixin`.
2. Em `initState()` , configurar um `SpringSimulation ( mass:1 , stiffness:100 ,
damping:10)` e inicializar um `AnimationController` sem bounds fixos.
3. Ao tocar em “Adicionar ao Carrinho”, disparar a simulação via
`_controller.animateWith(SpringSimulation(spring, 0, 1, 0))`;
4. Usar um `AnimatedBuilder` para envolver o widget Card e aplicar
`Transform.translate(offset: Offset(0, -100 * _controller.value))` .
5. Assegurar o dispose do controller em `dispose()` .


## 🧠 Funcionalidades

- ⚠️ Implementar o Gitpod.
- 🛍️ Cartão de produto com efeito de mola ao toque.
- ⚙️ Uso de `SpringSimulation` com `mass: 1`, `stiffness: 100`, `damping: 10`.
- 🔁 Animação suave com `AnimatedBuilder` e `Transform.translate`.
- 📱 Layout responsivo e organizado.
- 🧼 Separação entre lógica e interface com arquitetura modular.

## 📦 Estrutura do Projeto
```
lib/
├── animations/
│   └── spring_controller.dart        # Lógica de animação isolada
├── core/                             # Arquivos de configuração e utilitários
│   ├── themes.dart                   # Definições de temas (cores, fontes)
│   └── routes.dart                   # Definições de rotas
├── models/                           # Modelos de dados usados no app
├── modules/                          # Módulos principais do app (organizados por funcionalidade)
│   ├── home/                         # Tela inicial e lógica da home
│   └── splash/                       # Tela de splash e inicialização
│       ├── splash_controller.dart    # Tela de Carregamento
│       └── splash_screen.dart        # Tela de Carregamento
└── widgets/                          # Widgets reutilizáveis em várias partes do app
│       ├── animated_product_card.dart# Card com animação de mola
│       ├── drawer_widget.dart        # Barra lateral
│       └── appbar_widget.dart        # App bar com carrinho de venda

├── main.dart                         # Ponto de entrada do aplicativo
```

### ▶️ Executar via Web (Gitpod)

Abra o projeto direto no navegador usando o Gitpod:  
[![Abrir no Gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/#https://github.com/ErikMazzuco/atividade2)  
⚠️ **Requer Flutter Web. Ideal para testes rápidos e leitura do código.**

---

### 💻 Executar Localmente

Siga os passos abaixo para rodar o app na sua máquina:

1. **Clone este repositório:**
   ```bash
   git clone https://github.com/ErikMazzuco/atividade2.git
   cd atividade2
   ```

2. **Instale o Flutter**:
    Caso ainda não tenha o Flutter instalado, siga as instruções no site oficial: [Instalação do Flutter](https://flutter.dev/docs/get-started/install)

3. **Instale as dependências** do projeto:
    Navegue até a pasta do projeto no terminal e execute:
    ```bash
    flutter pub get
    ```

4. **Execute o aplicativo**:
    Para rodar o aplicativo, execute o seguinte comando no terminal:
    ```bash
    flutter run
    ```

## Funcionabilidades Implementadas

^^^^Preencher^^^^
^^^^^^^^^^^^^^^^^
|||||||||||||||||

## Créditos
- **Flutter**: Framework utilizado para o desenvolvimento do aplicativo.

- **Erik Matheus Mazzuco**: Desenvolvimento do projeto.
- **Felipe Morais Oliveira Campos**: Desenvolvimento do projeto.
- **Joao Otavio Bazzo Zimerman**: Desenvolvimento do projeto.
