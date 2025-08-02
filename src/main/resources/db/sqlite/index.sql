
CREATE INDEX idx_g     ON g   (group_id);
CREATE INDEX idx_ga    ON ga  (group_id, artifact_id);
CREATE INDEX idx_gav   ON gav (group_id, artifact_id, artifact_version);
CREATE INDEX idx_fname ON gav (file_name);
