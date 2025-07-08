# PTMOL Safe

> 🛡️ **Sua aliada na prevenção de ameaças em redes sociais!**

PTMOL Safe é um aplicativo Flutter desenvolvido para ajudar usuários a identificar e prevenir ameaças de privacidade e segurança digital em redes sociais. O aplicativo oferece uma interface intuitiva para análise de riscos e geração de modelos de ameaças personalizados.

## 📱 Sobre o Aplicativo

O PTMOL Safe é uma ferramenta educativa e preventiva que permite aos usuários:

- **Identificar Ameaças**: Reconhecer diferentes tipos de ameaças digitais como clonagem de perfil, espionagem, roubo de identidade, entre outras
- **Avaliar Riscos**: Analisar ativos pessoais e seu nível de exposição a ameaças
- **Gerar Relatórios**: Criar modelos de ameaças personalizados com base nas informações fornecidas
- **Educar e Prevenir**: Aprender sobre segurança digital através de interface didática

### 🎯 Principais Funcionalidades

#### 📋 Formulário de Análise
- Interface para coleta de informações sobre ativos pessoais
- Categorização de tipos de ameaças
- Avaliação de níveis de risco
- Identificação de fontes de vazamento

#### 🔍 Tipos de Ameaças Identificadas
- **Clonagem de Perfil**: Reprodução não autorizada de identidade
- **Espionagem**: Monitoramento não autorizado de atividades
- **Roubo de Identidade**: Apropriação de dados pessoais
- **Ameaça à Reputação**: Danos à imagem pessoal
- **Divulgação de Informações**: Exposição não autorizada de dados
- **Gravação Não Autorizada**: Captura de áudio/vídeo sem consentimento
- **Inferência de Dados**: Dedução de informações privadas
- **Reconhecimento Facial**: Identificação através de biometria

#### 📊 Relatórios e Documentação
- Geração de relatórios em PDF
- Modelos de ameaças personalizados
- Recomendações de contramedidas
- Compartilhamento de resultados

## 🛠️ Tecnologias Utilizadas

### Framework e Linguagem
- **Flutter** (>=3.16.0) - Framework multiplataforma
- **Dart** (>=3.2.0) - Linguagem de programação

### Principais Dependências
```yaml
dependencies:
  flutter_modular: ^6.4.1        # Arquitetura modular
  get: ^4.7.2                    # Gerenciamento de estado
  google_fonts: ^6.1.0          # Fontes personalizadas
  introduction_screen: ^3.1.12   # Tela de onboarding
  flutter_svg: ^2.0.9           # Suporte a SVG
  shared_preferences: ^2.5.3     # Armazenamento local
  pdf: ^3.11.2                  # Geração de PDF
  share_plus: ^11.0.0           # Compartilhamento
  printing: ^5.14.2             # Impressão
  intl: ^0.18.0                 # Internacionalização
```

### Arquitetura
- **Modular**: Organização em módulos independentes
- **MVVM**: Model-View-ViewModel pattern
- **GetX**: Gerenciamento de estado reativo

## 📁 Estrutura do Projeto

```
ptmol_safe/
├── lib/
│   ├── main.dart                    # Ponto de entrada da aplicação
│   ├── app_module.dart              # Módulo principal de rotas
│   ├── app_widget.dart              # Widget principal
│   ├── core/
│   │   └── mock_data.dart           # Dados mockados para ajuda
│   ├── shared/                      # Componentes compartilhados
│   │   ├── models/                  # Modelos de dados
│   │   ├── services/                # Serviços
│   │   ├── utils/                   # Utilitários
│   │   └── widgets/                 # Widgets reutilizáveis
│   ├── src/
│   │   └── modules/                 # Módulos da aplicação
│   │       ├── onboarding/          # Módulo de introdução
│   │       ├── form/                # Módulo do formulário
│   │       └── details/             # Módulo de detalhes/resultados
│   └── theme/                       # Temas e estilos
│       ├── default_theme.dart
│       ├── ui_theme.dart
│       └── colors/
├── assets/                          # Recursos estáticos
│   ├── logo.png                     # Logo principal
│   ├── ptmol.png                    # Logo PTMOL
│   ├── fonts/                       # Fontes personalizadas
│   ├── icons/                       # Ícones SVG das ameaças
│   └── illustrations/               # Ilustrações do onboarding
├── android/                         # Configurações Android
├── ios/                             # Configurações iOS
└── test/                           # Testes automatizados
```

