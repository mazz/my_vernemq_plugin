defmodule MyVMQPlugin do
  @moduledoc """
  Documentation for MyVMQPlugin.
  """

@doc """
  Callback function which is called after a client has been
  successfully authenticated.
  """
  def on_client_wakeup({mountpoint, clientid}) do
    endpoint = Application.get_env(:my_vernemq_plugin, :endpoint_on_client_wakeup)
    headers = [{"hook", "on_client_wakeup"}]
    body = JSX.encode!(%{"mountpoint" => mountpoint,
                         "clientid" => clientid})
    HTTPoison.post!(endpoint, body, headers)
    :ok
  end

  @doc """
  Callback function which is called after a client using
  `clean_session=false` has been disconnected.
  """
  def on_client_offline({mountpoint, clientid}) do
    endpoint = Application.get_env(:my_vernemq_plugin, :endpoint_on_client_offline)
    headers = [{"hook", "on_client_offline"}]
    body = JSX.encode!(%{"mountpoint" => mountpoint,
                         "clientid" => clientid})
    HTTPoison.post!(endpoint, body, headers)
    :ok
  end

  @doc """
  Callback function which is called after a client using
  `clean_session=true` has been disconnected.
  """
  def on_client_gone({mountpoint, clientid}) do
    endpoint = Application.get_env(:my_vernemq_plugin, :endpoint_on_client_gone)
    headers = [{"hook", "on_client_gone"}]
    body = JSX.encode!(%{"mountpoint" => mountpoint,
                         "clientid" => clientid})
    HTTPoison.post!(endpoint, body, headers)
    :ok
  end

  @doc """
  Callback function which is called whenever a message has been
  authorized and is about to be published.
  """
  def on_publish(username, {mountpoint, clientid}, qos, topic, payload, isretain) do
    endpoint = Application.get_env(:my_vernemq_plugin, :endpoint_on_publish)
    headers = [{"hook", "on_publish"}]
    body = JSX.encode!(%{"username" => username,
                         "mountpoint" => mountpoint,
                         "clientid" => clientid,
                         "qos" => qos,
                         "topic" => topic,
                         "payload" => payload,
                         "isretain" => isretain})
    HTTPoison.post!(endpoint, body, headers)
    :ok
  end
end
