package ac.uk.bbk.bookface.web;

import ac.uk.bbk.bookface.domain.Favourites;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/favouriteses")
@Controller
@RooWebScaffold(path = "favouriteses", formBackingObject = Favourites.class)
public class FavouritesController {
}
