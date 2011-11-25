// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package projekt.web;

import ee.itcollege.team11.ObjektIntsidendi;
import ee.itcollege.team11.ObjektiSeadusIntsidendi;
import ee.itcollege.team11.SeadusePunkt;
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

privileged aspect ObjektiSeadusIntsidendiController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST)
    public String ObjektiSeadusIntsidendiController.create(@Valid ObjektiSeadusIntsidendi objektiSeadusIntsidendi, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("objektiSeadusIntsidendi", objektiSeadusIntsidendi);
            addDateTimeFormatPatterns(uiModel);
            return "objektiseadusintsidendis/create";
        }
        uiModel.asMap().clear();
        objektiSeadusIntsidendi.persist();
        return "redirect:/objektiseadusintsidendis/" + encodeUrlPathSegment(objektiSeadusIntsidendi.getObjektiSeadusIntsidendisId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", method = RequestMethod.GET)
    public String ObjektiSeadusIntsidendiController.createForm(Model uiModel) {
        uiModel.addAttribute("objektiSeadusIntsidendi", new ObjektiSeadusIntsidendi());
        addDateTimeFormatPatterns(uiModel);
        return "objektiseadusintsidendis/create";
    }
    
    @RequestMapping(value = "/{objektiSeadusIntsidendisId}", method = RequestMethod.GET)
    public String ObjektiSeadusIntsidendiController.show(@PathVariable("objektiSeadusIntsidendisId") Long objektiSeadusIntsidendisId, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("objektiseadusintsidendi", ObjektiSeadusIntsidendi.findObjektiSeadusIntsidendi(objektiSeadusIntsidendisId));
        uiModel.addAttribute("itemId", objektiSeadusIntsidendisId);
        return "objektiseadusintsidendis/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String ObjektiSeadusIntsidendiController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            uiModel.addAttribute("objektiseadusintsidendis", ObjektiSeadusIntsidendi.findObjektiSeadusIntsidendiEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) ObjektiSeadusIntsidendi.countObjektiSeadusIntsidendis() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("objektiseadusintsidendis", ObjektiSeadusIntsidendi.findAllObjektiSeadusIntsidendis());
        }
        addDateTimeFormatPatterns(uiModel);
        return "objektiseadusintsidendis/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String ObjektiSeadusIntsidendiController.update(@Valid ObjektiSeadusIntsidendi objektiSeadusIntsidendi, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("objektiSeadusIntsidendi", objektiSeadusIntsidendi);
            addDateTimeFormatPatterns(uiModel);
            return "objektiseadusintsidendis/update";
        }
        uiModel.asMap().clear();
        objektiSeadusIntsidendi.merge();
        return "redirect:/objektiseadusintsidendis/" + encodeUrlPathSegment(objektiSeadusIntsidendi.getObjektiSeadusIntsidendisId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{objektiSeadusIntsidendisId}", params = "form", method = RequestMethod.GET)
    public String ObjektiSeadusIntsidendiController.updateForm(@PathVariable("objektiSeadusIntsidendisId") Long objektiSeadusIntsidendisId, Model uiModel) {
        uiModel.addAttribute("objektiSeadusIntsidendi", ObjektiSeadusIntsidendi.findObjektiSeadusIntsidendi(objektiSeadusIntsidendisId));
        addDateTimeFormatPatterns(uiModel);
        return "objektiseadusintsidendis/update";
    }
    
    @RequestMapping(value = "/{objektiSeadusIntsidendisId}", method = RequestMethod.DELETE)
    public String ObjektiSeadusIntsidendiController.delete(@PathVariable("objektiSeadusIntsidendisId") Long objektiSeadusIntsidendisId, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        ObjektiSeadusIntsidendi.findObjektiSeadusIntsidendi(objektiSeadusIntsidendisId).remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/objektiseadusintsidendis";
    }
    
    @ModelAttribute("objektintsidendis")
    public Collection<ObjektIntsidendi> ObjektiSeadusIntsidendiController.populateObjektIntsidendis() {
        return ObjektIntsidendi.findAllObjektIntsidendis();
    }
    
    @ModelAttribute("objektiseadusintsidendis")
    public Collection<ObjektiSeadusIntsidendi> ObjektiSeadusIntsidendiController.populateObjektiSeadusIntsidendis() {
        return ObjektiSeadusIntsidendi.findAllObjektiSeadusIntsidendis();
    }
    
    @ModelAttribute("seadusepunkts")
    public Collection<SeadusePunkt> ObjektiSeadusIntsidendiController.populateSeadusePunkts() {
        return SeadusePunkt.findAllSeadusePunkts();
    }
    
    void ObjektiSeadusIntsidendiController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("objektiSeadusIntsidendi_alates_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("objektiSeadusIntsidendi_avatud_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("objektiSeadusIntsidendi_kuni_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("objektiSeadusIntsidendi_muudetud_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("objektiSeadusIntsidendi_suletud_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
    }
    
    String ObjektiSeadusIntsidendiController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
