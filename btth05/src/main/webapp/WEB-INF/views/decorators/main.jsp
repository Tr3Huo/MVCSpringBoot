<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<!DOCTYPE html>
<html>
<head>
    <title><decorator:title default="SpringMVCMSSQL" /></title>
    <decorator:head />
</head>
<body>
    <header>
        <h2>Header - SpringMVCMSSQL</h2>
    </header>
    
    <div id="content">
        <decorator:body />
    </div>
    
    <footer>
        <p>Footer</p>
    </footer>
</body>
</html>
