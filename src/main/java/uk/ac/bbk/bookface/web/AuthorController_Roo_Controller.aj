// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package uk.ac.bbk.bookface.web;

import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;
import uk.ac.bbk.bookface.domain.Author;
import uk.ac.bbk.bookface.web.AuthorController;

privileged aspect AuthorController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String AuthorController.create(@Valid Author author, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, author);
            return "authors/create";
        }
        else if(Author.findAuthorByName(httpServletRequest.getParameter("name")).size() > 0){
        	uiModel.asMap().clear();
            return "redirect:/authors?page=1&size=10";
        }
        uiModel.asMap().clear();
        author.persist();
        return "redirect:/authors/" + encodeUrlPathSegment(author.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String AuthorController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Author());
        return "authors/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String AuthorController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("author", Author.findAuthor(id));
        uiModel.addAttribute("itemId", id);
        return "authors/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String AuthorController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("authors", Author.findAuthorEntries(firstResult, sizeNo));
            float nrOfPages = (float) Author.countAuthors() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("authors", Author.findAllAuthors());
        }
        return "authors/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String AuthorController.update(@Valid Author author, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, author);
            return "authors/update";
        }
        uiModel.asMap().clear();
        author.merge();
        return "redirect:/authors/" + encodeUrlPathSegment(author.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String AuthorController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, Author.findAuthor(id));
        return "authors/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String AuthorController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Author author = Author.findAuthor(id);
        author.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/authors";
    }
    
    void AuthorController.populateEditForm(Model uiModel, Author author) {
        uiModel.addAttribute("author", author);
    }
    
    String AuthorController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
