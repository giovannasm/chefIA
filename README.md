# 👩‍🍳 ChefIA — Receitas com Inteligência Artificial

ChefIA é um app web construído com **Ruby on Rails** que usa **Inteligência Artificial** para sugerir receitas com base nos ingredientes que você já tem em casa.

Você digita o que tem na geladeira, a IA pensa como uma chef experiente, e voilà — duas receitas aparecem na tela: uma só com o que você tem, e outra com pouquíssimos ingredientes extras.

> 🎓 Este projeto foi criado para um workshop introdutório de Rails + IA de Rails Girls com Le Wagon. Se você chegou até aqui depois da apresentação, seja bem-vinda! Este README vai te guiar para rodar o projeto na sua máquina e entender como tudo funciona.

---

## 📎 Links da apresentação

| Material | Link |
|----------|------|
| 🖥️ Slides do workshop | *(em breve)* |

---

## 🧱 O que é Ruby on Rails?

**Ruby** é uma linguagem de programação. **Rails** é um framework — pense nele como uma caixa de ferramentas que já vem com tudo organizado para você construir um app web rapidinho, sem precisar reinventar a roda.

Com Rails, você consegue criar páginas, salvar dados no banco, e conectar tudo isso em poucas linhas de código.

📖 Quer aprender mais? Veja o tutorial oficial do Rails (em inglês):
👉 [guides.rubyonrails.org/getting_started.html](https://guides.rubyonrails.org/getting_started.html)

📚 Documentação completa do Rails:
👉 [guides.rubyonrails.org](https://guides.rubyonrails.org)

---

## 🤖 O que é uma LLM / IA Generativa?

**LLM** significa *Large Language Model* (Grande Modelo de Linguagem). É o tipo de IA por trás do ChatGPT, do Google Gemini, e do Claude — modelos treinados em enormes quantidades de texto para entender e gerar linguagem humana.

Neste app, a gente envia os ingredientes da usuária para uma LLM (via API da OpenAI), e ela responde com sugestões de receitas. É exatamente isso que acontece nos bastidores quando você clica em "Gerar receita com IA".

A gem que conecta o Rails à API de IA se chama **RubyLLM**:
👉 [rubyllm.com](https://rubyllm.com)

---

## 🛠️ Como rodar o projeto na sua máquina

### 1. Configure seu ambiente

Se você ainda não tem Ruby, Rails e PostgreSQL instalados, siga o guia de setup do Le Wagon — ele é completo e tem instruções para Mac, Windows e Linux:

👉 [github.com/lewagon/setup](https://github.com/lewagon/setup)

### 2. Clone o repositório

Abra o terminal e rode:

```bash
git clone https://github.com/giovannasm/chefIA.git
cd chefIA
```

### 3. Instale as dependências

```bash
bundle install
```

> 💡 `bundle install` lê o arquivo `Gemfile` do projeto e instala todas as bibliotecas (gems) que ele precisa — incluindo o Rails e o RubyLLM.

### 4. Configure sua chave de API

O app precisa de uma chave de API para se comunicar com a IA. Crie um arquivo chamado `.env` na raiz do projeto:

```bash
touch .env
```

Abra o arquivo e adicione a chave da OpenAI:

```
OPENAI_API_KEY=sua_chave_aqui
```

> 🔑 Aprenda como gerar uma chave de API da OpenAI [aqui](openai-api-key.md)

> ⚠️ **Importante:** nunca suba o arquivo `.env` para o GitHub! Ele já está listado no `.gitignore` deste projeto, então você está protegida.

> 🔑 **Como conseguir uma chave gratuita?** Você pode usar o **GitHub Models** para prototipar de graça (criar uma chave na OpenAI exige cartão de crédito), usando seu token do GitHub como chave. Veja as instruções [aqui](github-models.md). Uma ressalva importante aqui é que esses modelos têm uma série de limitações (como só funcionarem em inglês e não saberem ler ou produzir imagens e vídeos)

### 5. Crie o banco de dados

```bash
rails db:create db:migrate
```

> 💡 Este comando cria o banco de dados local e roda as "migrations" — arquivos que definem como as tabelas do banco de dados são estruturadas.

### 6. Rode o servidor

```bash
rails server
```

Abra o navegador e acesse: [http://localhost:3000](http://localhost:3000) 🎉

---

## 📁 Como o projeto está organizado

```
chefIA/
├── app/
│   ├── controllers/         # Lógica do app (o que acontece quando você clica em algo)
│   │   └── recipe_suggestions_controller.rb
│   ├── models/              # Regras de negócio e conexão com o banco de dados
│   │   └── recipe_suggestion.rb
│   └── views/               # O que aparece na tela (HTML + Ruby)
│       └── recipe_suggestions/
│           ├── new.html.erb     # Formulário de ingredientes
│           ├── show.html.erb    # Exibição da receita gerada
│           ├── index.html.erb   # Histórico de receitas
│           └── edit.html.erb    # Edição de ingredientes
├── config/
│   └── routes.rb            # Define as URLs do app
├── db/
│   └── migrate/             # Histórico de mudanças no banco de dados
├── Gemfile                  # Lista de dependências (gems)
└── .env                     # Suas chaves secretas (NÃO sobe pro GitHub!)
```

---

## ✨ O que o app faz

| Ação | O que acontece |
|------|---------------|
| Acessar a página inicial | Formulário para digitar seus ingredientes |
| Enviar os ingredientes | A IA gera duas receitas e salva no banco |
| Ver uma receita | Exibe os ingredientes e a receita gerada |
| Ver o histórico | Lista todas as receitas já geradas |
| Editar | Atualiza os ingredientes e gera uma nova receita |
| Deletar | Remove a receita do histórico |

---

## 🧩 Quer criar seu próprio app do zero?

Este projeto foi gerado a partir do template minimalista do Le Wagon, que já vem com Bootstrap e outras configurações prontas:

👉 [github.com/lewagon/rails-templates](https://github.com/lewagon/rails-templates)

Para criar um novo projeto com o template:

```bash
rails new \
  -d postgresql \
  -m https://raw.githubusercontent.com/lewagon/rails-templates/master/minimal.rb \
  nome-do-seu-app
```

---

## 🙋 Dúvidas?

Se você está estudando por conta própria e travou em algum passo, o melhor lugar para buscar ajuda é:

- 📖 [Documentação do Rails](https://guides.rubyonrails.org)
- 📖 [Documentação do RubyLLM](https://rubyllm.com)
- 📖 [Odin Project](https://www.theodinproject.com/paths/full-stack-ruby-on-rails/courses/ruby-on-rails)
- 📖 [Workshops gratuitos do Le Wagon](https://www.lewagon.com/pt-BR/events?category=workshop)
- 💬 [Stack Overflow](https://stackoverflow.com) — pesquise sua dúvida em inglês para melhores resultados
- 🤖 Sua IA preferida! (Lembre-se de usar para apredender também, não apenas para auto completar o código)

---

*Feito com 👩‍🍳 e muito `rails generate` durante o workshop de Rails + IA de Rails Girls 🤝 Le Wagon*
