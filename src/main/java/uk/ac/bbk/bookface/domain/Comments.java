package uk.ac.bbk.bookface.domain;

import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Comments {

    @NotNull
    @Column(name = "description")
    @Size(min = 2)
    private String description;

    @NotNull
    @OneToOne
    @JoinColumn(name = "id", referencedColumnName = "title")
    private Book book;

    @NotNull
    @Value("0")
    @Column(name = "person")
    private Integer person;
}
