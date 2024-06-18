# HOTEL DE PET'S XAPPA

Projeto desenvolvido em flutter. 

## Sobre:

O projeto foi feito com o intuito de concorrer uma vaga de dev, o proposito do projeto é que o mesmo consiga cadastrar o pet incluindo: Nome do Tutor (Dono do animal) 
,Contato do Tutor, Espécie (Cachorro ou Gato), Raça, Data de entrada ,Diárias até o momento ,Previsão de data de saída (Se houver) ,Diárias totais previstas (se aplicável).

## Instalação: 

Para utilizar o projeto, siga os passos abaixo:

- Clone o repositório:

git clone https://github.com/thithirss/controle_animais_hotel.git
cd controle_animais_hotel

- Certifique-se de ter o Flutter instalado e configurado corretamente.
- Execute o projeto com `flutter run`.

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

<img src = "https://github.com/thithirss/controle_animais_hotel/assets/92064189/cc161092-25ba-4ef1-99e4-2d6b5dbba6a3" width = "300">

Ao clicar no simbolo de '+' no canto inferior esquerdo, podemos fazer o cadastro dos animais.

<img src = "https://github.com/thithirss/controle_animais_hotel/assets/92064189/e51fbc3a-30d7-417c-8afc-8d37cbbed8dc" width = "300">





onde será preenchido as informações para o cadastro do pet ao Hotel

<img src = "https://github.com/thithirss/controle_animais_hotel/assets/92064189/d19e4737-0302-41ee-b78d-d5d7a7fa25c4" width= "300">

É possivel diferenciar os animais pela especie (gato ou cachorro)

<img src = "https://github.com/thithirss/controle_animais_hotel/assets/92064189/e0aa5753-a003-4062-8306-436e98dbaa10" width = "300">

Para facilitar ao usuario, o cadastro de datas é feito via pop-up de um calendario 

<img src = "https://github.com/thithirss/controle_animais_hotel/assets/92064189/1908086d-3f9f-4849-918d-e1e6e2226d64" width = "300">

Apos preenchido, podera ser salvo e sera apresentado na tela inicial

<img src = "https://github.com/thithirss/controle_animais_hotel/assets/92064189/47ae24ad-2f02-4f75-8099-d44709a7b365" width = "300">

Clicando em cima do cadastro é possivel ser feita a edição do mesmo, ou excluir o cadastro do pet.

<img src = "https://github.com/thithirss/controle_animais_hotel/assets/92064189/a4565e51-6ba1-4aaa-9073-32e87d545d07" width = "300">

<img src = "https://github.com/thithirss/controle_animais_hotel/assets/92064189/72be6336-bb49-45b0-a917-9b7fbf2c1e0a" width = "300">






This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
