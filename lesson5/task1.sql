USE my_table;
UPDATE users
  SET created_at = now();
UPDATE users 
  SET updated_at = now();
