CREATE TABLE public.batch
(
  id        SERIAL                                              NOT NULL,
  edition   CHARACTER VARYING(255) COLLATE pg_catalog."default" NOT NULL,
  is_active BOOLEAN                                             NOT NULL,
  CONSTRAINT batch_pkey PRIMARY KEY (id),
  CONSTRAINT uk_rf7lm9yiteal0u3bm8bnk8i23 UNIQUE (edition)
);

CREATE TABLE public.event_category
(
  id           SERIAL                                              NOT NULL,
  category     CHARACTER VARYING(255) COLLATE pg_catalog."default" NOT NULL,
  color        CHARACTER VARYING(255) COLLATE pg_catalog."default" NOT NULL,
  sub_category CHARACTER VARYING(255) COLLATE pg_catalog."default" NOT NULL,
  CONSTRAINT event_category_pkey PRIMARY KEY (id)
);

CREATE TABLE public.office
(
  id           SERIAL                                              NOT NULL,
  location     CHARACTER VARYING(255) COLLATE pg_catalog."default" NOT NULL,
  name         CHARACTER VARYING(255) COLLATE pg_catalog."default" NOT NULL,
  office_code  CHARACTER VARYING(255) COLLATE pg_catalog."default" NOT NULL,
  phone_number CHARACTER VARYING(255) COLLATE pg_catalog."default" NOT NULL,
  CONSTRAINT office_pkey PRIMARY KEY (id),
  CONSTRAINT uk_awe1v1y6jxu7vcqmbc8xtvxyk UNIQUE (office_code)
);

CREATE TABLE public.sec_role
(
  id        SERIAL                                              NOT NULL,
  version   BIGINT                                              NOT NULL,
  authority CHARACTER VARYING(255) COLLATE pg_catalog."default" NOT NULL,
  CONSTRAINT sec_role_pkey PRIMARY KEY (id),
  CONSTRAINT uk_oah023x2ltqw09mdue7w0mcxb UNIQUE (authority)
);

CREATE TABLE public.sec_user
(
  id                  SERIAL                                              NOT NULL,
  version             BIGINT                                              NOT NULL,
  account_expired     BOOLEAN                                             NOT NULL,
  account_locked      BOOLEAN                                             NOT NULL,
  description         CHARACTER VARYING(255) COLLATE pg_catalog."default",
  email               CHARACTER VARYING(255) COLLATE pg_catalog."default" NOT NULL,
  enabled             BOOLEAN                                             NOT NULL,
  first_name          CHARACTER VARYING(255) COLLATE pg_catalog."default",
  gender              CHARACTER VARYING(255) COLLATE pg_catalog."default",
  github              CHARACTER VARYING(255) COLLATE pg_catalog."default",
  last_name           CHARACTER VARYING(255) COLLATE pg_catalog."default",
  linkedin            CHARACTER VARYING(255) COLLATE pg_catalog."default",
  name                CHARACTER VARYING(255) COLLATE pg_catalog."default",
  password            CHARACTER VARYING(255) COLLATE pg_catalog."default" NOT NULL,
  password_expired    BOOLEAN                                             NOT NULL,
  profile_picture_url CHARACTER VARYING(255) COLLATE pg_catalog."default",
  twitter             CHARACTER VARYING(255) COLLATE pg_catalog."default",
  username            CHARACTER VARYING(255) COLLATE pg_catalog."default" NOT NULL,
  class               CHARACTER VARYING(255) COLLATE pg_catalog."default" NOT NULL,
  age                 INTEGER,
  current_company     CHARACTER VARYING(255) COLLATE pg_catalog."default",
  school              CHARACTER VARYING(255) COLLATE pg_catalog."default",
  CONSTRAINT sec_user_pkey PRIMARY KEY (id),
  CONSTRAINT uk_5ctbdrlf3eismye20vsdtk8w8 UNIQUE (username)
);

