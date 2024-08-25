ALTER TABLE nova_local_db.passenger
    ADD active_booking_id BIGINT NULL;

ALTER TABLE nova_local_db.passenger
    ADD home_id BIGINT NULL;

ALTER TABLE nova_local_db.passenger
    ADD last_known_location_id BIGINT NULL;

ALTER TABLE nova_local_db.passenger
    ADD rating DOUBLE NULL;

ALTER TABLE nova_local_db.booking
    ADD end_time datetime NULL;

ALTER TABLE nova_local_db.booking
    ADD start_time datetime NULL;

ALTER TABLE nova_local_db.driver
    ADD is_available BIT(1) NULL;


ALTER TABLE nova_local_db.passenger
    ADD CONSTRAINT FK_PASSENGER_ON_ACTIVEBOOKING FOREIGN KEY (active_booking_id) REFERENCES nova_local_db.booking (id);

ALTER TABLE nova_local_db.passenger
    ADD CONSTRAINT FK_PASSENGER_ON_HOME FOREIGN KEY (home_id) REFERENCES nova_local_db.exact_location (id);

ALTER TABLE nova_local_db.passenger
    ADD CONSTRAINT FK_PASSENGER_ON_LASTKNOWNLOCATION FOREIGN KEY (last_known_location_id) REFERENCES nova_local_db.exact_location (id);