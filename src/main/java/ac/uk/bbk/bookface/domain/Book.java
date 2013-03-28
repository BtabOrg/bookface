package ac.uk.bbk.bookface.domain;

import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Book {

    @NotNull
    private Number identifier;

    @NotNull
    @ManyToOne
    private Author author;

    @NotNull
    @Size(min = 2, max = 255)
    private String title;
}
