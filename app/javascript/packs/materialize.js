document.addEventListener("turbolinks:load", function () {
    $(function() {
    
    $('.dropdown-trigger').dropdown({
        constrainWidth:false,
        coverTrigger:false,
        alignment:'left'
    });

    $(document).ready(function(){
        $('.collapsible').collapsible();
    });


    $(document).ready(function(){
        $('.modal').modal();
    });

    $(document).ready(function(){
        $('.sidenav').sidenav();
    });

    $(document).ready(function(){
        $('.sidenav-trigger').sidenav();
    });

    $('.chips-autocomplete').chips({
    placeholder: 'Enter a tag',
    secondaryPlaceholder: '+Tag',
    autocompleteOptions: {
        data: {
        'Apple': null,
        'Microsoft': null,
        'Google': null
        },
        limit: Infinity,
        minLength: 1
    }
    });

    $(document).on('click', function(e) {
        // ２．クリックされた場所の判定
        if(!$(e.target).closest('.dropdown-trigger').length && !$(e.target).closest('#button').length){
            $('.dropdown-content').fadeOut();
        }else if($(e.target).closest('#button').length){
            // ３．ポップアップの表示状態の判定
            if($('.dropdown-content').is(':hidden')){
                $('dropdown-content').fadeIn();
            }else{
                $('.dropdown-content').fadeOut();
            }
        }
    });
});
});

