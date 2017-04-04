<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//add category

	String msg = (String) request.getAttribute("msg");
	if (msg.equals("error")) {
		msg = "";
	} else {
%>
<div class="category">
	<table>
		<tbody>
			<tr>
				<td><%=msg%></td>
				<td align="right">설정</td>
			</tr>
			<tr>
				<td>업무명</td>
				<td align="right"><a onclick="test22()">설정</a></td>
			</tr>
			<tr>
				<td colspan="2">기간</td>
			</tr>
			<tr>
				<td colspan="2">멤버1, 멤버2</td>
			</tr>
			<tr>
				<td colspan="2">체크리스트+</td>
			</tr>
			<tr>
				<td colspan="2"><textarea rows="7">업무2</textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="left">표시하기</td>
			</tr>
			<tr>
				<td>진행률</td>
				<td>막대그래프</td>
			</tr>
			<tr>
				<td><input type="button" value="결재요청"></td>
				<td align="right">코멘트|첨부파일</td>
			</tr>
		</tbody>
	</table>
</div>
<%
	}
%>
