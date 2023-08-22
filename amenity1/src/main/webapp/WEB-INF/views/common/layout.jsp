<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  isELIgnored="false"
 %>
 <%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <style>
      #container-c {
        width: 100%;
        margin: 0px auto;
        text-align:center;
        border: 0px solid #bcbcbc;
      }
      #header-h {
        padding: 5px;
        margin-bottom: 5px;
        background-color: #f7f7f8;
      }
      #sidebar-left-s {
        width: 15%;
        height:700px;
        padding: 5px;
        margin-right: 5px;
        margin-bottom: 5px;
        float: left;
        border: 0px solid #bcbcbc;
        font-size:10px;
      }
      #content-c {
        width: 75%;
        padding: 5px;
        margin-right: 5px;
        float: left;
        border: 0px solid #bcbcbc;
      }
      #footer-f {
        clear: both;
        padding: 5px;
        border: 0px solid #bcbcbc;
         background-color: lightblue;
      }
      
    </style>
    <title><tiles:insertAttribute name="title" /></title>
  </head>
    <body>
    <div id="container-c">
      <div id="header-h">
         <tiles:insertAttribute name="header"/>
      </div> 
    <div id="sidebar-left-s">
          <tiles:insertAttribute name="side"/> 
      </div>

      <div id="content-c">
          <tiles:insertAttribute name="body"/>
      </div>
      <div id="footer-f">
          <tiles:insertAttribute name="footer"/>
      </div>
    </div>

  </body>
</html>