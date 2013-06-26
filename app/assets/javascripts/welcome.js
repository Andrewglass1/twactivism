//  TODO: after clicking on a SL, these params come in...
//poli_ids"=>["", "1", "3"]
// maybe on the form clear?

$(document).ready(function() {

  var tweeter = {
    addSubmitListener: function(){
      $('#submit-button').click(function(){
        poli_ids = tweetChosen.fetchSelected()
        content = $('#tweet-content').val()
        tweeter.createTweets(content, poli_ids)
        tweeter.clearForms()
        return false
      });
    },

    createTweets: function(content, poli_ids){
      $.ajax({
        type: "POST",
        url: '/tweets',
        data: {content: content, poli_ids: poli_ids },
        dataType: "json",
        success: function(data){
          tweeter.successTweet(data)
        },
        error: function(){
          tweeter.errorTweet(data)

        }
      });
    },

    updateSelectedList: function(selected){
      tweeter.clearSelectedList()

      _.each(selected, function(poli_id){
        tweeter.appendToSelectedList(poli_id)
      });
    },

    successTweet: function(){
      navigate.moveToShare()
      console.log("this is what happens after a successful tweet")
    },

    errorTweet: function(){
      console.log("this is what happens after an error tweet")
    },

    clearSelectedList: function(){
      $('#selected-list li').remove()
    },

    appendToSelectedList: function(poli_id){
      poli_item= $('#politician-select option[value='+poli_id+']').data()
      politician = Mustache.to_html($('#stache-selected-politician').html(), poli_item)
      $('#selected-list').append(politician)
    },

    clearForms: function(){
      $("#politician-select").val('').trigger("liszt:updated");
      $('#tweet-content').val('');
    }
  }


  var shitList = {

    addSubmitListener: function(){
      $('#shitlist-submit').click(function(){
        poli_ids = shitListChosen.fetchSelected()
        title = $("#shitlist-title").val()
        about = $("#shitlist-about").val()
        more = $("#shitlist-more").val()
        data = {ids: poli_ids, title: title, about: about, more: more}
        shitList.createShitList(data)
        shitList.clearForms()
        $('#shitlist-modal').modal('hide')
        return false
      });
    },

    createShitList: function(shit_list_data){
      $.ajax({
        type: "POST",
        url: '/shit_lists',
        data: {shit_list: shit_list_data},
        dataType: "json",
        success: function(data){ shitList.successList(data)},
        error: function(){ shitList.errorList()}
      });
    },

    successList: function(data){
      sl = Mustache.to_html($('#stache-shitlist').html(), data)
      $('#shit-lists').append(sl)
      tweetChosen.selectPoliticians(data['poli_ids'].split(","))
      console.log("this is what happens after a successful list creation")
    },

    errorList: function(){
      console.log("this is what happens after an error list creation")
    },

    clearForms: function(){
      $("#shitlist-create").val('').trigger("liszt:updated");
      $("#shitlist-title").val('')
      $("#shitlist-about").val('')
      $("#shitlist-more").val('')
    },

    populateFormListener: function(){
      $('.shit-list-link').click(function(){
        $("#politician-select").val('').trigger("liszt:updated");
        poli_ids = $(this).attr('data-poli-ids').split(",")
        tweetChosen.selectPoliticians(poli_ids)
      });
    }
  }

  var tweetChosen = {
    initialize: function(){
      $('#politician-select').chosen()
    },

    fetchSelected: function(){
      ids = _.map($('#politician-select option:checked'), function(item){ return item.value; });
      return _.compact(ids);
    },

    addListener: function(){
      $("#politician-select").bind('change',function() {
        selected_ids = tweetChosen.fetchSelected()
        tweeter.updateSelectedList(selected_ids)
      });
    },

    selectPoliticians: function(poli_ids) {
      _.each(poli_ids, function(id){
        $('.politician-select[value=' + id + ']').prop('selected', true)
      })
      tweeter.updateSelectedList(poli_ids)
      $('#politician-select').trigger('liszt:updated')
    }

  }

  var shitListChosen = {
    initialize: function(){
      $('#shitlist-create').chosen()
    },

    fetchSelected: function(){
      return _.map($('#shitlist-create option:checked'), function(item){ return item.value; });
    }
  }

  var navigate = {
    initialize: function(){
      $('#myCarousel').carousel({
        interval: false
      })
      navigate.clickListeners();
    },

    clickListeners: function(){
      $('#compose-button').click(function(){
        if(navigate.canCompose()){ 
          $('#myCarousel').carousel(1)
          navigate.currentTo('compose')
        }
        else{
          alert("please select at least one politician to tweet")
          //TODO maybe make this show error on page va JS alert
        }
      });

      $('#return-address').click(function(){
        $('#myCarousel').carousel(0)
        navigate.currentTo('address')
      })
    },

    canCompose: function(){
      if(tweetChosen.fetchSelected().length == 0){
        return false
      }
      else{return true}      
    },

    moveToShare: function(data){
     $('#myCarousel').carousel(2)
     navigate.currentTo('share')
    },

    currentTo: function(name){
      $('#user-status li').removeClass('active')
      $('#user-status li[id=' + name + ']').addClass('active')
    }
  }

  tweeter.addSubmitListener()
  tweetChosen.addListener()

  tweetChosen.initialize()


  shitList.addSubmitListener()
  shitList.populateFormListener()

  shitListChosen.initialize()

  navigate.initialize()

});
    

