Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4D6B3571EC
	for <lists+linux-omap@lfdr.de>; Wed,  7 Apr 2021 18:11:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233633AbhDGQLL (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 7 Apr 2021 12:11:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236600AbhDGQLK (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 7 Apr 2021 12:11:10 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69F69C061756
        for <linux-omap@vger.kernel.org>; Wed,  7 Apr 2021 09:11:01 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id y32so10239345pga.11
        for <linux-omap@vger.kernel.org>; Wed, 07 Apr 2021 09:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=DiVOnoRaOKWzvOjowAkfK5gmTOofYlhr3RJ2hit0GwM=;
        b=m6AJkn/rVeDyMIthqlgy8KQvKd3h+thfr5PHrr2NxQ7yoFq/nwmn8amXFL4OlD3i4X
         b4sUW79MlVz2GxS59lNlvqJUMMVdVKpV8JCJHu0pEsaia2VRVGPgKbfSRAJZ96vOQJo1
         zWvqWycS5RcdPA4/xRdi6vyFgtj+5CMYEgYqIUASdOJPdcUIFR0n2UiQ31WSor1XjN2R
         KXVLuVwwSKFQyFImJ+YOoVibjCPABKxSuYvuVVTijpkKwsFwve8z/5XfItsgtcVeQjrK
         XPdIPTIxii3FJVutW7I/heAvz7/6mf0RSfNbsbrdPd28kBQyFrN6x+8tMqXrgpVKG+uR
         b1xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=DiVOnoRaOKWzvOjowAkfK5gmTOofYlhr3RJ2hit0GwM=;
        b=Efqhyqr2CZK/tKFmAq829nPbwdIPElIDdcfuBLXKVphc75NWB8OmZE30J3OhGVOfVG
         PnTwYOzDF+NRB/S3a9qLYyq+7mOh5FrPfMsETQPMdqfrEAHlaW61br0TL7QU2hsJ8ZMq
         rx4q+gz0CxZqyIx+4GJ1/9jOok2vEyA2y1GeuylpANEHduiOCg7ObwEOE2Gj+fYQw841
         jZNtsrQBwik3V/CN/gKC0p6nqRMGsuYOjz+Gdeh5qU03TeAw/T07PEiY48Cq0v3C5q9d
         23/y93EucowBhN7Vd/QmzU7TSpJmkwkFQEQul6+X3mVoPwxKwywCxIZ2QxyfBI0YZguD
         iShw==
X-Gm-Message-State: AOAM53262lEKQb3Sz9KCixCeLBKFj0EshRiYMSoO9Yqm9fzNJg+CsHT4
        of7fLL50fQEY/Uf5DshM5XSCGA==
X-Google-Smtp-Source: ABdhPJxqGgOrRHzTvoA6k1tboczIppwck3D1i8PrK5gDRMlnpocoVFqHNJb6tTx9nV2ErqjVaK8nyA==
X-Received: by 2002:aa7:9804:0:b029:1f1:5340:77c1 with SMTP id e4-20020aa798040000b02901f1534077c1mr3584600pfl.72.1617811860852;
        Wed, 07 Apr 2021 09:11:00 -0700 (PDT)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id q19sm22379844pff.91.2021.04.07.09.11.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 09:11:00 -0700 (PDT)
Date:   Wed, 7 Apr 2021 10:10:58 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Suman Anna <s-anna@ti.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        linux-remoteproc@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] remoteproc: pru: Fix and cleanup firmware
 interrupt mapping logic
Message-ID: <20210407161058.GA418374@xps15>
References: <20210407155641.5501-1-s-anna@ti.com>
 <20210407155641.5501-4-s-anna@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210407155641.5501-4-s-anna@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Apr 07, 2021 at 10:56:41AM -0500, Suman Anna wrote:
> The PRU firmware interrupt mappings are configured and unconfigured in
> .start() and .stop() callbacks respectively using the variables 'evt_count'
> and a 'mapped_irq' pointer. These variables are modified only during these
> callbacks but are not re-initialized/reset properly during unwind or
> failure paths. These stale values caused a kernel crash while stopping a
> PRU remoteproc running a different firmware with no events on a subsequent
> run after a previous run that was running a firmware with events.
> 
> Fix this crash by ensuring that the evt_count is 0 and the mapped_irq
> pointer is set to NULL in pru_dispose_irq_mapping(). Also, reset these
> variables properly during any failures in the .start() callback. While
> at this, the pru_dispose_irq_mapping() callsites are all made to look
> the same, moving any conditional logic to inside the function.
> 
> Fixes: c75c9fdac66e ("remoteproc: pru: Add support for PRU specific interrupt configuration")
> Reported-by: Vignesh Raghavendra <vigneshr@ti.com>
> Signed-off-by: Suman Anna <s-anna@ti.com>
> ---
> v2:
>  - Fixed two additional cleanup paths in pru_handle_intrmap()
>    addressing Mathieu's review comment
> v1: https://patchwork.kernel.org/project/linux-remoteproc/patch/20210323223839.17464-4-s-anna@ti.com/
> 
>  drivers/remoteproc/pru_rproc.c | 22 +++++++++++++++++-----
>  1 file changed, 17 insertions(+), 5 deletions(-)
>

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
 
> diff --git a/drivers/remoteproc/pru_rproc.c b/drivers/remoteproc/pru_rproc.c
> index 87b43976c51b..04863bf23db8 100644
> --- a/drivers/remoteproc/pru_rproc.c
> +++ b/drivers/remoteproc/pru_rproc.c
> @@ -266,12 +266,17 @@ static void pru_rproc_create_debug_entries(struct rproc *rproc)
>  
>  static void pru_dispose_irq_mapping(struct pru_rproc *pru)
>  {
> -	while (pru->evt_count--) {
> +	if (!pru->mapped_irq)
> +		return;
> +
> +	while (pru->evt_count) {
> +		pru->evt_count--;
>  		if (pru->mapped_irq[pru->evt_count] > 0)
>  			irq_dispose_mapping(pru->mapped_irq[pru->evt_count]);
>  	}
>  
>  	kfree(pru->mapped_irq);
> +	pru->mapped_irq = NULL;
>  }
>  
>  /*
> @@ -307,8 +312,10 @@ static int pru_handle_intrmap(struct rproc *rproc)
>  	pru->evt_count = rsc->num_evts;
>  	pru->mapped_irq = kcalloc(pru->evt_count, sizeof(unsigned int),
>  				  GFP_KERNEL);
> -	if (!pru->mapped_irq)
> +	if (!pru->mapped_irq) {
> +		pru->evt_count = 0;
>  		return -ENOMEM;
> +	}
>  
>  	/*
>  	 * parse and fill in system event to interrupt channel and
> @@ -317,13 +324,19 @@ static int pru_handle_intrmap(struct rproc *rproc)
>  	 * corresponding sibling PRUSS INTC node.
>  	 */
>  	parent = of_get_parent(dev_of_node(pru->dev));
> -	if (!parent)
> +	if (!parent) {
> +		kfree(pru->mapped_irq);
> +		pru->mapped_irq = NULL;
> +		pru->evt_count = 0;
>  		return -ENODEV;
> +	}
>  
>  	irq_parent = of_get_child_by_name(parent, "interrupt-controller");
>  	of_node_put(parent);
>  	if (!irq_parent) {
>  		kfree(pru->mapped_irq);
> +		pru->mapped_irq = NULL;
> +		pru->evt_count = 0;
>  		return -ENODEV;
>  	}
>  
> @@ -398,8 +411,7 @@ static int pru_rproc_stop(struct rproc *rproc)
>  	pru_control_write_reg(pru, PRU_CTRL_CTRL, val);
>  
>  	/* dispose irq mapping - new firmware can provide new mapping */
> -	if (pru->mapped_irq)
> -		pru_dispose_irq_mapping(pru);
> +	pru_dispose_irq_mapping(pru);
>  
>  	return 0;
>  }
> -- 
> 2.30.1
> 
