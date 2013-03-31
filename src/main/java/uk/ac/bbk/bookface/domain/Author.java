package uk.ac.bbk.bookface.domain;

import javax.persistence.Column;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

/**
 * The Author domain entity. This represents a person
 * who has authored a book within the application domain.
 * The author has a name.
 * @author Developers Bernard Baker & Luis Da Silva
 */
@RooJavaBean
@RooToString
@RooJpaActiveRecord(table = "author")
public class Author {
	
    @NotNull
    @Column(name = "name")
    @Size(min = 2, max = 255)
    private String name;
}
