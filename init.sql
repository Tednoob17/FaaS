-- init.sql
-- SQLite initialization script for FaaS platform

-- Routes table: key = "METHOD:URI", value = complete function config (JSON)
CREATE TABLE IF NOT EXISTS functions (
  k TEXT PRIMARY KEY,                   -- Key: "METHOD:URI" (e.g., "POST:/resize")
  v TEXT NOT NULL,                      -- Value: Complete JSON config
  updated INTEGER DEFAULT (strftime('%s','now'))  -- UNIX timestamp
);

CREATE INDEX IF NOT EXISTS idx_functions_updated ON functions(updated);

-- ===================================================================
-- Routes with complete function configuration
-- ===================================================================

INSERT OR REPLACE INTO functions (k, v, updated)
VALUES (
  'POST:/resize',
  '{"name":"resizeImage","runtime":"php","module":"examples/resize.php","handler":"main","memory":128,"timeout":10}',
  strftime('%s','now')
);

INSERT OR REPLACE INTO functions (k, v, updated)
VALUES (
  'GET:/ping',
  '{"name":"ping","runtime":"php","module":"examples/ping.php","handler":"main","memory":64,"timeout":5}',
  strftime('%s','now')
);

-- PHP function examples
INSERT OR REPLACE INTO functions (k, v, updated)
VALUES (
  'POST:/api/hello',
  '{"name":"helloPhp","runtime":"php","module":"examples/hello.php","handler":"main","memory":64,"timeout":5}',
  strftime('%s','now')
);

INSERT OR REPLACE INTO functions (k, v, updated)
VALUES (
  'GET:/api/info',
  '{"name":"phpInfo","runtime":"php","module":"examples/info.php","handler":"main","memory":64,"timeout":5}',
  strftime('%s','now')
);

-- Python WASM function
INSERT OR REPLACE INTO functions (k, v, updated)
VALUES (
  'GET:/python',
  '{"name":"app","runtime":"wasm","module":"/opt/functions/app/app.wasm","handler":"main","memory":128,"timeout":10}',
  strftime('%s','now')
);
