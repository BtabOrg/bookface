package uk.ac.bbk.bookface.domain;

import javax.persistence.Column;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(table = "favourites")
public class Favourites {

    @NotNull
    @Column(name = "person")
    @Size(min = 2, max = 255)
    private String person;

    @NotNull
    @Column(name = "book")
    @Size(min = 2, max = 255)
    private String book;
}
