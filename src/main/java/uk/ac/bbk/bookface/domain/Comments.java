package uk.ac.bbk.bookface.domain;

import javax.persistence.Column;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

/**
 * The Comments domain entity. This represents a comment made on a book.
 * The comment has a description which is the opinion of the person who 
 * made the comment. The name of a person who left the comment. And the
 * title of the book which the comment refers to.
 * @author Developers Bernard Baker & Luis Da Silva
 */
@RooJavaBean
@RooToString
@RooJpaActiveRecord(table = "comments")
public class Comments {

    @NotNull
    @Column(name = "description")
    @Size(min = 2)
    private String description;

    @NotNull
    @Column(name = "person")
    @Size(min = 2, max = 255)
    private String person;

    @NotNull
    @Column(name = "book")
    @Size(min = 2, max = 255)
    private String book;
}
