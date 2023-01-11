$(function(){
	let currentPage;
	let count;
	let rowCount;
	
	//리뷰 목록
	function selectList(pageNum){
		currentPage = pageNum;
		
		//로딩 이미지 노출
		$('#loding').show();
		
		$.ajax({
			url:'listReview.do',
			type:'post',
			data:{pageNum:pageNum,pro_num:$('#pro_num').val()},
			dataType:'json',
			success:function(param){
				//로딩 이미지 감추기
				$('#loading').hide();
				count = param.count;
				rowCount = param.rowCount;
				
				if(pageNum == 1){
					//처음 호출시는 목록을 표시하는 div의 내부 내용 제거
					$('#output').empty();
				}
				
				$(param.list).each(function(index,game){
					let output = '<div class="game">';
					output += '<h4>' + game.id + '</h4>';
					output += '<div class="sub-game">';
					output += '<p>' + game.rev_content + '</p>';
					
					if(game.rev_modifydate){
						output += '<span class="modify-date"> 최근 수정일 : ' + game.rev_modifydate + '</span>';
					}else{
						output += '<span class="modify-date"> 등록일 : ' + game.rev_date + '</span>';
					}
					
					//로그인한 회원번호와 작성자의 회원번호 일치 여부 체크
					if(param.user_num == game.mem_num){
						//로그인한 회원번호와 작성자 회원번호 일치
						output += ' <input type="button" data-renum="'+game.rev_num+'" value="수정" class="modify-btn">';
						output += ' <input type="button" data-renum="'+game.rev_num+'" value="삭제" class="delete-bnt">';
					}
					
					output += '<hr size="1" noshade width="100%">';
					output += '</div>';
					output += '</div>';
					
					//문서 객체에 추가
					$('#output').append(output);
				});//end of each
				
				//page button 처리
				if(currentPage >= Math.ceil(count/rowCount)){
					//다음 페이지가 없음
					$('.paging-button').hide();
				}else{
					//다음 페이지가 존재
					$('.paging-button').show();
				}
			},
			error:function(){
				$('#loading').hide();
				alert('네트워크 오류 발생');
			}
		});
	
	}
	
	//페이지 처리 이벤트 연결(다음 리뷰 보기 버튼 클릭시 데이터 추가)
	$('.paging-button input').click(function(){
		selectList(currentPage + 1);
	});
	//리뷰 등록
	$('#re_form').submit(function(event){
		//기본 이벤트 제거
		event.preventDefault();
		
		if($('#rev_content').val().trim()==''){
			alert('내용을 입력하세요!');
			$('#rev_content').val('').focus();
			return false;
		}
		
		//form 이하의 태그에 입력한 데이터를 모두 읽어 옴
		let form_data = $(this).serialize();
		
		//리뷰 등록
		$.ajax({
			url:'writeReview.do',
			type:'post',
			data:form_data,
			dataType:'json',
			success:function(param){
				if(param.result == 'logout'){
					alert('로그인해야 작성할 수 있습니다.');
				}else if(param.result == 'success'){
					//폼 초기화
					initForm();
					//리뷰 작성 성공 시, 성공 리뷰 포함하여 첫번째 페이지 리뷰글 다시 호출
					selectList(1);
				}else{
					alert('댓글 등록 오류 발생');
				}
			},
			error:function(){
				alert('네트워크 오류');
			}
		});
		
	});
	//리뷰 작성 폼 초기화
	function initForm(){
		$('sub-game').show();
		$('#mre_form').remove();
	}
	//리뷰 수정
	$(document).on('submit','#mre_form',function(event){
		//기본 이벤트 제거
		event.preventDefault();
		
		if($('#mre_content').val().trim()==''){
			alert('내용을 입력하세요');
			$('#mre_content').val('').foucus();
			return false;
		}
		
		//폼에 입력한 데이터 반환
		let form_data = $(this).serialize();
		
		//서버와 통신
		$.ajax({
			url:'updateReview.do',
			type:'post',
			data:form_data,
			dataType:'json',
			success:function(param){
				if(param.result == 'logout'){
					alert('로그인해야 수정할 수 있습니다.')
				}else if(param.result == 'success'){
					$('#mre_form').parent().find('p')
						.html($('#mre_content').val()
												.replace(/</g,'$lt;')
												.replace(/>/g,'$gt;')
												.replace(/\n/g, '<br>'));
					$('#mre_form').parent()
								  .find('.modify-data').text('최근 수정일 : 5초미만');
					//수정폼 삭제 및 초기화
					initModifyForm();
				}else if(param.result == 'wrongAccess'){
					alert('타인의 글을 수정할 수 없습니다.');
				}else{
					alert('리뷰 수정 오류 발생');
				}
			},
			error:function(){
				alert('네트워크 오류 발생');
			}
		});
	});
	//리뷰 삭제 
	$(document).on('click','delete-btn',function(){
		//리뷰 번호
		let rev_num = $(this).attr('data-renum');
		
		//서버와 통신
		$.ajax({
			url:'deleteReview.do',
			type:'post',
			data:{rev_num:rev_num},
			dataType:'json',
			success:function(param){
				if(param.result == 'logout'){
					alert('로그인해야 삭제할 수 있습니다.');
				}else if(param.result == 'success'){
					alert('삭제 완료!!');
					selectList(1);
				}else if(param.result == 'wrongAccess'){
					alert('타인의 글을 삭제할 수 없습니다.');
				}else{
					alert('댓글 삭제 오류 발생');
				}
			},
			error:function(){
				alert('네트워크 오류 발생');
			}
		});
		
	});
	
	//초기 데이터(목록) 호출
	selectList(1);

});	