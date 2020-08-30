package com.zzy.controllor;

import com.sun.deploy.net.HttpResponse;
import com.zzy.entity.Catalog;
import com.zzy.service.CatalogsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
@RequestMapping("/catalog")
public class CatalogCcontrollor {
    @Autowired
    private CatalogsService catalogsService;
    @RequestMapping("/showCatalogs")
    @ResponseBody
    public List<Catalog> showCatalogs(Model model, HttpServletResponse response){
        response.setContentType("text/plain;charset=UTF-8");
        List<Catalog> catalogs = catalogsService.findCatalogs();
        model.addAttribute("catalogs",catalogs);
        for (Catalog catalog : catalogs) {
            System.out.println(catalog);
        }
        return catalogs;
    }
}
