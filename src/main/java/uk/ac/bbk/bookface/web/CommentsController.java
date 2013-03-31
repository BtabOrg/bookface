package uk.ac.bbk.bookface.web;

import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import uk.ac.bbk.bookface.domain.Comments;

/**
 * The comments controller which has its aspects woven into it at compile time.
 */
@RequestMapping("/commentses")
@Controller
@RooWebScaffold(path = "commentses", formBackingObject = Comments.class)
public class CommentsController {
}
