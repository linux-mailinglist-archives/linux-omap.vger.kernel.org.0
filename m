Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 545FC249439
	for <lists+linux-omap@lfdr.de>; Wed, 19 Aug 2020 06:58:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725497AbgHSE6u (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 19 Aug 2020 00:58:50 -0400
Received: from muru.com ([72.249.23.125]:40838 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725280AbgHSE6u (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 19 Aug 2020 00:58:50 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 2718F810D;
        Wed, 19 Aug 2020 04:58:46 +0000 (UTC)
Date:   Wed, 19 Aug 2020 07:59:14 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Adam Ford <aford173@gmail.com>
Cc:     linux-omap@vger.kernel.org, aford@beaconembedded.com,
        Russell King <linux@armlinux.org.uk>,
        Eduardo Valentin <edubezval@gmail.com>,
        Keerthy <j-keerthy@ti.com>, Zhang Rui <rui.zhang@intel.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org
Subject: Re: [PATCH 1/2] thermal: ti-soc-thermal: Enable addition power
 management
Message-ID: <20200819045914.GS2994@atomide.com>
References: <20200818154633.5421-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200818154633.5421-1-aford173@gmail.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Adam Ford <aford173@gmail.com> [200818 15:46]:
> @@ -1153,6 +1166,38 @@ static int ti_bandgap_suspend(struct device *dev)
>  	return err;
>  }
>  
> +static int bandgap_omap_cpu_notifier(struct notifier_block *nb,
> +				  unsigned long cmd, void *v)
> +{
> +	struct ti_bandgap *bgp;
> +
> +	bgp = container_of(nb, struct ti_bandgap, nb);
> +
> +	spin_lock(&bgp->lock);
> +	switch (cmd) {
> +	case CPU_CLUSTER_PM_ENTER:
> +		if (bgp->is_suspended)
> +			break;
> +		ti_bandgap_save_ctxt(bgp);
> +		ti_bandgap_power(bgp, false);
> +		if (TI_BANDGAP_HAS(bgp, CLK_CTRL))
> +			clk_disable(bgp->fclock);
> +		break;
> +	case CPU_CLUSTER_PM_ENTER_FAILED:
> +	case CPU_CLUSTER_PM_EXIT:
> +		if (bgp->is_suspended)
> +			break;
> +		if (TI_BANDGAP_HAS(bgp, CLK_CTRL))
> +			clk_enable(bgp->fclock);
> +		ti_bandgap_power(bgp, true);
> +		ti_bandgap_restore_ctxt(bgp);
> +		break;
> +	}
> +	spin_unlock(&bgp->lock);
> +
> +	return NOTIFY_OK;
> +}

Hmm to me it looks like is_suspended is not used right now?
I guess you want to set it in ti_bandgap_suspend() and clear
it in ti_bandgap_resume()?

Otherwise looks good to me, I can't test the power consumption
right now though so you may want to check it to make sure
device still hits off mode during idle.

Regards,

Tony
