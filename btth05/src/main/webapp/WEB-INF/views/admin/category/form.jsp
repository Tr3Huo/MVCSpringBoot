<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>${category.id == null ? 'Thêm' : 'Cập nhật'} Danh mục</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-4">
    <h2>${category.id == null ? 'Thêm Danh mục mới' : 'Cập nhật Danh mục'}</h2>
    <div class="card p-4 mt-3">
        <form action="/admin/categories/save" method="post">
            <input type="hidden" name="id" value="${category.id}">
            <div class="mb-3">
                <label class="form-label">Tên Danh mục</label>
                <input type="text" name="name" class="form-control" value="${category.name}" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Mô tả</label>
                <textarea name="description" class="form-control">${category.description}</textarea>
            </div>
            <button type="submit" class="btn btn-primary">Lưu</button>
            <a href="/admin/categories" class="btn btn-secondary">Hủy</a>
        </form>
    </div>
</body>
</html>
