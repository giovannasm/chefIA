<details>
<summary>📋 Passo a passo: criando sua chave gratuita com GitHub Models</summary>

<br>

Criar uma chave na OpenAI exige cartão de crédito. Como alternativa gratuita, o GitHub disponibiliza acesso aos mesmos modelos de IA (incluindo os da OpenAI) autenticado com um token do próprio GitHub.

**1. Acesse a página de tokens do GitHub**

Vá para [github.com/settings/tokens](https://github.com/settings/tokens), clique em **Personal access tokens > Fine-grained tokens** e depois em **Generate new token**.

**2. Dê um nome ao seu token**

Escolha um nome que você vai reconhecer facilmente (ex: `ChefIA Workshop`). Adicione uma descrição se quiser.

**3. Defina as permissões**

- Em **Repository access**, não precisa selecionar nenhum repositório — deixe como está.
- Em **Account permissions**, encontre **Models** e selecione **Read-only**.
- Deixe todas as outras permissões como **No access**.

**4. Gere o token**

Role até o final da página e clique em **Generate token**. Uma sequência de caracteres vai aparecer na tela — **copie agora**, pois ela não será exibida novamente!

**5. Use o token no projeto**

No seu arquivo `.env`, adicione:

```
GITHUB_TOKEN=cole-seu-token-aqui
```

E no arquivo `config/initializers/ruby_llm.rb`, configure assim como está aqui nesse projeto:

```ruby
RubyLLM.configure do |config|
  config.openai_api_key = ENV["GITHUB_TOKEN"]
  config.openai_api_base = "https://models.inference.ai.azure.com"
end
```

**6. Teste no console do Rails**

```bash
rails console
```

```ruby
chat = RubyLLM.chat
response = chat.ask("What is Ruby on Rails?")
puts response.content
```

Se uma resposta aparecer, está funcionando! 🎉

> ⚠️ O GitHub Models tem limites de uso gratuitos (rate limits). Para uso em produção ou volume maior, será necessário uma conta paga na OpenAI ou outro provedor.

</details>