CREATE TABLE public.sec_user_sec_role
(
  id          SERIAL NOT NULL,
  sec_role_id BIGINT NOT NULL,
  sec_user_id BIGINT NOT NULL,
  CONSTRAINT sec_user_sec_role_pkey PRIMARY KEY (id),
  CONSTRAINT uke1f8d621f0d859d242eab8d821ba UNIQUE (sec_role_id, sec_user_id),
  CONSTRAINT fk81r3vb2e9li23kwl9ykbo2l05 FOREIGN KEY (sec_user_id)
  REFERENCES public.sec_user (id) MATCH SIMPLE
  ON UPDATE NO ACTION
  ON DELETE NO ACTION,
  CONSTRAINT fkf4m8563aw7lu33q9g25hf1kaf FOREIGN KEY (sec_role_id)
  REFERENCES public.sec_role (id) MATCH SIMPLE
  ON UPDATE NO ACTION
  ON DELETE NO ACTION
);

CREATE TABLE public.oauthid
(
  id           SERIAL                                              NOT NULL,
  version      BIGINT                                              NOT NULL,
  access_token CHARACTER VARYING(255) COLLATE pg_catalog."default" NOT NULL,
  provider     CHARACTER VARYING(255) COLLATE pg_catalog."default" NOT NULL,
  user_id      BIGINT                                              NOT NULL,
  CONSTRAINT oauthid_pkey PRIMARY KEY (id),
  CONSTRAINT uk_2hy0on28oron3v471plrnu1k0 UNIQUE (access_token),
  CONSTRAINT fkrng3gs34hmjimsgf8k7marwtf FOREIGN KEY (user_id)
  REFERENCES public.sec_user (id) MATCH SIMPLE
  ON UPDATE NO ACTION
  ON DELETE NO ACTION
);

CREATE INDEX identity_idx
ON public.oauthid USING BTREE
(access_token COLLATE pg_catalog."default", provider COLLATE pg_catalog."default")
TABLESPACE pg_default;

CREATE TABLE public.event
(
  id                SERIAL                                              NOT NULL,
  batch_id          BIGINT                                              NOT NULL,
  date              BYTEA                                               NOT NULL,
  description       CHARACTER VARYING(255) COLLATE pg_catalog."default" NOT NULL,
  event_category_id BIGINT                                              NOT NULL,
  instructor_id     BIGINT                                              NOT NULL,
  office_id         BIGINT                                              NOT NULL,
  "time"            BYTEA                                               NOT NULL,
  type              CHARACTER VARYING(255) COLLATE pg_catalog."default" NOT NULL,
  CONSTRAINT event_pkey PRIMARY KEY (id),
  CONSTRAINT fk2r1ga9jmnogse7kwpeji20xho FOREIGN KEY (office_id)
  REFERENCES public.office (id) MATCH SIMPLE
  ON UPDATE NO ACTION
  ON DELETE NO ACTION,
  CONSTRAINT fkhycph8qb9rq1a7w5o268o2rww FOREIGN KEY (instructor_id)
  REFERENCES public.sec_user (id) MATCH SIMPLE
  ON UPDATE NO ACTION
  ON DELETE NO ACTION,
  CONSTRAINT fknk9w760hnelms32e9oqecw6ru FOREIGN KEY (event_category_id)
  REFERENCES public.event_category (id) MATCH SIMPLE
  ON UPDATE NO ACTION
  ON DELETE NO ACTION,
  CONSTRAINT fksakf6g2qavtthosikie37k7ec FOREIGN KEY (batch_id)
  REFERENCES public.batch (id) MATCH SIMPLE
  ON UPDATE NO ACTION
  ON DELETE NO ACTION
);


CREATE TABLE public.enrollment
(
  id          SERIAL  NOT NULL,
  attendance  BOOLEAN NOT NULL,
  attendee_id BIGINT  NOT NULL,
  event_id    BIGINT  NOT NULL,
  CONSTRAINT enrollment_pkey PRIMARY KEY (id),
  CONSTRAINT uk851d1dabdaa968c1e67cc2450686 UNIQUE (attendee_id, event_id),
  CONSTRAINT fk5gyr5uqj0o1q1evs7ju51n4t0 FOREIGN KEY (attendee_id)
  REFERENCES public.sec_user (id) MATCH SIMPLE
  ON UPDATE NO ACTION
  ON DELETE NO ACTION,
  CONSTRAINT fklo10g4urj8p2je5m2aixypfr4 FOREIGN KEY (event_id)
  REFERENCES public.event (id) MATCH SIMPLE
  ON UPDATE NO ACTION
  ON DELETE NO ACTION
);

