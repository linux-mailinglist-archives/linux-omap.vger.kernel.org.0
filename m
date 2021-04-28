Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCE4236D945
	for <lists+linux-omap@lfdr.de>; Wed, 28 Apr 2021 16:10:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230463AbhD1OLL (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 28 Apr 2021 10:11:11 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:60914 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231375AbhD1OLL (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 28 Apr 2021 10:11:11 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3BB772CF;
        Wed, 28 Apr 2021 16:10:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1619619025;
        bh=E/V0XXm4T2kQ5MCbnOd0J/NAnnIeiGdVO4cwSglIc1k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Iq0zjtLCAk5hMfxqW5f4/VNU8ebslH7wCFZKtKewc2BqFjQaz32wzwDeOyaUNcdl9
         l/icNKwvuDFy6K/jpICFGgDTmRM73ZFZi/0Srysz0aMeSEPOlvintywFPzmH0DmXTO
         tuPMByxxulJkJfijpModIGYplse3im3bFUGNi6QA=
Date:   Wed, 28 Apr 2021 17:10:19 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Sebastian Reichel <sre@kernel.org>,
        dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org
Subject: Re: [PATCHv2] drm/omap: Fix issue with clocks left on after resume
Message-ID: <YIlsy4mOkLcbMKwr@pendragon.ideasonboard.com>
References: <20210428092500.23521-1-tony@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210428092500.23521-1-tony@atomide.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony,

Thank you for the patch.

On Wed, Apr 28, 2021 at 12:25:00PM +0300, Tony Lindgren wrote:
> On resume, dispc pm_runtime_force_resume() is not enabling the hardware
> as we pass the pm_runtime_need_not_resume() test as the device is suspended
> with no child devices.
> 
> As the resume continues, omap_atomic_comit_tail() calls dispc_runtime_get()
> that calls rpm_resume() enabling the hardware, and increasing child_count
> for it's parent device.
> 
> But at this point device_complete() has not yet been called for dispc. So
> when omap_atomic_comit_tail() calls dispc_runtime_put(), it won't idle
> the hardware as rpm_suspend() returns -EBUSY, and the clocks are left on
> after resume. The parent child count is not decremented as the -EBUSY
> cannot be easily handled until later on after device_complete().
> 
> This can be easily seen for example after suspending Beagleboard-X15 with
> no displays connected, and by reading the CM_DSS_DSS_CLKCTRL register at
> 0x4a009120 after resume. After a suspend and resume cycle, it shows a
> value of 0x00040102 instead of 0x00070000 like it should.
> 
> Let's fix the issue by calling dispc_runtime_suspend() and
> dispc_runtime_resume() directly from dispc_suspend() and dispc_resume().
> This leaves out the PM runtime related issues for system suspend.
> 
> We could handle the issue by adding more calls to dispc_runtime_get()
> and dispc_runtime_put() from omap_drm_suspend() and omap_drm_resume()
> as suggested by Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>.
> But that would just add more inter-component calls and more dependencies
> to PM runtime for system suspend and does not make things easier in the
> long.

Based on my experience on the camera and display side with devices that
are made of multiple components, suspend and resume are best handled in
a controlled way by the top-level driver. Otherwise you end up having
different components suspending and resuming in random orders, and
that's a recipe for failure.

Can we get the omapdrm suspend/resume to run first/last, and
stop/restart the whole device from there ?

> See also earlier commit 88d26136a256 ("PM: Prevent runtime suspend during
> system resume") and commit ca8199f13498 ("drm/msm/dpu: ensure device
> suspend happens during PM sleep") for more information.
> 
> Fixes: ecfdedd7da5d ("drm/omap: force runtime PM suspend on system suspend")
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
> 
> Changes since v1:
> - Updated the description for a typo noticed by Tomi
> - Added more info about what all goes wrong
> 
> ---
>  drivers/gpu/drm/omapdrm/dss/dispc.c | 27 ++++++++++++++++++++++++++-
>  1 file changed, 26 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/dss/dispc.c b/drivers/gpu/drm/omapdrm/dss/dispc.c
> --- a/drivers/gpu/drm/omapdrm/dss/dispc.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dispc.c
> @@ -182,6 +182,7 @@ struct dispc_device {
>  	const struct dispc_features *feat;
>  
>  	bool is_enabled;
> +	bool needs_resume;
>  
>  	struct regmap *syscon_pol;
>  	u32 syscon_pol_offset;
> @@ -4887,10 +4888,34 @@ static int dispc_runtime_resume(struct device *dev)
>  	return 0;
>  }
>  
> +static int dispc_suspend(struct device *dev)
> +{
> +	struct dispc_device *dispc = dev_get_drvdata(dev);
> +
> +	if (!dispc->is_enabled)
> +		return 0;
> +
> +	dispc->needs_resume = true;
> +
> +	return dispc_runtime_suspend(dev);
> +}
> +
> +static int dispc_resume(struct device *dev)
> +{
> +	struct dispc_device *dispc = dev_get_drvdata(dev);
> +
> +	if (!dispc->needs_resume)
> +		return 0;
> +
> +	dispc->needs_resume = false;
> +
> +	return dispc_runtime_resume(dev);
> +}
> +
>  static const struct dev_pm_ops dispc_pm_ops = {
>  	.runtime_suspend = dispc_runtime_suspend,
>  	.runtime_resume = dispc_runtime_resume,
> -	SET_LATE_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
> +	SET_LATE_SYSTEM_SLEEP_PM_OPS(dispc_suspend, dispc_resume)
>  };
>  
>  struct platform_driver omap_dispchw_driver = {

-- 
Regards,

Laurent Pinchart
