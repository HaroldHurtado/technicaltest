document.addEventListener("turbolinks:load", function () {
    function init(){
        $('#input_api_key').val('');
        $('#div_container_result').hide();
        $('#div_container_input').empty();
        $('#tb_result').empty();
    }

    init();

    $('#btn_reset_input').click(function(){
        init();
    });

    $('#btn_show_duplicate').click(function(){

        var api_key = $('#input_api_key').val();
        var dataString = [];

        $('#div_container_input').find('input:text').each(function() {
            dataString.push($(this).val());
        });

        var postData = {
            api_key: api_key,
            data: dataString
        };

        if(isFormValid()){
            findDuplicate(postData);
        }

    });

    function isFormValid(){
        if(isKeyValid() &&  isWorksValid()){
            return true;
        }else {
            return false;
        }
    }

    function isEmpty(value){
        var isEmpty = false;
        var new_value=$.trim(value);

        if(new_value.length == 0){
            isEmpty = true;
        }

        return isEmpty;
    }

    function isKeyValid(){
        if(isEmpty($('#input_api_key').val())){
            alert("Enter key");
            return false;
        }
        else{
            return true;
        }
    }

    function isWorksValid(){
        var total_work = 0;

        $('#div_container_input').find('input:text').each(function() {
            total_work++;
        });

        if(total_work == 0){
            alert("You must enter words");
            return false;
        }
        else{
            return true;
        }
    }
    function findDuplicate(postData){
        $.ajax({
            url:'/api_keys/find_duplicates/0',
            type:'POST',
            dataType:'json',
            data:postData,
            success:function(data){

                if(data.status == 'success'){
                    $('#div_container_result').show();
                    $('#tb_result').empty();
                    var duplicates = data.duplicates;

                    for(i = 0; i < duplicates.length; i++){
                        $('#tb_result').append('<tr><td>'+duplicates[i].word+'</td><td>'+duplicates[i].positions+'</td></tr>');
                    }
                }else{
                    alert(data.message)
                }

            },
            error:function(data){
                console.log("error");
                alert(data);
            }
        });
    }

    $('#btn_add_input').click(function(){
        $('#div_container_input').append("<div><input type='text'></input><button class'btn-remove'>Remove</button></div>");

        $('#div_container_input > div > button').each(function() {
            $(this).click(function(){
                $(this).parent().remove();
            });
        });
    });
});
