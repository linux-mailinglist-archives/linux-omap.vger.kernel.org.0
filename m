Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C84302C5DD9
	for <lists+linux-omap@lfdr.de>; Thu, 26 Nov 2020 23:32:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391866AbgKZWbz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 26 Nov 2020 17:31:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388120AbgKZWby (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 26 Nov 2020 17:31:54 -0500
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D826C061A04
        for <linux-omap@vger.kernel.org>; Thu, 26 Nov 2020 14:31:52 -0800 (PST)
Received: by mail-pg1-x542.google.com with SMTP id j19so2717173pgg.5
        for <linux-omap@vger.kernel.org>; Thu, 26 Nov 2020 14:31:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=wGSsT9seajVOjbFERio1tYJo2XEKlH2gqwsbWcXTilg=;
        b=KlSuraKBJnqVtHFjN5zwb2K/A/fQkQnDE3CeKNSueLqUuC0zIGUmM/8fD/8R71bvO8
         SJRCjSRBqQ6ObpW0EQVC6wij8dF7lWrYzQi7a/QkGjgsoATLLueesnWYpEJvzX81tIOa
         gwlFEeTD5rt0Oci1I0X5fNOvijzzIKHY8AS6yS86IGskc20HAXF6RtDum2mBNEG1xNrI
         LhN/SD8r+Y8F5YKV+aYAf79VOF/5jH6oZwN8utNCeYrUt9Pm9qGkQySDE8svDZlw0u9r
         suHroQ1eQDh4Z52/BrrhMg/OhsRtbgZ+kWt5p7VPvWxZkHFO2kK+BdzlUywOOY1O9a9h
         oztg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wGSsT9seajVOjbFERio1tYJo2XEKlH2gqwsbWcXTilg=;
        b=Avm9SCZ1G093O0FYApefulcr0jOoTr+cMXNV2RMriimsLdwyOklIBXctId+KbA4NPq
         N/DOE11sZdJ6WcGGa6BpyXgNXptSWMClsUHRxIYD16P1ugI+/YGtJj45Psg8c4Xf8vKJ
         uHZY7bzyLjbJyMEc8VQ8sqzZDs5OuzMwmdIosYjMTvYIJWrWKdLf3rz7/hZMkAMZMNsF
         JiTXNYFvOGg+rq5NVwZKCl/0I5zivwWq6VNCMqAFTiwKQRxdTWAvjtWYH2HMGs+6bnB+
         oEHYPMRcINXLzmx3vTpgGtaKKDbvf8PVcrQmJ6pALOjq6o8FIXYH2bVLXJjox6a1lo4w
         TF3w==
X-Gm-Message-State: AOAM530ls/KiUu3Lcq2UHxV/M8QTmnd6EFsj8ukv5e94Az0ZbuvD0+2p
        J2/mfdzgGDald5S1Cp/tEnrv9A==
X-Google-Smtp-Source: ABdhPJxspCOJquAz7Th3kxpvAy5m41TZyhhFsRw2ctcxoSwuXvukL7DEk/zJZoDRiAKoREBXLQcCVg==
X-Received: by 2002:aa7:9501:0:b029:155:3b11:d5c4 with SMTP id b1-20020aa795010000b02901553b11d5c4mr4316766pfp.76.1606429911964;
        Thu, 26 Nov 2020 14:31:51 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id t13sm8158981pjq.15.2020.11.26.14.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2020 14:31:51 -0800 (PST)
Date:   Thu, 26 Nov 2020 15:31:49 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Suman Anna <s-anna@ti.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Arnaud Pouliquen <arnaud.pouliquen@st.com>,
        Loic Pallardy <loic.pallardy@st.com>,
        Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        linux-remoteproc@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] remoteproc: Fix unbalanced boot with sysfs for no
 auto-boot rprocs
