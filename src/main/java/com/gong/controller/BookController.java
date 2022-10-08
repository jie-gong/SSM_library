package com.gong.controller;

import com.gong.pojo.Books;
import com.gong.pojo.User;
import com.gong.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/book")
public class BookController {
    //controller 调service层
    @Autowired
    @Qualifier("BookServiceImpl")
    private BookService bookService;

    //查询全部书籍，并且返回一个书记展示页面
    @RequestMapping("/allbook")
    public String list(Model model) {
        List<Books> books = bookService.queryAllBook();
        model.addAttribute("list", books);
        return "allbook";
    }

    //    跳转到增加书籍页面
    @RequestMapping("/toAddBook")
    public String toAddPaper() {
        return "addBook";
    }

    //添加书籍请求
    @RequestMapping("/addBook")
    public String addBook(Books books) {
//        System.out.println("addBook=>" + books);
        bookService.addBook(books);
        //返回使用重定向
        return "redirect:/book/allbook";//重定向到    @RequestMapping("/allbook")  请求；这样可以实现请求复用
    }

    //跳转修改页面
    @RequestMapping("/toXG")
    public String toXG(int id, Model model) {
        Books books = bookService.queryBookById(id);
        model.addAttribute("QBooks", books);
        return "XG";
    }

    //修改书籍
    @RequestMapping("/upDateBook")
    public String upDataBook(Books books) {
        System.out.println("upDataBook=>" + books);
        int i = bookService.updateBook(books);
        if (i > 0) {
            System.out.println("添加成功" + books);
        } else {
            System.out.println("添加失败");
        }
        List<Books> books1 = bookService.queryAllBook();
        for (Books books2 : books1) {
            System.out.println(books2);
        }
        return "redirect:/book/allbook";
    }


    //自写
    //删除扁表单数据
    @RequestMapping("/toDe/{bookid}")
    public String toDe(@PathVariable("bookid") int id) {
        bookService.deleteBookById(id);
        return "redirect:/book/allbook";
    }

//    @Autowired
//    @Qualifier("BookServiceImpl")
//    private BookService bookServices;

    //查询书籍
    @RequestMapping("/queryBooK")
    public String queryBook(String bookName, Model model) {
        List<Books> books = bookService.queryBookByName(bookName);
//        List<Books>list= new ArrayList<>();
//        list.add(books);

        if (books == null) {
//            list=bookService.queryAllBook();
            model.addAttribute("error", "未查到该书籍");
        }

        System.out.println(books);
        model.addAttribute("list", books);
        return "allbook";
    }

    @RequestMapping("/user")
    public String user(Model model) {
        List<User> userList = bookService.user();
        model.addAttribute("user", userList);
        return "allUser";
    }

}
