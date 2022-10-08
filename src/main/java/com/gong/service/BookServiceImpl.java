package com.gong.service;

import com.gong.dao.BookMapper;
import com.gong.pojo.Books;
import com.gong.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class BookServiceImpl implements BookService {
    //业务层调dao层：组合Dao
    private BookMapper bookMapper;

    public void setBookMapper(BookMapper bookMapper) {
        this.bookMapper = bookMapper;
    }

    @Override
    public List<Books> queryBookByName(String bookName) {
        return bookMapper.queryBookByName(bookName);
    }

    @Override
    public List<User> user() {
        return bookMapper.user();
    }

    @Override
    public int addBook(Books books) {
        return bookMapper.addBook(books);
    }

    @Override
    public int deleteBookById(int id) {
        return bookMapper.deleteBookById(id);
    }

    @Override
    public int updateBook(Books books) {
//        System.out.println("book=>" + books);
        return bookMapper.updateBook(books);
    }

    @Override
    public Books queryBookById(int id) {
        return bookMapper.queryBookById(id);
    }

    @Override
    public List<Books> queryAllBook() {
        return bookMapper.queryAllBook();
    }


}
