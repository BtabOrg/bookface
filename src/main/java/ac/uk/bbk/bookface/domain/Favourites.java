package ac.uk.bbk.bookface.domain;

import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Favourites {

    @NotNull
    private Number identifier;

    @NotNull
    @ManyToOne
    private Person person;

    @NotNull
    @ManyToOne
    private Book book;
}
