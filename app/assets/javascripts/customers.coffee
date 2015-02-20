

$.rails.allowAction = (link) ->
  return true unless link.attr('data-confirm')
  $.rails.showConfirmDialog(link) # look bellow for implementations
  false # always stops the action since code runs asynchronously

$.rails.confirmed = (link) ->
  link.removeAttr('data-confirm')
  link.trigger('click.rails')

$.rails.showConfirmDialog = (link) ->
  message = link.attr 'data-confirm'
  html = """
		<div class="modal fade" data-backdrop="static" data-keyboard="true" id="confirmation-dialog">
         <div class="modal-dialog">
    		<div class="modal-content">
      		<div class="modal-header">
             <a class="close" data-dismiss="modal">×</a>
             <h3>#{message}</h3>
           </div>
           <div class="modal-body">
             <p>Are you sure you want to delete?</p>
           </div>
           <div class="modal-footer">
             <a data-dismiss="modal" class="btn">Cancel</a>
             <a data-dismiss="modal" class="btn btn-primary confirm" id="confirm-btn">OK</a>
           </div>
         </div>
         </div>
         </div>
         """
  $(html).modal('show')
  $(document).on 'click', '#confirm-btn', (event) -> $.rails.confirmed(link)