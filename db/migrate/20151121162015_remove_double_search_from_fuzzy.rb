class RemoveDoubleSearchFromFuzzy < ActiveRecord::Migration
  def self.up
    ActiveRecord::Base.connection.execute <<-SQL
    DROP VIEW searches;
    CREATE VIEW searches AS
      SELECT  patients.id AS searchable_id, patients.name AS term, patients.name AS patient_name,
        patients.mrn AS patient_mrn, patients.hospital_id AS hospital_id FROM patients
    SQL
  end

  def self.down
    DROP VIEW searches;
    execute %q{DELETE INDEX index_patients_on_name ON patients USING gin(to_tsvector('english', name))}
    execute %q{DELETE INDEX index_patients_on_mrn ON patients USING gin(to_tsvector('english', mrn))}
  end
end