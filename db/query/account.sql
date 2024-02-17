-- name: CreateAccount :one
INSERT INTO users (
  owner,
  balance,
  currency
) VALUES (
  $1, $2, $3
)
RETURNING *;

-- name: GetAccount :one
SELECT * FROM users
WHERE id = $1 LIMIT 1;

-- name: ListAccount :many
SELECT * FROM users
ORDER BY id DESC
LIMIT $1
OFFSET $2;

-- name: UpdateAccount :one
UPDATE users
  SET balance = $2
WHERE id = $1
RETURNING *;

-- name: DeleteAccount :exec
DELETE FROM users
WHERE id = $1;