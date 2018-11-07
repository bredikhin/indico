# Indico

[Indico.io](https://indico.io) API wrapper in [Elixir](https://elixir-lang.org).

## Installation

Just add `indico` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:indico, "~> 0.1.1"}
  ]
end
```

and put your Indico.io API key in your configuration file like this:

```elixir
config :indico, indico_io_api_key: System.get_env("INDICO_IO_API_KEY")
```

(assuming that environment variable is set).

## Implemented functionality

- **sentiment**: quickly and efficiently determine if text is positive or negative,
- **sentimenthq**: Highly accurate sentiment analysis but less performant than the standard Sentiment API,
- **texttags**: Determine the topics in the phrase or document,
- **language**: Automatically determine the language of a phrase or document,
- **political**: Gauge the political leanings of a phrase or document,
- **people**: Identify references to specific persons found in a document,
- **places**: Identify references to specific places found in a document,
- **organizations**: Identify references to specific organizations found in a document,
- **personality**: Predicts the personality traits of a text's author,
- **textfeatures**: Convert text into meaningful feature vectors,
- **emotion**: Predicts the emotion expressed by an author in a sample of text,
- **summarization**: Summarizes long documents by extracting important sentences

## Usage example

```elixir
iex(1)> IndicoIo.sentiment "I feel good!"
{:ok, %{"results" => 0.9360338577753942}}
iex(2)> IndicoIo.sentiment "yikes!"
{:ok, %{"results" => 8.545276187403398e-4}}
iex(3)> IndicoIo.sentiment(["yes-yes-yes!", "no way!"])
{:ok, %{"results" => [0.9344446305911374, 0.005659668743777363]}}
```

## Dependencies

* [Tesla](https://github.com/teamon/tesla)
* [Jason](https://github.com/michalmuskala/jason)

## Documentation

The docs are available at [https://hexdocs.pm/indico](https://hexdocs.pm/indico).

## License

[The MIT License](http://opensource.org/licenses/MIT)

Copyright (c) 2018 [Ruslan Bredikhin](http://ruslanbredikhin.com/)
