// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package projekt.web;

import ee.itcollege.team11.Amet;
import ee.itcollege.team11.AmetPiiripunkti;
import ee.itcollege.team11.AmetVaeosa;
import java.io.UnsupportedEncodingException;
import java.lang.Integer;
import java.lang.Long;
import java.lang.String;
import java.util.Collection;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.joda.time.format.DateTimeFormat;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect AmetController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST)
    public String AmetController.create(@Valid Amet amet, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("amet", amet);
            addDateTimeFormatPatterns(uiModel);
            return "amets/create";
        }
        uiModel.asMap().clear();
        amet.persist();
        return "redirect:/amets/" + encodeUrlPathSegment(amet.getAmetId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", method = RequestMethod.GET)
    public String AmetController.createForm(Model uiModel) {
        uiModel.addAttribute("amet", new Amet());
        addDateTimeFormatPatterns(uiModel);
        return "amets/create";
    }
    
    @RequestMapping(value = "/{ametId}", method = RequestMethod.GET)
    public String AmetController.show(@PathVariable("ametId") Long ametId, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("amet", Amet.findAmet(ametId));
        uiModel.addAttribute("itemId", ametId);
        return "amets/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String AmetController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            uiModel.addAttribute("amets", Amet.findAmetEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) Amet.countAmets() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("amets", Amet.findAllAmets());
        }
        addDateTimeFormatPatterns(uiModel);
        return "amets/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String AmetController.update(@Valid Amet amet, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("amet", amet);
            addDateTimeFormatPatterns(uiModel);
            return "amets/update";
        }
        uiModel.asMap().clear();
        amet.merge();
        return "redirect:/amets/" + encodeUrlPathSegment(amet.getAmetId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{ametId}", params = "form", method = RequestMethod.GET)
    public String AmetController.updateForm(@PathVariable("ametId") Long ametId, Model uiModel) {
        uiModel.addAttribute("amet", Amet.findAmet(ametId));
        addDateTimeFormatPatterns(uiModel);
        return "amets/update";
    }
    
    @RequestMapping(value = "/{ametId}", method = RequestMethod.DELETE)
    public String AmetController.delete(@PathVariable("ametId") Long ametId, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Amet.findAmet(ametId).remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/amets";
    }
    
    @ModelAttribute("amets")
    public Collection<Amet> AmetController.populateAmets() {
        return Amet.findAllAmets();
    }
    
    @ModelAttribute("ametpiiripunktis")
    public Collection<AmetPiiripunkti> AmetController.populateAmetPiiripunktis() {
        return AmetPiiripunkti.findAllAmetPiiripunktis();
    }
    
    @ModelAttribute("ametvaeosas")
    public Collection<AmetVaeosa> AmetController.populateAmetVaeosas() {
        return AmetVaeosa.findAllAmetVaeosas();
    }
    
    void AmetController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("amet_avatud_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("amet_muudetud_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("amet_suletud_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
    }
    
    String AmetController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        }
        catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
