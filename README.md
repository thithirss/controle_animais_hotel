# HOTEL DE PET'S XAPPA

Projeto desenvolvido em flutter. 

## Sobre:

O projeto foi feito com o intuito de concorrer uma vaga de dev, o proposito do projeto é que o mesmo consiga cadastrar o pet incluindo: Nome do Tutor (Dono do animal) 
,Contato do Tutor, Espécie (Cachorro ou Gato), Raça, Data de entrada ,Diárias até o momento ,Previsão de data de saída (Se houver) ,Diárias totais previstas (se aplicável).

## Instalação: 

O mesmo deverera ser baixado, ou clonado via git bash, nome da pasta deve ser 'controle_animais_hotel', o mesmo realizado com flutter, usando a depuração para eventuais testes no Google
Chrome, e Android Studio (dispositivo utilizado foi o Pixel 2 usando a API 31, release 'S' Android 12), versão do JDK 11. O mesmo nao exige nenhuma biblioteca em especial para seu funcionamento.


## Estrutura:

controle_animais_hotel/
├── lib/
│   ├── models/
│   │   └── animal.dart
│   ├── screens/
│   │   ├── home_screen.dart
│   │   └── animal_form_screen.dart
│   └── widgets/
│       └── animal_card.dart
├── pubspec.yaml
└── README.md

models/animal.dart -> as classes, construtores e metodos.
screens/home_screen.dart -> a tela inicial da aplicação, contendo os PET's cadastrados no hotel
screens/animal_form_creen.dart ->  O formulario de cadastro onde é inseridas as informações necessarias para compor o form
widgets/animal_card.dart -> O widget que apresenta os forms apos o submit.



























This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
