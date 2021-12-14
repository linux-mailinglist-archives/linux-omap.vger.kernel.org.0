Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B195474CF1
	for <lists+linux-omap@lfdr.de>; Tue, 14 Dec 2021 22:04:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237760AbhLNVEn (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 14 Dec 2021 16:04:43 -0500
Received: from netrider.rowland.org ([192.131.102.5]:32821 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S237759AbhLNVEm (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 14 Dec 2021 16:04:42 -0500
Received: (qmail 760655 invoked by uid 1000); 14 Dec 2021 16:04:41 -0500
Date:   Tue, 14 Dec 2021 16:04:41 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Sergey Shtylyov <s.shtylyov@omp.ru>
Cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-omap@vger.kernel.org
Subject: Re: [PATCH 4/4] usb: host: ohci-omap: propagate errors from
 platform_get_irq()
Message-ID: <YbkG6dui2A2yBiFX@rowland.harvard.edu>
References: <20211214204247.7172-1-s.shtylyov@omp.ru>
 <20211214204247.7172-5-s.shtylyov@omp.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211214204247.7172-5-s.shtylyov@omp.ru>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, Dec 14, 2021 at 11:42:47PM +0300, Sergey Shtylyov wrote:
> The driver overrides the error codes returned by platform_get_irq() to
> -ENXIO for some strange reason.  Switch to propagating the error codes
> upstream.
> 
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
> ---

Acked-by: Alan Stern <stern@rowland.harvard.edu>

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
