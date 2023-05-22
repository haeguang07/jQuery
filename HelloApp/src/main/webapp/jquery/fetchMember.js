$(function () {
  $(`#list`).remove();
  $(`#show2`).remove();
  $(`#show`).empty();
  $('#show').before('<h3>회원목록</h3>');
  fetch('MOCK_DATA.json')
    .then(function (resolve) {
      return resolve.json();
    })
    .then(makeList)
    .catch(function (err) {
      console.log(err);
    })


    //등록 이벤트
    $('#addBtn').on('click',function(){
      if(!$('#id').val()||!$('#lastName').val()||!$('#firstName').val()||
      !$('#email').val()||!$('#salary').val()){
        alert('값을 모두 입력하세요');
        return;
      }
      let member ={};
      member.id=$('#id').val();
      member.first_name=$('#firstName').val();
      member.last_name=$('#lastName').val();
      member.gender=$('#gender').val();
      member.email=$('#email').val();
      member.salary=$('#salary').val();
      console.log(member);
     $('#memberList').append(makeTr(member));
     $('table:eq(0)').find('input').val('');
    })




  function makeHead() {
    $('table:eq(1)').prepend(
      $('<thead />').append($('<tr/>').append($("<th /> ").text('ID'),
                            $('<th />').text('이름'),
                            $('<th />').text('성'),
                            $('<th />').text('성별'),
                            $('<th />').text('이메일'),
                            $('<th />').text('급여'),
                            $('<th />').text('삭제'),
                            $('<th />').append($('<input type="checkbox">').on('click',selectAll)))
                            ));
  }
  //전체선택 
  function selectAll(e){
    
    if($(e.target).is(':checked')){
      $('input:checkbox').prop('checked',true);
    }else{
      $('input:checkbox').prop('checked',false);
    }
  }


  function makeList(result) {
    console.log(result);
    let tbl = $('<table border="1" />');
    let tbd = $('<tbody />').attr('id', 'memberList');
    result.forEach(function(member,idx) {
      if(idx<5){
        tbd.append(makeTr(member));
      }
    });
    tbl.append(tbd);
    $('#show').append(tbl);
    makeHead();
  }
  //tr만들기
  function makeTr(member){
    let tr = $('<tr />').append($('<td />').text(member.id),
                                $('<td />').text(member.first_name),
                                $('<td />').text(member.last_name),
                                $('<td />').text(member.gender),
                                $('<td />').text(member.email),
                                $('<td />').text(member.salary),
                                $('<td />').append($('<button>삭제</button>').on('click', delmember)),
                                $('<td />').append($('<input type="checkbox">')))
  tr.on('mouseover',addInput)                              
  return tr;
  }
 


  //라이브 이벤트
  $('body').on('dblclick','#memberList>tr',function(){
    let oldTr = $(this);
    let newTr = $('<tr />').append(
      $('<td/>').text(oldTr.children().eq(0).text()),
      $('<td/>').append($('<input />').val(oldTr.children().eq(1).text())),
      $('<td/>').append($('<input />').val(oldTr.children().eq(2).text())),
      $('<td/>').text(oldTr.children().eq(3).text()),
      $('<td/>').text(oldTr.children().eq(4).text()),
      $('<td/>').text(oldTr.children().eq(5).text()),
      $('<td/>').append($('<button>수정</button>').on('click',updateTr))
    );
    
    oldTr.replaceWith(newTr);
  })
  $('#moveBtn').on('click',function(){
    let checkbox=$('#memberList input:checkbox:checked');
    let nextTr=checkbox.last().parent().parent().next();
    
    let data=checkbox.parent().parent().detach();
    if(nextTr.length==0){
      data.prependTo(checkbox.parent().parent().parent());
      return;
    }else{
      nextTr.after(data);
    }
  })
  //수정기능
  function updateTr(e){
    let oldTr=$(e.target).parent().parent();
    let newTr=$('.template').clone();
    newTr.find('td:eq(0)').text(oldTr.find('td:eq(0)').text());
    newTr.find('td:eq(1)').text(oldTr.find('td:eq(1)>input').val());
    newTr.find('td:eq(2)').text(oldTr.find('td:eq(2)>input').val());
    newTr.find('td:eq(3)').text(oldTr.find('td:eq(3)').text());
    newTr.find('td:eq(4)').text(oldTr.find('td:eq(4)').text());
    newTr.find('td:eq(5)').text(oldTr.find('td:eq(5)').text());
    newTr.find('td:eq(6)>button').on('click',delmember);
    newTr.toggleClass('template');
    oldTr.replaceWith(newTr)
  }
  //변경 기능
  $('#modifyBtn').on('click',modify)
  function modify(){
    // if($('#id').val('')||$('#lastName').val('')||$('#firstName').val('')||
    // $('#email').val('')||$('#salary').val('')){
    //   alert('값을 모두 입력하세요');
    //   return;
    // }
    if($(`#memberList tr>td:nth-of-type(1):contains(`+$('#id').val()+`)`).length!=0){
      
        let newTr=$('.template').clone();
        newTr.find('td:eq(0)').text($('#id').val());
        newTr.find('td:eq(1)').text($('#firstName').val());
        newTr.find('td:eq(2)').text($('#lastName').val());
        newTr.find('td:eq(3)').text($('#gender').val());
        newTr.find('td:eq(4)').text($('#salary').val());
        newTr.find('td:eq(5)').text($('#salary').val());
        newTr.find('td:eq(6)>button').on('click',delmember);
        newTr.toggleClass('template');
        $(`#memberList tr>td:nth-of-type(1):contains(`+$('#id').val()+`)`).parent().replaceWith(newTr);
        $('table:eq(0)').find('input').val('');
      }else{
       alert('해당 ID가 존재하지 않습니다')
     }
  }



  function addInput(e){
    $(e.target).parent().find('td');
  }
  function delmember(e) {
    $(e.target).parentsUntil($('#memberList')).remove();
  }
})