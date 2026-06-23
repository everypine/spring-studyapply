CREATE TABLE IF NOT EXISTS member
(
    id       BIGINT       NOT NULL AUTO_INCREMENT,
    email    VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    PRIMARY KEY (id),
    UNIQUE (email)
);

CREATE TABLE IF NOT EXISTS study
(
    id          BIGINT                        NOT NULL AUTO_INCREMENT,
    owner_id    BIGINT                        NOT NULL,
    title       VARCHAR(255)                  NOT NULL,
    description VARCHAR(255)                  NOT NULL,
    capacity    INT                           NOT NULL CHECK (capacity >= 1),
    status      ENUM ('RECRUITING', 'CLOSED') NOT NULL,
    FOREIGN KEY (owner_id) REFERENCES member (id)
);

CREATE TABLE IF NOT EXISTS application
(
    id       BIGINT                                                NOT NULL AUTO_INCREMENT,
    study_id BIGINT                                                NOT NULL,
    status   ENUM ('WAITING', 'APPROVED', 'REJECTED', 'CANCELLED') NOT NULL
);
