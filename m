Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48047319C4D
	for <lists+linux-omap@lfdr.de>; Fri, 12 Feb 2021 11:05:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230314AbhBLKDu (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 12 Feb 2021 05:03:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229674AbhBLKDk (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 12 Feb 2021 05:03:40 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EF9CC061756
        for <linux-omap@vger.kernel.org>; Fri, 12 Feb 2021 02:03:00 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id n10so436172wmq.0
        for <linux-omap@vger.kernel.org>; Fri, 12 Feb 2021 02:03:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=6QG81ZJM4e0Z54tok2YgM5IGXnuCS+PLSTvaXCs4Z2g=;
        b=E49ErNQfQ4F7JxhwHQzgTeuC30dIMojbTZRbamSdRwdB3czRTqDszNo7Sn28rJt8uz
         pSHlux1bTy4D8YSk1yTP8mIijFRDhlzYmH2FHRhXwzEYCsl3lb/DVyLWpaQjnD3rifEe
         AcPp6Pv/KAcjhfVAMxvUUaTfgr+4ih/AK6xnkbQewosmXjyliD9D132vlCeyqD0iCIB6
         07Tdh35P84eeMy37RQ39pXsCdHM8NNLteZHW3YplNJwEPGBYAn7fFj1nGDXSmQmW7Wtm
         rVvVYkGhsS7vplIxHyOpOTwh4QmNkwNUokld7BmA+QRJE6qRJc6PYSUmA0+yAENfJZhB
         1+oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=6QG81ZJM4e0Z54tok2YgM5IGXnuCS+PLSTvaXCs4Z2g=;
        b=QWiHx3iRjS67xerzktUTECdCwljhv/eV0mnsFrNlVDym8jULkNrUgEs4VrdHV1Ei4p
         3zbmeLHRIehIHzmuBy83yBN8oeMZNjKffFPhquAI+Trb0CRFlvt7z89FaANXFCmoisF2
         G+9OMQaspUkscO/zfAbZQXOiTp0MffEyrMXIuV5/CBZYEJhfTC/FPL0Rv05PcGiq0GoL
         bvBSJ6/WZoUvUTfrXPcWEUygiPXXENVOPyzxEHxlqLm7TE3VevYuNA0gyAjyrSYoRRA5
         2kGN7U3jaKdBoQ4jlA4T1zD8kDP639hgC1LkkY9HlY3V7ZOARsUOqUtAO6rKHyrtZhtQ
         Q8pQ==
X-Gm-Message-State: AOAM530L7neg0hS2tiE4byDul67a8EBz8Y7KzTa8wjZRrge4ozx1yzPB
        tH+fb+XwIcAxrpQf0oqJMlGRvg==
X-Google-Smtp-Source: ABdhPJwSdOB4cVf8xwsazH54/QT4EC/+//VnZHLp3grjPTZFnxNJeQp+4pBdBM3/PFw9nPHrQYh9LQ==
X-Received: by 2002:a1c:6487:: with SMTP id y129mr1865928wmb.106.1613124178877;
        Fri, 12 Feb 2021 02:02:58 -0800 (PST)
Received: from dell ([91.110.221.187])
        by smtp.gmail.com with ESMTPSA id u14sm9972510wro.10.2021.02.12.02.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Feb 2021 02:02:58 -0800 (PST)
Date:   Fri, 12 Feb 2021 10:02:56 +0000
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
Message-ID: <20210212100256.GB179940@dell>
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

I fixed-up the subject line and commit message a bit and applied.

Thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
