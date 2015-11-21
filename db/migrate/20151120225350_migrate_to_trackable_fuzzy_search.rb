class MigrateToTrackableFuzzySearch < ActiveRecord::Migration
  def self.up
    ActiveRecord::Base.connection.execute <<-SQL
    DROP VIEW IF EXISTS searches;
    CREATE VIEW searches AS
      SELECT  patients.id AS searchable_id, patients.name AS term, patients.hospital_id AS hospital_id,
              CAST('PatientName' AS varchar) AS searchable_type
      FROM patients
      UNION
      SELECT  patients.id AS searchable_id, patients.mrn AS term, patients.hospital_id AS hospital_id,
              CAST('PatientMrn' AS varchar) AS searchable_type
      FROM patients
    SQL
    execute %q{CREATE INDEX index_patients_on_name ON patients USING gin(to_tsvector('english', name))}
    execute %q{CREATE INDEX index_patients_on_mrn ON patients USING gin(to_tsvector('english', mrn))}
  end

  def self.down
  end
end
