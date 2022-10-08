<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改书籍</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 引入 Bootstrap -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="row clearfix">
    <div class="col-md-12 column">
        <div class="page-header">
            <h1>
                <small>修改书籍</small>
            </h1>
        </div>
    </div>
</div>
<form action="${pageContext.request.contextPath}/book/upDateBook" method="post">
    <%-- 出现的问题：我们提交了修改SQL的请求，但是修改失败，初次考虑是事务的问题，配置完毕事务，依旧无法提交数据   --%>
    <%-- 看一下sql语句能否执行成功：SQL执行失败，修改未完成   --%>
    <%-- 前端传递隐藏域       --%>
    <input type="hidden" name="bookID" value="${QBooks.bookID}">
    <div class="form-group">
        <label>书籍名称:</label>
        <input type="text" class="form-control" name="bookName" value="${QBooks.bookName}" required>
    </div>
    <div class="form-group">
        <label>书籍数量:</label>
        <input type="text" class="form-control" name="bookCounts" value="${QBooks.bookCounts}" required>
    </div>
    <div class="form-group">
        <label>书籍描述:</label>
        <input type="text" class="form-control" name="detail" value="${QBooks.detail}" required>
    </div>
    <div class="form-group">
        <input type="submit" class="form-control" value="修改">
    </div>


</form>


</body>
</html>
