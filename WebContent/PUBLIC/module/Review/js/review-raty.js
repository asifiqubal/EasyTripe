function reviewraty (id, hintlist, hintnumber, score_num)
{
	score_num = (score_num) ? score_num : undefined;
	$('#'+id).after('<div id="'+id+'_review"></div>');
    $('#'+id+'_review').raty({
      path: 'vendor/scripts/raty/images/',						  
      hints:	  hintlist,
      number:     hintnumber,
	  score:      score_num,
      click: function(score, evt) {
        //alert('ID: ' + this.attr('id') + '\nscore: ' + score + '\nevent: ' + evt.hint);
        $('#'+id).val(score);
      }						 
    });
}