CREATE TABLE public.resource
(
  id          SERIAL                                              NOT NULL,
  description CHARACTER VARYING(255) COLLATE pg_catalog."default" NOT NULL,
  event_id    BIGINT                                              NOT NULL,
  name        CHARACTER VARYING(255) COLLATE pg_catalog."default" NOT NULL,
  url         CHARACTER VARYING(255) COLLATE pg_catalog."default" NOT NULL,
  CONSTRAINT resource_pkey PRIMARY KEY (id),
  CONSTRAINT fkkrch4vbigbwk0exnmqnq6jgpj FOREIGN KEY (event_id)
  REFERENCES public.event (id) MATCH SIMPLE
  ON UPDATE NO ACTION
  ON DELETE NO ACTION
);

CREATE SEQUENCE public.hibernate_sequence
    INCREMENT 1
    START 65
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;



INSERT INTO batch (id, edition, is_active) VALUES (26, '2017 / 1', true);

INSERT INTO sec_user (id, version, account_expired, account_locked, description, email, enabled, first_name, gender, github, last_name, linkedin, name, password, password_expired, profile_picture_url, twitter, username, class, age, current_company, school) VALUES (50, 0, false, false, NULL, 'igomez@nearsoft.com', true, 'Israel', 'male', NULL, 'Gómez', NULL, 'Israel Gómez', '$2a$10$f4Qqx117x9YPHtly5OIaa.X6fMZPyqe9vu1Zh67UeQH5sB0Lw178a', false, 'https://lh5.googleusercontent.com/-2cRyoN5Rgmo/AAAAAAAAAAI/AAAAAAAAAB0/jWKxVQPl5F8/photo.jpg', NULL, 'igomez@nearsoft.com', 'vincool.Instructor', NULL, NULL, NULL);
INSERT INTO sec_user (id, version, account_expired, account_locked, description, email, enabled, first_name, gender, github, last_name, linkedin, name, password, password_expired, profile_picture_url, twitter, username, class, age, current_company, school) VALUES (53, 0, false, false, NULL, 'imarban22@gmail.com', true, 'Israel', 'male', NULL, 'Gómez Marbán', NULL, 'Israel Gómez Marbán', '$2a$10$4.UjBQdgiqhU4FvzQ5yrzu/5I/8kybQCcWv3UWAGVq1zGzI/IvqjK', false, 'https://lh6.googleusercontent.com/-VxhvbxLpfwY/AAAAAAAAAAI/AAAAAAAAKEA/RXs0l8ACBI8/photo.jpg', NULL, 'imarban22@gmail.com', 'vincool.Attendee', NULL, NULL, NULL);
INSERT INTO sec_user (id, version, account_expired, account_locked, description, email, enabled, first_name, gender, github, last_name, linkedin, name, password, password_expired, profile_picture_url, twitter, username, class, age, current_company, school) VALUES (10, 1, false, false, 'Hola mundo', 'laguilar@nearsoft.com', true, 'Luis Enrique', NULL, NULL, 'Aguilar', NULL, 'Luis Enrique Aguilar', '$2a$10$15fjonFvp3mpEECmrDqu.u8WJl.5u93mw6VGtFqm7lDRooKaxKE8C', false, 'https://lh6.googleusercontent.com/-OYmbrmfqK1Q/AAAAAAAAAAI/AAAAAAAAACY/FmHEhCpZp5E/photo.jpg', NULL, 'laguilar@nearsoft.com', 'vincool.Instructor', NULL, NULL, NULL);
INSERT INTO sec_user (id, version, account_expired, account_locked, description, email, enabled, first_name, gender, github, last_name, linkedin, name, password, password_expired, profile_picture_url, twitter, username, class, age, current_company, school) VALUES (56, 1, false, false, NULL, 'angelpmza@gmail.com', true, 'angel', 'male', NULL, 'pimentel meza', NULL, 'angel pimentel meza', '$2a$10$Zm4X6Q444g2Gmo/FWC5g4OLdb6BP.qxfIy6AIo6wr4OxGyIIkM8C2', false, 'https://lh4.googleusercontent.com/-ZjwpChxDwwQ/AAAAAAAAAAI/AAAAAAAAAJY/Yme4pUu_uTc/photo.jpg', 'Click to add your twitter profile', 'angelpmza@gmail.com', 'vincool.Attendee', NULL, NULL, NULL);
INSERT INTO sec_user (id, version, account_expired, account_locked, description, email, enabled, first_name, gender, github, last_name, linkedin, name, password, password_expired, profile_picture_url, twitter, username, class, age, current_company, school) VALUES (6, 3, false, false, 'Fullstack JVM developer. I do not carry much information in my mind since it is readily available in google.', 'apimentel@nearsoft.com', true, 'Angel', NULL, 'blzb', 'Pimentel', 'angelpimentel', 'Angel Pimentel', '$2a$10$a3xTWV65sUMZ5ggUnjnP3.upX.Kq2vXbkXdoqcJwz.zsG4b/CgL5i', false, 'http://res.cloudinary.com/vincoolns/image/upload/v1486668806/dreff8my1gudwmpl8gu8.jpg', 'blzb', 'apimentel@nearsoft.com', 'vincool.Instructor', NULL, NULL, NULL);
INSERT INTO sec_user (id, version, account_expired, account_locked, description, email, enabled, first_name, gender, github, last_name, linkedin, name, password, password_expired, profile_picture_url, twitter, username, class, age, current_company, school) VALUES (60, 0, false, false, NULL, 'lalducin@nearsoft.com', true, 'Luis', NULL, NULL, 'Alducin', NULL, 'Luis Alducin', '$2a$10$Q9WeiWzExqwnCS8DEJA12O6sDEYg4o1cOUh7eHJ/9CrSa7YHISqkq', false, 'https://lh4.googleusercontent.com/-Vj0lSnvm4ws/AAAAAAAAAAI/AAAAAAAAAAo/PsxS6DxjARU/photo.jpg', NULL, 'lalducin@nearsoft.com', 'vincool.Instructor', NULL, NULL, NULL);
INSERT INTO sec_user (id, version, account_expired, account_locked, description, email, enabled, first_name, gender, github, last_name, linkedin, name, password, password_expired, profile_picture_url, twitter, username, class, age, current_company, school) VALUES (63, 0, false, false, NULL, 'ldanielalducin@gmail.com', true, 'Luis', NULL, NULL, 'Daniel', NULL, 'Luis Daniel', '$2a$10$hfNOWiXRcQgKKXcSvS51U.aZLH7iAGb6EVw2wR6fLohgcShkm45ey', false, 'https://lh4.googleusercontent.com/-YX-kmH-N_Is/AAAAAAAAAAI/AAAAAAAAF-k/XKTpKoGdFGk/photo.jpg', NULL, 'ldanielalducin@gmail.com', 'vincool.Attendee', NULL, NULL, NULL);

