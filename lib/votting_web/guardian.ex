defmodule VottingWeb.Guardian do
  use Guardian, otp_app: :votting

  def subject_for_token(resource, _claims) do
    sub = to_string(resource.id)
    {:ok, sub}
  end

  def resource_from_claims(claims) do
    id = claims["sub"]
    resource = Votting.AdminRepo.get_admin!(id)
    {:ok, resource}
  end
end
