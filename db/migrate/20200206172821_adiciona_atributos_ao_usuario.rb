class AdicionaAtributosAoUsuario < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :nome, :string
    add_column :users, :matricula, :string
    add_column :users, :cargo, :string
  end
end
