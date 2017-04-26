<%@page import="java.sql.Timestamp"%>
<%@page import="tpm.work.model.WorkDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String msg = (String) request.getAttribute("msg");
%>

<div id="wdiv${wdto.work_idx}" class="wdiv" draggable="true"
	ondragover="allowDrop(event)" ondragstart="drag(event)">
	<i id="showWork${wdto.work_idx}"
		${wdto.work_state eq 3?'class="glyphicon glyphicon-menu-right"' :'class="glyphicon glyphicon-menu-down"' }></i>
	&nbsp;<span onclick="showWorkTable(${wdto.work_idx})">${wdto.work_title}</span>
	<c:set var="wstart">
		<f:formatDate value="${wdto.work_start}" type="both"
			pattern="yyyy/MM/dd  hh:mm a" />
	</c:set>
	<c:set var="wend">
		<f:formatDate value="${wdto.work_end}" type="both"
			pattern="yyyy/MM/dd  hh:mm a" />
	</c:set>

	<span
		onclick="workUpdate(${wdto.work_idx},'${wstart}','${wend}','${wdto.work_confirm}')">
		<i class="glyphicon glyphicon-cog"></i>
	</span>


</div>
<table id="workTable${wdto.work_idx}" class="cate_table"
	${wdto.work_state eq 3?'style="display:none;"' :'' }>
	<tbody>
		<tr>
			<td colspan="2">
				<div class="table_i glyphicon glyphicon-calendar"></div>
				&nbsp;${wstart}<br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				~${wend}
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<div class="table_i glyphicon glyphicon-user"></div> <span>${mdto.member_name}</span>



			</td>
		</tr>
		<tr>
			<td colspan="2">
				<form action="javascript:addCheck(${wdto.work_idx})">
					<div class="table_i glyphicon glyphicon-check"
						onclick="showChecklist(${wdto.work_idx})"></div>
					<c:choose>
						<c:when test="${pdto.project_level != 1000 }">
							<input type="text" id="content${wdto.work_idx}"
								placeholder="체크리스트" style="width: 60%;" required="required">
															&nbsp;<i class="glyphicon glyphicon-plus"
								onclick="addCheck(${wdto.work_idx})"></i>
						</c:when>
						<c:otherwise>
							<span>체크리스트</span>
						</c:otherwise>
					</c:choose>
				</form>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<div class="scr">
					<div class="check_div" id="check_div${wdto.work_idx}">
						<c:set var="chTotal" value="0"></c:set>
						<c:set var="chChecked" value="0"></c:set>
						<c:forEach var="chdto" items="${wdto.checklist_dtos}"
							varStatus="status">
							<div id="div_ch${chdto.checklist_idx }"
								style="display:${chdto.checklist_state eq '1' ? 'none' : 'block' }"
								draggable="true" ondragover="allowDrop(event)"
								ondragstart="drag(event)">
								<c:choose>
									<c:when test="${pdto.project_level != 1000 }">
										<a onclick="javascript:check(${chdto.checklist_idx })">
									</c:when>
									<c:otherwise>
										<a>
									</c:otherwise>
								</c:choose>
								<i id="ch${chdto.checklist_idx }"
									class="${chdto.checklist_state eq '1' ? 'glyphicon glyphicon-ok' : 'glyphicon glyphicon-unchecked' }">
								</i> ${chdto.checklist_content} </a> <input type="hidden"
									id="ch_state${chdto.checklist_idx}"
									value="${chdto.checklist_state}">
							</div>
							<c:if test="${status.last}">
								<c:set var="chTotal" value="${status.count}"></c:set>
							</c:if>
							<c:if test="${chdto.checklist_state eq '1'}">
								<c:set var="chChecked" value="${chChecked+1}"></c:set>
							</c:if>
						</c:forEach>
						<input type="hidden" id="checkHide${wdto.work_idx}" value="0">
					</div>
				</div>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="right"><a id="aCheck${wdto.work_idx}"
				href="javascript:showCheck(${wdto.work_idx})">완료한 체크리스트 보기</a>&nbsp;</td>
		</tr>
		<tr>
			<td colspan="2">
				<div class="progress" style="margin-bottom: 2px; height: 12px;">
					<div id="chBar${wdto.work_idx}"
						class="progress-bar progress-bar-primary "
						style="width: ${chChecked/chTotal * 100}%;"></div>
				</div> <input type="hidden" id="chTotal${wdto.work_idx}"
				value="${chTotal}"> <input type="hidden"
				id="chChecked${wdto.work_idx}" value="${chChecked}">
			</td>
		</tr>
		<c:remove var="chTotal" />
		<c:remove var="chChecked" />
		<tr>
			<td><div class="work_btn" id="workState${wdto.work_idx}">
					<i name="1" class="glyphicon glyphicon-play-circle"
						${wdto.work_state eq 1?'style="color:#367fa9;"':''}
						data-toggle="tooltip" data-placement="bottom" title="업무 진행 중"
						onclick="workDone(${wdto.work_idx},1)"></i>
					<c:if test="${wdto.work_confirm ==10}">
						<i name="2" class="glyphicon glyphicon-record"
							${wdto.work_state eq 2?'style="color:#f0ad4e;" data-toggle="tooltip" data-placement="bottom" title="결재 대기"':'data-toggle="tooltip" data-placement="bottom" title="결재 요청"'}
							onclick="workDone(${wdto.work_idx},2)"></i>
					</c:if>
					<i name="3" class="glyphicon glyphicon-ok-circle"
						${wdto.work_state eq 3?'style="color:green;"':''}
						data-toggle="tooltip" data-placement="bottom" title="완료된 업무"
						onclick="workDone(${wdto.work_idx},3)"></i>
				</div></td>
			<td align="right"><a href="#"
				onclick="workSide('${wdto.work_idx}','${project_idx }')"
				class="menu-toggle">코멘트</a>/ <a href="#"
				onclick="workSide('${wdto.work_idx}','${project_idx }')"
				class="menu-toggle">첨부파일</a></td>
		</tr>
	</tbody>
</table>

</div>
</div>