{include file='_head.tpl'}
{include file='_header.tpl'}

<style>
.search-wrapper-prnt {
display: none !important
}
.ccbill-icon-wrap.pending {
    background: rgba(243, 156, 18, .12);
}
.ccbill-icon-wrap.paid {
    background: rgba(46, 204, 113, .12);
}
.ccbill-icon-wrap.failed {
    background: rgba(231, 76, 60, .12);
}
.ccbill-pulse-bar {
    height: 4px;
    border-radius: 4px;
    background: #f0f0f0;
    overflow: hidden;
    margin: 28px auto 0;
    max-width: 260px;
}
.ccbill-pulse-bar span {
    display: block;
    height: 100%;
    width: 40%;
    background: linear-gradient(90deg, transparent, #f39c12, transparent);
    border-radius: 4px;
    animation: ccbill-sweep 1.6s ease-in-out infinite;
}
@keyframes ccbill-sweep {
    0% {
      transform: translateX(-100%);
    }

    100% {
      transform: translateX(360%);
    }
  }
</style>

<!-- page content -->
<div class="row x_content_row">
    <!-- content panel -->
    <div class="col-lg-12 w-100">
		<div class="notfound-wrapper h-100 d-flex align-items-center justify-content-center p-3">
			<div class="notfound text-center mx-auto">
				{if $payment['payment_status'] == 'pending'}
					<div class="ccbill-icon-wrap pending d-inline-flex align-items-center justify-content-center rounded-circle p-4 mb-4">
						<svg width="32" height="32" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M19.75 2.25C20.3023 2.25 20.75 2.69772 20.75 3.25C20.75 3.80228 20.3023 4.25 19.75 4.25H19.25V5.2041C19.25 6.62309 18.6377 7.96785 17.5811 8.89062L17.3643 9.06836L13.585 12L17.3643 14.9316L17.5811 15.1094C18.6377 16.0322 19.25 17.3769 19.25 18.7959V19.75H19.75C20.3023 19.75 20.75 20.1977 20.75 20.75C20.75 21.3023 20.3023 21.75 19.75 21.75H4.25C3.69772 21.75 3.25 21.3023 3.25 20.75C3.25 20.1977 3.69772 19.75 4.25 19.75H4.75V18.7959C4.75 17.2826 5.44667 15.8545 6.63574 14.9316L10.4141 12L6.63574 9.06836C5.44667 8.14553 4.75 6.7174 4.75 5.2041V4.25H4.25C3.69772 4.25 3.25 3.80228 3.25 3.25C3.25 2.69772 3.69772 2.25 4.25 2.25H19.75ZM6.68359 4.25V5.2041C6.68359 6.11222 7.10179 6.96975 7.81543 7.52344L12 10.7695L16.1846 7.52344L16.3154 7.41504C16.9491 6.86139 17.3164 6.05524 17.3164 5.2041V4.25H6.68359Z" fill="#f39c12"/></svg>
					</div>
					<h2 class="headline-font">{__("Payment Pending")}</h2>
					<p class="sub">{__("Your payment is being processed. This usually takes just a moment — please stay on this page.")}</p>
					<div id="ccbill-status-checker" class="mt-4">
						<div class="ccbill-pulse-bar"><span></span></div>
						<div id="ccbill-check-msg" class="small text-muted mt-3">
							<i class="fa-solid fa-circle-notch fa-spin"></i> {__("Checking payment status")}...
						</div>
					</div>

				{elseif $payment['payment_status'] == 'paid'}
					<div class="ccbill-icon-wrap paid d-inline-flex align-items-center justify-content-center rounded-circle p-4 mb-4">
						<svg width="32" height="32" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M18.2783 6.30748C18.6605 5.90909 19.2938 5.8961 19.6924 6.27818C20.0908 6.66039 20.1038 7.29365 19.7217 7.69224L11.1358 16.6483C10.8223 16.9753 10.5189 17.2956 10.2354 17.5213C9.93056 17.764 9.52694 17.9999 9.00001 17.9999C8.47311 17.9998 8.06946 17.7639 7.76466 17.5213C7.48108 17.2956 7.17771 16.9753 6.86427 16.6483L4.27833 13.951C3.8962 13.5524 3.90905 12.9192 4.30763 12.537C4.70632 12.1548 5.33952 12.1686 5.72169 12.5672L8.30763 15.2645C8.65244 15.6242 8.84834 15.8243 9.00001 15.9471C9.1517 15.8243 9.34755 15.6243 9.6924 15.2645L18.2783 6.30748Z" fill="#2ecc71"/></svg>
					</div>
					<h2 class="headline-font">{__("Payment Successful")}</h2>
					<p class="sub">{__("Your payment has been confirmed. You will be redirected to the payment page shortly.")}</p>
					<a class="btn btn-success mt-3" href="{$payment['success_url']}">{__("Continue")}</a>

				{elseif $payment['payment_status'] !== 'failed'}
					<div class="ccbill-icon-wrap failed d-inline-flex align-items-center justify-content-center rounded-circle p-4 mb-4">
						<svg width="32" height="32" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M17.293 5.29295C17.6835 4.90243 18.3165 4.90243 18.707 5.29295C19.0976 5.68348 19.0976 6.31649 18.707 6.70702L13.4131 12L18.7061 17.293L18.7754 17.3691C19.0954 17.7619 19.0721 18.341 18.7061 18.707C18.3399 19.0731 17.7609 19.0958 17.3682 18.7754L17.292 18.707L11.999 13.414L6.70802 18.706C6.3175 19.0966 5.68449 19.0965 5.29396 18.706C4.90344 18.3155 4.90344 17.6825 5.29396 17.292L10.585 12L5.29298 6.70799L5.22462 6.63182C4.90423 6.23907 4.92691 5.66007 5.29298 5.29393C5.65897 4.92794 6.23811 4.9046 6.63087 5.22459L6.70705 5.29393L11.999 10.5859L17.293 5.29295Z" fill="#e74c3c"/></svg>
					</div>
					<h2 class="headline-font">{__("Payment Failed")}</h2>
					<p class="sub">{__("Something went wrong with your payment. Please try again or contact support for assistance.")}</p>
				{/if}
			</div>
		</div>
    </div>
    <!-- content panel -->
</div>
<!-- page content -->

{if $payment['payment_status'] == 'pending'}
  <script>
    var ccbillStatusInterval = setInterval(function() {
      var statusCheckUrl = api['payments/ccbill_status_check'] + '?' + window.location.search.slice(1);
      $.post(statusCheckUrl, {}, function(response) {
        if (response.callback) {
          clearInterval(ccbillStatusInterval);
          $('.ccbill-pulse-bar').hide();
          $('#ccbill-check-msg').removeClass('info danger').addClass('success').html('<i class="fa-solid fa-check"></i> {__("Payment confirmed! Redirecting")}...');
          eval(response.callback);
        } else if (response.payment_status && response.payment_status !== 'pending') {
          clearInterval(ccbillStatusInterval);
          location.reload();
        } else {
          $('#ccbill-check-msg').removeClass('danger').addClass('info').html('<i class="fa-solid fa-circle-notch fa-spin"></i> {__("Still processing")} &mdash; {__("checking again in 5 seconds")}...');
        }
      }).fail(function() {
        $('#ccbill-check-msg').removeClass('info success').addClass('danger').html('<i class="fa-solid fa-triangle-exclamation"></i> {__("Could not reach the server, retrying")}...');
      });
    }, 5000);
  </script>
{/if}

{include file='_footer.tpl'}