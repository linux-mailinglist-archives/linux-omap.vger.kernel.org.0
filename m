Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A97FE3167AF
	for <lists+linux-omap@lfdr.de>; Wed, 10 Feb 2021 14:15:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230419AbhBJNPn (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 10 Feb 2021 08:15:43 -0500
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:49754 "EHLO
        mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229862AbhBJNPl (ORCPT
        <rfc822;linux-omap@vger.kernel.org>);
        Wed, 10 Feb 2021 08:15:41 -0500
X-IronPort-AV: E=Sophos;i="5.81,168,1610406000"; 
   d="scan'208";a="492258135"
Received: from 173.121.68.85.rev.sfr.net (HELO hadrien) ([85.68.121.173])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 10 Feb 2021 14:14:54 +0100
Date:   Wed, 10 Feb 2021 14:14:54 +0100 (CET)
From:   Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To:     Daniel Vetter <daniel@ffwll.ch>
cc:     Lee Jones <lee.jones@linaro.org>,
        Julia Lawall <Julia.Lawall@inria.fr>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        linux-kernel@vger.kernel.org,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Jingoo Han <jingoohan1@gmail.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        kernel-janitors@vger.kernel.org,
        Michal Simek <michal.simek@xilinx.com>,
        dri-devel@lists.freedesktop.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-fbdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Shawn Guo <shawnguo@kernel.org>, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] video: use getter/setter functions
In-Reply-To: <YCPbxSHWMipTz+mB@phenom.ffwll.local>
Message-ID: <alpine.DEB.2.22.394.2102101414100.2881@hadrien>
References: <20210209211325.1261842-1-Julia.Lawall@inria.fr> <20210210082341.GH220368@dell> <YCPbxSHWMipTz+mB@phenom.ffwll.local>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-2043823747-1612962895=:2881"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2043823747-1612962895=:2881
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT



On Wed, 10 Feb 2021, Daniel Vetter wrote:

> On Wed, Feb 10, 2021 at 08:23:41AM +0000, Lee Jones wrote:
> > On Tue, 09 Feb 2021, Julia Lawall wrote:
> >
> > > Use getter and setter functions, for platform_device structures and a
> > > spi_device structure.
> > >
> > > Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
> > >
> > > ---
> > >  drivers/video/backlight/qcom-wled.c                                  |    2 +-
> >
> > This patch is fine.
> >
> > Could you please split it out and submit it separately though please.
>
> Or just apply the entire patch through backlight tree, there's nothing
> going on in fbdev anyway I think.

I was indeed not sure how much to split this up.  If it is desired to
split it more, I can do that.

julia

>
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>
> >
> > >  drivers/video/fbdev/amifb.c                                          |    4 ++--
> > >  drivers/video/fbdev/da8xx-fb.c                                       |    4 ++--
> > >  drivers/video/fbdev/imxfb.c                                          |    2 +-
> > >  drivers/video/fbdev/omap2/omapfb/displays/panel-lgphilips-lb035q02.c |    6 +++---
> > >  drivers/video/fbdev/omap2/omapfb/dss/dpi.c                           |    4 ++--
> > >  drivers/video/fbdev/omap2/omapfb/dss/dsi.c                           |    4 ++--
> > >  drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c                         |    2 +-
> > >  drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c                         |    2 +-
> > >  drivers/video/fbdev/xilinxfb.c                                       |    2 +-
> > >  10 files changed, 16 insertions(+), 16 deletions(-)
> >
> > ...]
> >
> > > diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
> > > index 3bc7800eb0a9..091f07e7c145 100644
> > > --- a/drivers/video/backlight/qcom-wled.c
> > > +++ b/drivers/video/backlight/qcom-wled.c
> > > @@ -1692,7 +1692,7 @@ static int wled_probe(struct platform_device *pdev)
> > >
> > >  static int wled_remove(struct platform_device *pdev)
> > >  {
> > > -	struct wled *wled = dev_get_drvdata(&pdev->dev);
> > > +	struct wled *wled = platform_get_drvdata(pdev);
> > >
> > >  	mutex_destroy(&wled->lock);
> > >  	cancel_delayed_work_sync(&wled->ovp_work);
> >
> > For my own reference (apply this as-is to your sign-off block):
> >
> >   Acked-for-Backlight-by: Lee Jones <lee.jones@linaro.org>
> >
> > --
> > Lee Jones [李琼斯]
> > Senior Technical Lead - Developer Services
> > Linaro.org │ Open source software for Arm SoCs
> > Follow Linaro: Facebook | Twitter | Blog
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
>
--8323329-2043823747-1612962895=:2881--
