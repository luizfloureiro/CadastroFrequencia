module CadastrosHelper
  def gera_cargos(user)
    if user.admin?
      %w(Admin Secretaria)
    elsif user.secretaria?
      ["Professor"]
    else
      [""]
    end
  end
end
