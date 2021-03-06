defmodule Aprb.ViewHelper do
  def artwork_link(artwork_id) do
    "https://www.artsy.net/artwork/#{artwork_id}"
  end

  def artist_link(artist_id) do
    "https://www.artsy.net/artist/#{artist_id}"
  end

  def radiation_link(path) do
    "https://radiation.artsy.net/#{path}"
  end

  def impulse_link(path) do
    "https://impulse.artsy.net/#{path}"
  end

  def radiation_conversation_link(conversation_id) do
    conversation_path = "admin/accounts/2/conversations/#{conversation_id}"
    radiation_link(conversation_path)
  end

  def impulse_conversation_link(conversation_id) do
    conversation_path = "admin/conversations/#{conversation_id}"
    impulse_link(conversation_path)
  end

  def admin_partners_link(path) do
    "https://admin-partners.artsy.net/#{path}"
  end

  def admin_subscription_link(subscription_id) do
    admin_partners_link("subscriptions/#{subscription_id}")
  end

  def consignments_admin_link(consignment_id) do
    "https://convection.artsy.net/admin/submissions/#{consignment_id}"
  end

  def cleanup_name(full_name) do
    full_name
      |> String.split
      |> List.first
  end

  def format_price(price, currency \\ :USD) do
    if price do
      Money.to_string(Money.new(round(price * 100), currency), symbol: false)
    else
      "N/A"
    end
  end

  def artworks_display_from_artworkgroups(artworkgroups) do
    artworkgroups
      |> Enum.map(fn(ag) -> "#{ag["title"]}(#{ag["artists"]})" end)
      |> Enum.join(", ")
  end
end