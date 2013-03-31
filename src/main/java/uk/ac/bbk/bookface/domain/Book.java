package uk.ac.bbk.bookface.domain;

import javax.persistence.Column;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

/**
 * The Book domain entity. This represents a manuscript which has been authored.
 * The book has a title and it also has the name of the author.
 * @author Developers Bernard Baker & Luis Da Silva
 */
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
    @Size(min = 2, max = 255)
    private String author;
    
}
