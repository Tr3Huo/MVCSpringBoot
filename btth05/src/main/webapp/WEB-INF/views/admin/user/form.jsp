<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>${user.id == null ? 'Thêm' : 'Cập nhật'} Người dùng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-4">
    <h2>${user.id == null ? 'Thêm Người dùng mới' : 'Cập nhật Người dùng'}</h2>
    <div class="card p-4 mt-3">
        <form action="/admin/users/save" method="post">
            <input type="hidden" name="id" value="${user.id}">
            <div class="mb-3">
                <label class="form-label">Tên đăng nhập</label>
                <input type="text" name="username" class="form-control" value="${user.username}" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Mật khẩu</label>
                <input type="text" name="password" class="form-control" value="${user.password}" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Họ và tên</label>
                <input type="text" name="fullName" class="form-control" value="${user.fullName}">
            </div>
            <div class="mb-3">
                <label class="form-label">Vai trò</label>
                <select name="role" class="form-select">
                    <option value="USER" ${user.role == 'USER' ? 'selected' : ''}>Người dùng</option>
                    <option value="ADMIN" ${user.role == 'ADMIN' ? 'selected' : ''}>Quản trị viên</option>
                </select>
            </div>
            <button type="submit" class="btn btn-primary">Lưu</button>
            <a href="/admin/users" class="btn btn-secondary">Hủy</a>
        </form>
    </div>
</body>
</html>
