defmodule Indico do
  @moduledoc """
  Indico.io API wrapper
  """

  defmodule Wrapper do
    @moduledoc false
    use Tesla
    plug Tesla.Middleware.BaseUrl, "https://apiv2.indico.io"
    plug Tesla.Middleware.Headers, [{"X-ApiKey", Application.get_env(:indico, :indico_io_api_key)}]
    plug Tesla.Middleware.JSON
  end

  @endpoints [
    sentiment: "Quickly and efficiently determine if text is positive or negative",
    sentimenthq: "Highly accurate sentiment analysis but less performant than the standard Sentiment API",
    texttags: "Determine the topics in the phrase or document",
    language: "Automatically determine the language of a phrase or document",
    political: "Gauge the political leanings of a phrase or document",
    people: "Identify references to specific persons found in a document",
    places: "Identify references to specific places found in a document",
    organizations: "Identify references to specific organizations found in a document",
    personality: "Predicts the personality traits of a text's author",
    textfeatures: "Convert text into meaningful feature vectors",
    emotion: "Predicts the emotion expressed by an author in a sample of text",
    summarization: "Summarizes long documents by extracting important sentences"
  ]

  @endpoints |> Enum.each(fn {name, desc} ->
    @doc """
    #{desc}

    ## Examples

        iex> {:ok, result} = Indico.#{name}("I feel good!")
        iex> Map.has_key?(result, "results")
        true

    """
    def unquote(name)(data) when is_list(data) do
      {:ok, %Tesla.Env{:body => body}} = Wrapper.post("/#{unquote(name)}/batch", %{:data => data})

      {:ok, body |> Jason.decode!}
    end

    def unquote(name)(data) do
      {:ok, %Tesla.Env{:body => body}} = Wrapper.post("/#{unquote(name)}", %{:data => data})

      {:ok, body}
    end
  end)
end
