package uk.ac.bbk.bookface.domain;

import javax.persistence.ManyToOne;
import java.lang.Number;
import javax.validation.constraints.NotNull;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class BookFaceUser {

    @NotNull
    private Number identifier;
    
    @ManyToOne
    private Person person;
}
