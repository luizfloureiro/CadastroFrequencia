class CreateTurmas < ActiveRecord::Migration[6.0]
  def change
    create_table :turmas do |t|
      t.string :nome
      t.integer :dias
      t.time :inicio
      t.time :fim
      t.integer :cargamin
      t.integer :cargamax
      t.integer :capacidade

      t.timestamps
    end
  end
end
