class GetHospitalIdFromFuzzySearch < ActiveRecord::Migration
  def self.up
    ActiveRecord::Base.connection.execute <<-SQL
    DROP VIEW searches;
    CREATE VIEW searches AS
      SELECT  locations.id AS searchable_id, locations.name AS term, locations.hospital_id AS hospital_id,
              CAST ('Location' AS varchar) AS searchable_type
      FROM locations
      UNION
      SELECT  brands.id AS searchable_id, brands.name AS term, pills.hospital_id AS hospital_id,
              CAST ('Brand' AS varchar) AS searchable_type
      FROM brands
      LEFT OUTER JOIN pills ON pills.brand_id = brands.id
      UNION
      SELECT  drugs.id AS searchable_id, drugs.name AS term, pills.hospital_id AS hospital_id,
              CAST ('Drug' AS varchar) AS searchable_type
      FROM drugs
      LEFT OUTER JOIN pills ON pills.drug_id = drugs.id
    SQL
    execute %q{CREATE INDEX index_locations_on_name ON locations USING gin(to_tsvector('english', name))}
    execute %q{CREATE INDEX index_brands_on_name ON brands USING gin(to_tsvector('english', name))}
    execute %q{CREATE INDEX index_drugs_on_name ON drugs USING gin(to_tsvector('english', name))}
  end

  def self.down
    ActiveRecord::Base.connection.execute <<-SQL
      DROP VIEW searches;
      CREATE VIEW searches AS
        SELECT  locations.id AS searchable_id, locations.name AS term,
                CAST ('Location' AS varchar) AS searchable_type
        FROM locations
        UNION
        SELECT  brands.id AS searchable_id, brands.name AS term,
                CAST ('Brand' AS varchar) AS searchable_type
        FROM brands
        UNION
        SELECT  drugs.id AS searchable_id, drugs.name AS term,
                CAST ('Drug' AS varchar) AS searchable_type
        FROM drugs
    SQL
  end
end