## 🚀 Como Executar

### Pré-requisitos
- Flutter SDK (>=3.16.0)
- Dart SDK (>=3.2.0)
- Android Studio ou VS Code
- Emulador Android/iOS ou dispositivo físico

### Passos para Execução

1. **Clone o repositório**
```bash
git clone [URL_DO_REPOSITORIO]
cd ptmol_safe
```

2. **Instale as dependências**
```bash
flutter pub get
```

3. **Execute o aplicativo**
```bash
flutter run
```

### Comandos Úteis

```bash
# Executar testes
flutter test

# Construir para Android
flutter build apk

# Construir para iOS
flutter build ios

# Analisar código
flutter analyze

# Formatar código
flutter format .
```

## 🧪 Testes

O projeto inclui testes automatizados para validar:
- Carregamento correto da aplicação
- Navegação entre módulos
- Presença de elementos na UI
- Funcionalidades do formulário

Execute os testes com:
```bash
flutter test
```

## 📋 Funcionalidades Detalhadas

### 🎬 Onboarding
- Introdução ao aplicativo com slides informativos
- Explicação das funcionalidades principais
- Navegação intuitiva para o formulário

### 📝 Formulário de Análise
- Coleta de informações sobre ativos pessoais
- Seleção de tipos de ameaças
- Avaliação de níveis de risco
- Validação de campos obrigatórios

### 📊 Resultados e Relatórios
- Visualização do modelo de ameaças gerado
- Detalhamento das ameaças identificadas
- Recomendações de segurança
- Opções de exportação e compartilhamento

## 🔧 Configurações

### Splash Screen
Configurado com:
- Cor de fundo: `#7c00de` (roxo PTMOL)
- Logo centralizado
- Compatibilidade Android/iOS

### Ícones da Aplicação
- Ícone personalizado para Android e iOS
- Adaptive icon para Android
- Configuração automática via `flutter_launcher_icons`

## 📱 Plataformas Suportadas

- ✅ **Android** (API 21+)
- ✅ **iOS** (iOS 11.0+)
- 🔄 **Web** (em desenvolvimento)
- 🔄 **Desktop** (planejado)

## 🤝 Contribuindo

1. Faça um fork do projeto
2. Crie uma branch para sua feature (`git checkout -b feat/nova-feature`)
3. Commit suas mudanças (`git commit -am 'Adiciona nova feature'`)
4. Push para a branch (`git push origin feat/nova-feature`)
5. Abra um Pull Request

### Padrões de Commit
- `feat`: Nova funcionalidade
- `fix`: Correção de bug
- `docs`: Documentação
- `style`: Formatação
- `refactor`: Refatoração
- `test`: Testes

## 👥 Time de Desenvolvimento

- **Antônio Barbosa** - Desenvolvedor

## 🌿 Ambiente de Desenvolvimento

### Branches

- **`main`**: Versão estável em produção
- **`dev`**: Desenvolvimento ativo
- **`hml`**: Ambiente de homologação
- **`feat/*`**: Novas funcionalidades
- **`fix/*`**: Correções de bugs

### Fluxo de Trabalho

1. Desenvolvimento em `feat/*` ou `fix/*`
2. Merge para `dev` via Pull Request
3. Testes em `hml`
4. Deploy para `main`

## 📄 Licença

Este projeto está sob a licença [MIT](LICENSE) - veja o arquivo LICENSE para detalhes.

## 🆘 Suporte

Para dúvidas, sugestões ou problemas:

1. Abra uma [Issue](../../issues)
2. Entre em contato com o time de desenvolvimento
3. Consulte a documentação

---

**PTMOL Safe** - Protegendo sua privacidade digital! 🛡️ 