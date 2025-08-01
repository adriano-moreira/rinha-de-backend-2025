CREATE UNLOGGED TABLE payments (
    correlation_id UUID PRIMARY KEY,
    amount        DECIMAL NOT NULL,
    requested_at   TIMESTAMP NOT NULL,
    status        SMALLINT NOT NULL,
    processor     SMALLINT
);

CREATE INDEX payments_requested_at ON payments (requested_at);