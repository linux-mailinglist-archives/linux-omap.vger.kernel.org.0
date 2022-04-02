Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E6224F030A
	for <lists+linux-omap@lfdr.de>; Sat,  2 Apr 2022 15:54:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243429AbiDBNym (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 2 Apr 2022 09:54:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243404AbiDBNyl (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 2 Apr 2022 09:54:41 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 0028123BD0
        for <linux-omap@vger.kernel.org>; Sat,  2 Apr 2022 06:52:49 -0700 (PDT)
Received: (qmail 60900 invoked by uid 1000); 2 Apr 2022 09:52:49 -0400
Date:   Sat, 2 Apr 2022 09:52:49 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Janusz Krzysztofik <jmkrzyszt@gmail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH] usb: host: ohci-omap: Make it CCF clk API compatible
Message-ID: <YkhVMQXdbAYr9A6E@rowland.harvard.edu>
References: <20220402114353.130775-1-jmkrzyszt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220402114353.130775-1-jmkrzyszt@gmail.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Sat, Apr 02, 2022 at 01:43:53PM +0200, Janusz Krzysztofik wrote:
> The driver, OMAP1 specific, now omits clk_prepare/unprepare() steps, not
> supported by OMAP1 custom implementation of clock API.  However, non-CCF
> stubs of those functions exist for use on such platforms until converted
> to CCF.
> 
> Update the driver to be compatible with CCF implementation of clock API.
> 
> Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
> ---

Acked-by: Alan Stern <stern@rowland.harvard.edu>

>  drivers/usb/host/ohci-omap.c | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/host/ohci-omap.c b/drivers/usb/host/ohci-omap.c
> index 45dcf8292072..2ab2e089a2b7 100644
> --- a/drivers/usb/host/ohci-omap.c
> +++ b/drivers/usb/host/ohci-omap.c
> @@ -281,6 +281,10 @@ static int ohci_hcd_omap_probe(struct platform_device *pdev)
>  		goto err_put_hcd;
>  	}
>  
> +	retval = clk_prepare(priv->usb_host_ck);
> +	if (retval)
> +		goto err_put_host_ck;
> +
>  	if (!cpu_is_omap15xx())
>  		priv->usb_dc_ck = clk_get(&pdev->dev, "usb_dc_ck");
>  	else
> @@ -288,13 +292,17 @@ static int ohci_hcd_omap_probe(struct platform_device *pdev)
>  
>  	if (IS_ERR(priv->usb_dc_ck)) {
>  		retval = PTR_ERR(priv->usb_dc_ck);
> -		goto err_put_host_ck;
> +		goto err_unprepare_host_ck;
>  	}
>  
> +	retval = clk_prepare(priv->usb_dc_ck);
> +	if (retval)
> +		goto err_put_dc_ck;
> +
>  	if (!request_mem_region(hcd->rsrc_start, hcd->rsrc_len, hcd_name)) {
>  		dev_dbg(&pdev->dev, "request_mem_region failed\n");
>  		retval = -EBUSY;
> -		goto err_put_dc_ck;
> +		goto err_unprepare_dc_ck;
>  	}
>  
>  	hcd->regs = ioremap(hcd->rsrc_start, hcd->rsrc_len);
> @@ -319,8 +327,12 @@ static int ohci_hcd_omap_probe(struct platform_device *pdev)
>  	iounmap(hcd->regs);
>  err2:
>  	release_mem_region(hcd->rsrc_start, hcd->rsrc_len);
> +err_unprepare_dc_ck:
> +	clk_unprepare(priv->usb_dc_ck);
>  err_put_dc_ck:
>  	clk_put(priv->usb_dc_ck);
> +err_unprepare_host_ck:
> +	clk_unprepare(priv->usb_host_ck);
>  err_put_host_ck:
>  	clk_put(priv->usb_host_ck);
>  err_put_hcd:
> @@ -355,7 +367,9 @@ static int ohci_hcd_omap_remove(struct platform_device *pdev)
>  	}
>  	iounmap(hcd->regs);
>  	release_mem_region(hcd->rsrc_start, hcd->rsrc_len);
> +	clk_unprepare(priv->usb_dc_ck);
>  	clk_put(priv->usb_dc_ck);
> +	clk_unprepare(priv->usb_host_ck);
>  	clk_put(priv->usb_host_ck);
>  	usb_put_hcd(hcd);
>  	return 0;
> -- 
> 2.35.1
> 
