Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF599F8748
	for <lists+linux-omap@lfdr.de>; Tue, 12 Nov 2019 05:13:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726939AbfKLEN4 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 11 Nov 2019 23:13:56 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:32911 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726927AbfKLEN4 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 11 Nov 2019 23:13:56 -0500
Received: by mail-pf1-f194.google.com with SMTP id c184so12426311pfb.0
        for <linux-omap@vger.kernel.org>; Mon, 11 Nov 2019 20:13:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=CL1oYwCRCe1FFxAR4ElH+kBmzUBnxprhYijyLHdokpU=;
        b=bTKCUgLpkgyIaDlwMWtuKuIVQpnIkI7PzYM5HL3b7UOSbhSz0gK8QdnmzBeydwmcOf
         Fu5sAKqSmZBpDPj2wKbxvBUbF37g/fyJ7UR7Ojz63fY1UwY9uxtamW3LlLbEnKhBXPPJ
         kEOIUiIG1uxDYI7safIMrNYLH1dWia/bHhA6wgu5Sej9VXoNbmqrZLdFDnds/hzHFvc0
         ZHzf0HRE0KCJJ3s7IQHvPJ2Tkm+NFzBvTTA2NMrPt2W4eia3WjCiSph8vi4y1BP5jBvr
         ugWnPeHRHSBLDWTS7YN8TRt3oK5nNgAK563U3w6QT+oBaAHpMM8mW1Fhp2jNIlsQlNnh
         jAaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=CL1oYwCRCe1FFxAR4ElH+kBmzUBnxprhYijyLHdokpU=;
        b=JjbwN1PMIpKr/eiyks8/rcxRX2luq5b1folA6Sv4rLkYm3JU4fxnAq76jF6nIp6uie
         NfXzdBXZvoqaXjg5zdi+wCCN4NqFkpmMUKqLnBCfzD3H+fFIzEUEVwU4x/ogKZQIt67w
         yY2FL0Swh2wFzcOZb0qZd+NHNWTvYI6UmCAZZt0oofe3RT2hownnBVBdJDCtTxd4wMZP
         dAGNnAYfr0rrKjBSyaMw/PFf3vnzha2lEawoLF4vX/qXUyhhmKcHJq3Bg3cXNK9JfkKi
         CiKx+p42yXhOFupo7+w/+u1Hihc5QlZnA7MOwT4Xv63SNyS2ZPlNnsIAgAHMQ0Yf8MXp
         gRrw==
X-Gm-Message-State: APjAAAWXWbtA9Bfo2tYmL4SbZQypndTNnqKIsZo6GldnOG27Plz287x1
        7byRgIHci6IJl0DzLTODjc4LTw==
X-Google-Smtp-Source: APXvYqwY9ijyqr62TWLYIlosvDI2P3R33BIahnqHfI998inOBIkH55H0+DeRQYqOA1ymsWiQiBxBWg==
X-Received: by 2002:a63:b047:: with SMTP id z7mr27293989pgo.224.1573532034764;
        Mon, 11 Nov 2019 20:13:54 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id hi2sm791136pjb.22.2019.11.11.20.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2019 20:13:54 -0800 (PST)
Date:   Mon, 11 Nov 2019 20:13:51 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Tero Kristo <t-kristo@ti.com>
Cc:     ohad@wizery.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        s-anna@ti.com
Subject: Re: [PATCH 12/17] remoteproc/omap: Request a timer(s) for remoteproc
 usage
Message-ID: <20191112041351.GN3108315@builder>
References: <20191028124238.19224-1-t-kristo@ti.com>
 <20191028124238.19224-13-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191028124238.19224-13-t-kristo@ti.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon 28 Oct 05:42 PDT 2019, Tero Kristo wrote:

