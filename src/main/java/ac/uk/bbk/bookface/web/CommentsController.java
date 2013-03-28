package ac.uk.bbk.bookface.web;

import ac.uk.bbk.bookface.domain.Comments;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/commentses")
@Controller
@RooWebScaffold(path = "commentses", formBackingObject = Comments.class)
public class CommentsController {
}