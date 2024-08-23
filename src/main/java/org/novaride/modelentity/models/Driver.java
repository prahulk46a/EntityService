package org.novaride.modelentity.models;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.OneToMany;
import lombok.*;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import java.util.List;

@Entity
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor

public class Driver extends BaseModel{
    private String Name;

    @Column(nullable = false, unique = true)
    private String licenseNumber;

    //As soon as  removed this nullable property but mentioned in flyway causes exception that flyway has some property licensenumber inside schema
    //but your entity don't have that as of now. if you want to remove that you must do versioning of flyway first then only will run.


    private String address;
    //But for nullable=true type it will not throw error as it will be there in table but value will be null

    //One driver has many booking
    @OneToMany(mappedBy = "driver",fetch = FetchType.LAZY)
    @Fetch(FetchMode.SUBSELECT)
    private List<Booking> bookings;  //There can be case when we need to map one entity with multiple entities and there might be any other similar mapped with same entity
                                                         // ex. passenger and driver both mapped with booking so to avoid which mapping we are refering we use mapped annotation



}
