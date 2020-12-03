Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDB052CDE1A
	for <lists+linux-omap@lfdr.de>; Thu,  3 Dec 2020 19:55:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729190AbgLCSyQ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 3 Dec 2020 13:54:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728191AbgLCSyP (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 3 Dec 2020 13:54:15 -0500
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20608C061A52
        for <linux-omap@vger.kernel.org>; Thu,  3 Dec 2020 10:53:35 -0800 (PST)
Received: by mail-pg1-x542.google.com with SMTP id e23so1937546pgk.12
        for <linux-omap@vger.kernel.org>; Thu, 03 Dec 2020 10:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=EE5mMvmXrxXfB4VeSZLs7H6jR6pEvdX9Wrji0Qr5SPY=;
        b=YxGDh8Kyih68g640dh1sCWyrR96R29Pes5pSYET8gCr/BYmJ2n0Ul0U232/U/ZHvOZ
         T5/ymRdWa54KSSgyFjLr3gShxL3i4BmFXbonKFqW6yD3Qbd+PSTkO2Q0x68SXOL8i3C5
         1JzNWr8XGWr8W8pz+ZZ2yzV7qyXnZ1V1vanh3dZb9ZAz02Ymae/971r7DnbW/Xfae6R/
         /xBLexklnQEfz3SDZWdgtjJ+RzjkucE9To0SXRE+TRA5q9jZzoLwmf864VVemeeQEGxm
         s2/rS34GDB5z+R/fV9aczjw1lW7JMmyF2EZK5ioTzzIK2vwvwWQ+hrySnD4PTFRddNuJ
         qwjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EE5mMvmXrxXfB4VeSZLs7H6jR6pEvdX9Wrji0Qr5SPY=;
        b=kMnYje3I0wxhJ6zHQwPqnzTztAPdKK/4WsoMdxNhheKvtNkd03dfeT/rM5ekbJngsD
         /TB1b592mls6zGOjnwALSJVkqp8WCcko4xwDEnrSKk2GYDLypTfoRM6WIKtd4ur4BI+z
         wZ9ffaD6FQh+gfaEU5DB6+9wI6+DeOB9+bNZqBR88lJIi2oIMgBAkN0v1kXdPusSxN5m
         Y3whmuWEAj5WZhsBKHKQm/MQ90jVqJeF+GxO7g3nEDhMJF3u3g+uoZho8mXOjPZ9E+zz
         AB+Vj7lReCOEuZlhyCPrGogyFhdn1uDTpB5vYTv/hO3IQ6G05RC/xqpsNZBIcPdrBoCs
         7A3Q==
X-Gm-Message-State: AOAM533fRPH7FE/05T0oDnnN8CcRoB2UkyTgZ/nqgM6rUFzcVdpsZEFm
        hvDo1Ji/6GcYqIaSQzp0pyrmZQ==
X-Google-Smtp-Source: ABdhPJx9xxTOoz62oEKCZ/qgOAVgYq/TOGPogPwYNJwQRwFa3NbTz668JDWHoyyAiOT3mH++W6cCOg==
X-Received: by 2002:a63:e44:: with SMTP id 4mr4161760pgo.162.1607021614654;
        Thu, 03 Dec 2020 10:53:34 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id m77sm2513701pfd.105.2020.12.03.10.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 10:53:34 -0800 (PST)
Date:   Thu, 3 Dec 2020 11:53:32 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org, s-anna@ti.com,
        linux-remoteproc@vger.kernel.org, robh+dt@kernel.org,
        lee.jones@linaro.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, praneeth@ti.com,
        rogerq@ti.com
Subject: Re: [PATCH v2 6/6] remoteproc/pru: Add support for various PRU cores
 on K3 J721E SoCs
Message-ID: <20201203185332.GC1392978@xps15>
References: <20201119140850.12268-1-grzegorz.jaszczyk@linaro.org>
 <20201119140850.12268-7-grzegorz.jaszczyk@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201119140850.12268-7-grzegorz.jaszczyk@linaro.org>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Nov 19, 2020 at 03:08:50PM +0100, Grzegorz Jaszczyk wrote:
> From: Suman Anna <s-anna@ti.com>
> 
> The K3 J721E family of SoCs have a revised version of the AM65x ICSSG IP
> and contains two instances of this newer ICSSG IP. Each ICSSG processor
> subsystem contains 2 primary PRU cores, 2 auxiliary PRU cores called RTUs,
> and 2 new auxiliary cores called Transmit PRUs (Tx_PRUs).
> 
> Enhance the existing PRU remoteproc driver to support these new PRU
> and RTU cores by using specific compatibles. The cores have the same
> memory copying limitations as on AM65x, so reuses the custom memcpy
> function within the driver's ELF loader implementation. The initial
> names for the firmware images for each PRU core are retrieved from
> DT nodes, and can be adjusted through sysfs if required.
> 
> Signed-off-by: Suman Anna <s-anna@ti.com>
> Co-developed-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
> Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

> ---
>  drivers/remoteproc/pru_rproc.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/remoteproc/pru_rproc.c b/drivers/remoteproc/pru_rproc.c
> index 48c1c51e0d42..96f689283a8b 100644
> --- a/drivers/remoteproc/pru_rproc.c
> +++ b/drivers/remoteproc/pru_rproc.c
> @@ -852,6 +852,9 @@ static const struct of_device_id pru_rproc_match[] = {
>  	{ .compatible = "ti,am654-pru",		.data = &k3_pru_data },
>  	{ .compatible = "ti,am654-rtu",		.data = &k3_rtu_data },
>  	{ .compatible = "ti,am654-tx-pru",	.data = &k3_tx_pru_data },
> +	{ .compatible = "ti,j721e-pru",		.data = &k3_pru_data },
> +	{ .compatible = "ti,j721e-rtu",		.data = &k3_rtu_data },
> +	{ .compatible = "ti,j721e-tx-pru",	.data = &k3_tx_pru_data },
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, pru_rproc_match);
> -- 
> 2.29.0
> 
