package org.novaride.modelentity.models;

import jakarta.persistence.*;
import lombok.*;
import org.springframework.stereotype.Repository;

import java.util.Date;

@Entity
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Repository
public class Booking extends BaseModel{

    //Every booking has review one to one mapping

    //As soon as Added mapping error will be gone as sp boot knows its an entity
    //@OneToOne(cascade = {CascadeType.PERSIST, CascadeType.REMOVE})//Cascade is used to define how is relation between both entities
                                                                  //If booking is deleted from db then casacade type will decidewhat to do with mapped entity
                                                                  //Ex. if ig acc deleted then no need of review or post enttity that will get deleted afterwards using cascade
    //private Review review;  // instead of mapping into booking we do mapping inside review so no booking candidate can have review

    @Enumerated(EnumType.STRING) //This annotation is used to specify that enum is mapped in entity.enum type will decide how enum to store in db bydefault enumtype is num i.e will store according to mapping
    //The most common option to map an enum value to and from its database representation in JPA before 2.1 is to use the @Enumerated annotation.
    private BookingStatus bookingStatus;
    @Temporal(value = TemporalType.TIMESTAMP)
    private Date startTime;

    @Temporal(value = TemporalType.TIMESTAMP)
    private Date endTime;

    private Long totalDistance;

    @ManyToOne(fetch = FetchType.LAZY)
    private Passenger passenger;    //here we have used 2 times many to one relationship.
                                    //Hence to avoid mapping confusion which many to one map with other
                                    //We use mapped by property in other entity

    @ManyToOne(fetch = FetchType.LAZY)
    private Driver driver;

    @OneToOne(cascade = CascadeType.ALL)
    private ExactLocation startLocation;

    @OneToOne(cascade = CascadeType.ALL)
    private ExactLocation endLocation;

}
