package uk.ac.bbk.bookface.domain;

import javax.persistence.Column;
import javax.validation.constraints.NotNull;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Favourites {

    @NotNull
    @Column(name = "person")
    private Integer person;

    @NotNull
    @Column(name = "book")
    private Integer book;
}
