defmodule DockerEngineAPI.Mixfile do
  use Mix.Project

  @app :ex_docker_engine_api
  @version "1.43.2"
  @source_url "https://github.com/jarlah/docker-engine-api-elixir"

  def project do
    [
      app: @app,
      name: "#{@app}",
      version: @version,
      source_url: @source_url,
      homepage_url: @source_url,
      elixir: "~> 1.13",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      package: package(),
      description: """
      The Engine API is an HTTP API served by Docker Engine. It is the API the Docker client uses to communicate with the Engine, so everything the Docker client can do can be done with the API.
      """,
      deps: deps()
    ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    # Specify extra applications you'll use from Erlang/Elixir
    [extra_applications: [:logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:my_dep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:my_dep, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.3.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:tesla, "~> 1.7"},
      {:jason, "~> 1.4"},
      {:hackney, "~> 1.20"},
      {:ex_doc, "~> 0.30", only: :dev, runtime: false},
      {:dialyxir, "~> 1.3", only: [:dev, :test], runtime: false}
    ]
  end

   defp package do
      [
        name: "#{@app}",
        files: ~w(.formatter.exs lib mix.exs README* LICENSE*),
        links: %{"GitHub" => @source_url},
        licenses: ["MIT"]
      ]
  end
end
