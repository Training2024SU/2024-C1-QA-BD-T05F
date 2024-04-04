package com.davidbonelo;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "Almacenistas")
public class Almacenista {
    @Id
    Integer id;

    @Column(name = "nombre")
    String nombre;

}