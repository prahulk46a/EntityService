package org.novaride.modelentity.models;

import jakarta.persistence.Entity;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
//This is needed inorder to get to know exact location
public class ExactLocation extends BaseModel{
    private Double latitude;
    private Double longitude;
}
