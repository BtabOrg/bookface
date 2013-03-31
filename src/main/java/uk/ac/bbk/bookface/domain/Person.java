package uk.ac.bbk.bookface.domain;

import javax.persistence.Column;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

/**
 * The Person domain entity. This represents a person within the
 * Bookface_V1.0 web application.
 * The person has a screen name and an email address which they use to
 * log into the Bookface_V1.0 web application.
 * @author Developers Bernard Baker & Luis Da Silva
 */
@RooJavaBean
@RooToString
@RooJpaActiveRecord(table = "person")
public class Person {

	@NotNull
    @Column(name = "screen_name")
    @Size(min = 2, max = 255)
    private String screenName;

    @NotNull
    @Column(name = "email_address")
    @Size(min = 6, max = 255)
    private String emailAddress;
}
