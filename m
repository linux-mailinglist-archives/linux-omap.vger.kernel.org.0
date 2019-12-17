Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A61D01234C5
	for <lists+linux-omap@lfdr.de>; Tue, 17 Dec 2019 19:25:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726813AbfLQSZh (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 17 Dec 2019 13:25:37 -0500
Received: from muru.com ([72.249.23.125]:49036 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726742AbfLQSZh (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 17 Dec 2019 13:25:37 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id BF2D38116;
        Tue, 17 Dec 2019 18:26:16 +0000 (UTC)
Date:   Tue, 17 Dec 2019 10:25:34 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Dave Gerlach <d-gerlach@ti.com>
Cc:     Santosh Shilimkar <ssantosh@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, Suman Anna <s-anna@ti.com>
Subject: Re: [PATCH] soc: ti: wkup_m3_ipc: Fix race condition with rproc_boot
Message-ID: <20191217182534.GD35479@atomide.com>
References: <20191212040314.14753-1-d-gerlach@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191212040314.14753-1-d-gerlach@ti.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* Dave Gerlach <d-gerlach@ti.com> [191211 20:02]:
> Any user of wkup_m3_ipc calls wkup_m3_ipc_get to get a handle and this
> checks the value of the static variable m3_ipc_state to see if the
> wkup_m3 is ready. Currently this is populated during probe before
> rproc_boot has been called, meaning there is a window of time that
> wkup_m3_ipc_get can return a valid handle but the wkup_m3 itself is not
> ready, leading to invalid IPC calls to the wkup_m3 and system
> instability.
> 
> To avoid this, move the population of the m3_ipc_state variable until
> after rproc_boot has succeeded to guarantee a valid and usable handle
> is always returned.

Santosh, do you want me to pick this one into my fixes branch?

Regards,

Tony


> Reported-by: Suman Anna <s-anna@ti.com>
> Signed-off-by: Dave Gerlach <d-gerlach@ti.com>
> ---
>  drivers/soc/ti/wkup_m3_ipc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/ti/wkup_m3_ipc.c b/drivers/soc/ti/wkup_m3_ipc.c
> index 378369d9364a..e9ece45d7a33 100644
> --- a/drivers/soc/ti/wkup_m3_ipc.c
> +++ b/drivers/soc/ti/wkup_m3_ipc.c
> @@ -419,6 +419,8 @@ static void wkup_m3_rproc_boot_thread(struct wkup_m3_ipc *m3_ipc)
>  	ret = rproc_boot(m3_ipc->rproc);
>  	if (ret)
>  		dev_err(dev, "rproc_boot failed\n");
> +	else
> +		m3_ipc_state = m3_ipc;
>  
>  	do_exit(0);
>  }
> @@ -505,8 +507,6 @@ static int wkup_m3_ipc_probe(struct platform_device *pdev)
>  		goto err_put_rproc;
>  	}
>  
> -	m3_ipc_state = m3_ipc;
> -
>  	return 0;
>  
>  err_put_rproc:
> -- 
> 2.20.1
> 
