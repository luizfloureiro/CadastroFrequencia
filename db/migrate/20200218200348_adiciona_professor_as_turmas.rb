class AdicionaProfessorAsTurmas < ActiveRecord::Migration[6.0]
  def change
    add_reference :turmas, :user, foreign_key: true
  end
end
