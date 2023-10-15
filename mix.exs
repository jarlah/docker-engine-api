defmodule DockerEngineAPI.Mixfile do
  use Mix.Project

  @app :docker_engine_api
  @version "1.43.0"
  @source_url "https://github.com/jarlah/docker-engine-api-elixir"

  def project do
    [
      app: @app,
      name: "#{@app}",
      version: @version,
      source_url: @source_url,
      homepage_url: @source_url,
      elixir: "~> 1.15",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      package: package(),
      description: """
      The Engine API is an HTTP API served by Docker Engine. It is the API the Docker client uses to communicate with the Engine, so everything the Docker client can do can be done with the API.  Most of the client&#39;s commands map directly to API endpoints (e.g. &#x60;docker ps&#x60; is &#x60;GET /containers/json&#x60;). The notable exception is running containers, which consists of several API calls. See README for more.
      """,
      deps: deps(),
      package: [
        links: %{"GitHub" => @source_url},
        licenses: ["MIT"]
      ]
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
        name: "docker_engine_api",
        files: ~w(.formatter.exs config lib mix.exs README* LICENSE*),
      ]
  end
end
