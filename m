Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8504292B74
	for <lists+linux-omap@lfdr.de>; Mon, 19 Oct 2020 18:28:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730599AbgJSQ22 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 19 Oct 2020 12:28:28 -0400
Received: from netrider.rowland.org ([192.131.102.5]:38569 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1730593AbgJSQ21 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 19 Oct 2020 12:28:27 -0400
Received: (qmail 902149 invoked by uid 1000); 19 Oct 2020 12:28:26 -0400
Date:   Mon, 19 Oct 2020 12:28:26 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Winischhofer <thomas@winischhofer.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        "Ahmed S. Darwish" <a.darwish@linutronix.de>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Johan Hovold <johan@kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>, linux-omap@vger.kernel.org,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, Felipe Balbi <balbi@kernel.org>,
        Duncan Sands <duncan.sands@free.fr>
Subject: Re: [patch V2 09/13] USB: host: ehci-pmcmsp: Cleanup
 usb_hcd_msp_remove()
Message-ID: <20201019162826.GB898631@rowland.harvard.edu>
References: <20201019100629.419020859@linutronix.de>
 <20201019101110.530302737@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201019101110.530302737@linutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, Oct 19, 2020 at 12:06:38PM +0200, Thomas Gleixner wrote:
> usb_hcd_msp_remove() has a pdev argument which isn't used and the function
> is used only within this file.
> 
> Remove pdev and make usb_hcd_msp_remove() static.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> ---
> V2: Split out from comments patch
> ---
>  drivers/usb/host/ehci-pmcmsp.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> --- a/drivers/usb/host/ehci-pmcmsp.c
> +++ b/drivers/usb/host/ehci-pmcmsp.c
> @@ -236,7 +236,7 @@ int usb_hcd_msp_probe(const struct hc_dr
>   * may be called without controller electrically present
>   * may be called with controller, bus, and devices active
>   */
> -void usb_hcd_msp_remove(struct usb_hcd *hcd, struct platform_device *dev)
> +static void usb_hcd_msp_remove(struct usb_hcd *hcd)
>  {
>  	usb_remove_hcd(hcd);
>  	iounmap(hcd->regs);
> @@ -309,7 +309,7 @@ static int ehci_hcd_msp_drv_remove(struc
>  {
>  	struct usb_hcd *hcd = platform_get_drvdata(pdev);
>  
> -	usb_hcd_msp_remove(hcd, pdev);
> +	usb_hcd_msp_remove(hcd);
>  
>  	/* free TWI GPIO USB_HOST_DEV pin */
>  	gpio_free(MSP_PIN_USB0_HOST_DEV);

Acked-by: Alan Stern <stern@rowland.harvard.edu>