> From: Suman Anna <s-anna@ti.com>
> 
> The remote processors in OMAP4+ SoCs are equipped with internal
> timers, like the internal SysTick timer in a Cortex M3/M4 NVIC or
> the CTM timer within Unicache in IPU & DSP. However, these timers
> are gated when the processor subsystem clock is gated, making
> them rather difficult to use as OS tick sources. They will not
> be able to wakeup the processor from any processor-sleep induced
> clock-gating states.
> 
> This can be avoided by using an external timer as the tick source,
> which can be controlled independently by the OMAP remoteproc
> driver code, but still allowing the processor subsystem clock to
> be auto-gated when the remoteproc cores are idle.
> 
> This patch adds the support for OMAP remote processors to request
> timer(s) to be used by the remoteproc. The timers are enabled and
> disabled in line with the enabling/disabling of the remoteproc.
> The timer data is not mandatory if the advanced device management
> features are not required.
> 
> The core timer functionality is provided by the OMAP DMTimer
> clocksource driver, which does not export any API. The logic is
> implemented through the timer device's platform data ops. The OMAP
> remoteproc driver mainly requires ops to request/free a dmtimer,
> and to start/stop a timer. The split ops helps in controlling the
> timer state without having to request and release a timer everytime
> it needs to use the timer.
> 
> NOTE: If the gptimer is already in use by the time IPU and/or
> DSP are loaded, the processors will fail to boot.
> 
> Signed-off-by: Suman Anna <s-anna@ti.com>
> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> ---
>  drivers/remoteproc/omap_remoteproc.c | 258 +++++++++++++++++++++++++++
>  1 file changed, 258 insertions(+)
> 
> diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/omap_remoteproc.c
> index 016d5beda195..8450dd79d391 100644
> --- a/drivers/remoteproc/omap_remoteproc.c
> +++ b/drivers/remoteproc/omap_remoteproc.c
> @@ -27,6 +27,9 @@
>  #include <linux/regmap.h>
>  #include <linux/mfd/syscon.h>
>  #include <linux/reset.h>
> +#include <clocksource/timer-ti-dm.h>
> +
> +#include <linux/platform_data/dmtimer-omap.h>
>  
>  #include "omap_remoteproc.h"
>  #include "remoteproc_internal.h"
> @@ -61,6 +64,16 @@ struct omap_rproc_mem {
>  	size_t size;
>  };
>  
> +/**
> + * struct omap_rproc_timer - data structure for a timer used by a omap rproc
> + * @odt: timer pointer
> + * @timer_ops: OMAP dmtimer ops for @odt timer
> + */
> +struct omap_rproc_timer {
> +	struct omap_dm_timer *odt;
> +	const struct omap_dm_timer_ops *timer_ops;
> +};
> +
>  /**
>   * struct omap_rproc - omap remote processor state
>   * @mbox: mailbox channel handle
> @@ -68,6 +81,8 @@ struct omap_rproc_mem {
>   * @boot_data: boot data structure for setting processor boot address
>   * @mem: internal memory regions data
>   * @num_mems: number of internal memory regions
> + * @num_timers: number of rproc timer(s)
> + * @timers: timer(s) info used by rproc
>   * @rproc: rproc handle
>   * @reset: reset handle
>   */
> @@ -77,6 +92,8 @@ struct omap_rproc {
>  	struct omap_rproc_boot_data *boot_data;
>  	struct omap_rproc_mem *mem;
>  	int num_mems;
> +	int num_timers;
> +	struct omap_rproc_timer *timers;
>  	struct rproc *rproc;
>  	struct reset_control *reset;
>  };
> @@ -91,6 +108,212 @@ struct omap_rproc_dev_data {
>  	const char *fw_name;
>  };
>  
> +/**
> + * omap_rproc_request_timer - request a timer for a remoteproc

Add parenthesis on functions in kerneldoc.

> + * @np: device node pointer to the desired timer
> + * @timer: handle to a struct omap_rproc_timer to return the timer handle
> + *
> + * This helper function is used primarily to request a timer associated with
> + * a remoteproc. The returned handle is stored in the .odt field of the
> + * @timer structure passed in, and is used to invoke other timer specific
> + * ops (like starting a timer either during device initialization or during
> + * a resume operation, or for stopping/freeing a timer).
> + *
> + * Returns 0 on success, otherwise an appropriate failure
> + */
> +static int omap_rproc_request_timer(struct device_node *np,
> +				    struct omap_rproc_timer *timer)
> +{
> +	int ret = 0;
> +
> +	timer->odt = timer->timer_ops->request_by_node(np);
> +	if (!timer->odt) {
> +		pr_err("request for timer node %p failed\n", np);
> +		return -EBUSY;
> +	}
> +
> +	ret = timer->timer_ops->set_source(timer->odt, OMAP_TIMER_SRC_SYS_CLK);
> +	if (ret) {
> +		pr_err("error setting OMAP_TIMER_SRC_SYS_CLK as source for timer node %p\n",
> +		       np);

You could easily pass a struct device * from omap_rproc_enable_timers()
to make this a more useful dev_err()

> +		timer->timer_ops->free(timer->odt);
> +		return ret;
> +	}
> +
> +	/* clean counter, remoteproc code will set the value */
> +	timer->timer_ops->set_load(timer->odt, 0, 0);
> +
> +	return ret;

ret is 0 here, so return 0;

> +}
> +
> +/**
> + * omap_rproc_start_timer - start a timer for a remoteproc
> + * @timer: handle to a OMAP rproc timer
> + *
> + * This helper function is used to start a timer associated with a remoteproc,
> + * obtained using the request_timer ops. The helper function needs to be
> + * invoked by the driver to start the timer (during device initialization)
> + * or to just resume the timer.
> + *
> + * Returns 0 on success, otherwise a failure as returned by DMTimer ops
> + */
> +static inline int omap_rproc_start_timer(struct omap_rproc_timer *timer)
> +{
> +	return timer->timer_ops->start(timer->odt);
> +}
> +
> +/**
> + * omap_rproc_stop_timer - stop a timer for a remoteproc
> + * @timer: handle to a OMAP rproc timer
> + *
> + * This helper function is used to disable a timer associated with a
> + * remoteproc, and needs to be called either during a device shutdown
> + * or suspend operation. The separate helper function allows the driver
> + * to just stop a timer without having to release the timer during a
> + * suspend operation.
> + *
> + * Returns 0 on success, otherwise a failure as returned by DMTimer ops
> + */
> +static inline int omap_rproc_stop_timer(struct omap_rproc_timer *timer)
> +{
> +	return timer->timer_ops->stop(timer->odt);
> +}
> +
> +/**
> + * omap_rproc_release_timer - release a timer for a remoteproc
> + * @timer: handle to a OMAP rproc timer
> + *
> + * This helper function is used primarily to release a timer associated
> + * with a remoteproc. The dmtimer will be available for other clients to
> + * use once released.
> + *
> + * Returns 0 on success, otherwise a failure as returned by DMTimer ops
> + */
> +static inline int omap_rproc_release_timer(struct omap_rproc_timer *timer)
> +{
> +	return timer->timer_ops->free(timer->odt);
> +}
> +
> +/**
> + * omap_rproc_enable_timers - enable the timers for a remoteproc
> + * @rproc: handle of a remote processor
> + * @configure: boolean flag used to acquire and configure the timer handle
> + *
> + * This function is used primarily to enable the timers associated with
> + * a remoteproc. The configure flag is provided to allow the driver to
> + * to either acquire and start a timer (during device initialization) or
> + * to just start a timer (during a resume operation).
> + */
> +static int omap_rproc_enable_timers(struct rproc *rproc, bool configure)
> +{
> +	int i;
> +	int ret = 0;
> +	struct platform_device *tpdev;
> +	struct dmtimer_platform_data *tpdata;
> +	const struct omap_dm_timer_ops *timer_ops;
> +	struct omap_rproc *oproc = rproc->priv;
> +	struct omap_rproc_timer *timers = oproc->timers;
> +	struct device *dev = rproc->dev.parent;
> +	struct device_node *np = NULL;
> +
> +	if (oproc->num_timers <= 0)
> +		return 0;
> +
> +	if (!configure)
> +		goto start_timers;
> +
> +	for (i = 0; i < oproc->num_timers; i++) {
> +		np = of_parse_phandle(dev->of_node, "timers", i);
> +		if (!np) {
> +			ret = -ENXIO;
> +			dev_err(dev, "device node lookup for timer at index %d failed: %d\n",
> +				i, ret);
> +			goto free_timers;
> +		}
> +
> +		tpdev = of_find_device_by_node(np);
> +		if (!tpdev) {
> +			ret = -ENODEV;
> +			dev_err(dev, "could not get timer platform device\n");
> +			goto put_node;
> +		}
> +
> +		tpdata = dev_get_platdata(&tpdev->dev);
> +		put_device(&tpdev->dev);
> +		if (!tpdata) {
> +			ret = -EINVAL;
> +			dev_err(dev, "dmtimer pdata structure NULL\n");
> +			goto put_node;
> +		}
> +
> +		timer_ops = tpdata->timer_ops;
> +		if (!timer_ops || !timer_ops->request_by_node ||
> +		    !timer_ops->set_source || !timer_ops->set_load ||
> +		    !timer_ops->free || !timer_ops->start ||
> +		    !timer_ops->stop) {
> +			ret = -EINVAL;
> +			dev_err(dev, "device does not have required timer ops\n");
> +			goto put_node;
> +		}
> +
> +		timers[i].timer_ops = timer_ops;
> +		ret = omap_rproc_request_timer(np, &timers[i]);
> +		if (ret) {
> +			dev_err(dev, "request for timer %p failed: %d\n", np,
> +				ret);
> +			goto put_node;
> +		}
> +		of_node_put(np);
> +	}
> +
> +start_timers:
> +	for (i = 0; i < oproc->num_timers; i++)
> +		omap_rproc_start_timer(&timers[i]);
> +	return 0;
> +
> +put_node:
> +	of_node_put(np);
> +free_timers:
> +	while (i--) {
> +		omap_rproc_release_timer(&timers[i]);
> +		timers[i].odt = NULL;
> +		timers[i].timer_ops = NULL;
> +	}
> +
> +	return ret;
> +}
> +
> +/**
> + * omap_rproc_disable_timers - disable the timers for a remoteproc
> + * @rproc: handle of a remote processor
> + * @configure: boolean flag used to release the timer handle
> + *
> + * This function is used primarily to disable the timers associated with
> + * a remoteproc. The configure flag is provided to allow the driver to
> + * to either stop and release a timer (during device shutdown) or to just
> + * stop a timer (during a suspend operation).
> + */
> +static int omap_rproc_disable_timers(struct rproc *rproc, bool configure)
> +{
> +	int i;
> +	struct omap_rproc *oproc = rproc->priv;
> +	struct omap_rproc_timer *timers = oproc->timers;
> +
> +	if (oproc->num_timers <= 0)
> +		return 0;
> +
> +	for (i = 0; i < oproc->num_timers; i++) {
> +		omap_rproc_stop_timer(&timers[i]);
> +		if (configure) {
> +			omap_rproc_release_timer(&timers[i]);
> +			timers[i].odt = NULL;
> +			timers[i].timer_ops = NULL;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>  /**
>   * omap_rproc_mbox_callback() - inbound mailbox message handler
>   * @client: mailbox client pointer used for requesting the mailbox channel
> @@ -226,6 +449,12 @@ static int omap_rproc_start(struct rproc *rproc)
>  		goto put_mbox;
>  	}
>  
> +	ret = omap_rproc_enable_timers(rproc, true);
> +	if (ret) {
> +		dev_err(dev, "omap_rproc_enable_timers failed: %d\n", ret);
> +		goto put_mbox;
> +	}
> +
>  	reset_control_deassert(oproc->reset);
>  
>  	return 0;
> @@ -239,9 +468,14 @@ static int omap_rproc_start(struct rproc *rproc)
>  static int omap_rproc_stop(struct rproc *rproc)
>  {
>  	struct omap_rproc *oproc = rproc->priv;
> +	int ret;
>  
>  	reset_control_assert(oproc->reset);
>  
> +	ret = omap_rproc_disable_timers(rproc, true);
> +	if (ret)
> +		return ret;
> +
>  	mbox_free_channel(oproc->mbox);
>  
>  	return 0;
> @@ -548,6 +782,30 @@ static int omap_rproc_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto free_rproc;
>  
> +	/*
> +	 * Timer nodes are directly used in client nodes as phandles, so
> +	 * retrieve the count using appropriate size
> +	 */
> +	oproc->num_timers = of_property_count_elems_of_size(np, "timers",

Didn't this get a ti, prefix?

And I think you should use of_count_phandle_with_args() instead.

Regards,
Bjorn

> +							    sizeof(phandle));
> +	if (oproc->num_timers <= 0) {
> +		dev_dbg(&pdev->dev, "device does not have timers, status = %d\n",
> +			oproc->num_timers);
> +		oproc->num_timers = 0;
> +	}
> +
> +	if (oproc->num_timers) {
> +		oproc->timers = devm_kzalloc(&pdev->dev, sizeof(*oproc->timers)
> +					     * oproc->num_timers, GFP_KERNEL);
> +		if (!oproc->timers) {
> +			ret = -ENOMEM;
> +			goto free_rproc;
> +		}
> +
> +		dev_dbg(&pdev->dev, "device has %d tick timers\n",
> +			oproc->num_timers);
> +	}
> +
>  	ret = of_reserved_mem_device_init(&pdev->dev);
>  	if (ret) {
>  		dev_err(&pdev->dev, "device does not have specific CMA pool\n");
> -- 
> 2.17.1
> 
> --
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
