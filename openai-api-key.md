<details>
<summary>📋 Passo a passo: criando sua chave de API na OpenAI</summary>

<br>

**1. Crie uma conta na OpenAI**

Acesse [platform.openai.com](https://platform.openai.com) e crie uma conta (ou faça login se já tiver uma).

**2. Adicione créditos**

A API da OpenAI é paga por uso. Você precisa adicionar um cartão de crédito e comprar créditos antes de conseguir criar uma chave.

Vá em **Settings > Billing** e adicione um método de pagamento. Para testes, um valor pequeno (como US$ 5) já é suficiente para muitas requisições.

**3. Crie sua chave de API**

Vá para [platform.openai.com/api-keys](https://platform.openai.com/api-keys) e clique em **Create new secret key**.

Dê um nome à chave (ex: `ChefIA`) e clique em **Create secret key**. A chave vai aparecer na tela — **copie agora**, pois ela não será exibida novamente!

**4. Use a chave no projeto**

No seu arquivo `.env`, adicione:

```
OPENAI_API_KEY=cole-sua-chave-aqui
```

O arquivo `config/initializers/ruby_llm.rb` já está configurado para usar essa variável por padrão:

```ruby
RubyLLM.configure do |config|
  config.openai_api_key = ENV["OPENAI_API_KEY"]
end
```

**5. Teste no console do Rails**

```bash
rails console
```

```ruby
chat = RubyLLM.chat
response = chat.ask("O que é Ruby on Rails?")
puts response.content
```

Se uma resposta aparecer, está funcionando! 🎉

> ⚠️ Fique de olho no seu consumo em **Settings > Usage** na plataforma da OpenAI para não ter surpresas na fatura. Você também pode criar limites de gasto ou bloquear a compra automática de créditos em seu cartão de crédito (desabilite o auto recharge).

</details>
