Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A8EF179BBA
	for <lists+linux-omap@lfdr.de>; Wed,  4 Mar 2020 23:33:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388407AbgCDWdE (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 4 Mar 2020 17:33:04 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:36944 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388371AbgCDWdE (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 4 Mar 2020 17:33:04 -0500
Received: by mail-pf1-f196.google.com with SMTP id p14so1709672pfn.4
        for <linux-omap@vger.kernel.org>; Wed, 04 Mar 2020 14:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=QTVY2PxB+QGjjFSvZUdTuRF2OkQB7vIlqQijuIquHBo=;
        b=bUC9NhxqTDAjUy2ox2zYGyLYjAaeDNIJ7Iiioc8/P4kn8MdZW8oR2skmQBWdvMIqBM
         AMLjBugMlUKfqdaieMoD8fRgEm2ZvUafuiHr8bdMV6Kc6bsP4/4XGNUfKLDR/qzR3w92
         /KnIajMvuXDWiaAYXa37mVMzoklB77S+LGSKdLnUI8EBCNXN+mg/BJfruCuKPWtOaihw
         xXPdNBw5wW6obfAEw36Ji5O8F8O9vK9Orzzdk0k7x/ksnmcoGf+jjOrIR674XXHgkt67
         qAlZC6W0k6rml/VW3ON1NGER1s5I8+ZxJ1rMGQTrr367DGEyY+UuLFLcfjQIiqpOrAFa
         2zag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=QTVY2PxB+QGjjFSvZUdTuRF2OkQB7vIlqQijuIquHBo=;
        b=LlH7bj5YUPeWgnE/x8t146oIC/jsL+jz4u7DomiJbL5jrLTypybaYNgwpJcRLu7/bu
         VN8ePoIlrB2fZ0Gbh1E5jdzAj0GIl3/r6wmUdc6oxouT4EDYrzvMB9PQe+CRIlIsWkhB
         2QxwHlfpr5H8urZ2zsGiUOct55rW6OKPI2g33rWuwZZl1EIUMU+qmgYtQlD7U3och8JV
         JTQ4oO90TWYKYF9cqoNl70xYQ4EZUoQchcOLMukRvJN05u7ivowCZyKXpF7Vb6NljYlp
         yOwgnKvARIncVUpTsmn5Znf99ZnDaFVkQ+0lFQctainoH7Qt9yxCAHb08htLYT+VaOLo
         eiaQ==
X-Gm-Message-State: ANhLgQ2vAEpdA9wsn/A8a2Et7u1sVsExFRnS6TY8/nRj1w3Cxh7NJ6Sp
        Rc7FqRfeKaXLV6WnEVZd/EQOgA==
X-Google-Smtp-Source: ADFU+vtKd9ENApFp7KD0NDm3BBBDpo1miSmpeF9w8Rvx5BCRyo117gHCG9Gs+Q5eHQ4SzgiF7MUZOg==
X-Received: by 2002:a65:5383:: with SMTP id x3mr4419402pgq.279.1583361182682;
        Wed, 04 Mar 2020 14:33:02 -0800 (PST)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id u1sm29461190pfn.133.2020.03.04.14.33.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2020 14:33:02 -0800 (PST)
Date:   Wed, 4 Mar 2020 15:33:00 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Tero Kristo <t-kristo@ti.com>
Cc:     bjorn.andersson@linaro.org, ohad@wizery.com,
        linux-remoteproc@vger.kernel.org, afd@ti.com, s-anna@ti.com,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCHv7 14/15] remoteproc/omap: Add watchdog functionality for
 remote processors
Message-ID: <20200304223300.GB2799@xps15>
References: <20200221101936.16833-1-t-kristo@ti.com>
 <20200221101936.16833-15-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200221101936.16833-15-t-kristo@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Feb 21, 2020 at 12:19:35PM +0200, Tero Kristo wrote:
> From: Suman Anna <s-anna@ti.com>
> 
> Remote processors can be stuck in a loop, and may not be recoverable
> if they do not have a built-in watchdog. The watchdog implementation
> for OMAP remote processors uses external gptimers that can be used
> to interrupt both the Linux host as well as the remote processor.
> 
> Each remote processor is responsible for refreshing the timer during
> normal behavior - during OS task scheduling or entering the idle loop
> properly. During a watchdog condition (executing a tight loop causing
> no scheduling), the host processor gets interrupts and schedules a
> recovery for the corresponding remote processor. The remote processor
> may also get interrupted to be able to print a back trace.
> 
> A menuconfig option has also been added to enable/disable the Watchdog
> functionality, with the default as disabled.
> 
> Signed-off-by: Suman Anna <s-anna@ti.com>
> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> ---
> v7:
>   - minor kerneldoc updates
> 
>  drivers/remoteproc/Kconfig           |  12 +++
>  drivers/remoteproc/omap_remoteproc.c | 153 ++++++++++++++++++++++++---
>  2 files changed, 153 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> index b52abc2268cc..5f33358eb2f1 100644
> --- a/drivers/remoteproc/Kconfig
> +++ b/drivers/remoteproc/Kconfig
> @@ -52,6 +52,18 @@ config OMAP_REMOTEPROC
>  	  It's safe to say N here if you're not interested in multimedia
>  	  offloading or just want a bare minimum kernel.
>  
> +config OMAP_REMOTEPROC_WATCHDOG
> +	bool "OMAP remoteproc watchdog timer"
> +	depends on OMAP_REMOTEPROC
> +	default n
> +	help
> +	  Say Y here to enable watchdog timer for remote processors.
> +
> +	  This option controls the watchdog functionality for the remote
> +	  processors in OMAP. Dedicated OMAP DMTimers are used by the remote
> +	  processors and triggers the timer interrupt upon a watchdog
> +	  detection.
> +
>  config WKUP_M3_RPROC
>  	tristate "AMx3xx Wakeup M3 remoteproc support"
>  	depends on SOC_AM33XX || SOC_AM43XX
> diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/omap_remoteproc.c
> index 7dcb5da0d940..bae01a9f8afc 100644
> --- a/drivers/remoteproc/omap_remoteproc.c
> +++ b/drivers/remoteproc/omap_remoteproc.c
> @@ -24,6 +24,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/dma-mapping.h>
> +#include <linux/interrupt.h>
>  #include <linux/remoteproc.h>
>  #include <linux/mailbox_client.h>
>  #include <linux/omap-iommu.h>
> @@ -72,10 +73,12 @@ struct omap_rproc_mem {
>   * struct omap_rproc_timer - data structure for a timer used by a omap rproc
>   * @odt: timer pointer
>   * @timer_ops: OMAP dmtimer ops for @odt timer
> + * @irq: timer irq
>   */
>  struct omap_rproc_timer {
>  	struct omap_dm_timer *odt;
>  	const struct omap_dm_timer_ops *timer_ops;
> +	int irq;
>  };
>  
>  /**
> @@ -86,6 +89,7 @@ struct omap_rproc_timer {
>   * @mem: internal memory regions data
>   * @num_mems: number of internal memory regions
>   * @num_timers: number of rproc timer(s)
> + * @num_wd_timers: number of rproc watchdog timers
>   * @timers: timer(s) info used by rproc
>   * @autosuspend_delay: auto-suspend delay value to be used for runtime pm
>   * @need_resume: if true a resume is needed in the system resume callback
> @@ -102,6 +106,7 @@ struct omap_rproc {
>  	struct omap_rproc_mem *mem;
>  	int num_mems;
>  	int num_timers;
> +	int num_wd_timers;
>  	struct omap_rproc_timer *timers;
>  	int autosuspend_delay;
>  	bool need_resume;
> @@ -219,6 +224,79 @@ static inline int omap_rproc_release_timer(struct omap_rproc_timer *timer)
>  	return timer->timer_ops->free(timer->odt);
>  }
>  
> +/**
> + * omap_rproc_get_timer_irq() - get the irq for a timer
> + * @timer: handle to a OMAP rproc timer
> + *
> + * This function is used to get the irq associated with a watchdog timer. The
> + * function is called by the OMAP remoteproc driver to register a interrupt
> + * handler to handle watchdog events on the remote processor.
> + *
> + * Return: irq id on success, otherwise a failure as returned by DMTimer ops
> + */
> +static inline int omap_rproc_get_timer_irq(struct omap_rproc_timer *timer)
> +{
> +	return timer->timer_ops->get_irq(timer->odt);
> +}
> +
> +/**
> + * omap_rproc_ack_timer_irq() - acknowledge a timer irq
> + * @timer: handle to a OMAP rproc timer
> + *
> + * This function is used to clear the irq associated with a watchdog timer. The
> + * The function is called by the OMAP remoteproc upon a watchdog event on the
> + * remote processor to clear the interrupt status of the watchdog timer.
> + */
> +static inline void omap_rproc_ack_timer_irq(struct omap_rproc_timer *timer)
> +{
> +	timer->timer_ops->write_status(timer->odt, OMAP_TIMER_INT_OVERFLOW);
> +}
> +
> +/**
> + * omap_rproc_watchdog_isr() - Watchdog ISR handler for remoteproc device
> + * @irq: IRQ number associated with a watchdog timer
> + * @data: IRQ handler data
> + *
> + * This ISR routine executes the required necessary low-level code to
> + * acknowledge a watchdog timer interrupt. There can be multiple watchdog
> + * timers associated with a rproc (like IPUs which have 2 watchdog timers,
> + * one per Cortex M3/M4 core), so a lookup has to be performed to identify
> + * the timer to acknowledge its interrupt.
> + *
> + * The function also invokes rproc_report_crash to report the watchdog event
> + * to the remoteproc driver core, to trigger a recovery.
> + *
> + * Return: IRQ_HANDLED on success, otherwise IRQ_NONE
> + */
> +static irqreturn_t omap_rproc_watchdog_isr(int irq, void *data)
> +{
> +	struct rproc *rproc = data;
> +	struct omap_rproc *oproc = rproc->priv;
> +	struct device *dev = rproc->dev.parent;
> +	struct omap_rproc_timer *timers = oproc->timers;
> +	struct omap_rproc_timer *wd_timer = NULL;
> +	int num_timers = oproc->num_timers + oproc->num_wd_timers;
> +	int i;
> +
> +	for (i = oproc->num_timers; i < num_timers; i++) {
> +		if (timers[i].irq > 0 && irq == timers[i].irq) {
> +			wd_timer = &timers[i];
> +			break;
> +		}
> +	}
> +
> +	if (!wd_timer) {
> +		dev_err(dev, "invalid timer\n");
> +		return IRQ_NONE;
> +	}
> +
> +	omap_rproc_ack_timer_irq(wd_timer);
> +
> +	rproc_report_crash(rproc, RPROC_WATCHDOG);
> +
> +	return IRQ_HANDLED;
> +}
> +
>  /**
>   * omap_rproc_enable_timers() - enable the timers for a remoteproc
>   * @rproc: handle of a remote processor
> @@ -242,19 +320,26 @@ static int omap_rproc_enable_timers(struct rproc *rproc, bool configure)
>  	struct omap_rproc_timer *timers = oproc->timers;
>  	struct device *dev = rproc->dev.parent;
>  	struct device_node *np = NULL;
> +	int num_timers = oproc->num_timers + oproc->num_wd_timers;
>  
> -	if (!oproc->num_timers)
> +	if (!num_timers)
>  		return 0;
>  
>  	if (!configure)
>  		goto start_timers;
>  
> -	for (i = 0; i < oproc->num_timers; i++) {
> -		np = of_parse_phandle(dev->of_node, "ti,timers", i);
> +	for (i = 0; i < num_timers; i++) {
> +		if (i < oproc->num_timers)
> +			np = of_parse_phandle(dev->of_node, "ti,timers", i);
> +		else
> +			np = of_parse_phandle(dev->of_node,
> +					      "ti,watchdog-timers",
> +					      (i - oproc->num_timers));
>  		if (!np) {
>  			ret = -ENXIO;
>  			dev_err(dev, "device node lookup for timer at index %d failed: %d\n",
> -				i, ret);
> +				i < oproc->num_timers ? i :
> +				i - oproc->num_timers, ret);
>  			goto free_timers;
>  		}
>  
> @@ -277,12 +362,14 @@ static int omap_rproc_enable_timers(struct rproc *rproc, bool configure)
>  		if (!timer_ops || !timer_ops->request_by_node ||
>  		    !timer_ops->set_source || !timer_ops->set_load ||
>  		    !timer_ops->free || !timer_ops->start ||
> -		    !timer_ops->stop) {
> +		    !timer_ops->stop || !timer_ops->get_irq ||
> +		    !timer_ops->write_status) {
>  			ret = -EINVAL;
>  			dev_err(dev, "device does not have required timer ops\n");
>  			goto put_node;
>  		}
>  
> +		timers[i].irq = -1;
>  		timers[i].timer_ops = timer_ops;
>  		ret = omap_rproc_request_timer(dev, np, &timers[i]);
>  		if (ret) {
> @@ -291,10 +378,33 @@ static int omap_rproc_enable_timers(struct rproc *rproc, bool configure)
>  			goto put_node;
>  		}
>  		of_node_put(np);
> +
> +		if (i >= oproc->num_timers) {

We already have num_wd_timers and oproc->timers is allocated via
devm_kcalloc()...  I think the code would be much easier to ready and maintain
if watchdog timers where held in their own array.

> +			timers[i].irq = omap_rproc_get_timer_irq(&timers[i]);
> +			if (timers[i].irq < 0) {
> +				dev_err(dev, "get_irq for timer %p failed: %d\n",
> +					np, timers[i].irq);
> +				ret = -EBUSY;
> +				goto free_timers;
> +			}
> +
> +			ret = request_irq(timers[i].irq,
> +					  omap_rproc_watchdog_isr, IRQF_SHARED,
> +					  "rproc-wdt", rproc);
> +			if (ret) {
> +				dev_err(dev, "error requesting irq for timer %p\n",
> +					np);
> +				omap_rproc_release_timer(&timers[i]);
> +				timers[i].odt = NULL;
> +				timers[i].timer_ops = NULL;
> +				timers[i].irq = -1;
> +				goto free_timers;
> +			}
> +		}
>  	}
>  
>  start_timers:
> -	for (i = 0; i < oproc->num_timers; i++) {
> +	for (i = 0; i < num_timers; i++) {
>  		ret = omap_rproc_start_timer(&timers[i]);
>  		if (ret) {
>  			dev_err(dev, "start timer %p failed failed: %d\n", np,
> @@ -316,9 +426,12 @@ static int omap_rproc_enable_timers(struct rproc *rproc, bool configure)
>  		of_node_put(np);
>  free_timers:
>  	while (i--) {
> +		if (i >= oproc->num_timers)
> +			free_irq(timers[i].irq, rproc);
>  		omap_rproc_release_timer(&timers[i]);
>  		timers[i].odt = NULL;
>  		timers[i].timer_ops = NULL;
> +		timers[i].irq = -1;
>  	}
>  
>  	return ret;
> @@ -341,16 +454,20 @@ static int omap_rproc_disable_timers(struct rproc *rproc, bool configure)
>  	int i;
>  	struct omap_rproc *oproc = rproc->priv;
>  	struct omap_rproc_timer *timers = oproc->timers;
> +	int num_timers = oproc->num_timers + oproc->num_wd_timers;
>  
> -	if (!oproc->num_timers)
> +	if (!num_timers)
>  		return 0;
>  
> -	for (i = 0; i < oproc->num_timers; i++) {
> +	for (i = 0; i < num_timers; i++) {
>  		omap_rproc_stop_timer(&timers[i]);
>  		if (configure) {
> +			if (i >= oproc->num_timers)
> +				free_irq(timers[i].irq, rproc);
>  			omap_rproc_release_timer(&timers[i]);
>  			timers[i].odt = NULL;
>  			timers[i].timer_ops = NULL;
> +			timers[i].irq = -1;
>  		}
>  	}
>  
> @@ -1097,6 +1214,7 @@ static int omap_rproc_probe(struct platform_device *pdev)
>  	struct omap_rproc *oproc;
>  	struct rproc *rproc;
>  	const char *firmware;
> +	int num_timers;
>  	int ret;
>  	struct reset_control *reset;
>  
> @@ -1149,8 +1267,19 @@ static int omap_rproc_probe(struct platform_device *pdev)
>  		oproc->num_timers = 0;
>  	}
>  
> -	if (oproc->num_timers) {
> -		oproc->timers = devm_kcalloc(&pdev->dev, oproc->num_timers,
> +#ifdef CONFIG_OMAP_REMOTEPROC_WATCHDOG
> +	oproc->num_wd_timers =
> +		of_count_phandle_with_args(np, "ti,watchdog-timers", NULL);
> +	if (oproc->num_wd_timers <= 0) {
> +		dev_dbg(&pdev->dev, "device does not have watchdog timers, status = %d\n",
> +			oproc->num_wd_timers);
> +		oproc->num_wd_timers = 0;
> +	}
> +#endif

Please turn this into a function with the implementation conditional on the
#ifdef.

> +
> +	if (oproc->num_timers || oproc->num_wd_timers) {
> +		num_timers = oproc->num_timers + oproc->num_wd_timers;
> +		oproc->timers = devm_kcalloc(&pdev->dev, num_timers,
>  					     sizeof(*oproc->timers),
>  					     GFP_KERNEL);
>  		if (!oproc->timers) {
> @@ -1158,8 +1287,8 @@ static int omap_rproc_probe(struct platform_device *pdev)
>  			goto free_rproc;
>  		}
>  
> -		dev_dbg(&pdev->dev, "device has %d tick timers\n",
> -			oproc->num_timers);
> +		dev_dbg(&pdev->dev, "device has %d tick timers and %d watchdog timers\n",
> +			oproc->num_timers, oproc->num_wd_timers);
>  	}
>  
>  	init_completion(&oproc->pm_comp);
> -- 
> 2.17.1
> 
> --
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
