package org.novaride.modelentity.models;

import jakarta.persistence.*;
import lombok.*;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor

@Entity

@Inheritance(strategy = InheritanceType.JOINED)

public class Review extends BaseModel {
    @Column(nullable = false)
    private String content;

    private Double rating;

    @OneToOne(cascade = {CascadeType.PERSIST, CascadeType.REMOVE})
    @JoinColumn(nullable = false)
    //This will ensure that booking foriegn key id is not null at db level.
    //so no reviews will exist before booking has done
    private Booking booking;
    //By adding this we are not able to create review without booking it will show intternal server error in postman


    @Override
    public String toString() {
        return "Review: " + this.content + " " + this.rating + " " + this.createdAt;
    }

}
