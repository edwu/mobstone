jQuery(document).ready(
    function(){
    jQuery(".project.small a").hover(
        function() {
            jQuery(this).find('img:last').stop().fadeTo("fast", .9);
            jQuery(this).find('img:last').attr('title','');
        },
        function() {
            jQuery(this).find('img:last').stop().fadeTo("fast", 1);
    });

    jQuery(".project.small a").hover(
        function() {
        jQuery(this).find('.title').stop().fadeTo("fast", 1);
        },
        function() {
        jQuery(this).find('.title').stop().fadeTo("fast", 0);
    });
});
