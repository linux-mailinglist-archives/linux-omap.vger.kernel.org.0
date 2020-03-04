Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C6C6A179B05
	for <lists+linux-omap@lfdr.de>; Wed,  4 Mar 2020 22:35:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726440AbgCDVfI (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 4 Mar 2020 16:35:08 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:43257 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728614AbgCDVfI (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 4 Mar 2020 16:35:08 -0500
Received: by mail-pl1-f194.google.com with SMTP id x17so1603232plm.10
        for <linux-omap@vger.kernel.org>; Wed, 04 Mar 2020 13:35:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=RC3zlmLzgkfDEhAcR4v69VJESgugLf17FEdxupK09/c=;
        b=zSUJygJMsJyAKGW6nSL9gs1pSzvOHTdj1/PkZ5u7QsfzAIkIfZYK079jXLIaNl3o9Q
         jCxR8RYDyu0CWQf9zXNE/Q/Wb+OVxA1Ltff+R5hzea4KUVA9cyEVG0ivVIw29VCxKKl2
         26vvhANlr3Tesu4ZuL19q1ZRn236LLtudF6zAQ3XxEfs9Bba392u4plUw16JzgsScgY4
         XkjuuukbTrt49W4/Aw1X6LEA0cdWI2Ezy9LTG25J3DJGrs+9QiB4q5OLFhZq9aIK3/PE
         gdGWovIhkyzkRX9bd2S03rJkPwz8AQhF62Py7GzB1Np3uiEa6fPWDEejwk0AFhXVOomW
         kgfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=RC3zlmLzgkfDEhAcR4v69VJESgugLf17FEdxupK09/c=;
        b=Fz5Qeoj3MmQXQiGWwcYdnYjDvP+T3XiV8QCOl7hVZ5C9kOpO+O1VAGvDOWvYvzUaTs
         hpSpEA/x4V6sAeUELUzGzZGnblZPBS4zp5fFYv1b+gO9m6DRoTfskgEQAVqi4rF8Wvo8
         InFrafJgcwAUE2PHsH71+DaILXc6FwEIHvG78WVg0k1i0YCGg7yx3xGKyZwhlKDtoBaC
         nezd/VuEeu4bPJhUs/2OtEhxJaMr+ywiW/0WSY2zJacVQZXCdRR9ulEx5raE+5upINUo
         vg8JbBFn60FoQQPS1huMbP571WRfGDcRw7wMgWiLbUpPAvmkhvBgxS3/SB70pzjOlcNs
         0XFg==
X-Gm-Message-State: ANhLgQ0+p+K8vcZJM2Vhjnzkyq+2cA7CMDeN8xjceuRNZkT1ievbddvC
        F08Mecp1J9dkIf41g4og/DhugQ==
X-Google-Smtp-Source: ADFU+vvqXj3dWfu+KgUOYtSSbSKPWpv3Nq55zNRKdQoYxGfP+m0cXgXzhxwkFX/DX4Q2Evb5wb7MnQ==
X-Received: by 2002:a17:902:ab8f:: with SMTP id f15mr4894715plr.280.1583357706576;
        Wed, 04 Mar 2020 13:35:06 -0800 (PST)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id gx18sm3698069pjb.8.2020.03.04.13.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2020 13:35:06 -0800 (PST)
Date:   Wed, 4 Mar 2020 14:35:03 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Tero Kristo <t-kristo@ti.com>
Cc:     bjorn.andersson@linaro.org, ohad@wizery.com,
        linux-remoteproc@vger.kernel.org, afd@ti.com, s-anna@ti.com,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCHv7 12/15] remoteproc/omap: Add support for runtime
 auto-suspend/resume
Message-ID: <20200304213503.GK8197@xps15>
References: <20200221101936.16833-1-t-kristo@ti.com>
 <20200221101936.16833-13-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200221101936.16833-13-t-kristo@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Feb 21, 2020 at 12:19:33PM +0200, Tero Kristo wrote:
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
> only when a usecase needs to run.
> 
> The OMAP remoteproc driver currently uses a default value of 10 seconds
> for all OMAP remoteprocs, and a different value can be chosen either by
> choosing a positive value for the 'ti,autosuspend-delay-ms' under DT or
> by updating the 'autosuspend_delay_ms' field at runtime through the
> sysfs interface. A negative value is equivalent to disabling the runtime
> suspend.
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
> v7:
>   - fixed the broken behavior for timers during runtime suspend
>   - revamped the runtime PM handling code back towards the initial
>     implementation, Suman reported some issues which seemed to have
>     been introduced by my attempts to clean-up the code a bit.
> 
>  drivers/remoteproc/omap_remoteproc.c | 202 +++++++++++++++++++++++++--
>  1 file changed, 193 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/omap_remoteproc.c
> index 0d45af1fb0e3..1ac270df4d66 100644
> --- a/drivers/remoteproc/omap_remoteproc.c
> +++ b/drivers/remoteproc/omap_remoteproc.c
> @@ -22,6 +22,7 @@
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
> @@ -407,11 +415,23 @@ static void omap_rproc_kick(struct rproc *rproc, int vqid)
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
> @@ -504,6 +524,18 @@ static int omap_rproc_start(struct rproc *rproc)
>  		goto disable_timers;
>  	}
>  
> +	/*
> +	 * remote processor is up, so update the runtime pm status and
> +	 * enable the auto-suspend. The device usage count is incremented
> +	 * manually for balancing it for auto-suspend
> +	 */
> +	pm_runtime_set_active(dev);
> +	pm_runtime_use_autosuspend(dev);
> +	pm_runtime_get_noresume(dev);
> +	pm_runtime_enable(dev);
> +	pm_runtime_mark_last_busy(dev);
> +	pm_runtime_put_autosuspend(dev);
> +
>  	return 0;
>  
>  disable_timers:
> @@ -516,20 +548,52 @@ static int omap_rproc_start(struct rproc *rproc)
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
>  	ret = reset_control_assert(oproc->reset);
>  	if (ret)
> -		return ret;
> +		goto out;
>  
>  	ret = omap_rproc_disable_timers(rproc, true);
>  	if (ret)
> -		return ret;
> +		goto enable_device;
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
> +
> +enable_device:
> +	reset_control_deassert(oproc->reset);
> +out:
> +	/* schedule the next auto-suspend */
> +	pm_runtime_mark_last_busy(dev);
> +	pm_runtime_put_autosuspend(dev);
> +	return ret;
>  }
>  
>  /**
> @@ -586,17 +650,19 @@ static bool _is_rproc_in_standby(struct omap_rproc *oproc)
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
> @@ -640,32 +706,62 @@ static int _omap_rproc_suspend(struct rproc *rproc)
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
>  
> +enable_timers:
> +	/* ignore errors on re-enabling code */
> +	omap_rproc_enable_timers(rproc, false);
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
>  		}
>  	}
>  
>  	ret = omap_rproc_enable_timers(rproc, false);
>  	if (ret) {
>  		dev_err(dev, "enabling timers during resume failed %d\n", ret);
> -		goto out;
> +		goto suspend_iommu;
>  	}
>  
>  	ret = reset_control_deassert(oproc->reset);
> @@ -678,6 +774,9 @@ static int _omap_rproc_resume(struct rproc *rproc)
>  
>  disable_timers:
>  	omap_rproc_disable_timers(rproc, false);
> +suspend_iommu:
> +	if (auto_suspend)
> +		omap_iommu_domain_deactivate(rproc->domain);
>  out:
>  	return ret;
>  }
> @@ -686,6 +785,7 @@ static int __maybe_unused omap_rproc_suspend(struct device *dev)
>  {
>  	struct platform_device *pdev = to_platform_device(dev);
>  	struct rproc *rproc = platform_get_drvdata(pdev);
> +	struct omap_rproc *oproc = rproc->priv;
>  	int ret = 0;
>  
>  	mutex_lock(&rproc->lock);
> @@ -700,13 +800,19 @@ static int __maybe_unused omap_rproc_suspend(struct device *dev)
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
> +	oproc->need_resume = true;
>  	rproc->state = RPROC_SUSPENDED;
> +
>  out:
>  	mutex_unlock(&rproc->lock);
>  	return ret;
> @@ -716,6 +822,7 @@ static int __maybe_unused omap_rproc_resume(struct device *dev)
>  {
>  	struct platform_device *pdev = to_platform_device(dev);
>  	struct rproc *rproc = platform_get_drvdata(pdev);
> +	struct omap_rproc *oproc = rproc->priv;
>  	int ret = 0;
>  
>  	mutex_lock(&rproc->lock);
> @@ -727,17 +834,86 @@ static int __maybe_unused omap_rproc_resume(struct device *dev)
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
>  
> +	oproc->need_resume = false;
>  	rproc->state = RPROC_RUNNING;
> +
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

Shouldn't the rproc->lock be held here?  Same for omap_rproc_runtime_resume().

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
> +		dev_err(dev, "rproc cannot be runtime resumed if not suspended! state=%d\n",
> +			rproc->state);
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
>  static const struct omap_rproc_mem_data ipu_mems[] = {
> @@ -983,6 +1159,12 @@ static int omap_rproc_probe(struct platform_device *pdev)
>  	}
>  
>  	init_completion(&oproc->pm_comp);
> +	oproc->autosuspend_delay = DEFAULT_AUTOSUSPEND_DELAY;
> +
> +	of_property_read_u32(pdev->dev.of_node, "ti,autosuspend-delay-ms",
> +			     &oproc->autosuspend_delay);
> +
> +	pm_runtime_set_autosuspend_delay(&pdev->dev, oproc->autosuspend_delay);
>  
>  	oproc->fck = devm_clk_get(&pdev->dev, 0);
>  	if (IS_ERR(oproc->fck)) {
> @@ -1025,6 +1207,8 @@ static int omap_rproc_remove(struct platform_device *pdev)
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
