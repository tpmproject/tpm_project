<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/sample/cho/main/import.jsp"%>

</head>
<body class="skin-blue">
	<div class="wrapper">
		<%@ include file="/WEB-INF/view/header.jsp"%>
		<%@ include file="/WEB-INF/view/aside.jsp"%>
		<div class="content-wrapper" style="min-height: 887px;">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					Calendar <small>Control panel</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li class="active">Calendar</li>
				</ol>
			</section>

			<!-- Main content -->
			<section class="content">
				<div class="row">
					<div class="col-md-3">
						<div class="box box-solid">
							<div class="box-header with-border">
								<h4 class="box-title">Draggable Events</h4>
							</div>
							<div class="box-body">
								<!-- the events -->
								<div id="external-events">
									<div
										class="external-event bg-green ui-draggable ui-draggable-handle"
										style="position: relative;">Lunch</div>
									<div
										class="external-event bg-yellow ui-draggable ui-draggable-handle"
										style="position: relative;">Go home</div>
									<div
										class="external-event bg-aqua ui-draggable ui-draggable-handle"
										style="position: relative;">Do homework</div>
									<div
										class="external-event bg-light-blue ui-draggable ui-draggable-handle"
										style="position: relative;">Work on UI design</div>
									<div
										class="external-event bg-red ui-draggable ui-draggable-handle"
										style="position: relative;">Sleep tight</div>
									<div class="checkbox">
										<label for="drop-remove"> <input type="checkbox"
											id="drop-remove"> remove after drop
										</label>
									</div>
								</div>
							</div>
							<!-- /.box-body -->
						</div>
						<!-- /. box -->
						<div class="box box-solid">
							<div class="box-header with-border">
								<h3 class="box-title">Create Event</h3>
							</div>
							<div class="box-body">
								<div class="btn-group" style="width: 100%; margin-bottom: 10px;">
									<!--<button type="button" id="color-chooser-btn" class="btn btn-info btn-block dropdown-toggle" data-toggle="dropdown">Color <span class="caret"></span></button>-->
									<ul class="fc-color-picker" id="color-chooser">
										<li><a class="text-aqua" href="#"><i
												class="fa fa-square"></i></a></li>
										<li><a class="text-blue" href="#"><i
												class="fa fa-square"></i></a></li>
										<li><a class="text-light-blue" href="#"><i
												class="fa fa-square"></i></a></li>
										<li><a class="text-teal" href="#"><i
												class="fa fa-square"></i></a></li>
										<li><a class="text-yellow" href="#"><i
												class="fa fa-square"></i></a></li>
										<li><a class="text-orange" href="#"><i
												class="fa fa-square"></i></a></li>
										<li><a class="text-green" href="#"><i
												class="fa fa-square"></i></a></li>
										<li><a class="text-lime" href="#"><i
												class="fa fa-square"></i></a></li>
										<li><a class="text-red" href="#"><i
												class="fa fa-square"></i></a></li>
										<li><a class="text-purple" href="#"><i
												class="fa fa-square"></i></a></li>
										<li><a class="text-fuchsia" href="#"><i
												class="fa fa-square"></i></a></li>
										<li><a class="text-muted" href="#"><i
												class="fa fa-square"></i></a></li>
										<li><a class="text-navy" href="#"><i
												class="fa fa-square"></i></a></li>
									</ul>
								</div>
								<!-- /btn-group -->
								<div class="input-group">
									<input id="new-event" type="text" class="form-control"
										placeholder="Event Title">
									<div class="input-group-btn">
										<button id="add-new-event" type="button"
											class="btn btn-primary btn-flat">Add</button>
									</div>
									<!-- /btn-group -->
								</div>
								<!-- /input-group -->
							</div>
						</div>
					</div>
					<!-- /.col -->
					<div class="col-md-9">
						<div class="box box-primary">
							<div class="box-body no-padding">
								<!-- THE CALENDAR -->
								<div id="calendar" class="fc fc-ltr fc-unthemed">
									<div class="fc-toolbar">
										<div class="fc-left">
											<div class="fc-button-group">
												<button type="button"
													class="fc-prev-button fc-button fc-state-default fc-corner-left">
													<span class="fc-icon fc-icon-left-single-arrow"></span>
												</button>
												<button type="button"
													class="fc-next-button fc-button fc-state-default fc-corner-right">
													<span class="fc-icon fc-icon-right-single-arrow"></span>
												</button>
											</div>
											<button type="button"
												class="fc-today-button fc-button fc-state-default fc-corner-left fc-corner-right fc-state-disabled"
												disabled="disabled">today</button>
										</div>
										<div class="fc-right">
											<div class="fc-button-group">
												<button type="button"
													class="fc-month-button fc-button fc-state-default fc-corner-left fc-state-active">month</button>
												<button type="button"
													class="fc-agendaWeek-button fc-button fc-state-default">week</button>
												<button type="button"
													class="fc-agendaDay-button fc-button fc-state-default fc-corner-right">day</button>
											</div>
										</div>
										<div class="fc-center">
											<h2>April 2017</h2>
										</div>
										<div class="fc-clear"></div>
									</div>
									<div class="fc-view-container" style="">
										<div class="fc-view fc-month-view fc-basic-view">
											<table>
												<thead>
													<tr>
														<td class="fc-widget-header"><div
																class="fc-row fc-widget-header">
																<table>
																	<thead>
																		<tr>
																			<th class="fc-day-header fc-widget-header fc-sun">Sun</th>
																			<th class="fc-day-header fc-widget-header fc-mon">Mon</th>
																			<th class="fc-day-header fc-widget-header fc-tue">Tue</th>
																			<th class="fc-day-header fc-widget-header fc-wed">Wed</th>
																			<th class="fc-day-header fc-widget-header fc-thu">Thu</th>
																			<th class="fc-day-header fc-widget-header fc-fri">Fri</th>
																			<th class="fc-day-header fc-widget-header fc-sat">Sat</th>
																		</tr>
																	</thead>
																</table>
															</div></td>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td class="fc-widget-content"><div
																class="fc-day-grid-container">
																<div class="fc-day-grid">
																	<div class="fc-row fc-week fc-widget-content"
																		style="height: 107px;">
																		<div class="fc-bg">
																			<table>
																				<tbody>
																					<tr>
																						<td
																							class="fc-day fc-widget-content fc-sun fc-other-month fc-past"
																							data-date="2017-03-26"></td>
																						<td
																							class="fc-day fc-widget-content fc-mon fc-other-month fc-past"
																							data-date="2017-03-27"></td>
																						<td
																							class="fc-day fc-widget-content fc-tue fc-other-month fc-past"
																							data-date="2017-03-28"></td>
																						<td
																							class="fc-day fc-widget-content fc-wed fc-other-month fc-past"
																							data-date="2017-03-29"></td>
																						<td
																							class="fc-day fc-widget-content fc-thu fc-other-month fc-past"
																							data-date="2017-03-30"></td>
																						<td
																							class="fc-day fc-widget-content fc-fri fc-other-month fc-past"
																							data-date="2017-03-31"></td>
																						<td
																							class="fc-day fc-widget-content fc-sat fc-past"
																							data-date="2017-04-01"></td>
																					</tr>
																				</tbody>
																			</table>
																		</div>
																		<div class="fc-content-skeleton">
																			<table>
																				<thead>
																					<tr>
																						<td
																							class="fc-day-number fc-sun fc-other-month fc-past"
																							data-date="2017-03-26">26</td>
																						<td
																							class="fc-day-number fc-mon fc-other-month fc-past"
																							data-date="2017-03-27">27</td>
																						<td
																							class="fc-day-number fc-tue fc-other-month fc-past"
																							data-date="2017-03-28">28</td>
																						<td
																							class="fc-day-number fc-wed fc-other-month fc-past"
																							data-date="2017-03-29">29</td>
																						<td
																							class="fc-day-number fc-thu fc-other-month fc-past"
																							data-date="2017-03-30">30</td>
																						<td
																							class="fc-day-number fc-fri fc-other-month fc-past"
																							data-date="2017-03-31">31</td>
																						<td class="fc-day-number fc-sat fc-past"
																							data-date="2017-04-01">1</td>
																					</tr>
																				</thead>
																				<tbody>
																					<tr>
																						<td rowspan="2"></td>
																						<td rowspan="2"></td>
																						<td rowspan="2"></td>
																						<td rowspan="2"></td>
																						<td class="fc-event-container" colspan="3"><a
																							class="fc-day-grid-event fc-event fc-start fc-end fc-draggable"
																							style="background-color: #f39c12; border-color: #f39c12"><div
																									class="fc-content">
																									<span class="fc-time">12a</span> <span
																										class="fc-title">Long Event</span>
																								</div></a></td>
																					</tr>
																					<tr>
																						<td></td>
																						<td></td>
																						<td class="fc-event-container"><a
																							class="fc-day-grid-event fc-event fc-start fc-end fc-draggable"
																							style="background-color: #f56954; border-color: #f56954"><div
																									class="fc-content">
																									<span class="fc-time">12a</span> <span
																										class="fc-title">All Day Event</span>
																								</div></a></td>
																					</tr>
																				</tbody>
																			</table>
																		</div>
																	</div>
																	<div class="fc-row fc-week fc-widget-content"
																		style="height: 107px;">
																		<div class="fc-bg">
																			<table>
																				<tbody>
																					<tr>
																						<td
																							class="fc-day fc-widget-content fc-sun fc-past"
																							data-date="2017-04-02"></td>
																						<td
																							class="fc-day fc-widget-content fc-mon fc-past"
																							data-date="2017-04-03"></td>
																						<td
																							class="fc-day fc-widget-content fc-tue fc-today fc-state-highlight"
																							data-date="2017-04-04"></td>
																						<td
																							class="fc-day fc-widget-content fc-wed fc-future"
																							data-date="2017-04-05"></td>
																						<td
																							class="fc-day fc-widget-content fc-thu fc-future"
																							data-date="2017-04-06"></td>
																						<td
																							class="fc-day fc-widget-content fc-fri fc-future"
																							data-date="2017-04-07"></td>
																						<td
																							class="fc-day fc-widget-content fc-sat fc-future"
																							data-date="2017-04-08"></td>
																					</tr>
																				</tbody>
																			</table>
																		</div>
																		<div class="fc-content-skeleton">
																			<table>
																				<thead>
																					<tr>
																						<td class="fc-day-number fc-sun fc-past"
																							data-date="2017-04-02">2</td>
																						<td class="fc-day-number fc-mon fc-past"
																							data-date="2017-04-03">3</td>
																						<td
																							class="fc-day-number fc-tue fc-today fc-state-highlight"
																							data-date="2017-04-04">4</td>
																						<td class="fc-day-number fc-wed fc-future"
																							data-date="2017-04-05">5</td>
																						<td class="fc-day-number fc-thu fc-future"
																							data-date="2017-04-06">6</td>
																						<td class="fc-day-number fc-fri fc-future"
																							data-date="2017-04-07">7</td>
																						<td class="fc-day-number fc-sat fc-future"
																							data-date="2017-04-08">8</td>
																					</tr>
																				</thead>
																				<tbody>
																					<tr>
																						<td rowspan="2"></td>
																						<td rowspan="2"></td>
																						<td class="fc-event-container"><a
																							class="fc-day-grid-event fc-event fc-start fc-end fc-draggable"
																							style="background-color: #0073b7; border-color: #0073b7"><div
																									class="fc-content">
																									<span class="fc-time">10:30a</span> <span
																										class="fc-title">Meeting</span>
																								</div></a></td>
																						<td class="fc-event-container" rowspan="2"><a
																							class="fc-day-grid-event fc-event fc-start fc-end fc-draggable"
																							style="background-color: #00a65a; border-color: #00a65a"><div
																									class="fc-content">
																									<span class="fc-time">7p</span> <span
																										class="fc-title">Birthday Party</span>
																								</div></a></td>
																						<td rowspan="2"></td>
																						<td rowspan="2"></td>
																						<td rowspan="2"></td>
																					</tr>
																					<tr>
																						<td class="fc-event-container"><a
																							class="fc-day-grid-event fc-event fc-start fc-end fc-draggable"
																							style="background-color: #00c0ef; border-color: #00c0ef"><div
																									class="fc-content">
																									<span class="fc-time">12p</span> <span
																										class="fc-title">Lunch</span>
																								</div></a></td>
																					</tr>
																				</tbody>
																			</table>
																		</div>
																	</div>
																	<div class="fc-row fc-week fc-widget-content"
																		style="height: 107px;">
																		<div class="fc-bg">
																			<table>
																				<tbody>
																					<tr>
																						<td
																							class="fc-day fc-widget-content fc-sun fc-future"
																							data-date="2017-04-09"></td>
																						<td
																							class="fc-day fc-widget-content fc-mon fc-future"
																							data-date="2017-04-10"></td>
																						<td
																							class="fc-day fc-widget-content fc-tue fc-future"
																							data-date="2017-04-11"></td>
																						<td
																							class="fc-day fc-widget-content fc-wed fc-future"
																							data-date="2017-04-12"></td>
																						<td
																							class="fc-day fc-widget-content fc-thu fc-future"
																							data-date="2017-04-13"></td>
																						<td
																							class="fc-day fc-widget-content fc-fri fc-future"
																							data-date="2017-04-14"></td>
																						<td
																							class="fc-day fc-widget-content fc-sat fc-future"
																							data-date="2017-04-15"></td>
																					</tr>
																				</tbody>
																			</table>
																		</div>
																		<div class="fc-content-skeleton">
																			<table>
																				<thead>
																					<tr>
																						<td class="fc-day-number fc-sun fc-future"
																							data-date="2017-04-09">9</td>
																						<td class="fc-day-number fc-mon fc-future"
																							data-date="2017-04-10">10</td>
																						<td class="fc-day-number fc-tue fc-future"
																							data-date="2017-04-11">11</td>
																						<td class="fc-day-number fc-wed fc-future"
																							data-date="2017-04-12">12</td>
																						<td class="fc-day-number fc-thu fc-future"
																							data-date="2017-04-13">13</td>
																						<td class="fc-day-number fc-fri fc-future"
																							data-date="2017-04-14">14</td>
																						<td class="fc-day-number fc-sat fc-future"
																							data-date="2017-04-15">15</td>
																					</tr>
																				</thead>
																				<tbody>
																					<tr>
																						<td></td>
																						<td></td>
																						<td></td>
																						<td></td>
																						<td></td>
																						<td></td>
																						<td></td>
																					</tr>
																				</tbody>
																			</table>
																		</div>
																	</div>
																	<div class="fc-row fc-week fc-widget-content"
																		style="height: 107px;">
																		<div class="fc-bg">
																			<table>
																				<tbody>
																					<tr>
																						<td
																							class="fc-day fc-widget-content fc-sun fc-future"
																							data-date="2017-04-16"></td>
																						<td
																							class="fc-day fc-widget-content fc-mon fc-future"
																							data-date="2017-04-17"></td>
																						<td
																							class="fc-day fc-widget-content fc-tue fc-future"
																							data-date="2017-04-18"></td>
																						<td
																							class="fc-day fc-widget-content fc-wed fc-future"
																							data-date="2017-04-19"></td>
																						<td
																							class="fc-day fc-widget-content fc-thu fc-future"
																							data-date="2017-04-20"></td>
																						<td
																							class="fc-day fc-widget-content fc-fri fc-future"
																							data-date="2017-04-21"></td>
																						<td
																							class="fc-day fc-widget-content fc-sat fc-future"
																							data-date="2017-04-22"></td>
																					</tr>
																				</tbody>
																			</table>
																		</div>
																		<div class="fc-content-skeleton">
																			<table>
																				<thead>
																					<tr>
																						<td class="fc-day-number fc-sun fc-future"
																							data-date="2017-04-16">16</td>
																						<td class="fc-day-number fc-mon fc-future"
																							data-date="2017-04-17">17</td>
																						<td class="fc-day-number fc-tue fc-future"
																							data-date="2017-04-18">18</td>
																						<td class="fc-day-number fc-wed fc-future"
																							data-date="2017-04-19">19</td>
																						<td class="fc-day-number fc-thu fc-future"
																							data-date="2017-04-20">20</td>
																						<td class="fc-day-number fc-fri fc-future"
																							data-date="2017-04-21">21</td>
																						<td class="fc-day-number fc-sat fc-future"
																							data-date="2017-04-22">22</td>
																					</tr>
																				</thead>
																				<tbody>
																					<tr>
																						<td></td>
																						<td></td>
																						<td></td>
																						<td></td>
																						<td></td>
																						<td></td>
																						<td></td>
																					</tr>
																				</tbody>
																			</table>
																		</div>
																	</div>
																	<div class="fc-row fc-week fc-widget-content"
																		style="height: 107px;">
																		<div class="fc-bg">
																			<table>
																				<tbody>
																					<tr>
																						<td
																							class="fc-day fc-widget-content fc-sun fc-future"
																							data-date="2017-04-23"></td>
																						<td
																							class="fc-day fc-widget-content fc-mon fc-future"
																							data-date="2017-04-24"></td>
																						<td
																							class="fc-day fc-widget-content fc-tue fc-future"
																							data-date="2017-04-25"></td>
																						<td
																							class="fc-day fc-widget-content fc-wed fc-future"
																							data-date="2017-04-26"></td>
																						<td
																							class="fc-day fc-widget-content fc-thu fc-future"
																							data-date="2017-04-27"></td>
																						<td
																							class="fc-day fc-widget-content fc-fri fc-future"
																							data-date="2017-04-28"></td>
																						<td
																							class="fc-day fc-widget-content fc-sat fc-future"
																							data-date="2017-04-29"></td>
																					</tr>
																				</tbody>
																			</table>
																		</div>
																		<div class="fc-content-skeleton">
																			<table>
																				<thead>
																					<tr>
																						<td class="fc-day-number fc-sun fc-future"
																							data-date="2017-04-23">23</td>
																						<td class="fc-day-number fc-mon fc-future"
																							data-date="2017-04-24">24</td>
																						<td class="fc-day-number fc-tue fc-future"
																							data-date="2017-04-25">25</td>
																						<td class="fc-day-number fc-wed fc-future"
																							data-date="2017-04-26">26</td>
																						<td class="fc-day-number fc-thu fc-future"
																							data-date="2017-04-27">27</td>
																						<td class="fc-day-number fc-fri fc-future"
																							data-date="2017-04-28">28</td>
																						<td class="fc-day-number fc-sat fc-future"
																							data-date="2017-04-29">29</td>
																					</tr>
																				</thead>
																				<tbody>
																					<tr>
																						<td></td>
																						<td></td>
																						<td></td>
																						<td></td>
																						<td></td>
																						<td class="fc-event-container"><a
																							class="fc-day-grid-event fc-event fc-start fc-end fc-draggable"
																							href="http://google.com/"
																							style="background-color: #3c8dbc; border-color: #3c8dbc"><div
																									class="fc-content">
																									<span class="fc-time">12a</span> <span
																										class="fc-title">Click for Google</span>
																								</div></a></td>
																						<td></td>
																					</tr>
																				</tbody>
																			</table>
																		</div>
																	</div>
																	<div class="fc-row fc-week fc-widget-content"
																		style="height: 112px;">
																		<div class="fc-bg">
																			<table>
																				<tbody>
																					<tr>
																						<td
																							class="fc-day fc-widget-content fc-sun fc-future"
																							data-date="2017-04-30"></td>
																						<td
																							class="fc-day fc-widget-content fc-mon fc-other-month fc-future"
																							data-date="2017-05-01"></td>
																						<td
																							class="fc-day fc-widget-content fc-tue fc-other-month fc-future"
																							data-date="2017-05-02"></td>
																						<td
																							class="fc-day fc-widget-content fc-wed fc-other-month fc-future"
																							data-date="2017-05-03"></td>
																						<td
																							class="fc-day fc-widget-content fc-thu fc-other-month fc-future"
																							data-date="2017-05-04"></td>
																						<td
																							class="fc-day fc-widget-content fc-fri fc-other-month fc-future"
																							data-date="2017-05-05"></td>
																						<td
																							class="fc-day fc-widget-content fc-sat fc-other-month fc-future"
																							data-date="2017-05-06"></td>
																					</tr>
																				</tbody>
																			</table>
																		</div>
																		<div class="fc-content-skeleton">
																			<table>
																				<thead>
																					<tr>
																						<td class="fc-day-number fc-sun fc-future"
																							data-date="2017-04-30">30</td>
																						<td
																							class="fc-day-number fc-mon fc-other-month fc-future"
																							data-date="2017-05-01">1</td>
																						<td
																							class="fc-day-number fc-tue fc-other-month fc-future"
																							data-date="2017-05-02">2</td>
																						<td
																							class="fc-day-number fc-wed fc-other-month fc-future"
																							data-date="2017-05-03">3</td>
																						<td
																							class="fc-day-number fc-thu fc-other-month fc-future"
																							data-date="2017-05-04">4</td>
																						<td
																							class="fc-day-number fc-fri fc-other-month fc-future"
																							data-date="2017-05-05">5</td>
																						<td
																							class="fc-day-number fc-sat fc-other-month fc-future"
																							data-date="2017-05-06">6</td>
																					</tr>
																				</thead>
																				<tbody>
																					<tr>
																						<td></td>
																						<td></td>
																						<td></td>
																						<td></td>
																						<td></td>
																						<td></td>
																						<td></td>
																					</tr>
																				</tbody>
																			</table>
																		</div>
																	</div>
																</div>
															</div></td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
							<!-- /.box-body -->
						</div>
						<!-- /. box -->
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</section>
			<!-- /.content -->
		</div>
	</div>
</body>
</html>