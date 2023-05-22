  // document.addEventListener('DOMContentLoaded',function(){
    //   let li = document.createElement('li');
    //   li.innerText='Chery';
    //   console.log(li);
    //   document.querySelector('#list').append(li);
    // })

    //jquery
    $(document).ready(function(){   
      $('#list').append($('<li/>').text('Cherry'),
                        $('<li/>').text('Mango'));
    })