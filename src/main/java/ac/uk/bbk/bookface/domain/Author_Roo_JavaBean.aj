// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ac.uk.bbk.bookface.domain;

import ac.uk.bbk.bookface.domain.Author;
import ac.uk.bbk.bookface.domain.Book;
import java.util.Set;

privileged aspect Author_Roo_JavaBean {
    
    public Set<Book> Author.getBooks() {
        return this.books;
    }
    
    public void Author.setBooks(Set<Book> books) {
        this.books = books;
    }
    
}