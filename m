Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7462355F80
	for <lists+linux-omap@lfdr.de>; Wed,  7 Apr 2021 01:34:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233025AbhDFXdX (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 6 Apr 2021 19:33:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232362AbhDFXdW (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 6 Apr 2021 19:33:22 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3ED6AC061756
        for <linux-omap@vger.kernel.org>; Tue,  6 Apr 2021 16:33:14 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id k8so11612118pgf.4
        for <linux-omap@vger.kernel.org>; Tue, 06 Apr 2021 16:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=LRgGDa7UAPYiNMpF39Lh56jOssvyorq9ppnVgi31J/o=;
        b=dol2GVi+MHXAlQjLNZRDGWiqiSTsM30xf7XFveOIDRMzyunh6Jdu+U5JHQcGZuJpFT
         1Nt6iDXj+VGjUXmzEpBOly2AcwI29wifSBNVAaPnsZM3dBKPWK3Jr388aqNYDVw+FmZP
         N8XsQQuVaPQf2rjP9vqafbggki2gcIVroQ6vLd0+bSmdL38sYop/zcaQIqgxy72tLy6S
         mnj2jbtr9HeKqe6ym8YnbmfZ2+b93HoPmG6lCSVT8TG4y4c2wdYlUIWyjLOefUnhFpRo
         0HmzNOW90h4nNv8WNiQy/IcGujauCci6RgEGtB9+LMc/vaV6Y7B+1IoE4sPtZrrsuMh4
         cv2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LRgGDa7UAPYiNMpF39Lh56jOssvyorq9ppnVgi31J/o=;
        b=tgPeP7DLIQqZsGLnBOZrfouIzFJFY4JFJlBZ+usulpLMSE1+M/hJznkrhHYfL1yqCs
         ghrJgbswATagKOkmJEXZUsMF9DTj6CgVzmtx4cglL9e6mgq5JS64Gs/INxjRCtxjmRY8
         PAuYQfNpwQ0P0hIYMI/J4G7vSj0lvNbARWjgcUnkchBNhSjgXxCbUmGnvJN0lElBhpBP
         WulpwXJUHv75FSXsUWaRNblVoa2IBWB1ZoeBS8V4ssJ5fV/lnUpNnwiyYVofm7ibpNuk
         81i/plKBr7I9f5LJZGrJputmqwvic3AQc5XPRyXR8KTaLBtsCGeN2qQITtQDjVXU9KAn
         CPug==
X-Gm-Message-State: AOAM5312y8y26lqPjKHnGAP+PnqSgM1nJJXl59avKPQMXqiNKe15ZZ1/
        Ohyq7sHearZGQWG1Ogwo+FupFQ==
X-Google-Smtp-Source: ABdhPJwrZ0lc01wGERI3BcvvrKoJqUHSE2Q747ublXsAoC/rukUPbzW2AAL5/9C6tWoe/P1U0YuLLQ==
X-Received: by 2002:a63:fb12:: with SMTP id o18mr539600pgh.438.1617751993641;
        Tue, 06 Apr 2021 16:33:13 -0700 (PDT)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id z3sm19557575pff.40.2021.04.06.16.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 16:33:12 -0700 (PDT)
Date:   Tue, 6 Apr 2021 17:33:10 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Suman Anna <s-anna@ti.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        linux-remoteproc@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] remoteproc: pru: Fix wrong success return value for
 fw events
Message-ID: <20210406233310.GB330882@xps15>
References: <20210323223839.17464-1-s-anna@ti.com>
 <20210323223839.17464-3-s-anna@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210323223839.17464-3-s-anna@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, Mar 23, 2021 at 05:38:38PM -0500, Suman Anna wrote:
> The irq_create_fwspec_mapping() returns a proper virq value on success
> and 0 upon any failure. The pru_handle_intrmap() treats this as an error
> and disposes all firmware event mappings correctly, but is returning
> this incorrect value as is, letting the pru_rproc_start() interpret it
> as a success and boot the PRU.
> 

Very subtle...  I had to look twice to make sure.

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

> Fix this by returning an error value back upon any such failure. While
> at this, revise the error trace to print some meaningful info about the
> failed event.
> 
> Fixes: c75c9fdac66e ("remoteproc: pru: Add support for PRU specific interrupt configuration")
> Signed-off-by: Suman Anna <s-anna@ti.com>
> ---
>  drivers/remoteproc/pru_rproc.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/pru_rproc.c b/drivers/remoteproc/pru_rproc.c
> index a9d07c0751be..87b43976c51b 100644
> --- a/drivers/remoteproc/pru_rproc.c
> +++ b/drivers/remoteproc/pru_rproc.c
> @@ -339,8 +339,10 @@ static int pru_handle_intrmap(struct rproc *rproc)
>  
>  		pru->mapped_irq[i] = irq_create_fwspec_mapping(&fwspec);
>  		if (!pru->mapped_irq[i]) {
> -			dev_err(dev, "failed to get virq\n");
> -			ret = pru->mapped_irq[i];
> +			dev_err(dev, "failed to get virq for fw mapping %d: event %d chnl %d host %d\n",
> +				i, fwspec.param[0], fwspec.param[1],
> +				fwspec.param[2]);
> +			ret = -EINVAL;
>  			goto map_fail;
>  		}
>  	}
> -- 
> 2.30.1
> 
