# MyVMQPlugin

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `my_vernemq_plugin` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:my_vernemq_plugin, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/my_vernemq_plugin](https://hexdocs.pm/my_vernemq_plugin).

## Install vernemq on a mac:

```sh
git clone git://github.com/erlio/vernemq.git
chmod -R u+w /usr/local/Cellar/erlang
brew install openssl
cd vernemq
CFLAGS="-I/usr/local/Cellar/openssl/1.0.2l/include -L/usr/local/Cellar/openssl/1.0.2l/lib" make rel
cd _build/default/rel/vernemq/bin
# fix ulimit on Sierra: https://blog.dekstroza.io/ulimit-shenanigans-on-osx-el-capitan/
./vernemq start
```

## Recipe for enabling elixir plugin

```sh
./vernemq restart
./vmq-admin set allow_anonymous=on # set this before enabling my_vernemq_plugin to allow anonymous publishing
./vmq-admin plugin enable --name=elixir --path=/usr/local/Cellar/elixir/1.5.1
./vmq-admin plugin enable --name=my_vernemq_plugin --path=/Users/maz/src/my_vernemq_plugin/_build/dev
./vmq-admin plugin show
```
