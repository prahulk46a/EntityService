package org.novaride.modelentity.models;

import jakarta.persistence.Column;
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
public class DbConstants extends BaseModel{
    @Column(unique = true, nullable = false)
    private String name;
    private String value;
}
