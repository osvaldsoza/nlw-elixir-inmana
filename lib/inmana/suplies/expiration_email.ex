defmodule Inmana.Suplies.ExpirationEmail do
  import Bamboo.Email

  alias Inmana.Suply

  def create(to_email, suplies) do
    new_email(
      to: to_email,
      from: "app@inmana@com.br",
      subject: "Suplies that ate about to expire",
      text_body: email_text(suplies)
    )
  end

  defp email_text(suplies) do
    initial_text = "------------- Suplies that are about to expire: -------------\n"

    Enum.reduce(suplies, initial_text, fn suply, text -> text <> suply_string(suply) end)
  end

  defp suply_string(%Suply{
         description: description,
         expiration_date: expiration_date,
         responsible: responsible
       }) do
    "Description: #{description}, Expiration Date: #{expiration_date}, Responsible: #{responsible} \n"
  end
end
