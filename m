Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 488C88788D
	for <lists+linux-omap@lfdr.de>; Fri,  9 Aug 2019 13:30:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406589AbfHILaF (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 9 Aug 2019 07:30:05 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:56363 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406533AbfHILaE (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 9 Aug 2019 07:30:04 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20190809113003euoutp02fe6aa82ab4a9fb72ea9e5d45b55e487b~5PbdTHfTl1950519505euoutp02_
        for <linux-omap@vger.kernel.org>; Fri,  9 Aug 2019 11:30:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20190809113003euoutp02fe6aa82ab4a9fb72ea9e5d45b55e487b~5PbdTHfTl1950519505euoutp02_
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1565350203;
        bh=bTGInlSVhmUeSw5kWsgCeWb8NpQFnLIH+2lya/64BK8=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=Yho+5J3ctjkUpQmg6yU0ySm2Zc6G4n62d1d1Tqce4VwWxg83/Z6NnM4Q+Hi+QCG4q
         EhmRg8PPyVZ2i/njSBI+AZFFwyQ6VpleOdEC+edzN6/MjDxYYkpcpxMGHtX2KlQ0Lk
         lLqlSjfURsGLrGYMWqpyuyqaNmT+TsQxynem7sjY=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20190809113002eucas1p21f587e91f425ab1fb27e14da3eaa6c69~5PbclTNt50338603386eucas1p2B;
        Fri,  9 Aug 2019 11:30:02 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 6C.85.04309.9395D4D5; Fri,  9
        Aug 2019 12:30:01 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20190809113001eucas1p2b5ec955fb6968ef7ba052989c1a025a5~5PbbmQD0_1441114411eucas1p2O;
        Fri,  9 Aug 2019 11:30:01 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20190809113001eusmtrp26cd3c65b5c16274b6c9d0dd72bedae4f~5PbbYJpwN0289302893eusmtrp2F;
        Fri,  9 Aug 2019 11:30:01 +0000 (GMT)
X-AuditID: cbfec7f4-ae1ff700000010d5-7b-5d4d593901f8
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 62.AE.04117.8395D4D5; Fri,  9
        Aug 2019 12:30:00 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20190809113000eusmtip140190a6266d6eba38570fd1f7fce7976~5Pba42m7F0288202882eusmtip1Y;
        Fri,  9 Aug 2019 11:30:00 +0000 (GMT)
Subject: Re: [PATCH 01/22] ARM: omap1: innovator: pass lcd control address
 as pdata
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Tony Lindgren <tony@atomide.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
        dri-devel@lists.freedesktop.org
From:   Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <af560012-053e-b439-8c6a-8d3f05ff1ef7@samsung.com>
Date:   Fri, 9 Aug 2019 13:29:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190808212234.2213262-2-arnd@arndb.de>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrAKsWRmVeSWpSXmKPExsWy7djPc7qWkb6xBof7rCzWvHCw+DvpGLvF
        la/v2SyaF69ns5jyZzmTxabH11gtTvR9YLW4vGsOm8XsJf0sFuvn32Kz2H/Fy4Hb4/evSYwe
        375OYvE4/HUhi8eda3vYPPbPXcPucb/7OJPH5iX1HsdvbGfy+LxJLoAzissmJTUnsyy1SN8u
        gStjW98P5oKrghVz5n1mb2B8ydfFyMkhIWAi8abhE0sXIxeHkMAKRonX33rYIJwvjBIrV16D
        ynxmlLgybw8TTEvjjX3sILaQwHJGiQ+7vSCK3jJKnP+9EaxIWCBU4kPvLDBbREBRYuqLZ8wg
        RcwCX5kkGjp2M4Ik2ASsJCa2rwKzeQXsJJpe3QGzWQRUJC413gFrFhWIkLh/bAMrRI2gxMmZ
        T1hAbE4BU4lNfS1g9cwC4hK3nsxngrDlJba/nQO2TELgI7vE4o1zoc52kVj64CY7hC0s8er4
        FihbRuL/TpBmkIZ1jBJ/O15AdW9nlFg++R8bRJW1xOHjF4HO4ABaoSmxfpc+iCkh4CixYK0e
        hMknceOtIMQNfBKTtk1nhgjzSnS0CUHMUJPYsGwDG8zWrp0rmScwKs1C8tksJN/MQvLNLIS1
        CxhZVjGKp5YW56anFhvlpZbrFSfmFpfmpesl5+duYgSms9P/jn/ZwbjrT9IhRgEORiUe3gZF
        n1gh1sSy4srcQ4wSHMxKIrxXOHxjhXhTEiurUovy44tKc1KLDzFKc7AoifNWMzyIFhJITyxJ
        zU5NLUgtgskycXBKNTAK1MvnrOi1enc2aFbZVP34m6d2BicWPlOvFp8a92LdjReBPb7f1yQ9
        e/FotULdoUX79Oy4lxSefMbSIqflI+9upSD1ZU70zdf8q/7PjV9X8vbAxWWGb+4IrDhmpzlV
        eabEeddqkUlSmbZiIkK/dCf4lxXxMc7fslf00ZH22fzRr17kMAitSPNVYinOSDTUYi4qTgQA
        REp+JWMDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrMIsWRmVeSWpSXmKPExsVy+t/xu7oWkb6xBo8nW1mseeFg8XfSMXaL
        K1/fs1k0L17PZjHlz3Imi02Pr7FanOj7wGpxedccNovZS/pZLNbPv8Vmsf+KlwO3x+9fkxg9
        vn2dxOJx+OtCFo871/aweeyfu4bd4373cSaPzUvqPY7f2M7k8XmTXABnlJ5NUX5pSapCRn5x
        ia1StKGFkZ6hpYWekYmlnqGxeayVkamSvp1NSmpOZllqkb5dgl7Gtr4fzAVXBSvmzPvM3sD4
        kq+LkZNDQsBEovHGPvYuRi4OIYGljBIN8+eydTFyACVkJI6vL4OoEZb4c62LDaLmNaPE3ZW7
        WUASwgKhEqd+zmYHsUUEFCWmvnjGDFLELPCVSWLGrV9MEB2bGSVOPGwB62ATsJKY2L6KEcTm
        FbCTaHp1B8xmEVCRuNR4hwnEFhWIkDjzfgULRI2gxMmZT8BsTgFTiU19LWD1zALqEn/mXWKG
        sMUlbj2ZzwRhy0tsfzuHeQKj0Cwk7bOQtMxC0jILScsCRpZVjCKppcW56bnFRnrFibnFpXnp
        esn5uZsYgRG87djPLTsYu94FH2IU4GBU4uHVkPeJFWJNLCuuzD3EKMHBrCTCe4XDN1aINyWx
        siq1KD++qDQntfgQoynQcxOZpUST84HJJa8k3tDU0NzC0tDc2NzYzEJJnLdD4GCMkEB6Yklq
        dmpqQWoRTB8TB6dUA6PDe4aJsTsiIzJvBB4QmmAuzxSs7nfN+7Bau9u8KNt/7v/e7o+JORn2
        RiyFa/+eU4p6nnMPrFhVL/KwbsZfcUnOn+eWRZy4+6Thj1G9wKOJ94IU2I4XPiksVdk5+YCk
        S++ljefTWd+kpZsxHjvOOS+vQ+/T7fxtMm0O7Xlv3N7EeVwq/rh25n4lluKMREMt5qLiRABW
        xS779gIAAA==
X-CMS-MailID: 20190809113001eucas1p2b5ec955fb6968ef7ba052989c1a025a5
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190808212328epcas1p36ee1f5a956c54d665dbe0c80d912e6b3
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190808212328epcas1p36ee1f5a956c54d665dbe0c80d912e6b3
References: <20190808212234.2213262-1-arnd@arndb.de>
        <CGME20190808212328epcas1p36ee1f5a956c54d665dbe0c80d912e6b3@epcas1p3.samsung.com>
        <20190808212234.2213262-2-arnd@arndb.de>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


On 8/8/19 11:22 PM, Arnd Bergmann wrote:
> To avoid using the mach/omap1510.h header file, pass the correct
> address as platform data.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

For fbdev part:

Acked-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

> ---
>  arch/arm/mach-omap1/board-innovator.c  | 3 +++
>  drivers/video/fbdev/omap/lcd_inn1510.c | 7 +++++--
>  2 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/mach-omap1/board-innovator.c b/arch/arm/mach-omap1/board-innovator.c
> index cbe093f969d5..2425f1bacb33 100644
> --- a/arch/arm/mach-omap1/board-innovator.c
> +++ b/arch/arm/mach-omap1/board-innovator.c
> @@ -194,6 +194,9 @@ static struct platform_device innovator1510_smc91x_device = {
>  static struct platform_device innovator1510_lcd_device = {
>  	.name		= "lcd_inn1510",
>  	.id		= -1,
> +	.dev	= {
> +		.platform_data = (void __force *)OMAP1510_FPGA_LCD_PANEL_CONTROL,
> +	}
>  };
>  
>  static struct platform_device innovator1510_spi_device = {
> diff --git a/drivers/video/fbdev/omap/lcd_inn1510.c b/drivers/video/fbdev/omap/lcd_inn1510.c
> index 776e7f8d656e..37ed0c14aa5a 100644
> --- a/drivers/video/fbdev/omap/lcd_inn1510.c
> +++ b/drivers/video/fbdev/omap/lcd_inn1510.c
> @@ -14,15 +14,17 @@
>  
>  #include "omapfb.h"
>  
> +static void __iomem *omap1510_fpga_lcd_panel_control;
> +
>  static int innovator1510_panel_enable(struct lcd_panel *panel)
>  {
> -	__raw_writeb(0x7, OMAP1510_FPGA_LCD_PANEL_CONTROL);
> +	__raw_writeb(0x7, omap1510_fpga_lcd_panel_control);
>  	return 0;
>  }
>  
>  static void innovator1510_panel_disable(struct lcd_panel *panel)
>  {
> -	__raw_writeb(0x0, OMAP1510_FPGA_LCD_PANEL_CONTROL);
> +	__raw_writeb(0x0, omap1510_fpga_lcd_panel_control);
>  }
>  
>  static struct lcd_panel innovator1510_panel = {
> @@ -48,6 +50,7 @@ static struct lcd_panel innovator1510_panel = {
>  
>  static int innovator1510_panel_probe(struct platform_device *pdev)
>  {
> +	omap1510_fpga_lcd_panel_control = (void __iomem *)pdev->dev.platform_data;
>  	omapfb_register_panel(&innovator1510_panel);
>  	return 0;
>  }
