<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">

<!-- 문자열을 넣을때는 getAsString을 사용한다. -->
<title>GoGipam</title>
<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">

</script>


<link rel="stylesheet" href="css/basic.css">
<link rel="stylesheet" href="css/navbar.css">
<link rel="stylesheet" href="css/list.css">
<style>

body {
   padding-right: 0 !important;
}

header {
   width: 100%;
   height: 128px;
   margin-top: -10px;
}

section {
   background-color: white;
   min-width: 100%;
   height: 100%;
}

footer {
   background-color: #ffffff;
   clear: both;
   max-width: 100%;
}

</style>

</head>

<body>
   <header>
      <p>
         <!-- tiles.xml의put-attribute name을 참조한다(경로참조할때) / p라는 요소안에 header.jsp를 참조하라 -->
         <tiles:insertAttribute name="header" />
      </p>
   </header>
   <section>
      <div>
         <tiles:insertAttribute name="body" />
      </div>
   </section>

   <footer>
      <div>
         <tiles:insertAttribute name="footer" />
      </div>
   </footer>
</body>
</html>