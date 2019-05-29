package com.itlike.web;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.itlike.domain.AjaxRes;
import com.itlike.domain.Menu;
import com.itlike.domain.PageListRes;
import com.itlike.domain.QueryVo;
import com.itlike.service.MenuService;
import org.apache.shiro.authz.AuthorizationException;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.method.HandlerMethod;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
public class MenuController {
    @Autowired
    private MenuService menuService;


    @RequestMapping("/menu")
    @RequiresPermissions("menu:index")
    public String employee(){
        return "menu";
    }

    @RequestMapping("/menuList")
    @ResponseBody
    public PageListRes menuList(QueryVo vo){
        /*调用业务层查询菜单*/
        PageListRes pageListRes = menuService.getMenuList(vo);
        return pageListRes;
    }

    /*加载父菜单*/
    @RequestMapping("/parentList")
    @ResponseBody
    public List<Menu> parentList(){
        return  menuService.parentList();
    }

    /*保存菜单*/
    @RequestMapping("/saveMenu")
    @ResponseBody
    public AjaxRes saveMenu(Menu menu){
        AjaxRes ajaxRes = new AjaxRes();
        try {
            /*调用业务层,保存菜单*/
            menuService.saveMenu(menu);
            ajaxRes.setMsg("保存成功");
            ajaxRes.setSuccess(true);
        }catch (Exception e){
            ajaxRes.setSuccess(false);
            ajaxRes.setMsg("保存失败");
            System.out.println(e);
        }
        return ajaxRes;
    }
    /*更新菜单*/
    @RequestMapping("/updateMenu")
    @ResponseBody
    public AjaxRes updateMenu(Menu menu){
        return menuService.updateMenu(menu);
    }


    /*删除菜单*/
    @RequestMapping("/deleteMenu")
    @ResponseBody
    public AjaxRes deleteMenu(Long id){
        return menuService.deleteMenu(id);
    }

    /*获取树形菜单数据*/
    @RequestMapping("/getTreeData")
    @ResponseBody
    public List<Menu> getTreeData(){
        return menuService.getTreeData();
    }
    @ExceptionHandler(AuthorizationException.class)
    public void handleShiroException(HandlerMethod method, HttpServletResponse response) throws Exception{ /*method  发生异常的方法*/
        /*跳转到一个界面  界面提示没有 权限*/
        /*判断 当前的请求是不是Json请求  如果是  返回json给浏览器 让它自己来做跳转*/
        /*获取方法上的注解*/
        ResponseBody methodAnnotation = method.getMethodAnnotation(ResponseBody.class);
        if (methodAnnotation != null){
            //Ajax
            AjaxRes ajaxRes = new AjaxRes();
            ajaxRes.setSuccess(false);
            ajaxRes.setMsg("你没有权限操作");
            String s = new ObjectMapper().writeValueAsString(ajaxRes);
            response.setCharacterEncoding("utf-8");
            response.getWriter().print(s);
        }else {
            response.sendRedirect("nopermission.jsp");
        }
    }

}
