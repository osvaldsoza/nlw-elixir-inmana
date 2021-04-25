defmodule Inmana.Suplies.ExpirationNotification do
  alias Inmana.Mailer
  alias Inmana.Suplies.ExpirationEmail
  alias Inmana.Suplies.GetByexpiration

  def send do
    data = GetByexpiration.call()

    Enum.each(data, fn {to_email, suplies} ->
      to_email
      |> ExpirationEmail.create(suplies)
      |> Mailer.deliver_later!()
    end)
  end
end
