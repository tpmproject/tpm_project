<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- Modal Subscription -->
<div class="modal fade modal-ext" id="createChannelModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-fullsize" role="document">
        <!--Content-->
        <div class="modal-content">
            <!--Header-->
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title w-100" id="myModalLabel">채널 생성</h4>
            </div>
            <!--Body-->
            <div class="modal-body">
                <div class="md-form">
                    <i class="fa fa-edit prefix"></i>
                    <!-- <i class="fa fa-edit" aria-hidden="true"></i> -->
                    <input type="text" id="form22" class="mform-control minput-text">
                    <label for="form22">채널명</label>
                    
                    <div class="row createChatChannel_content_div">
						<div class="col-sm-5">
							<!-- Using data attributes -->
							<select id="chat_myfriend_list_selectBefore" name="foods" multiple>
								
								
							</select>
						</div>
						<div class="col-sm-2 btMoveSelect_div">
							<!-- Using data attributes -->
							<button class="btn btn-sm btn-success waves-effect waves-light" onclick="moveSeleted('left')">
								<i class="fa fa-chevron-left"></i>
							</button>
							<button class="btn btn-sm btn-success waves-effect waves-light" onclick="moveSeleted('right')">
								<i class="fa fa-chevron-right"></i>
							</button>
						</div>
						<div class="col-sm-5">
							<!-- Using data attributes -->
							<select id="chat_myfriend_list_selectAfter" name="foods" multiple>
								
							</select>
						</div>
					</div>
                </div>
            </div>
            <!--Footer-->
            <div class="modal-footer">
           		<button class="mbtn mbtn-primary">생성</button>
                <button type="button" class="mbtn mbtn-default" data-dismiss="modal">닫기</button>
            </div>
        </div>
        <!--/.Content-->
    </div>
</div>