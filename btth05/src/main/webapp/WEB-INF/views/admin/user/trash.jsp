<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Thùng rác - Người dùng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-4">
    <h2>Thùng rác - Người dùng đã xóa</h2>
    <div class="mb-3">
        <a href="/admin/users" class="btn btn-secondary">Quay lại danh sách</a>
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
                        <a href="/admin/users/restore/${usr.id}" class="btn btn-sm btn-success" onclick="confirmRestore(event, this.href)">Khôi phục</a>
                    </td>
                </tr>
            </c:forEach>
            <c:if test="${empty users}">
                <tr><td colspan="5" class="text-center">Thùng rác rỗng.</td></tr>
            </c:if>
        </tbody>
    </table>
    
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script>
        function confirmRestore(event, url) {
            event.preventDefault(); 
            Swal.fire({
                title: 'Xác nhận khôi phục?',
                text: "Người dùng này sẽ được khôi phục về danh sách chính!",
                icon: 'question',
                showCancelButton: true,
                confirmButtonColor: '#198754',
                cancelButtonColor: '#6c757d',
                confirmButtonText: 'Đồng ý',
                cancelButtonText: 'Hủy'
            }).then((result) => {
                if (result.isConfirmed) {
                    window.location.href = url; 
                }
            })
        }
    </script>
</body>
</html>
