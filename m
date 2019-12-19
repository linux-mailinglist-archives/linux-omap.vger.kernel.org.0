Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 807901271B3
	for <lists+linux-omap@lfdr.de>; Fri, 20 Dec 2019 00:43:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726964AbfLSXnk (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 19 Dec 2019 18:43:40 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:46802 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726992AbfLSXng (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 19 Dec 2019 18:43:36 -0500
Received: by mail-pf1-f196.google.com with SMTP id y14so4157808pfm.13
        for <linux-omap@vger.kernel.org>; Thu, 19 Dec 2019 15:43:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=OtCPyixwd5gWmkI2ho8vgvDObgtIjhtsdj0IKTczXaQ=;
        b=GNKnmX74Gs5S92TDk3mvuXNOZPLV2KJOAVGzYccFgQG2GYGHbMrR0daTpPmpT/QMi0
         sD/ILwE8b55frmFT/HZi4g1vC+TS4yXquY7/NUqddhx2OnG94bmMvLSclxAs4DmkhHm2
         CHxRO++2C8PO+OgVZnlmG+UcW5wmPq33FGssBow2NC/ygNk1K8UHy3EaXxQoTo6/mhiT
         C4ueQgemY5MFNBpaiQfSNs3svD+gLwXL6YOQ1+RcToo58Yurjd9YYQxptOzsrVvTl8iP
         cmbbuQaeQ9zgLtFOfgY0MAAyoPmKsrmSoJGRzejiYImd4wTBebgr6dnUHywhMK00uRaT
         4Zxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=OtCPyixwd5gWmkI2ho8vgvDObgtIjhtsdj0IKTczXaQ=;
        b=jKee2/uUZkQVDux7nkn8b//kGVUL0F9Ni2tA78jYwBKkM7KLcLV1XOfiZda4CcqbG0
         QbWGtHjoRyXB1SAKNx1qF92a2S+7MkFxUp5iDbMjeExfI1Wi+FMJTYZ3RyshxgUx6iW5
         J0vSP51T3+eSIGsxCKnbE7ysXF3u1+vWSIKuXuwe/Pq/LeYXLzbRSFFXlTGy0db0vANG
         Hi8qW12n4SknanpBxy648laiXZXaSVedcYKCafr/cvjQD7gW1FvVdjMV+rDONDFS8AHy
         PcBA7P3dj0CjCABDicSJ9bx0V+wNSYd9hDyDLBMB8kc7XSQ7vJn+fNF/Ff8aXnr1fKvw
         35ug==
X-Gm-Message-State: APjAAAUFDZ6dDcBu8IDKFCW2Ijs/sFMdNw2pgRJjSDAagUVkNsn8QLOE
        BmMjtkHA1Xce5rNAohPs324+4A==
X-Google-Smtp-Source: APXvYqzJUCJ8DJyIauDpldrh8ohlmZJLuIO2aPoMFH9g8sB5BOrEchfH0Z5I9+vW8yFdRpaIND9Lng==
X-Received: by 2002:a63:3dc6:: with SMTP id k189mr11563922pga.396.1576799015042;
        Thu, 19 Dec 2019 15:43:35 -0800 (PST)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id w11sm9816985pfn.4.2019.12.19.15.43.33
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Dec 2019 15:43:34 -0800 (PST)
Date:   Thu, 19 Dec 2019 16:43:32 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Tero Kristo <t-kristo@ti.com>
Cc:     bjorn.andersson@linaro.org, ohad@wizery.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, Suman Anna <s-anna@ti.com>
Subject: Re: [PATCHv3 13/15] remoteproc/omap: add support for runtime
 auto-suspend/resume
Message-ID: <20191219234332.GB32574@xps15>
References: <20191213125537.11509-1-t-kristo@ti.com>
 <20191213125537.11509-14-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191213125537.11509-14-t-kristo@ti.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Dec 13, 2019 at 02:55:35PM +0200, Tero Kristo wrote:
> From: Suman Anna <s-anna@ti.com>
> 
> This patch enhances the PM support in the OMAP remoteproc driver to
> support the runtime auto-suspend. A remoteproc may not be required to
> be running all the time, and typically will need to be active only
> during certain usecases. As such, to save power, it should be turned
> off during potential long periods of inactivity between usecases.
> This suspend and resume of the device is a relatively heavy process
> in terms of latencies, so a remoteproc should be suspended only after
> a certain period of prolonged inactivity. The OMAP remoteproc driver
> leverages the runtime pm framework's auto_suspend feature to accomplish
> this functionality. This feature is automatically enabled when a remote
> processor has successfully booted. The 'autosuspend_delay_ms' for each
> device dictates the inactivity period/time to wait for before
> suspending the device.
> 
> The runtime auto-suspend design relies on marking the last busy time
> on every communication (virtqueue kick) to and from the remote processor.
> When there has been no activity for 'autosuspend_delay_ms' time, the
> runtime PM framework invokes the driver's runtime pm suspend callback
> to suspend the device. The remote processor will be woken up on the
> initiation of the next communication message through the runtime pm
> resume callback. The current auto-suspend design also allows a remote
> processor to deny a auto-suspend attempt, if it wishes to, by sending a
> NACK response to the initial suspend request message sent to the remote
> processor as part of the suspend process. The auto-suspend request is
> also only attempted if the remote processor is idled and in standby at
> the time of inactivity timer expiry. This choice is made to avoid
> unnecessary messaging, and the auto-suspend is simply rescheduled to
> be attempted again after a further lapse of autosuspend_delay_ms.
> 
> The runtime pm callbacks functionality in this patch reuses most of the
> core logic from the suspend/resume support code, and make use of an
> additional auto_suspend flag to differentiate the logic in common code
> from system suspend. The system suspend/resume sequences are also updated
> to reflect the proper pm_runtime statuses, and also to really perform a
> suspend/resume only if the remoteproc has not been auto-suspended at the
> time of request. The remote processor is left in suspended state on a
> system resume if it has been auto-suspended before, and will be woken up
> only when a usecase needs to run. The other significant change in this
> patch is to reset the remoteproc device's pm_domain so as to avoid
> conflicts with the ordering sequences in the device pm_domain's runtime
> callbacks and the reset management and clock management implemented
> within the runtime callbacks in the driver.
> 
> The OMAP remoteproc driver currently uses a default value of 10 seconds
> for all OMAP remoteprocs, and a different value can be chosen either by
> choosing a positive value for the 'autosuspend_delay' in the device's
> omap_rproc_fw_data in the driver match data or by updating the
> 'autosuspend_delay_ms' field at runtime through the sysfs interface.
>     Eg: To use 25 seconds for IPU2 on DRA7xx,
>       echo 25000 > /sys/bus/platform/devices/55020000.ipu/power/autosuspend_delay_ms
> 
> The runtime suspend feature can also be similarly enabled or disabled by
> writing 'auto' or 'on' to the device's 'control' power field. The default
> is enabled.
>     Eg: To disable auto-suspend for IPU2 on DRA7xx SoC,
>       echo on > /sys/bus/platform/devices/55020000.ipu/power/control
> 
> Signed-off-by: Suman Anna <s-anna@ti.com>
> [t-kristo@ti.com: converted to use ti-sysc instead of hwmod]
> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> ---
>  drivers/remoteproc/omap_remoteproc.c | 220 ++++++++++++++++++++++++++-
>  1 file changed, 214 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/omap_remoteproc.c
> index 0a9b9f7d20da..463d6f60947a 100644
> --- a/drivers/remoteproc/omap_remoteproc.c
> +++ b/drivers/remoteproc/omap_remoteproc.c
> @@ -20,6 +20,7 @@
>  #include <linux/of_device.h>
>  #include <linux/of_reserved_mem.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/remoteproc.h>
>  #include <linux/mailbox_client.h>
> @@ -37,6 +38,9 @@
>  #include "omap_remoteproc.h"
>  #include "remoteproc_internal.h"
>  
> +/* default auto-suspend delay (ms) */
> +#define DEFAULT_AUTOSUSPEND_DELAY		10000
> +
>  /**
>   * struct omap_rproc_boot_data - boot data structure for the DSP omap rprocs
>   * @syscon: regmap handle for the system control configuration module
> @@ -83,6 +87,8 @@ struct omap_rproc_timer {
>   * @num_mems: number of internal memory regions
>   * @num_timers: number of rproc timer(s)
>   * @timers: timer(s) info used by rproc
> + * @autosuspend_delay: auto-suspend delay value to be used for runtime pm
> + * @need_resume: if true a resume is needed in the system resume callback
>   * @rproc: rproc handle
>   * @reset: reset handle
>   * @pm_comp: completion primitive to sync for suspend response
> @@ -97,6 +103,8 @@ struct omap_rproc {
>  	int num_mems;
>  	int num_timers;
>  	struct omap_rproc_timer *timers;
> +	int autosuspend_delay;
> +	bool need_resume;
>  	struct rproc *rproc;
>  	struct reset_control *reset;
>  	struct completion pm_comp;
> @@ -111,6 +119,7 @@ struct omap_rproc {
>   * @boot_reg_shift: bit shift for the boot register mask
>   * @mem_names: memory names for this remote processor
>   * @dev_addrs: device addresses corresponding to the memory names
> + * @autosuspend_delay: custom auto-suspend delay value in milliseconds
>   */
>  struct omap_rproc_dev_data {
>  	const char *device_name;
> @@ -118,6 +127,7 @@ struct omap_rproc_dev_data {
>  	int boot_reg_shift;
>  	const char * const *mem_names;
>  	const u32 *dev_addrs;
> +	int autosuspend_delay;
>  };
>  
>  /**
> @@ -384,11 +394,23 @@ static void omap_rproc_kick(struct rproc *rproc, int vqid)
>  	struct device *dev = rproc->dev.parent;
>  	int ret;
>  
> +	/* wake up the rproc before kicking it */
> +	ret = pm_runtime_get_sync(dev);
> +	if (WARN_ON(ret < 0)) {
> +		dev_err(dev, "pm_runtime_get_sync() failed during kick, ret = %d\n",
> +			ret);
> +		pm_runtime_put_noidle(dev);
> +		return;
> +	}
> +
>  	/* send the index of the triggered virtqueue in the mailbox payload */
>  	ret = mbox_send_message(oproc->mbox, (void *)vqid);
>  	if (ret < 0)
>  		dev_err(dev, "failed to send mailbox message, status = %d\n",
>  			ret);
> +
> +	pm_runtime_mark_last_busy(dev);
> +	pm_runtime_put_autosuspend(dev);
>  }
>  
>  /**
> @@ -473,6 +495,19 @@ static int omap_rproc_start(struct rproc *rproc)
>  		goto put_mbox;
>  	}
>  
> +	/*
> +	 * remote processor is up, so update the runtime pm status and
> +	 * enable the auto-suspend. The device usage count is incremented
> +	 * manually for balancing it for auto-suspend
> +	 */
> +	pm_runtime_set_active(dev);
> +	pm_runtime_set_autosuspend_delay(dev, oproc->autosuspend_delay);
> +	pm_runtime_use_autosuspend(dev);
> +	pm_runtime_get(dev);
> +	pm_runtime_enable(dev);
> +	pm_runtime_mark_last_busy(dev);
> +	pm_runtime_put_autosuspend(dev);
> +
>  	reset_control_deassert(oproc->reset);
>  
>  	return 0;
> @@ -485,9 +520,26 @@ static int omap_rproc_start(struct rproc *rproc)
>  /* power off the remote processor */
>  static int omap_rproc_stop(struct rproc *rproc)
>  {
> +	struct device *dev = rproc->dev.parent;
>  	struct omap_rproc *oproc = rproc->priv;
>  	int ret;
>  
> +	/*
> +	 * cancel any possible scheduled runtime suspend by incrementing
> +	 * the device usage count, and resuming the device. The remoteproc
> +	 * also needs to be woken up if suspended, to avoid the remoteproc
> +	 * OS to continue to remember any context that it has saved, and
> +	 * avoid potential issues in misindentifying a subsequent device
> +	 * reboot as a power restore boot
> +	 */
> +	ret = pm_runtime_get_sync(dev);
> +	if (ret < 0) {
> +		pm_runtime_put_noidle(dev);
> +		return ret;
> +	}
> +
> +	pm_runtime_put_sync(dev);
> +
>  	reset_control_assert(oproc->reset);
>  
>  	ret = omap_rproc_disable_timers(rproc, true);
> @@ -496,6 +548,15 @@ static int omap_rproc_stop(struct rproc *rproc)
>  
>  	mbox_free_channel(oproc->mbox);
>  
> +	/*
> +	 * update the runtime pm states and status now that the remoteproc
> +	 * has stopped
> +	 */
> +	pm_runtime_disable(dev);
> +	pm_runtime_dont_use_autosuspend(dev);
> +	pm_runtime_put_noidle(dev);
> +	pm_runtime_set_suspended(dev);
> +
>  	return 0;
>  }
>  
> @@ -552,17 +613,19 @@ static bool _is_rproc_in_standby(struct omap_rproc *oproc)
>  
>  /* 1 sec is long enough time to let the remoteproc side suspend the device */
>  #define DEF_SUSPEND_TIMEOUT 1000
> -static int _omap_rproc_suspend(struct rproc *rproc)
> +static int _omap_rproc_suspend(struct rproc *rproc, bool auto_suspend)
>  {
>  	struct device *dev = rproc->dev.parent;
>  	struct omap_rproc *oproc = rproc->priv;
>  	unsigned long to = msecs_to_jiffies(DEF_SUSPEND_TIMEOUT);
>  	unsigned long ta = jiffies + to;
> +	u32 suspend_msg = auto_suspend ?
> +				RP_MBOX_SUSPEND_AUTO : RP_MBOX_SUSPEND_SYSTEM;
>  	int ret;
>  
>  	reinit_completion(&oproc->pm_comp);
>  	oproc->suspend_acked = false;
> -	ret = mbox_send_message(oproc->mbox, (void *)RP_MBOX_SUSPEND_SYSTEM);
> +	ret = mbox_send_message(oproc->mbox, (void *)suspend_msg);
>  	if (ret < 0) {
>  		dev_err(dev, "PM mbox_send_message failed: %d\n", ret);
>  		return ret;
> @@ -602,25 +665,55 @@ static int _omap_rproc_suspend(struct rproc *rproc)
>  		goto enable_device;
>  	}
>  
> +	/*
> +	 * IOMMUs would have to be disabled specifically for runtime suspend.
> +	 * They are handled automatically through System PM callbacks for
> +	 * regular system suspend
> +	 */
> +	if (auto_suspend) {
> +		ret = omap_iommu_domain_deactivate(rproc->domain);
> +		if (ret) {
> +			dev_err(dev, "iommu domain deactivate failed %d\n",
> +				ret);
> +			goto enable_timers;
> +		}
> +	}
> +
>  	return 0;
> +enable_timers:
> +	/* ignore errors on re-enabling code */
> +	omap_rproc_enable_timers(rproc, false);
>  
>  enable_device:
>  	reset_control_deassert(oproc->reset);
>  	return ret;
>  }
>  
> -static int _omap_rproc_resume(struct rproc *rproc)
> +static int _omap_rproc_resume(struct rproc *rproc, bool auto_suspend)
>  {
>  	struct device *dev = rproc->dev.parent;
>  	struct omap_rproc *oproc = rproc->priv;
>  	int ret;
>  
> +	/*
> +	 * IOMMUs would have to be enabled specifically for runtime resume.
> +	 * They would have been already enabled automatically through System
> +	 * PM callbacks for regular system resume
> +	 */
> +	if (auto_suspend) {
> +		ret = omap_iommu_domain_activate(rproc->domain);
> +		if (ret) {
> +			dev_err(dev, "omap_iommu activate failed %d\n", ret);
> +			goto out;
> +		}
> +	}
> +
>  	/* boot address could be lost after suspend, so restore it */
>  	if (oproc->boot_data) {
>  		ret = omap_rproc_write_dsp_boot_addr(rproc);
>  		if (ret) {
>  			dev_err(dev, "boot address restore failed %d\n", ret);
> -			goto out;
> +			goto suspend_iommu;

The same needs to be done if omap_rproc_enable_timers() fails.

>  		}
>  	}
>  
> @@ -633,6 +726,12 @@ static int _omap_rproc_resume(struct rproc *rproc)
>  
>  	reset_control_deassert(oproc->reset);
>  
> +	return 0;
> +
> +suspend_iommu:
> +	if (auto_suspend)
> +		omap_iommu_domain_deactivate(rproc->domain);
> +
>  out:
>  	return ret;
>  }
> @@ -641,6 +740,7 @@ static int __maybe_unused omap_rproc_suspend(struct device *dev)
>  {
>  	struct platform_device *pdev = to_platform_device(dev);
>  	struct rproc *rproc = platform_get_drvdata(pdev);
> +	struct omap_rproc *oproc = rproc->priv;
>  	int ret = 0;
>  
>  	mutex_lock(&rproc->lock);
> @@ -655,13 +755,25 @@ static int __maybe_unused omap_rproc_suspend(struct device *dev)
>  		goto out;
>  	}
>  
> -	ret = _omap_rproc_suspend(rproc);
> +	ret = _omap_rproc_suspend(rproc, false);
>  	if (ret) {
>  		dev_err(dev, "suspend failed %d\n", ret);
>  		goto out;
>  	}
>  
> +	/*
> +	 * remoteproc is running at the time of system suspend, so remember
> +	 * it so as to wake it up during system resume
> +	 */
> +	oproc->need_resume = 1;

Please use 'true' to be consistent with the type and omap_rproc_resume().

>  	rproc->state = RPROC_SUSPENDED;
> +
> +	/*
> +	 * update the runtime pm status to be suspended, without decrementing
> +	 * the device usage count
> +	 */
> +	pm_runtime_disable(dev);
> +	pm_runtime_set_suspended(dev);
>  out:
>  	mutex_unlock(&rproc->lock);
>  	return ret;
> @@ -671,6 +783,7 @@ static int __maybe_unused omap_rproc_resume(struct device *dev)
>  {
>  	struct platform_device *pdev = to_platform_device(dev);
>  	struct rproc *rproc = platform_get_drvdata(pdev);
> +	struct omap_rproc *oproc = rproc->priv;
>  	int ret = 0;
>  
>  	mutex_lock(&rproc->lock);
> @@ -682,17 +795,91 @@ static int __maybe_unused omap_rproc_resume(struct device *dev)
>  		goto out;
>  	}
>  
> -	ret = _omap_rproc_resume(rproc);
> +	/*
> +	 * remoteproc was auto-suspended at the time of system suspend,
> +	 * so no need to wake-up the processor (leave it in suspended
> +	 * state, will be woken up during a subsequent runtime_resume)
> +	 */
> +	if (!oproc->need_resume)
> +		goto out;
> +
> +	ret = _omap_rproc_resume(rproc, false);
>  	if (ret) {
>  		dev_err(dev, "resume failed %d\n", ret);
>  		goto out;
>  	}
> +	oproc->need_resume = false;
>  
>  	rproc->state = RPROC_RUNNING;
> +
> +	/*
> +	 * update the runtime pm status to be active, without incrementing
> +	 * the device usage count
> +	 */
> +	pm_runtime_set_active(dev);
> +	pm_runtime_enable(dev);
> +	pm_runtime_mark_last_busy(dev);
>  out:
>  	mutex_unlock(&rproc->lock);
>  	return ret;
>  }
> +
> +static int omap_rproc_runtime_suspend(struct device *dev)
> +{
> +	struct rproc *rproc = dev_get_drvdata(dev);
> +	struct omap_rproc *oproc = rproc->priv;
> +	int ret;
> +
> +	if (rproc->state == RPROC_CRASHED) {
> +		dev_dbg(dev, "rproc cannot be runtime suspended when crashed!\n");
> +		return -EBUSY;
> +	}
> +
> +	if (WARN_ON(rproc->state != RPROC_RUNNING)) {
> +		dev_err(dev, "rproc cannot be runtime suspended when not running!\n");
> +		return -EBUSY;
> +	}
> +
> +	/*
> +	 * do not even attempt suspend if the remote processor is not
> +	 * idled for runtime auto-suspend
> +	 */
> +	if (!_is_rproc_in_standby(oproc)) {
> +		ret = -EBUSY;
> +		goto abort;
> +	}
> +
> +	ret = _omap_rproc_suspend(rproc, true);
> +	if (ret)
> +		goto abort;
> +
> +	rproc->state = RPROC_SUSPENDED;
> +	return 0;
> +
> +abort:
> +	pm_runtime_mark_last_busy(dev);
> +	return ret;
> +}
> +
> +static int omap_rproc_runtime_resume(struct device *dev)
> +{
> +	struct rproc *rproc = dev_get_drvdata(dev);
> +	int ret;
> +
> +	if (WARN_ON(rproc->state != RPROC_SUSPENDED)) {
> +		dev_err(dev, "rproc cannot be runtime resumed if not suspended!\n");
> +		return -EBUSY;
> +	}
> +
> +	ret = _omap_rproc_resume(rproc, true);
> +	if (ret) {
> +		dev_err(dev, "runtime resume failed %d\n", ret);
> +		return ret;
> +	}
> +
> +	rproc->state = RPROC_RUNNING;
> +	return 0;
> +}
>  #endif /* CONFIG_PM */
>  
>  static const char * const ipu_mem_names[] = {
> @@ -778,6 +965,20 @@ static const struct of_device_id omap_rproc_of_match[] = {
>  };
>  MODULE_DEVICE_TABLE(of, omap_rproc_of_match);
>  
> +static int omap_rproc_get_autosuspend_delay(struct platform_device *pdev)
> +{
> +	const struct omap_rproc_dev_data *data;
> +	int delay;
> +
> +	data = of_device_get_match_data(&pdev->dev);
> +	if (!data)
> +		return -ENODEV;

This check is done in omap_rproc_of_get_internal_memories() and
omap_rproc_get_boot_data().  I think it would be best to do it once at the top
of the probe() function and be done with it.

That being said and as noted in a previous comment, I would push all tuneables
to the DT.  If the property is missing then things default to
DEFAULT_AUTOSUSPEND_DELAY.

> +
> +	delay = data->autosuspend_delay;
> +
> +	return (delay > 0) ? delay : DEFAULT_AUTOSUSPEND_DELAY;
> +}
> +
>  static const char *omap_rproc_get_firmware(struct platform_device *pdev)
>  {
>  	const char *fw_name;
> @@ -953,6 +1154,11 @@ static int omap_rproc_probe(struct platform_device *pdev)
>  	}
>  
>  	init_completion(&oproc->pm_comp);
> +	oproc->autosuspend_delay = omap_rproc_get_autosuspend_delay(pdev);
> +	if (oproc->autosuspend_delay < 0) {
> +		ret = oproc->autosuspend_delay;
> +		goto free_rproc;
> +	}
>  
>  	oproc->fck = devm_clk_get(&pdev->dev, 0);
>  	if (IS_ERR(oproc->fck)) {
> @@ -994,6 +1200,8 @@ static int omap_rproc_remove(struct platform_device *pdev)
>  
>  static const struct dev_pm_ops omap_rproc_pm_ops = {
>  	SET_SYSTEM_SLEEP_PM_OPS(omap_rproc_suspend, omap_rproc_resume)
> +	SET_RUNTIME_PM_OPS(omap_rproc_runtime_suspend,
> +			   omap_rproc_runtime_resume, NULL)
>  };
>  
>  static struct platform_driver omap_rproc_driver = {
> -- 
> 2.17.1
> 
> --
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
