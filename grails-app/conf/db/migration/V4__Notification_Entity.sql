CREATE TABLE notification
(
  id                SERIAL        NOT NULL,
  notification_type INT           NOT NULL,
  seen              BOOLEAN       NULL,
  user_id           BIGINT        NOT NULL,
  message           VARCHAR(2000) NOT NULL,
  CONSTRAINT notification_pkey PRIMARY KEY (id),
  CONSTRAINT notification_user FOREIGN KEY (user_id)
  REFERENCES sec_user (id) MATCH SIMPLE
);