package com.rb.owish.web;
import com.rb.owish.domain.Wish;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/wishes")
@Controller
@RooWebScaffold(path = "wishes", formBackingObject = Wish.class)
public class WishController {
}
