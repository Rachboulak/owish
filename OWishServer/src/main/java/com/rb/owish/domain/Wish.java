package com.rb.owish.domain;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Wish {

    /**
     */
    @NotNull
    @Size(min = 1, max = 255)
    private String title;

    /**
     */
    @NotNull
    @Size(min = 1, max = 255)
    private String description;
}
