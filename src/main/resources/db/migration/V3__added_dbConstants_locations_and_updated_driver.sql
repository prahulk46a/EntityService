CREATE TABLE nova_local_db.db_constants
(
    id         BIGINT AUTO_INCREMENT NOT NULL,
    created_at datetime              NOT NULL,
    updated_at datetime              NOT NULL,
    name       VARCHAR(255)          NOT NULL,
    value      VARCHAR(255)          NULL,
    CONSTRAINT pk_dbconstants PRIMARY KEY (id)
);

CREATE TABLE nova_local_db.exact_location
(
    id         BIGINT AUTO_INCREMENT NOT NULL,
    created_at datetime              NOT NULL,
    updated_at datetime              NOT NULL,
    latitude   DOUBLE                NULL,
    longitude  DOUBLE                NULL,
    CONSTRAINT pk_exactlocation PRIMARY KEY (id)
);

CREATE TABLE nova_local_db.named_location
(
    id                BIGINT AUTO_INCREMENT NOT NULL,
    created_at        datetime              NOT NULL,
    updated_at        datetime              NOT NULL,
    exact_location_id BIGINT                NULL,
    name              VARCHAR(255)          NULL,
    zip_code          VARCHAR(255)          NULL,
    city              VARCHAR(255)          NULL,
    state             VARCHAR(255)          NULL,
    country           VARCHAR(255)          NULL,
    CONSTRAINT pk_namedlocation PRIMARY KEY (id)
);

CREATE TABLE nova_local_db.otp
(
    id             BIGINT AUTO_INCREMENT NOT NULL,
    created_at     datetime              NOT NULL,
    updated_at     datetime              NOT NULL,
    code           VARCHAR(255)          NULL,
    sent_to_number VARCHAR(255)          NULL,
    CONSTRAINT pk_otp PRIMARY KEY (id)
);



ALTER TABLE nova_local_db.driver
    ADD active_city VARCHAR(255) NULL;

ALTER TABLE nova_local_db.driver
    ADD driver_approval_status ENUM('APPROVED','DENIED','PENDING');

ALTER TABLE nova_local_db.driver
    ADD home_id BIGINT NULL;



ALTER TABLE nova_local_db.driver
    ADD last_known_location_id BIGINT NULL;

ALTER TABLE nova_local_db.driver
    ADD rating DOUBLE NULL;

ALTER TABLE nova_local_db.booking
    ADD end_location_id BIGINT NULL;

ALTER TABLE nova_local_db.booking
    ADD start_location_id BIGINT NULL;





ALTER TABLE nova_local_db.db_constants
    ADD CONSTRAINT uc_dbconstants_name UNIQUE (name);

ALTER TABLE nova_local_db.booking
    ADD CONSTRAINT FK_BOOKING_ON_ENDLOCATION FOREIGN KEY (end_location_id) REFERENCES nova_local_db.exact_location (id);

ALTER TABLE nova_local_db.booking
    ADD CONSTRAINT FK_BOOKING_ON_STARTLOCATION FOREIGN KEY (start_location_id) REFERENCES nova_local_db.exact_location (id);


ALTER TABLE nova_local_db.driver
    ADD CONSTRAINT FK_DRIVER_ON_HOME FOREIGN KEY (home_id) REFERENCES nova_local_db.exact_location (id);

ALTER TABLE nova_local_db.driver
    ADD CONSTRAINT FK_DRIVER_ON_LASTKNOWNLOCATION FOREIGN KEY (last_known_location_id) REFERENCES nova_local_db.exact_location (id);

ALTER TABLE nova_local_db.named_location
    ADD CONSTRAINT FK_NAMEDLOCATION_ON_EXACTLOCATION FOREIGN KEY (exact_location_id) REFERENCES nova_local_db.exact_location (id);



#db level check for ratings should be in range 1 to 5
ALTER table nova_local_db.driver
    ADD Constraint check_rating CHECK ( driver.rating>=0 AND driver.rating<=5);

