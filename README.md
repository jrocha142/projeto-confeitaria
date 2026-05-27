# Confeitaria Manager 🍰

Sistema administrativo para gerenciamento de confeitaria desenvolvido em Flutter.

O objetivo deste projeto é fornecer uma solução simples e moderna para gerenciamento de:
- Pedidos
- Produtos
- Finanças
- Análise de performance

O aplicativo está sendo desenvolvido em etapas como projeto acadêmico para disciplina de Laboratório de Engenharia de Software, com foco em:
- Arquitetura de aplicações Flutter
- Organização de estado
- Modelagem de dados
- Experiência do usuário
- Dashboards administrativos

---

# 📱 Funcionalidades

## ✅ Pedidos
- Cadastro de pedidos
- Seleção de produtos diretamente do catálogo
- Quantidade por pedido
- Cálculo automático do valor total
- Remoção/conclusão de pedidos
- Atualização automática das entradas financeiras

---

## ✅ Produtos
- Catálogo de produtos
- Exibição em grade (GridView)
- Cards com imagem, nome e preço
- Modal com detalhes do produto
- Ingredientes do produto
- Cadastro de novos produtos
- Seleção de imagens pelo explorador de arquivos

---

## ✅ Finanças
- Controle de gastos da confeitaria
- Registro de despesas
- Visualização de:
  - Entradas
  - Saídas
  - Balanço total

---

## ✅ Performance
- Dashboard administrativo
- Gráfico de receita semanal
- Produto mais vendido
- Produto menos vendido
- Total de pedidos
- Receita total

---

# 🛠️ Tecnologias Utilizadas

## Flutter
Framework principal utilizado para desenvolvimento da interface.

## Dart
Linguagem utilizada no desenvolvimento da aplicação.

## fl_chart
Biblioteca utilizada para criação dos gráficos da dashboard.

## image_picker
Biblioteca utilizada para seleção de imagens do dispositivo.

## Firebase (em desenvolvimento)
Integração futura para:
- persistência de dados
- armazenamento em nuvem
- sincronização entre dispositivos

---

# 📊 Arquitetura Atual

O projeto segue uma arquitetura simples baseada em:
- Separação de responsabilidades
- Componentes reutilizáveis
- Gerenciamento de estado via StatefulWidget e callbacks

Atualmente:
- `MainPage` centraliza o estado principal da aplicação
- páginas recebem dados via construtor
- widgets visuais permanecem desacoplados da lógica

---

# 🚀 Como Executar

## Clone o projeto

```bash
git clone <url-do-repositorio>
```

---

## Instale as dependências

```bash
flutter pub get
```

---

## Execute o projeto

```bash
flutter run
```

---

# 🌐 Executar no Chrome

```bash
flutter run -d chrome
```

---

# 📦 Gerar Build Web

```bash
flutter build web
```

---

# 📱 Gerar APK Android

```bash
flutter build apk --release
```

---

# 📌 Funcionalidades Futuras

- Integração completa com Firebase
- Firebase Firestore
- Firebase Storage
- Persistência real dos dados
- Sistema de autenticação
- Controle de estoque
- Relatórios financeiros avançados
- Tema customizável
- Exportação de relatórios
- Responsividade aprimorada

---

# 👨‍💻 Desenvolvimento

Projeto desenvolvido utilizando Flutter como estudo de:
- Desenvolvimento mobile
- Arquitetura de software
- Interfaces administrativas
- Sistemas de gerenciamento

---

# 📄 Licença

Este projeto é destinado para fins acadêmicos e de estudo.
