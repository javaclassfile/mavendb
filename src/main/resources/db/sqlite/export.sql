

SELECT
  "group_id",
  "artifact_version_counter",
  "major_version_counter",
  "version_seq_max",
  "last_modified_max"
FROM "g"
INTO OUTFILE 'g.csv'
FIELDS ESCAPED BY '"'
FIELDS ENCLOSED BY '"'
;

