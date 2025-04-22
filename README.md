# Atividade 2 - Flutter – Cartão com Efeito de Mola

Este projeto foi desenvolvido para a disciplina de **Dispositivos Móveis** com o objetivo de demonstrar o uso de **animações físicas no Flutter**, através de um **cartão de produto que salta com efeito de mola** ao ser adicionado ao carrinho.

## Objetivo

Aplicar o conceito de **animações com SpringSimulation** utilizando `AnimationController`, com foco em suavidade, resposta física e separação da lógica de animação da UI principal.

## 🧠 Funcionalidades

- 🛍️ Cartão de produto com efeito de mola ao toque.
- ⚙️ Uso de `SpringSimulation` com `mass: 1`, `stiffness: 100`, `damping: 10`.
- 🔁 Animação suave com `AnimatedBuilder` e `Transform.translate`.
- 📱 Layout responsivo e organizado.
- 🧼 Separação entre lógica e interface com arquitetura modular.

## Estrutura do Projeto
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
│       ├── drawer_wdiget.dart        # Barra lateral
├── main.dart                         # Ponto de entrada do aplicativo
```

## Instruções para Executar o Aplicativo

Para executar o aplicativo localmente, siga os passos abaixo:

1. **Clone este repositório** para sua máquina local:
    ```bash
    git clone https://github.com/ErikMazzuco/atividade2.git
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
