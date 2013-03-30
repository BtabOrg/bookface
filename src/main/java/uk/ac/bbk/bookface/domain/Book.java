package uk.ac.bbk.bookface.domain;

import javax.persistence.Column;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(table = "book")
public class Book {

    @NotNull
    @Column(name = "title")
    @Size(min = 2, max = 255)
    private String title;

    @NotNull
    @Column(name = "author")
    private Integer author;
    
}
