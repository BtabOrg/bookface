package uk.ac.bbk.bookface.domain;

import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Comments {

    @ManyToMany(cascade = CascadeType.ALL)
    private Set<BookFaceUser> bookFaceUser = new HashSet<BookFaceUser>();

    @ManyToOne
    private Book book;

    @NotNull
    @Size(min = 2)
    private String description;
}
