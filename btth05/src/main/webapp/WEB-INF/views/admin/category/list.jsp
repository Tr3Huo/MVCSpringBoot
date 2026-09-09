<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Quản lý Danh mục</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-4">
    <h2>Quản lý Danh mục (Admin)</h2>
    <div class="d-flex justify-content-between mb-3">
        <a href="/admin/categories/add" class="btn btn-success">Thêm Danh mục mới</a>
        <form action="/admin/categories" method="get" class="d-flex">
            <input type="text" name="keyword" class="form-control me-2" placeholder="Tìm kiếm danh mục..." value="${keyword}">
            <button type="submit" class="btn btn-primary text-nowrap">Tìm kiếm</button>
            <a href="/admin/categories" class="btn btn-secondary ms-2 text-nowrap">Làm mới</a>
        </form>
    </div>

    <table class="table table-bordered table-striped">
        <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Tên danh mục</th>
                <th>Mô tả</th>
                <th>Thao tác</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="cat" items="${categories}">
                <tr>
                    <td>${cat.id}</td>
                    <td>${cat.name}</td>
                    <td>${cat.description}</td>
                    <td>
                        <a href="/admin/categories/edit/${cat.id}" class="btn btn-sm btn-warning">Sửa</a>
                        <a href="/admin/categories/delete/${cat.id}" class="btn btn-sm btn-danger" onclick="return confirm('Bạn có chắc chắn muốn xóa không?')">Xóa</a>
                    </td>
                </tr>
            </c:forEach>
            <c:if test="${empty categories}">
                <tr><td colspan="4" class="text-center">Không tìm thấy danh mục nào.</td></tr>
            </c:if>
        </tbody>
    </table>
    <br/>
    <a href="/admin/users" class="btn btn-outline-info">Chuyển sang Quản lý Người dùng</a>
</body>
</html>
