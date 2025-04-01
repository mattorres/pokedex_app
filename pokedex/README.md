# 🎮 Pokémon GO POC – Monorepo (Melos + FVM)

Uma prova de conceito inspirada em Pokémon GO, construída com Flutter e MobX, consumindo dados da [PokéAPI](https://pokeapi.co/), estruturado como **monorepo** com suporte a **Melos**, **FVM**, **Clean Architecture** e integração com código nativo (`MethodChannel`) para pronúncia via TTS.

---

## 📦 Requisitos

- [Flutter SDK (via FVM)](https://fvm.app) – versão `3.29.2`
- [Melos](https://melos.invertase.dev/) – gerenciamento de workspaces Flutter
- Git e Dart instalados

---

## ▶️ Passo a passo para rodar o projeto

### 1. Instale o FVM (se ainda não tiver)

```bash
dart pub global activate fvm
```

Adicione o FVM ao PATH:

```bash
export PATH="$PATH":"$HOME/.pub-cache/bin"
```

---

### 2. Instale o Melos

```bash
dart pub global activate melos
```

---

### 3. Clone o repositório

```bash
git clone https://github.com/mattorres/pokedex
cd pokedex
```

---

### 4. Use a versão correta do Flutter com FVM

```bash
fvm use 3.29.2
fvm flutter --version
```

---

### 5. Instale as dependências com o Melos

```bash
melos bootstrap
```

---

### 6. Rode o app principal

Se o app estiver em `apps/apps`, rode:

```bash
cd apps/app
fvm flutter run
```

---

### 7. Rodando os testes

Para rodar testes de todos os pacotes:

```bash
melos run test
```

Ou manualmente:

```bash
cd packages/pokemon_core
fvm flutter test
```

---

## 🧱 Estrutura de projeto (Melos)

```
.
├── apps/
│   └── pokemon_app/            # App principal
├── packages/
│   ├── pokemon_core/           # Domain, data, shared logic
│   └── pokemon_presentation/   # Stores, widgets, pages
├── melos.yaml
├── fvm/
│   └── config.json
└── pubspec.yaml
```

---

## 📦 Exemplo do `melos.yaml`

```yaml
name: pokedex

packages:
  - apps/**
  - packages/**

scripts:
  test: |
    melos exec -- flutter test
```

---

## 📱 Integração com TTS nativo

- Android: `MainActivity.kt` implementa `TextToSpeech` com MethodChannel `pokemon_tts`
- iOS: `AppDelegate.swift` implementa `AVSpeechSynthesizer` com mesmo canal

---

## 🧠 Clean Architecture aplicada

- **Domain**: regras de negócio puras (usecases, entities, failures)
- **Data**: integração com API (datasources, mappers, repositories)
- **Presentation**: stores MobX e interface desacoplada
- **Platform**: comunicação com código nativo via canais

---

## 🧪 Testes unitários incluídos

- ✅ Camada de domínio (usecases)
- ✅ Camada de dados (datasources e repositories)
- ✅ Camada de apresentação (stores MobX)
- ✅ Testes executáveis via `melos run test`