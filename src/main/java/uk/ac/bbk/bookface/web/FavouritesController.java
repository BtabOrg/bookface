package uk.ac.bbk.bookface.web;

import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import uk.ac.bbk.bookface.domain.Favourites;

/**
 * The favourites controller which has its aspects woven into it at compile time.
 */
@RequestMapping("/favouriteses")
@Controller
@RooWebScaffold(path = "favouriteses", formBackingObject = Favourites.class)
public class FavouritesController {
}
