CREATE TABLE IF NOT EXISTS visitors (
  visitor_hash TEXT PRIMARY KEY,
  first_seen TEXT NOT NULL DEFAULT (datetime('now'))
);
CREATE TABLE IF NOT EXISTS site_stats (
  id INTEGER PRIMARY KEY CHECK (id = 1),
  unique_visitors INTEGER NOT NULL DEFAULT 0,
  total_views INTEGER NOT NULL DEFAULT 0
);
INSERT OR IGNORE INTO site_stats (id, unique_visitors, total_views) VALUES (1, 0, 0);
