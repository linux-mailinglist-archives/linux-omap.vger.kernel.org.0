Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8A1C36C130
	for <lists+linux-omap@lfdr.de>; Tue, 27 Apr 2021 10:47:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229655AbhD0IsK (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 27 Apr 2021 04:48:10 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:41288 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229629AbhD0IsJ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 27 Apr 2021 04:48:09 -0400
Received: from [192.168.1.111] (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0A54EE9;
        Tue, 27 Apr 2021 10:47:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1619513245;
        bh=7TGn+2lQ5iUH5+gWfDkN9ad+SwyQsgv3tvhAd5pw/iA=;
        h=To:Cc:References:From:Subject:Date:In-Reply-To:From;
        b=W6GnmYaPULBGfNIqcSyiMB+48tf47k5avfv70cXQhWEjPEo8pkpSB4yrBTHZE/PSI
         /8zOFiW/7z1T+ou3dDyplIeN2M/96WPIMFQmopJG2yFy5j6LDllO3a4DiPak9NdvK1
         jVylDtsSOO88QuU7vlwY+DSPDca1LqAEVx/AD3Vw=
To:     Tony Lindgren <tony@atomide.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sebastian Reichel <sre@kernel.org>,
        dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org
References: <20210426141241.51985-1-tony@atomide.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH] drm/omap: Fix issue with clocks left on after resume
Message-ID: <0963c9fa-1b45-b742-ed9b-5c48d3a97987@ideasonboard.com>
Date:   Tue, 27 Apr 2021 11:47:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210426141241.51985-1-tony@atomide.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony,

On 26/04/2021 17:12, Tony Lindgren wrote:
> On resume, dispc pm_runtime_force_resume() is not enabling the hardware
> as we pass the pm_runtime_need_not_resume() test as the device is suspended
> with no child devices.
> 
> As the resume continues, omap_atomic_comit_tail() calls dispc_runtime_get()
> that calls rpm_resume() enabling the hardware, and increasing child_count
> for it's parent device.
> 
> But at this point device_complete() has not yet been called for dispc. So
> when omap_atomic_comit_tail() calls dispc_runtime_get(), it won't idle

Is that supposed to be dispc_runtime_put()?

> the hardware, and the clocks are left on after resume.
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
> See also earlier commit 88d26136a256 ("PM: Prevent runtime suspend during
> system resume") and commit ca8199f13498 ("drm/msm/dpu: ensure device
> suspend happens during PM sleep") for more information.
> 
> Fixes: ecfdedd7da5d ("drm/omap: force runtime PM suspend on system suspend")
> Signed-off-by: Tony Lindgren <tony@atomide.com>

Why is this only needed for dispc, and not the other dss submodules 
which were handled in ecfdedd7da5d?

I have to say I'm pretty confused (maybe partly because it's been a 
while since I debugged this =). Aren't the 
pm_runtime_force_suspend/resume made explicitly for this use case? At 
least that is how I read the documentation.

If I understand right, this is only an issue when the dss was not 
enabled before the system suspend? And as the dispc is not enabled at 
suspend, pm_runtime_force_suspend and pm_runtime_force_resume don't 
really do anything. At resume, the DRM resume functionality causes 
omapdrm to call pm_runtime_get and put, and this somehow causes the dss 
to stay enabled.

I think I'm missing something here, but this patch feels like a hack 
fix. But continuing with the hack mindset, as the PM apparently needs 
DSS to be enabled at suspend for it to work correctly, lets give that to 
the PM. This seems to work also:

diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c 
b/drivers/gpu/drm/omapdrm/omap_drv.c
index 28bbad1353ee..0fd9d80d3e12 100644
--- a/drivers/gpu/drm/omapdrm/omap_drv.c
+++ b/drivers/gpu/drm/omapdrm/omap_drv.c
@@ -695,6 +695,8 @@ static int omap_drm_suspend(struct device *dev)
         struct omap_drm_private *priv = dev_get_drvdata(dev);
         struct drm_device *drm_dev = priv->ddev;

+       dispc_runtime_get(priv->dispc);
+
         return drm_mode_config_helper_suspend(drm_dev);
  }

@@ -705,6 +707,8 @@ static int omap_drm_resume(struct device *dev)

         drm_mode_config_helper_resume(drm_dev);

+       dispc_runtime_put(priv->dispc);
+
         return omap_gem_resume(drm_dev);
  }
  #endif

But I don't think that helps with the other dss submodules either.

  Tomi
