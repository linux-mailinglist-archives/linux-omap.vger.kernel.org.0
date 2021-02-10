Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 794CB3160E6
	for <lists+linux-omap@lfdr.de>; Wed, 10 Feb 2021 09:24:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232776AbhBJIYi (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 10 Feb 2021 03:24:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233977AbhBJIYZ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 10 Feb 2021 03:24:25 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57A6FC061786
        for <linux-omap@vger.kernel.org>; Wed, 10 Feb 2021 00:23:45 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id h12so1445557wrw.6
        for <linux-omap@vger.kernel.org>; Wed, 10 Feb 2021 00:23:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=MJzRoK5AHHgr8V25vpyceNTWmZxiFyKsyjhqQm8Vxxc=;
        b=d/b3ponHrtEaGh9+nR4CHVGjqOHtnpraE5raOOOMutWd3Y/vW/uw1i/PmwjfcCAOlI
         hSBPogoT7cAULj0g3PmoKbO+SoDAWMPSOECHnT1Hf4DW/HG3NgCZs5Oz4yycpbsGpbXz
         6aDc3GNQtnk1ZzXHSwQCVv4LOVj0FL2tcZrnkEKPH22CeUw6azGEwO6gqPhOeo/UTzC8
         CAGMYMu0CibvYCRJgy2fuPg3TqVZbhGt5gHufNtUof0Gw0FDR3KgWX5KWtTvRU2bJCB3
         6J8LXoac3H1R5/6ZWZ8wIHim0sOUZG312tHezmcG2vA/YZDFQNq2NLrC7BlZj/TPwF8d
         LG7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=MJzRoK5AHHgr8V25vpyceNTWmZxiFyKsyjhqQm8Vxxc=;
        b=Dwj3Bsz6xc9q5cgsGvbdHKmYZsHN1Ta1hSSnQABI7B+bmoRC/F1BDRq5lFGNJ/VHzd
         HXOmRXt50LFR2ovSur5w3aeX4h7SPVcPy0J+XObiwDWSvSApoNj7UXQXGHai8qrHm6VQ
         5XI1Mp2d4/qSYS+Lfi2nC6MdWENXZEoZO9IwYhkWYcONd4eeMLr58GFIjwQO2HWmDiDP
         azrhdsna+nSKo8hYjiY6cyXwSzjWWTCpB3otmpsv8qMzGZD2D7Hy8058XcRKFhAtMnex
         DmFeFSI6Kt6nD6vpzJ+MCM4v0LMrMfVlV23TxdP1zRwSb/V1jg+YxXbZlEOZGkAuRGFq
         3IPw==
X-Gm-Message-State: AOAM5308fjb0MqxOLRIqhI/ZFdJCLioZPGlSQyQicIYCRNZJU29xYZDr
        YD1nzm/H/jXLKuniuL+b71GFKA==
X-Google-Smtp-Source: ABdhPJzpmLKGtf/B7RhbJlQwrCAP0Mb8Tyioqci54O7y0v57o4U82PROFirmSWr5+lJk79X2A0kouQ==
X-Received: by 2002:a05:6000:2cf:: with SMTP id o15mr2236419wry.184.1612945423966;
        Wed, 10 Feb 2021 00:23:43 -0800 (PST)
Received: from dell ([91.110.221.237])
        by smtp.gmail.com with ESMTPSA id h9sm1850897wrc.94.2021.02.10.00.23.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Feb 2021 00:23:43 -0800 (PST)
Date:   Wed, 10 Feb 2021 08:23:41 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Julia Lawall <Julia.Lawall@inria.fr>
Cc:     Fabio Estevam <festevam@gmail.com>,
        kernel-janitors@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Michal Simek <michal.simek@xilinx.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>
Subject: Re: [PATCH] video: use getter/setter functions
Message-ID: <20210210082341.GH220368@dell>
References: <20210209211325.1261842-1-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210209211325.1261842-1-Julia.Lawall@inria.fr>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, 09 Feb 2021, Julia Lawall wrote:

> Use getter and setter functions, for platform_device structures and a
> spi_device structure.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
> 
> ---
>  drivers/video/backlight/qcom-wled.c                                  |    2 +-

This patch is fine.

Could you please split it out and submit it separately though please.

>  drivers/video/fbdev/amifb.c                                          |    4 ++--
>  drivers/video/fbdev/da8xx-fb.c                                       |    4 ++--
>  drivers/video/fbdev/imxfb.c                                          |    2 +-
>  drivers/video/fbdev/omap2/omapfb/displays/panel-lgphilips-lb035q02.c |    6 +++---
>  drivers/video/fbdev/omap2/omapfb/dss/dpi.c                           |    4 ++--
>  drivers/video/fbdev/omap2/omapfb/dss/dsi.c                           |    4 ++--
>  drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c                         |    2 +-
>  drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c                         |    2 +-
>  drivers/video/fbdev/xilinxfb.c                                       |    2 +-
>  10 files changed, 16 insertions(+), 16 deletions(-)

...]

> diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
> index 3bc7800eb0a9..091f07e7c145 100644
> --- a/drivers/video/backlight/qcom-wled.c
> +++ b/drivers/video/backlight/qcom-wled.c
> @@ -1692,7 +1692,7 @@ static int wled_probe(struct platform_device *pdev)
>  
>  static int wled_remove(struct platform_device *pdev)
>  {
> -	struct wled *wled = dev_get_drvdata(&pdev->dev);
> +	struct wled *wled = platform_get_drvdata(pdev);
>  
>  	mutex_destroy(&wled->lock);
>  	cancel_delayed_work_sync(&wled->ovp_work);

For my own reference (apply this as-is to your sign-off block):

  Acked-for-Backlight-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
