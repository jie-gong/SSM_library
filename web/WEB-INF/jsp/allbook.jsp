<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>首页</title>
    <%--BootStrap美化界面    --%>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <style>
        table {
            border: 1px solid #ccc;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>书籍列表——————————显示所有书籍</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4 column">
                <%--toAddBook--%>
                <a class="btn btn-primary" href="${pageContext.request.contextPath}/book/toAddBook">新增书籍</a>
                    <a class="btn btn-primary" href="${pageContext.request.contextPath}/book/allbook">显示全部书籍</a>
            </div>

            <div class="col-md-4 column">
                <%--  查询书籍  --%>
                <form action="/book/queryBooK" method="get">
                    <span style="color: crimson;font-weight: bold ">${error}</span>
                    <input type="text" class="from-control" name="bookName"  placeholder="请键入您要查询的书籍" >
                    <input type="submit" value="搜索" class="btn btn-primary">
                </form>
            </div>
        </div>
    </div>
    <div class="row clearfix">
        <div class="col-md-12 column">
            <table class="table table-hover table-stripe">
                <thead>
                <tr>
                    <th>书籍编号</th>
                    <th>书籍名称</th>
                    <th>书籍数量</th>
                    <th>书籍详情</th>
                    <th>操作</th>
                </tr>
                </thead>
                <%--   数据从数据库中查询 ,从controller中将“list”遍历出来      --%>
                <tbody>
                <c:forEach var="book" items="${list}">
                    <tr>
                        <td>${book.bookID}</td>
                        <td>${book.bookName}</td>
                        <td>${book.bookCounts}</td>
                        <td>${book.detail}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/book/toXG?id=${book.bookID}">修改</a>
                            &nbsp; | &nbsp;
                            <a href="${pageContext.request.contextPath}/book/toDe/${book.bookID}">删除</a>
                            &nbsp; | &nbsp;
                        </td>

                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

</body>
</html>
