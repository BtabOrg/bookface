package uk.ac.bbk.bookface.domain;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Person {

    @NotNull
    private Number identifier;
    
    @NotNull
    @Size(min = 2, max = 255)
    private String screenName;

    @NotNull
    @Size(min = 6, max = 255)
    private String emailAddress;

    @NotNull
    @Size(min = 4, max = 255)
    private String password;
}
