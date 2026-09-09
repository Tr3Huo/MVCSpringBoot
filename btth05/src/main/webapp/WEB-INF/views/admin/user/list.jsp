<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Quản lý Người dùng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-4">
    <h2>Quản lý Người dùng (Admin)</h2>
    <div class="d-flex justify-content-between mb-3">
        <a href="/admin/users/add" class="btn btn-success">Thêm Người dùng mới</a>
        <form action="/admin/users" method="get" class="d-flex">
            <input type="text" name="keyword" class="form-control me-2" placeholder="Tìm kiếm người dùng..." value="${keyword}">
            <button type="submit" class="btn btn-primary text-nowrap">Tìm kiếm</button>
            <a href="/admin/users" class="btn btn-secondary ms-2 text-nowrap">Làm mới</a>
        </form>
    </div>

    <table class="table table-bordered table-striped">
        <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Tên đăng nhập</th>
                <th>Họ và tên</th>
                <th>Vai trò</th>
                <th>Thao tác</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="usr" items="${users}">
                <tr>
                    <td>${usr.id}</td>
                    <td>${usr.username}</td>
                    <td>${usr.fullName}</td>
                    <td><span class="badge bg-${usr.role == 'ADMIN' ? 'danger' : 'info'}">${usr.role}</span></td>
                    <td>
                        <a href="/admin/users/edit/${usr.id}" class="btn btn-sm btn-warning">Sửa</a>
                        <a href="/admin/users/delete/${usr.id}" class="btn btn-sm btn-danger" onclick="return confirm('Bạn có chắc chắn muốn xóa không?')">Xóa</a>
                    </td>
                </tr>
            </c:forEach>
            <c:if test="${empty users}">
                <tr><td colspan="5" class="text-center">Không tìm thấy người dùng nào.</td></tr>
            </c:if>
        </tbody>
    </table>
    <br/>
    <a href="/admin/categories" class="btn btn-outline-info">Chuyển sang Quản lý Danh mục</a>
</body>
</html>
