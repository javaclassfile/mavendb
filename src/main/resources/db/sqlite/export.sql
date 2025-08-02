

SELECT
  group_id,
  artifact_version_counter,
  major_version_counter,
  version_seq_max,
  last_modified_max
INTO OUTFILE '/var/lib/mysql-files/g.csv'
FIELDS TERMINATED BY ',' ESCAPED BY '"' ENCLOSED BY '"'
FROM mavendb.g;


SELECT
  group_id,
  artifact_id,
  artifact_version_counter,
  major_version_counter,
  version_seq_max,
  last_modified_max
INTO OUTFILE '/var/lib/mysql-files/ga.csv'
FIELDS TERMINATED BY ',' ESCAPED BY '"' ENCLOSED BY '"'
FROM mavendb.ga;


SELECT
  group_id,
  artifact_id,
  artifact_version,
  file_name,
  major_version,
  version_seq,
  last_modified,
  size,
  IFNULL(sha1, '') AS sha1,
  signature_exists,
  sources_exists,
  javadoc_exists,
  IFNULL(classifier, '') AS classifier,
  classifier_length,
  IFNULL(file_extension, '') AS file_extension,
  IFNULL(packaging, '') AS packaging,
  IF(ISNULL(name),
    artifact_id,
    REPLACE(name, CHAR(10), ' ')
  ) AS name
INTO OUTFILE '/var/lib/mysql-files/gav.csv'
FIELDS TERMINATED BY ',' ESCAPED BY '"' ENCLOSED BY '"'
FROM mavendb.gav;
