Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F13A34ED6B5
	for <lists+linux-omap@lfdr.de>; Thu, 31 Mar 2022 11:20:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233761AbiCaJWK (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 31 Mar 2022 05:22:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233772AbiCaJWJ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 31 Mar 2022 05:22:09 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D315B149257
        for <linux-omap@vger.kernel.org>; Thu, 31 Mar 2022 02:20:21 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id 17so31147576ljw.8
        for <linux-omap@vger.kernel.org>; Thu, 31 Mar 2022 02:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yb1CwtRmEKzIaitcV1uYLwn8+8pZFjjspdViJJfupOA=;
        b=ZVNcse89FnS0p2MERvWwHHx+x2VGNuwikCUeoTxdS2FJH5IXUGs1zs44GPCgnahrmP
         vZZbTOXFIu8zofVmAd3wEwNeNAg5myFqamo2tyZixqiEjdZFj3/iMmMO/8F5eVsN194H
         bF2e7XhExhg9W9PeUlQK0HnU00nyJuZDjCYgqMLtvzq83taW7KpNBEKcdzO59l6FY21b
         3f95NwQak3KY5B1TXR12cboT0htcj2A9yol090mRwiFYIA1oLuPDjGnilE2OUjjSR/ao
         r81c5sWTYT5rQaxsI7eTSg0/Bp+GKz8DjYWe0CQwBb3GM7hPAXs9uaGzBpCH85u/8gW8
         7hew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yb1CwtRmEKzIaitcV1uYLwn8+8pZFjjspdViJJfupOA=;
        b=eUQ5ITTQ3VVO2f1gGCkHXS7ViemHDsC7fINHPlevzr3rUXzt0kyCIqnpJkNlEzxiDO
         B+iU6zUNM673xf5hS9y9lIpIflBRoXLFuNyKKWIlCHpxJZoxa/99oGhwlGxPrK4IRGNN
         KdV1MFkMbNVduidpEqzyfinpX2IxfNd36bV6VDjfQmLZzC5JxbZHTP8OhNp46Jd9qYBh
         zarve2tK65OWNoDuKq0s86ImZLpmx84A4ligNSkDY7tm/LSJJ7f10KgVWRj4o2VROIYu
         edVbV3jL8eD2vx8R0YxSrw7AWstbzS27YTXyOERCbWI+dkrexSYCMwsTccyjuEaMROt/
         T3QA==
X-Gm-Message-State: AOAM530C3CAqO3LZhOvQU1S2ios4ncV0Ang9y6yO2nWG/bPf/mdOOYKM
        mFW0OsuyK0ULa+YoxaTw2xJcA+kTGis1An0ZPPNQFUWe/50=
X-Google-Smtp-Source: ABdhPJz+kAZcZEC2yAQlLV7UUNbIWXceatEQrPLAt0dIltU6wVAgQ1+IOFUjIw7LEs2lkteHpxx7wd6Qd7MfvOQUEn8=
X-Received: by 2002:a2e:b012:0:b0:249:8061:8486 with SMTP id
 y18-20020a2eb012000000b0024980618486mr9816579ljk.463.1648718419607; Thu, 31
 Mar 2022 02:20:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220310233307.99220-3-jmkrzyszt@gmail.com> <20220321215416.236250-1-jmkrzyszt@gmail.com>
In-Reply-To: <20220321215416.236250-1-jmkrzyszt@gmail.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 31 Mar 2022 11:19:43 +0200
Message-ID: <CAPDyKFo3sD-5OrfknMQt10D8A7ygMCUW3PV7EQ7L_MB9GxEDbQ@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: OMAP1: Prepare for conversion of OMAP1 clocks to CCF
To:     Janusz Krzysztofik <jmkrzyszt@gmail.com>
Cc:     Tony Lindgren <tony@atomide.com>, Paul Walmsley <paul@pwsan.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Helge Deller <deller@gmx.de>, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>, Felipe Balbi <balbi@kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-mmc@vger.kernel.org,
        alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, 21 Mar 2022 at 22:54, Janusz Krzysztofik <jmkrzyszt@gmail.com> wrote:
>
> In preparation for conversion of OMAP1 clocks to common clock framework,
> identify users of those clocks which don't call clk_prepare/unprepare()
> and update them to call clk_prepare_enable/clk_disable_unprepare() instead
> of just clk_enable/disable(), as required by CCF implementation of clock
> API.
>
> v2: update still a few more OMAP specific drivers missed in v1,
>   - call clk_prepare/unprepare() just after/before clk_get/put() where it
>     can make more sense than merging prepare/unprepare with enable/disable.
>
> Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>

Is there a specific reason why you can't split this into a per subsystem patch?

Don't get me wrong, if you need my ack you have it, but I just wanted
to know why this is?

Kind regards
Uffe

> ---
>  arch/arm/mach-omap1/mcbsp.c       |  8 ++++----
>  arch/arm/mach-omap1/ocpi.c        |  4 ++--
>  arch/arm/mach-omap1/serial.c      |  6 +++---
>  arch/arm/mach-omap1/timer32k.c    |  2 +-
>  drivers/mmc/host/omap.c           | 23 ++++++++++++++---------
>  drivers/usb/gadget/udc/omap_udc.c | 14 ++++++++------
>  drivers/usb/host/ohci-omap.c      | 18 ++++++++++++++++--
>  drivers/video/fbdev/omap/hwa742.c |  6 +++---
>  drivers/video/fbdev/omap/lcdc.c   |  6 +++---
>  drivers/video/fbdev/omap/sossi.c  |  5 +++--
>  sound/soc/ti/osk5912.c            |  9 ++++++++-
>  11 files changed, 65 insertions(+), 36 deletions(-)
>
> diff --git a/arch/arm/mach-omap1/mcbsp.c b/arch/arm/mach-omap1/mcbsp.c
> index f36c34f47f11..3ec2badff6af 100644
> --- a/arch/arm/mach-omap1/mcbsp.c
> +++ b/arch/arm/mach-omap1/mcbsp.c
> @@ -44,8 +44,8 @@ static void omap1_mcbsp_request(unsigned int id)
>                         api_clk = clk_get(NULL, "api_ck");
>                         dsp_clk = clk_get(NULL, "dsp_ck");
>                         if (!IS_ERR(api_clk) && !IS_ERR(dsp_clk)) {
> -                               clk_enable(api_clk);
> -                               clk_enable(dsp_clk);
> +                               clk_prepare_enable(api_clk);
> +                               clk_prepare_enable(dsp_clk);
>
>                                 /*
>                                  * DSP external peripheral reset
> @@ -63,11 +63,11 @@ static void omap1_mcbsp_free(unsigned int id)
>         if (id == 0 || id == 2) {
>                 if (--dsp_use == 0) {
>                         if (!IS_ERR(api_clk)) {
> -                               clk_disable(api_clk);
> +                               clk_disable_unprepare(api_clk);
>                                 clk_put(api_clk);
>                         }
>                         if (!IS_ERR(dsp_clk)) {
> -                               clk_disable(dsp_clk);
> +                               clk_disable_unprepare(dsp_clk);
>                                 clk_put(dsp_clk);
>                         }
>                 }
> diff --git a/arch/arm/mach-omap1/ocpi.c b/arch/arm/mach-omap1/ocpi.c
> index 380ea2de58c1..03cc48024fd6 100644
> --- a/arch/arm/mach-omap1/ocpi.c
> +++ b/arch/arm/mach-omap1/ocpi.c
> @@ -73,7 +73,7 @@ static int __init omap_ocpi_init(void)
>         if (IS_ERR(ocpi_ck))
>                 return PTR_ERR(ocpi_ck);
>
> -       clk_enable(ocpi_ck);
> +       clk_prepare_enable(ocpi_ck);
>         ocpi_enable();
>         pr_info("OMAP OCPI interconnect driver loaded\n");
>
> @@ -87,7 +87,7 @@ static void __exit omap_ocpi_exit(void)
>         if (!cpu_is_omap16xx())
>                 return;
>
> -       clk_disable(ocpi_ck);
> +       clk_disable_unprepare(ocpi_ck);
>         clk_put(ocpi_ck);
>  }
>
> diff --git a/arch/arm/mach-omap1/serial.c b/arch/arm/mach-omap1/serial.c
> index 9eb591fbfd89..5f591a836ab5 100644
> --- a/arch/arm/mach-omap1/serial.c
> +++ b/arch/arm/mach-omap1/serial.c
> @@ -141,7 +141,7 @@ void __init omap_serial_init(void)
>                         if (IS_ERR(uart1_ck))
>                                 printk("Could not get uart1_ck\n");
>                         else {
> -                               clk_enable(uart1_ck);
> +                               clk_prepare_enable(uart1_ck);
>                                 if (cpu_is_omap15xx())
>                                         clk_set_rate(uart1_ck, 12000000);
>                         }
> @@ -151,7 +151,7 @@ void __init omap_serial_init(void)
>                         if (IS_ERR(uart2_ck))
>                                 printk("Could not get uart2_ck\n");
>                         else {
> -                               clk_enable(uart2_ck);
> +                               clk_prepare_enable(uart2_ck);
>                                 if (cpu_is_omap15xx())
>                                         clk_set_rate(uart2_ck, 12000000);
>                                 else
> @@ -163,7 +163,7 @@ void __init omap_serial_init(void)
>                         if (IS_ERR(uart3_ck))
>                                 printk("Could not get uart3_ck\n");
>                         else {
> -                               clk_enable(uart3_ck);
> +                               clk_prepare_enable(uart3_ck);
>                                 if (cpu_is_omap15xx())
>                                         clk_set_rate(uart3_ck, 12000000);
>                         }
> diff --git a/arch/arm/mach-omap1/timer32k.c b/arch/arm/mach-omap1/timer32k.c
> index 780fdf03c3ce..049c7b7f28c4 100644
> --- a/arch/arm/mach-omap1/timer32k.c
> +++ b/arch/arm/mach-omap1/timer32k.c
> @@ -180,7 +180,7 @@ int __init omap_32k_timer_init(void)
>
>                 sync32k_ick = clk_get(NULL, "omap_32ksync_ick");
>                 if (!IS_ERR(sync32k_ick))
> -                       clk_enable(sync32k_ick);
> +                       clk_prepare_enable(sync32k_ick);
>
>                 ret = omap_init_clocksource_32k(base);
>         }
> diff --git a/drivers/mmc/host/omap.c b/drivers/mmc/host/omap.c
> index 5e5af34090f1..57d39283924d 100644
> --- a/drivers/mmc/host/omap.c
> +++ b/drivers/mmc/host/omap.c
> @@ -1374,7 +1374,7 @@ static int mmc_omap_probe(struct platform_device *pdev)
>         host->iclk = clk_get(&pdev->dev, "ick");
>         if (IS_ERR(host->iclk))
>                 return PTR_ERR(host->iclk);
> -       clk_enable(host->iclk);
> +       clk_prepare_enable(host->iclk);
>
>         host->fclk = clk_get(&pdev->dev, "fck");
>         if (IS_ERR(host->fclk)) {
> @@ -1382,16 +1382,18 @@ static int mmc_omap_probe(struct platform_device *pdev)
>                 goto err_free_iclk;
>         }
>
> +       ret = clk_prepare(host->fclk);
> +       if (ret)
> +               goto err_put_fclk;
> +
>         host->dma_tx_burst = -1;
>         host->dma_rx_burst = -1;
>
>         host->dma_tx = dma_request_chan(&pdev->dev, "tx");
>         if (IS_ERR(host->dma_tx)) {
>                 ret = PTR_ERR(host->dma_tx);
> -               if (ret == -EPROBE_DEFER) {
> -                       clk_put(host->fclk);
> -                       goto err_free_iclk;
> -               }
> +               if (ret == -EPROBE_DEFER)
> +                       goto err_free_fclk;
>
>                 host->dma_tx = NULL;
>                 dev_warn(host->dev, "TX DMA channel request failed\n");
> @@ -1403,8 +1405,7 @@ static int mmc_omap_probe(struct platform_device *pdev)
>                 if (ret == -EPROBE_DEFER) {
>                         if (host->dma_tx)
>                                 dma_release_channel(host->dma_tx);
> -                       clk_put(host->fclk);
> -                       goto err_free_iclk;
> +                       goto err_free_fclk;
>                 }
>
>                 host->dma_rx = NULL;
> @@ -1454,9 +1455,12 @@ static int mmc_omap_probe(struct platform_device *pdev)
>                 dma_release_channel(host->dma_tx);
>         if (host->dma_rx)
>                 dma_release_channel(host->dma_rx);
> +err_free_fclk:
> +       clk_unprepare(host->fclk);
> +err_put_fclk:
>         clk_put(host->fclk);
>  err_free_iclk:
> -       clk_disable(host->iclk);
> +       clk_disable_unprepare(host->iclk);
>         clk_put(host->iclk);
>         return ret;
>  }
> @@ -1476,8 +1480,9 @@ static int mmc_omap_remove(struct platform_device *pdev)
>
>         mmc_omap_fclk_enable(host, 0);
>         free_irq(host->irq, host);
> +       clk_unprepare(host->fclk);
>         clk_put(host->fclk);
> -       clk_disable(host->iclk);
> +       clk_disable_unprepare(host->iclk);
>         clk_put(host->iclk);
>
>         if (host->dma_tx)
> diff --git a/drivers/usb/gadget/udc/omap_udc.c b/drivers/usb/gadget/udc/omap_udc.c
> index 494da00398d7..8768a3280e19 100644
> --- a/drivers/usb/gadget/udc/omap_udc.c
> +++ b/drivers/usb/gadget/udc/omap_udc.c
> @@ -2604,6 +2604,8 @@ static void omap_udc_release(struct device *dev)
>         if (udc->dc_clk) {
>                 if (udc->clk_requested)
>                         omap_udc_enable_clock(0);
> +               clk_unprepare(udc->hhc_clk);
> +               clk_unprepare(udc->dc_clk);
>                 clk_put(udc->hhc_clk);
>                 clk_put(udc->dc_clk);
>         }
> @@ -2768,8 +2770,8 @@ static int omap_udc_probe(struct platform_device *pdev)
>                 hhc_clk = clk_get(&pdev->dev, "usb_hhc_ck");
>                 BUG_ON(IS_ERR(dc_clk) || IS_ERR(hhc_clk));
>                 /* can't use omap_udc_enable_clock yet */
> -               clk_enable(dc_clk);
> -               clk_enable(hhc_clk);
> +               clk_prepare_enable(dc_clk);
> +               clk_prepare_enable(hhc_clk);
>                 udelay(100);
>         }
>
> @@ -2778,8 +2780,8 @@ static int omap_udc_probe(struct platform_device *pdev)
>                 hhc_clk = clk_get(&pdev->dev, "l3_ocpi_ck");
>                 BUG_ON(IS_ERR(dc_clk) || IS_ERR(hhc_clk));
>                 /* can't use omap_udc_enable_clock yet */
> -               clk_enable(dc_clk);
> -               clk_enable(hhc_clk);
> +               clk_prepare_enable(dc_clk);
> +               clk_prepare_enable(hhc_clk);
>                 udelay(100);
>         }
>
> @@ -2927,8 +2929,8 @@ static int omap_udc_probe(struct platform_device *pdev)
>                 usb_put_phy(xceiv);
>
>         if (cpu_is_omap16xx() || cpu_is_omap7xx()) {
> -               clk_disable(hhc_clk);
> -               clk_disable(dc_clk);
> +               clk_disable_unprepare(hhc_clk);
> +               clk_disable_unprepare(dc_clk);
>                 clk_put(hhc_clk);
>                 clk_put(dc_clk);
>         }
> diff --git a/drivers/usb/host/ohci-omap.c b/drivers/usb/host/ohci-omap.c
> index 45dcf8292072..2ab2e089a2b7 100644
> --- a/drivers/usb/host/ohci-omap.c
> +++ b/drivers/usb/host/ohci-omap.c
> @@ -281,6 +281,10 @@ static int ohci_hcd_omap_probe(struct platform_device *pdev)
>                 goto err_put_hcd;
>         }
>
> +       retval = clk_prepare(priv->usb_host_ck);
> +       if (retval)
> +               goto err_put_host_ck;
> +
>         if (!cpu_is_omap15xx())
>                 priv->usb_dc_ck = clk_get(&pdev->dev, "usb_dc_ck");
>         else
> @@ -288,13 +292,17 @@ static int ohci_hcd_omap_probe(struct platform_device *pdev)
>
>         if (IS_ERR(priv->usb_dc_ck)) {
>                 retval = PTR_ERR(priv->usb_dc_ck);
> -               goto err_put_host_ck;
> +               goto err_unprepare_host_ck;
>         }
>
> +       retval = clk_prepare(priv->usb_dc_ck);
> +       if (retval)
> +               goto err_put_dc_ck;
> +
>         if (!request_mem_region(hcd->rsrc_start, hcd->rsrc_len, hcd_name)) {
>                 dev_dbg(&pdev->dev, "request_mem_region failed\n");
>                 retval = -EBUSY;
> -               goto err_put_dc_ck;
> +               goto err_unprepare_dc_ck;
>         }
>
>         hcd->regs = ioremap(hcd->rsrc_start, hcd->rsrc_len);
> @@ -319,8 +327,12 @@ static int ohci_hcd_omap_probe(struct platform_device *pdev)
>         iounmap(hcd->regs);
>  err2:
>         release_mem_region(hcd->rsrc_start, hcd->rsrc_len);
> +err_unprepare_dc_ck:
> +       clk_unprepare(priv->usb_dc_ck);
>  err_put_dc_ck:
>         clk_put(priv->usb_dc_ck);
> +err_unprepare_host_ck:
> +       clk_unprepare(priv->usb_host_ck);
>  err_put_host_ck:
>         clk_put(priv->usb_host_ck);
>  err_put_hcd:
> @@ -355,7 +367,9 @@ static int ohci_hcd_omap_remove(struct platform_device *pdev)
>         }
>         iounmap(hcd->regs);
>         release_mem_region(hcd->rsrc_start, hcd->rsrc_len);
> +       clk_unprepare(priv->usb_dc_ck);
>         clk_put(priv->usb_dc_ck);
> +       clk_unprepare(priv->usb_host_ck);
>         clk_put(priv->usb_host_ck);
>         usb_put_hcd(hcd);
>         return 0;
> diff --git a/drivers/video/fbdev/omap/hwa742.c b/drivers/video/fbdev/omap/hwa742.c
> index b191bef22d98..9d9fe5c3a7a1 100644
> --- a/drivers/video/fbdev/omap/hwa742.c
> +++ b/drivers/video/fbdev/omap/hwa742.c
> @@ -964,7 +964,7 @@ static int hwa742_init(struct omapfb_device *fbdev, int ext_mode,
>         if ((r = calc_extif_timings(ext_clk, &extif_mem_div)) < 0)
>                 goto err3;
>         hwa742.extif->set_timings(&hwa742.reg_timings);
> -       clk_enable(hwa742.sys_ck);
> +       clk_prepare_enable(hwa742.sys_ck);
>
>         calc_hwa742_clk_rates(ext_clk, &sys_clk, &pix_clk);
>         if ((r = calc_extif_timings(sys_clk, &extif_mem_div)) < 0)
> @@ -1023,7 +1023,7 @@ static int hwa742_init(struct omapfb_device *fbdev, int ext_mode,
>
>         return 0;
>  err4:
> -       clk_disable(hwa742.sys_ck);
> +       clk_disable_unprepare(hwa742.sys_ck);
>  err3:
>         hwa742.extif->cleanup();
>  err2:
> @@ -1037,7 +1037,7 @@ static void hwa742_cleanup(void)
>         hwa742_set_update_mode(OMAPFB_UPDATE_DISABLED);
>         hwa742.extif->cleanup();
>         hwa742.int_ctrl->cleanup();
> -       clk_disable(hwa742.sys_ck);
> +       clk_disable_unprepare(hwa742.sys_ck);
>  }
>
>  struct lcd_ctrl hwa742_ctrl = {
> diff --git a/drivers/video/fbdev/omap/lcdc.c b/drivers/video/fbdev/omap/lcdc.c
> index 7317c9aad677..97d20dc0d1d0 100644
> --- a/drivers/video/fbdev/omap/lcdc.c
> +++ b/drivers/video/fbdev/omap/lcdc.c
> @@ -711,7 +711,7 @@ static int omap_lcdc_init(struct omapfb_device *fbdev, int ext_mode,
>                 dev_err(fbdev->dev, "failed to adjust LCD rate\n");
>                 goto fail1;
>         }
> -       clk_enable(lcdc.lcd_ck);
> +       clk_prepare_enable(lcdc.lcd_ck);
>
>         r = request_irq(OMAP_LCDC_IRQ, lcdc_irq_handler, 0, MODULE_NAME, fbdev);
>         if (r) {
> @@ -746,7 +746,7 @@ static int omap_lcdc_init(struct omapfb_device *fbdev, int ext_mode,
>  fail3:
>         free_irq(OMAP_LCDC_IRQ, lcdc.fbdev);
>  fail2:
> -       clk_disable(lcdc.lcd_ck);
> +       clk_disable_unprepare(lcdc.lcd_ck);
>  fail1:
>         clk_put(lcdc.lcd_ck);
>  fail0:
> @@ -760,7 +760,7 @@ static void omap_lcdc_cleanup(void)
>         free_fbmem();
>         omap_free_lcd_dma();
>         free_irq(OMAP_LCDC_IRQ, lcdc.fbdev);
> -       clk_disable(lcdc.lcd_ck);
> +       clk_disable_unprepare(lcdc.lcd_ck);
>         clk_put(lcdc.lcd_ck);
>  }
>
> diff --git a/drivers/video/fbdev/omap/sossi.c b/drivers/video/fbdev/omap/sossi.c
> index 80ac67f27f0d..b9cb8b386627 100644
> --- a/drivers/video/fbdev/omap/sossi.c
> +++ b/drivers/video/fbdev/omap/sossi.c
> @@ -598,7 +598,7 @@ static int sossi_init(struct omapfb_device *fbdev)
>         l &= ~CONF_SOSSI_RESET_R;
>         omap_writel(l, MOD_CONF_CTRL_1);
>
> -       clk_enable(sossi.fck);
> +       clk_prepare_enable(sossi.fck);
>         l = omap_readl(ARM_IDLECT2);
>         l &= ~(1 << 8);                 /* DMACK_REQ */
>         omap_writel(l, ARM_IDLECT2);
> @@ -649,7 +649,7 @@ static int sossi_init(struct omapfb_device *fbdev)
>         return 0;
>
>  err:
> -       clk_disable(sossi.fck);
> +       clk_disable_unprepare(sossi.fck);
>         clk_put(sossi.fck);
>         return r;
>  }
> @@ -657,6 +657,7 @@ static int sossi_init(struct omapfb_device *fbdev)
>  static void sossi_cleanup(void)
>  {
>         omap_lcdc_free_dma_callback();
> +       clk_unprepare(sossi.fck);
>         clk_put(sossi.fck);
>         iounmap(sossi.base);
>  }
> diff --git a/sound/soc/ti/osk5912.c b/sound/soc/ti/osk5912.c
> index 40e29dda7e7a..22da3b335e81 100644
> --- a/sound/soc/ti/osk5912.c
> +++ b/sound/soc/ti/osk5912.c
> @@ -134,6 +134,10 @@ static int __init osk_soc_init(void)
>                 goto err2;
>         }
>
> +       err = clk_prepare(tlv320aic23_mclk);
> +       if (err)
> +               goto err3;
> +
>         /*
>          * Configure 12 MHz output on MCLK.
>          */
> @@ -142,7 +146,7 @@ static int __init osk_soc_init(void)
>                 if (clk_set_rate(tlv320aic23_mclk, CODEC_CLOCK)) {
>                         printk(KERN_ERR "Cannot set MCLK for AIC23 CODEC\n");
>                         err = -ECANCELED;
> -                       goto err3;
> +                       goto err4;
>                 }
>         }
>
> @@ -151,6 +155,8 @@ static int __init osk_soc_init(void)
>
>         return 0;
>
> +err4:
> +       clk_unprepare(tlv320aic23_mclk);
>  err3:
>         clk_put(tlv320aic23_mclk);
>  err2:
> @@ -164,6 +170,7 @@ static int __init osk_soc_init(void)
>
>  static void __exit osk_soc_exit(void)
>  {
> +       clk_unprepare(tlv320aic23_mclk);
>         clk_put(tlv320aic23_mclk);
>         platform_device_unregister(osk_snd_device);
>  }
> --
> 2.35.1
>
