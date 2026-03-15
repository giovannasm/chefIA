class RecipeSuggestionsController < ApplicationController
  def new
    @suggestion = RecipeSuggestion.new
  end

  def create
    @suggestion = RecipeSuggestion.new(suggestion_params)

    prompt = build_prompt(@suggestion.ingredients)

    response = RubyLLM.chat.ask(prompt)

    @suggestion.recipe = response.content

    if @suggestion.save
      redirect_to @suggestion
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @suggestion = RecipeSuggestion.find(params[:id])
  end

  private

  def suggestion_params
    params.require(:recipe_suggestion).permit(:ingredients)
  end

  def build_prompt(ingredients)
    <<~PROMPT
      Sugira duas receitas simples com base nos seguintes ingredientes:

      #{ingredients}

      Receita 1:
      - Deve usar apenas os ingredientes listados acima.

      Receita 2:
      - Pode incluir alguns ingredientes adicionais que o usuário talvez precise comprar.

      Para cada receita, retorne:
      - Nome da receita
      - Lista de ingredientes
      - Instruções passo a passo

      Mantenha a receita simples e amigável para iniciantes.
    PROMPT
  end
end
