CREATE TABLE nova_local_db.car
(
    id           BIGINT AUTO_INCREMENT NOT NULL,
    created_at   datetime              NOT NULL,
    updated_at   datetime              NOT NULL,
    number_plate VARCHAR(255)          NOT NULL,
    color_id     BIGINT                NULL,
    brand        VARCHAR(255)          NULL,
    model        VARCHAR(255)          NULL,
    car_type     ENUM('XL','SUV','COMPACT_SUV','SEDAN','HATCHBACK') NULL,
    driver_id    BIGINT                NULL,
    CONSTRAINT pk_car PRIMARY KEY (id)
);

CREATE TABLE nova_local_db.color
(
    id         BIGINT AUTO_INCREMENT NOT NULL,
    created_at datetime              NOT NULL,
    updated_at datetime              NOT NULL,
    color_name VARCHAR(255)          NOT NULL,
    CONSTRAINT pk_color PRIMARY KEY (id)
);

ALTER TABLE nova_local_db.car
    ADD CONSTRAINT uc_car_numberplate UNIQUE (number_plate);

ALTER TABLE nova_local_db.color
    ADD CONSTRAINT uc_color_colorname UNIQUE (color_name);

ALTER TABLE nova_local_db.car
    ADD CONSTRAINT FK_CAR_ON_COLOR FOREIGN KEY (color_id) REFERENCES nova_local_db.color (id);

ALTER TABLE nova_local_db.car
    ADD CONSTRAINT FK_CAR_ON_DRIVER FOREIGN KEY (driver_id) REFERENCES nova_local_db.driver (id);