Message-ID: <20201126223149.GA897651@xps15>
References: <20201121030156.22857-1-s-anna@ti.com>
 <20201121030156.22857-2-s-anna@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201121030156.22857-2-s-anna@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Nov 20, 2020 at 09:01:54PM -0600, Suman Anna wrote:
> The remoteproc core performs automatic boot and shutdown of a remote
> processor during rproc_add() and rproc_del() for remote processors
> supporting 'auto-boot'. The remoteproc devices not using 'auto-boot'
> require either a remoteproc client driver or a userspace client to
> use the sysfs 'state' variable to perform the boot and shutdown. The
> in-kernel client drivers hold the corresponding remoteproc driver
> module's reference count when they acquire a rproc handle through
> the rproc_get_by_phandle() API, but there is no such support for
> userspace applications performing the boot through sysfs interface.
> 
> The shutdown of a remoteproc upon removing a remoteproc platform
> driver is automatic only with 'auto-boot' and this can cause a
> remoteproc with no auto-boot to stay powered on and never freed
> up if booted using the sysfs interface without a matching stop,
> and when the remoteproc driver module is removed or unbound from
> the device. This will result in a memory leak as well as the
> corresponding remoteproc ida being never deallocated. Fix this
> by holding a module reference count for the remoteproc's driver
> during a sysfs 'start' and releasing it during the sysfs 'stop'
> operation.
> 
> Signed-off-by: Suman Anna <s-anna@ti.com>
> Acked-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
> ---
> v2: rebased version, no changes
> v1: https://patchwork.kernel.org/project/linux-remoteproc/patch/20180915003725.17549-2-s-anna@ti.com/
> 
>  drivers/remoteproc/remoteproc_sysfs.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_sysfs.c b/drivers/remoteproc/remoteproc_sysfs.c
> index d1cf7bf277c4..bd2950a246c9 100644
> --- a/drivers/remoteproc/remoteproc_sysfs.c
> +++ b/drivers/remoteproc/remoteproc_sysfs.c
> @@ -3,6 +3,7 @@
>   * Remote Processor Framework
>   */
>  
> +#include <linux/module.h>
>  #include <linux/remoteproc.h>
>  #include <linux/slab.h>
>  
> @@ -228,14 +229,27 @@ static ssize_t state_store(struct device *dev,
>  		if (rproc->state == RPROC_RUNNING)
>  			return -EBUSY;
>  
> +		/*
> +		 * prevent underlying implementation from being removed
> +		 * when remoteproc does not support auto-boot
> +		 */
> +		if (!rproc->auto_boot &&
> +		    !try_module_get(dev->parent->driver->owner))
> +			return -EINVAL;
> +
>  		ret = rproc_boot(rproc);
> -		if (ret)
> +		if (ret) {
>  			dev_err(&rproc->dev, "Boot failed: %d\n", ret);
> +			if (!rproc->auto_boot)
> +				module_put(dev->parent->driver->owner);
> +		}
>  	} else if (sysfs_streq(buf, "stop")) {
>  		if (rproc->state != RPROC_RUNNING)
>  			return -EINVAL;
>  
>  		rproc_shutdown(rproc);
> +		if (!rproc->auto_boot)
> +			module_put(dev->parent->driver->owner);

I tackled the same problem by fixing another problem we had in the core.  Patch
2 [1] and 3 [2] of this set [3] get rid of the problem related to the auto_boot
check without having to deal with module counters.

Please see if that covers the use case you are dealing with.

Thanks,
Mathieu

[1]. https://patchwork.kernel.org/project/linux-remoteproc/patch/20201126210642.897302-3-mathieu.poirier@linaro.org/
[2]. https://patchwork.kernel.org/project/linux-remoteproc/patch/20201126210642.897302-4-mathieu.poirier@linaro.org/
[3]. https://patchwork.kernel.org/project/linux-remoteproc/list/?series=391789


>  	} else {
>  		dev_err(&rproc->dev, "Unrecognised option: %s\n", buf);
>  		ret = -EINVAL;
> -- 
> 2.28.0
> 
