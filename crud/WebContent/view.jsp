<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.newsclan.crud.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add/Edit</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF8");
		String tbname = request.getParameter("tbname");
		String sid = request.getParameter("id");
		Integer user_id=(Integer)session.getAttribute("user_id");
		if(user_id==null) user_id=0;
		int id = -1;
		if (sid != null) {
			try {
				id = Integer.parseInt(sid);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	
		tbname = request.getParameter("tb");
		if (tbname == null)
			return;

		tbname = Tools.toHTML(tbname);
	%>
		
		<%
		System.err.println(id);
			if (id == -1) {
		%> 
		<%=Tools.toTable(DAO.getForm(user_id,tbname, false),
						"table table-striped table-hover")%>
		<% 
			} else {
				List<List> values=DAO.queryList("select * from `"+tbname+"` where id=?", false, String.valueOf(id));
				List<String> value=null;
				if(values.size()>0){
					value=values.get(0);
					value.remove(0);
				}
				
		%><input id=data_id type=hidden name=id value="<%=id%>">
		<%=Tools.toTable(DAO.getView(user_id,tbname, false,value),
						"table table-striped table-hover")%>
		<%
 			}
		%>
		

</body>
</html>