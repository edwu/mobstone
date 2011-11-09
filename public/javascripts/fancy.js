jQuery(document).ready(function(){
    ///////////////////////////////
// Functions
///////////////////////////////
    function isotopeAnimationEngine(){
        if(jQuery.browser.mozilla){
            return "jquery";
        }else{
            return "css";
        }
    }
    jQuery.noConflict();
    jQuery(document).ready(function(){
    ///////////////////////////////
    //Project thumbs
    ///////////////////////////////
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
    jQuery('.thumbs.masonry').isotope({
    // options
    itemSelector : '.project.small',
    layoutMode : 'masonry',
    animationEngine: isotopeAnimationEngine()
    });
    jQuery(".project.small").css("opacity", "1");
    jQuery('#filterNav a').click(function(){
    var selector = jQuery(this).attr('data-filter');
    jQuery('#projects .thumbs').isotope({
    filter: selector,
    hiddenStyle : {
    opacity: 0,
    scale : 1
    }
    });
    if ( !jQuery(this).hasClass('selected') ) {
    jQuery(this).parents('#filterNav').find('.selected').removeClass('selected');
    jQuery(this).addClass('selected');
    }
    return false;
    });
    ///////////////////////////////
    //Lightbox
    ///////////////////////////////
    jQuery("a[rel^='prettyPhoto']").prettyPhoto({
    social_tools: false,
    deeplinking: false
    });
    ///////////////////////////////
    //Social Links
    ///////////////////////////////
    jQuery("#socialLinks a").hover(
    function() {
    jQuery(this).stop().fadeTo("fast", 1);
    },
    function() {
    jQuery(this).stop().fadeTo("fast", .5);
    });
    });




});
function milestone(percentage) {
    if (percentage > 1) {
        percentage = 1;
    }
    var height = jQuery('#thermometer').height();
    jQuery('#people').css('height', percentage * height + 20 + "px" );
    jQuery('#arrow').css('bottom', percentage * height + "px" );
    jQuery('#arrow_people').css('bottom', percentage * height + "px" );

}

function milestones(index, percentage) {
    jQuery('#milestone'+index).css('bottom', percentage * jQuery('#thermometer').height() - 10+ "px" );
}

jQuery('people').hover(
    function () {


    }
)