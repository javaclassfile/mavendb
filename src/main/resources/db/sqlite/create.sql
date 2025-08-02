
CREATE TABLE "g"(
  "group_id"                  TEXT,
  "artifact_version_counter"  INTEGER, 
  "major_version_counter"     INTEGER, 
  "version_seq_max"           TEXT, 
  "last_modified_max"         TEXT
);

CREATE TABLE "ga"(
  "group_id"                  TEXT, 
  "artifact_id"               TEXT, 
  "artifact_version_counter"  INTEGER, 
  "major_version_counter"     INTEGER,
  "version_seq_max"           TEXT, 
  "last_modified_max"         TEXT
);

CREATE TABLE "gav"(
  "uinfo"                     TEXT, 
  "group_id"                  TEXT, 
  "artifact_id"               TEXT, 
  "artifact_version"          TEXT, 

  "file_name"                 TEXT, 

  "major_version"             INTEGER, 
  "version_seq"               TEXT, 

  "last_modified"             TEXT,
  "size"                      TEXT, 
  "sha1"                      TEXT, 

  "signature_exists"          INTEGER, 
  "sources_exists"            INTEGER, 
  "javadoc_exists"            INTEGER, 

  "classifier"                TEXT, 
  "classifier_length"         INTEGER, 
  "file_extension"            TEXT, 
  "packaging"                 TEXT, 
  "name"                      TEXT, 
  "description"               TEXT 
);