INSERT INTO sec_role (id, version, authority) VALUES (1, 0, 'ROLE_STUDENT');
INSERT INTO sec_role (id, version, authority) VALUES (2, 0, 'ROLE_INSTRUCTOR');
INSERT INTO sec_role (id, version, authority) VALUES (3, 0, 'ROLE_ADMIN');

INSERT INTO sec_user_sec_role (id, sec_role_id, sec_user_id) VALUES (52, 2, 50);
INSERT INTO sec_user_sec_role (id, sec_role_id, sec_user_id) VALUES (8, 2, 6);
INSERT INTO sec_user_sec_role (id, sec_role_id, sec_user_id) VALUES (9, 3, 6);
INSERT INTO sec_user_sec_role (id, sec_role_id, sec_user_id) VALUES (12, 2, 10);
INSERT INTO sec_user_sec_role (id, sec_role_id, sec_user_id) VALUES (13, 3, 10);
INSERT INTO sec_user_sec_role (id, sec_role_id, sec_user_id) VALUES (55, 1, 53);
INSERT INTO sec_user_sec_role (id, sec_role_id, sec_user_id) VALUES (58, 1, 56);
INSERT INTO sec_user_sec_role (id, sec_role_id, sec_user_id) VALUES (65, 1, 63);
INSERT INTO sec_user_sec_role (id, sec_role_id, sec_user_id) VALUES (62, 2, 60);

