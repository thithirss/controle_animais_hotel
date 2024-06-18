# HOTEL DE PET'S XAPPA

Projeto desenvolvido em flutter. 

## Sobre:

O projeto foi feito com o intuito de concorrer uma vaga de dev, o proposito do projeto é que o mesmo consiga cadastrar o pet incluindo: Nome do Tutor (Dono do animal) 
,Contato do Tutor, Espécie (Cachorro ou Gato), Raça, Data de entrada ,Diárias até o momento ,Previsão de data de saída (Se houver) ,Diárias totais previstas (se aplicável).

## Instalação: 

O mesmo deverera ser baixado, ou clonado via git bash, nome da pasta deve ser 'controle_animais_hotel', o mesmo realizado com flutter, usando a depuração para eventuais testes no Google
Chrome, e Android Studio (dispositivo utilizado foi o Pixel 2 usando a API 31, release 'S' Android 12), versão do JDK 11. O mesmo nao exige nenhuma biblioteca em especial para seu funcionamento.


## Estrutura:

controle_animais_hotel/ <br />
├── lib/ <br />
│   ├── models/ <br />
│   │   └── animal.dart <br />
│   ├── screens/ <br />
│   │   ├── home_screen.dart <br />
│   │   └── animal_form_screen.dart <br />
│   └── widgets/ <br />
│       └── animal_card.dart <br />
├── pubspec.yaml <br />
└── README.md <br />

models/animal.dart -> as classes, construtores e metodos.
screens/home_screen.dart -> a tela inicial da aplicação, contendo os PET's cadastrados no hotel
screens/animal_form_creen.dart ->  O formulario de cadastro onde é inseridas as informações necessarias para compor o form
widgets/animal_card.dart -> O widget que apresenta os forms apos o submit.


## Apresentação da aplicação:

Ao iniciar o main.dart, apos a depuração do flutter vamos nos deparar com a tela inicial:

![Screenshot_1718746559](https://github.com/thithirss/controle_animais_hotel/assets/92064189/59c73816-2fa1-449e-ba64-a7490f4b3b49 =200x400)

Ao clicar no simbolo de "+" no canto inferior esquerdo, podemos fazer o cadastro dos animais.

![Screenshot_1718746639](https://github.com/thithirss/controle_animais_hotel/assets/92064189/6f9717d4-b6a0-4c6d-90cb-a99b5dc33cc0)

onde será preenchido as informações para o cadastro do pet ao Hotel

![Screenshot_1718746698](https://github.com/thithirss/controle_animais_hotel/assets/92064189/d0c2156b-ec0d-4dbe-ad15-cf1a660dcc51)

Apos preenchido, podera ser salvo e sera apresentado na tela inicial

![Screenshot_1718746736](https://github.com/thithirss/controle_animais_hotel/assets/92064189/47ae24ad-2f02-4f75-8099-d44709a7b365)

Clicando em cima do cadastro é possivel ser feita a edição do mesmo, ou excluir o cadastro do pet.

![Screenshot_1718746793](https://github.com/thithirss/controle_animais_hotel/assets/92064189/a4c7c405-5969-49fa-80fe-3490891afcc3)


































This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
