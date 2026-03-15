class RecipeSuggestionController < ApplicationController
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
      Suggest a simple recipe using only the following ingredients:

      #{ingredients}

      Return:
      - Recipe name
      - Ingredients list
      - Step-by-step instructions

      Keep it simple and beginner friendly.
    PROMPT
  end
end
