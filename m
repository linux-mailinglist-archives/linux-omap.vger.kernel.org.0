Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B53A46DCB7
	for <lists+linux-omap@lfdr.de>; Wed,  8 Dec 2021 21:09:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240011AbhLHUNY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 8 Dec 2021 15:13:24 -0500
Received: from fgw23-4.mail.saunalahti.fi ([62.142.5.110]:13099 "EHLO
        fgw23-4.mail.saunalahti.fi" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240009AbhLHUNX (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 8 Dec 2021 15:13:23 -0500
Received: from darkstar.musicnaut.iki.fi (85-76-66-106-nat.elisa-mobile.fi [85.76.66.106])
        by fgw23.mail.saunalahti.fi (Halon) with ESMTP
        id 8dfc9ff7-5860-11ec-877a-005056bdfda7;
        Wed, 08 Dec 2021 21:53:47 +0200 (EET)
Date:   Wed, 8 Dec 2021 21:53:46 +0200
From:   Aaro Koskinen <aaro.koskinen@iki.fi>
To:     Sergey Shtylyov <s.shtylyov@omp.ru>
Cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        linux-omap@vger.kernel.org
Subject: Re: [PATCH v2 09/10] usb: host: ohci-omap: fix deferred probing
Message-ID: <20211208195346.GC799423@darkstar.musicnaut.iki.fi>
References: <20211208192118.7483-1-s.shtylyov@omp.ru>
 <20211208192118.7483-10-s.shtylyov@omp.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211208192118.7483-10-s.shtylyov@omp.ru>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Dec 08, 2021 at 10:21:17PM +0300, Sergey Shtylyov wrote:
> The driver overrides the error codes returned by platform_get_irq() to
> -ENXIO for some strange reason, so if it returns -EPROBE_DEFER, the driver
> will fail the probe permanently instead of the deferred probing. Switch to
> propagating the error codes upstream.
> 
> Fixes: 60bbfc84b6d9 ("USB OHCI controller support for PNX4008")

I don't see how this Fixes commit is related to OHCI OMAP?

A.

> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
> ---
> Changes in version 2:
> - refreshed the patch.
> 
>  drivers/usb/host/ohci-omap.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/host/ohci-omap.c b/drivers/usb/host/ohci-omap.c
> index ded9738392e4..45dcf8292072 100644
> --- a/drivers/usb/host/ohci-omap.c
> +++ b/drivers/usb/host/ohci-omap.c
> @@ -306,7 +306,7 @@ static int ohci_hcd_omap_probe(struct platform_device *pdev)
>  
>  	irq = platform_get_irq(pdev, 0);
>  	if (irq < 0) {
> -		retval = -ENXIO;
> +		retval = irq;
>  		goto err3;
>  	}
>  	retval = usb_add_hcd(hcd, irq, 0);
> -- 
> 2.26.3
> 