INSERT INTO event_category (id, category, color, sub_category) VALUES (15, 'APPRENTICE', '#e54800', 'Introduccion a los lenguajes (Python, Java y JS)');
INSERT INTO event_category (id, category, color, sub_category) VALUES (17, 'APPRENTICE', '#e54800', 'Notacion Big O y Estructuras de Datos II');
INSERT INTO event_category (id, category, color, sub_category) VALUES (16, 'APPRENTICE', '#e54800', 'Notacion Big O y Estructuras de Datos I');
INSERT INTO event_category (id, category, color, sub_category) VALUES (18, 'APPRENTICE', '#e54800', 'Notacion Big O y Estructuras de Datos III');
INSERT INTO event_category (id, category, color, sub_category) VALUES (19, 'APPRENTICE', '#e54800', 'Algoritmos Comunes');
INSERT INTO event_category (id, category, color, sub_category) VALUES (20, 'APPRENTICE', '#e54800', 'Programacion Orientada a Objetos');
INSERT INTO event_category (id, category, color, sub_category) VALUES (21, 'APPRENTICE', '#e54800', 'Patrones de Diseño');
INSERT INTO event_category (id, category, color, sub_category) VALUES (22, 'APPRENTICE', '#e54800', 'Principios S.O.L.I.D.');
INSERT INTO event_category (id, category, color, sub_category) VALUES (23, 'APPRENTICE', '#e54800', 'Pruebas Unitarias');
INSERT INTO event_category (id, category, color, sub_category) VALUES (24, 'APPRENTICE', '#e54800', 'Bases de Datos');
INSERT INTO event_category (id, category, color, sub_category) VALUES (25, 'APPRENTICE', '#e54800', 'Metodologias de Desarrollo de software');
INSERT INTO event_category (id, category, color, sub_category) VALUES (14, 'APPRENTICE', '#e54800', 'Codigo Limpio y Git');

SELECT pg_catalog.setval('hibernate_sequence', 66, true);


INSERT INTO oauthid (id, version, access_token, provider, user_id) VALUES (7, 0, 'apimentel@nearsoft.com', 'google', 6);
INSERT INTO oauthid (id, version, access_token, provider, user_id) VALUES (11, 0, 'laguilar@nearsoft.com', 'google', 10);
INSERT INTO oauthid (id, version, access_token, provider, user_id) VALUES (51, 0, 'igomez@nearsoft.com', 'google', 50);
INSERT INTO oauthid (id, version, access_token, provider, user_id) VALUES (54, 0, 'imarban22@gmail.com', 'google', 53);
INSERT INTO oauthid (id, version, access_token, provider, user_id) VALUES (57, 0, 'angelpmza@gmail.com', 'google', 56);
INSERT INTO oauthid (id, version, access_token, provider, user_id) VALUES (61, 0, 'lalducin@nearsoft.com', 'google', 60);
INSERT INTO oauthid (id, version, access_token, provider, user_id) VALUES (64, 0, 'ldanielalducin@gmail.com', 'google', 63);

INSERT INTO office (id, location, name, office_code, phone_number) VALUES (27, 'San Luis Potosí 196 int. 401 Col. Roma Norte Del. Cuauhtémoc Mexico, D.F. 06700', 'Ciudad de Mexico', 'CDMX', '+52 (55) 6388-6650');

INSERT INTO enrollment (id, attendance, attendee_id, event_id) VALUES (59, false, 56, 28);
