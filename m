Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5DFE318F07
	for <lists+linux-omap@lfdr.de>; Thu, 11 Feb 2021 16:45:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229480AbhBKPnw (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 11 Feb 2021 10:43:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231281AbhBKPk5 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 11 Feb 2021 10:40:57 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DE50C06178B
        for <linux-omap@vger.kernel.org>; Thu, 11 Feb 2021 07:40:17 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id m1so6180317wml.2
        for <linux-omap@vger.kernel.org>; Thu, 11 Feb 2021 07:40:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=BQASuo84wfslsSEivWFaPBGKyJ+9IhWQICA1bAqw9pc=;
        b=G/UnfUhjvghbtT5LL/ccChqvxR3VGoeJDY0GnhgqREnzARjQQ+nIuF6vtPkRJ67lFU
         IOrCaSzzOWXuAcKHDhheox4KAPQXkPZ0VlDd70F+0DJpVVTh0rBkQDVTuSHeQ06xKPSb
         c1cmmAz6bP+t0knwzzSCM+lT37KdOsOWUDOEw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=BQASuo84wfslsSEivWFaPBGKyJ+9IhWQICA1bAqw9pc=;
        b=bHqzA0vCVum7O30cs6iwGZNYLSrOsJKjNLUSqQNGP4p7WplfgLsNXZGWxQxVSEz8aG
         57eymm+BAZYXunXHE80o2AxWy4Z8uftjCJOqKkD+P2Qo+oKDVICDSZl4Zw3NRjnW7k4Q
         4z4TWLtfjxgZQRHK+cfbkLExxWCHir/n2rH4oyfg/CuhCLA04YO4ltaM6H7wz+qV7PEJ
         CzzOC+BYPwrWj4ZTxogFRwgRRQt21YPWb43X7JPe59gP20BIkMjzrZyYjrFby/7n+ijB
         JpgXRQ5SdpWJPqhxkPJkbvMJwh5vxMqr3qJvv+ZX938XTwUdSuv+qE+5F5DSAbEIaXtU
         M2ig==
X-Gm-Message-State: AOAM533pm0Tm8byIqhmVRvOmN68YalxYea0svC3kLXizPIF3O/0yEUr6
        9CfYJIsne/EyEl++VUx7OtFBdA==
X-Google-Smtp-Source: ABdhPJyEz8KdbutPUEkFdfjjXqFBnVRyCrjCSeZ53ICqWwBwbN6UTPF9mpSKyi9zn1yrCN7w9m+Wqg==
X-Received: by 2002:a1c:113:: with SMTP id 19mr5676819wmb.7.1613058015846;
        Thu, 11 Feb 2021 07:40:15 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id t2sm5773738wru.53.2021.02.11.07.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Feb 2021 07:40:15 -0800 (PST)
Date:   Thu, 11 Feb 2021 16:40:13 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Julia Lawall <Julia.Lawall@inria.fr>,
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
Message-ID: <YCVP3ZKBsJUV0m8G@phenom.ffwll.local>
Mail-Followup-To: Lee Jones <lee.jones@linaro.org>,
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
        Andy Gross <agross@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
        linux-fbdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Shawn Guo <shawnguo@kernel.org>, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20210209211325.1261842-1-Julia.Lawall@inria.fr>
 <20210210082341.GH220368@dell>
 <YCPbxSHWMipTz+mB@phenom.ffwll.local>
 <20210210161258.GA124276@x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210210161258.GA124276@x1>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Feb 10, 2021 at 04:12:58PM +0000, Lee Jones wrote:
> On Wed, 10 Feb 2021, Daniel Vetter wrote:
> 
> > On Wed, Feb 10, 2021 at 08:23:41AM +0000, Lee Jones wrote:
> > > On Tue, 09 Feb 2021, Julia Lawall wrote:
> > > 
> > > > Use getter and setter functions, for platform_device structures and a
> > > > spi_device structure.
> > > > 
> > > > Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
> > > > 
> > > > ---
> > > >  drivers/video/backlight/qcom-wled.c                                  |    2 +-
> > > 
> > > This patch is fine.
> > > 
> > > Could you please split it out and submit it separately though please.
> > 
> > Or just apply the entire patch through backlight tree, there's nothing
> > going on in fbdev anyway I think.
> > 
> > Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> 
> I can do that.  Is that an fbdev Ack?

Yeah defacto I'm somehow stuck with that as maintainer of last resort :-)
Iirc we've got an S: orphaned entry pointing at drm.git trees.
-Daniel


> 
> > > >  drivers/video/fbdev/amifb.c                                          |    4 ++--
> > > >  drivers/video/fbdev/da8xx-fb.c                                       |    4 ++--
> > > >  drivers/video/fbdev/imxfb.c                                          |    2 +-
> > > >  drivers/video/fbdev/omap2/omapfb/displays/panel-lgphilips-lb035q02.c |    6 +++---
> > > >  drivers/video/fbdev/omap2/omapfb/dss/dpi.c                           |    4 ++--
> > > >  drivers/video/fbdev/omap2/omapfb/dss/dsi.c                           |    4 ++--
> > > >  drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c                         |    2 +-
> > > >  drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c                         |    2 +-
> > > >  drivers/video/fbdev/xilinxfb.c                                       |    2 +-
> > > >  10 files changed, 16 insertions(+), 16 deletions(-)
> > > 
> > > ...]
> > > 
> > > > diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
> > > > index 3bc7800eb0a9..091f07e7c145 100644
> > > > --- a/drivers/video/backlight/qcom-wled.c
> > > > +++ b/drivers/video/backlight/qcom-wled.c
> > > > @@ -1692,7 +1692,7 @@ static int wled_probe(struct platform_device *pdev)
> > > >  
> > > >  static int wled_remove(struct platform_device *pdev)
> > > >  {
> > > > -	struct wled *wled = dev_get_drvdata(&pdev->dev);
> > > > +	struct wled *wled = platform_get_drvdata(pdev);
> > > >  
> > > >  	mutex_destroy(&wled->lock);
> > > >  	cancel_delayed_work_sync(&wled->ovp_work);
> > > 
> > > For my own reference (apply this as-is to your sign-off block):
> > > 
> > >   Acked-for-Backlight-by: Lee Jones <lee.jones@linaro.org>
> > > 
> > 
> 
> -- 
> Lee Jones [李琼斯]
> Senior Technical Lead - Developer Services
> Linaro.org │ Open source software for Arm SoCs
> Follow Linaro: Facebook | Twitter | Blog
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
