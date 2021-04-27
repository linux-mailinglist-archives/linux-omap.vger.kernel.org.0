Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A015636C25A
	for <lists+linux-omap@lfdr.de>; Tue, 27 Apr 2021 12:12:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235133AbhD0KNZ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 27 Apr 2021 06:13:25 -0400
Received: from muru.com ([72.249.23.125]:49106 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230341AbhD0KNZ (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 27 Apr 2021 06:13:25 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 4BDE980EB;
        Tue, 27 Apr 2021 10:12:41 +0000 (UTC)
Date:   Tue, 27 Apr 2021 13:12:37 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sebastian Reichel <sre@kernel.org>,
        dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH] drm/omap: Fix issue with clocks left on after resume
Message-ID: <YIfjlVaiGa2sz8qW@atomide.com>
References: <20210426141241.51985-1-tony@atomide.com>
 <0963c9fa-1b45-b742-ed9b-5c48d3a97987@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0963c9fa-1b45-b742-ed9b-5c48d3a97987@ideasonboard.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> [210427 08:47]:
> Hi Tony,
> 
> On 26/04/2021 17:12, Tony Lindgren wrote:
> > On resume, dispc pm_runtime_force_resume() is not enabling the hardware
> > as we pass the pm_runtime_need_not_resume() test as the device is suspended
> > with no child devices.
> > 
> > As the resume continues, omap_atomic_comit_tail() calls dispc_runtime_get()
> > that calls rpm_resume() enabling the hardware, and increasing child_count
> > for it's parent device.
> > 
> > But at this point device_complete() has not yet been called for dispc. So
> > when omap_atomic_comit_tail() calls dispc_runtime_get(), it won't idle
> 
> Is that supposed to be dispc_runtime_put()?

Oops that's right, yes it should have dispc_runtime_put() there.

> > the hardware, and the clocks are left on after resume.
> > 
> > This can be easily seen for example after suspending Beagleboard-X15 with
> > no displays connected, and by reading the CM_DSS_DSS_CLKCTRL register at
> > 0x4a009120 after resume. After a suspend and resume cycle, it shows a
> > value of 0x00040102 instead of 0x00070000 like it should.
> > 
> > Let's fix the issue by calling dispc_runtime_suspend() and
> > dispc_runtime_resume() directly from dispc_suspend() and dispc_resume().
> > This leaves out the PM runtime related issues for system suspend.
> > 
> > See also earlier commit 88d26136a256 ("PM: Prevent runtime suspend during
> > system resume") and commit ca8199f13498 ("drm/msm/dpu: ensure device
> > suspend happens during PM sleep") for more information.
> > 
> > Fixes: ecfdedd7da5d ("drm/omap: force runtime PM suspend on system suspend")
> > Signed-off-by: Tony Lindgren <tony@atomide.com>
> 
> Why is this only needed for dispc, and not the other dss submodules which
> were handled in ecfdedd7da5d?

For dispc, the other components are also calling dispc_runtime_get() and
dispc_runtime_put(). I don't think the other parts have such dss cross
component calls happening during system suspend and resume.

> I have to say I'm pretty confused (maybe partly because it's been a while
> since I debugged this =). Aren't the pm_runtime_force_suspend/resume made
> explicitly for this use case? At least that is how I read the documentation.

IMO using pm_runtime_force_suspend() and pm_runtime_force_resume() in the
system suspend and resume path is a big hack. In the long run it's best to
just use the same device internal functions for both PM runtime and system
suspend and leave out the unnecessary PM runtime calls for system suspend.

> If I understand right, this is only an issue when the dss was not enabled
> before the system suspend? And as the dispc is not enabled at suspend,
> pm_runtime_force_suspend and pm_runtime_force_resume don't really do
> anything. At resume, the DRM resume functionality causes omapdrm to call
> pm_runtime_get and put, and this somehow causes the dss to stay enabled.

We do have dss enabled at system suspend from omap_atomic_comit_tail()
until pm_runtime_force_suspend(). Then we have pm_runtime_force_resume()
enable it.

Then on resume PM runtime prevents disable of the hardware on resume path
until after device_complete(). Until then we have rpm_suspend() return
-EBUSY, and so the parent child_count is not going to get decreased.
Something would have to handle the -EBUSY error here it seems.

> I think I'm missing something here, but this patch feels like a hack fix.

Probably the lack of handling for rpm_suspend() -EBUSY is the missing
part :)

> But continuing with the hack mindset, as the PM apparently needs DSS to be
> enabled at suspend for it to work correctly, lets give that to the PM. This
> seems to work also:
> 
> diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c
> b/drivers/gpu/drm/omapdrm/omap_drv.c
> index 28bbad1353ee..0fd9d80d3e12 100644
> --- a/drivers/gpu/drm/omapdrm/omap_drv.c
> +++ b/drivers/gpu/drm/omapdrm/omap_drv.c
> @@ -695,6 +695,8 @@ static int omap_drm_suspend(struct device *dev)
>         struct omap_drm_private *priv = dev_get_drvdata(dev);
>         struct drm_device *drm_dev = priv->ddev;
> 
> +       dispc_runtime_get(priv->dispc);
> +
>         return drm_mode_config_helper_suspend(drm_dev);
>  }
> 
> @@ -705,6 +707,8 @@ static int omap_drm_resume(struct device *dev)
> 
>         drm_mode_config_helper_resume(drm_dev);
> 
> +       dispc_runtime_put(priv->dispc);
> +
>         return omap_gem_resume(drm_dev);
>  }
>  #endif

Yeah sure this works too.. That is if you want to keep the dependency
around for pm_runtime_force_suspend(), cause some extra PM runtime
calls, and also add few more dss cross-component calls to dispc PM
runtime while saving a few lines of code :)

Naturally removing the dependency to pm_runtime_force_suspend() can
be done separately later on too, up to you.

> But I don't think that helps with the other dss submodules either.

I don't think we have other dss components call other components'
PM runtime functions during system suspend and resume like we have
for dispc. But yeah similar issues could be lurking there for the
other components.

Regards,

Tony
