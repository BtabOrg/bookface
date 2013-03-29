package uk.ac.bbk.bookface.web;

import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import uk.ac.bbk.bookface.domain.Book;

@RequestMapping("/books")
@Controller
@RooWebScaffold(path = "books", formBackingObject = Book.class)
public class BookController {
}
