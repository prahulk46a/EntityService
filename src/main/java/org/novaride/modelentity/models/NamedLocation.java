package org.novaride.modelentity.models;

import jakarta.persistence.Entity;
import jakarta.persistence.OneToOne;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
//This could particular named location like swargate or anything
public class NamedLocation extends BaseModel {
    @OneToOne
    private ExactLocation exactLocation;

    private String name;

    private String zipCode;

    private String city;

    private String state;

    private String country;
}
