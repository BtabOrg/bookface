// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package uk.ac.bbk.bookface.web;

import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

import uk.ac.bbk.bookface.domain.Book;
import uk.ac.bbk.bookface.domain.Comments;
import uk.ac.bbk.bookface.domain.Person;
import uk.ac.bbk.bookface.web.CommentsController;

privileged aspect CommentsController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String CommentsController.create(@Valid Comments comments, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
    	if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, comments);
            return "commentses/create";
        }
        uiModel.asMap().clear();
        comments.persist();
        return "redirect:/commentses/" + encodeUrlPathSegment(comments.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String CommentsController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Comments());
        return "commentses/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String CommentsController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("comments", Comments.findComments(id));
        uiModel.addAttribute("itemId", id);
        return "commentses/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String CommentsController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("commentses", Comments.findCommentsEntries(firstResult, sizeNo));
            float nrOfPages = (float) Comments.countCommentses() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("commentses", Comments.findAllCommentses());
        }
        return "commentses/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String CommentsController.update(@Valid Comments comments, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, comments);
            return "commentses/update";
        }
        uiModel.asMap().clear();
        comments.merge();
        return "redirect:/commentses/" + encodeUrlPathSegment(comments.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String CommentsController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, Comments.findComments(id));
        return "commentses/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String CommentsController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Comments comments = Comments.findComments(id);
        comments.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/commentses";
    }
    
    void CommentsController.populateEditForm(Model uiModel, Comments comments) {
    	comments.setPerson(SecurityContextHolder.getContext().getAuthentication().getName());
        uiModel.addAttribute("comments", comments);
        uiModel.addAttribute("books", Book.findAllBooks());
    }
    
    String CommentsController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
