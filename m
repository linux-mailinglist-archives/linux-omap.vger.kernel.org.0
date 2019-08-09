Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12ED5878B9
	for <lists+linux-omap@lfdr.de>; Fri,  9 Aug 2019 13:34:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726216AbfHILen (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 9 Aug 2019 07:34:43 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:49486 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406534AbfHILen (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 9 Aug 2019 07:34:43 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20190809113441euoutp01870203e4a28d0391af7c4b83a781fede~5Pfg0pxyK3010630106euoutp01-
        for <linux-omap@vger.kernel.org>; Fri,  9 Aug 2019 11:34:41 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20190809113441euoutp01870203e4a28d0391af7c4b83a781fede~5Pfg0pxyK3010630106euoutp01-
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1565350481;
        bh=aMCn1XxVhBKy4njfyQ64GO75j4CFu1rnUQBQzJ2CTNA=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=JJ+MA/6CdgAV4DKlWhkhvDfmT3hJe81/2JEn/03y8GlKhB1tA+Pg303NcnhEX6XFH
         fghW9X8mb5VsTp35xKbCXg3O4V5TvCXu4FfhidQLyoX+ZnAkMFrcEMTbGgQC0AgruF
         1+hDjN5E+mtORDsxdNs85jVJ01thdCfsL05WVdpI=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20190809113440eucas1p210ab6cca0f738199e2a9b09900cb4a07~5Pff6D2Tg2486324863eucas1p2d;
        Fri,  9 Aug 2019 11:34:40 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id F3.34.04374.05A5D4D5; Fri,  9
        Aug 2019 12:34:40 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20190809113439eucas1p144308b9053ba07b7ae6ed948e059543f~5PffANDmZ0900709007eucas1p1V;
        Fri,  9 Aug 2019 11:34:39 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20190809113439eusmtrp199e99bcf228ef151f60fd6d0e98ab6ee~5Pfexh-ac0695106951eusmtrp1H;
        Fri,  9 Aug 2019 11:34:39 +0000 (GMT)
X-AuditID: cbfec7f5-4ddff70000001116-18-5d4d5a503f93
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 75.1E.04166.F4A5D4D5; Fri,  9
        Aug 2019 12:34:39 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20190809113438eusmtip2fa328a3b63d46ef5e186625250a96079~5PfeJFv_90298402984eusmtip2Z;
        Fri,  9 Aug 2019 11:34:38 +0000 (GMT)
Subject: Re: [PATCH 09/22] fbdev: omap: avoid using mach/*.h files
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Tony Lindgren <tony@atomide.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
From:   Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <0c0f5ba1-fe66-25ea-35f6-089ec22f235e@samsung.com>
Date:   Fri, 9 Aug 2019 13:34:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190808212234.2213262-10-arnd@arndb.de>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa0hTYRju2zk7Ow4nn1PxLcNwiqHgpQt1KBG7/DhGlnShmEitOqxIZ+14
        yQqSBAu7T6NcytIszUxNzaVdpKlbNwjLxDKZlckKLWsuMHXkdib573mf93m+53nhown5kHgB
        fUCTyWk1qjQFJSVbzBOvo5KVSamxXePzmVpbAjOtM0uYVyMDEqbH8ZNi8m/UU0z1eImEsTq6
        EFM8VSViGr/0ipln58fEzNu2Uoq5VnmBZOoNHyimvWdDgg87+VeH2D8OHcm26gckbIejnGQ/
        9j6i2PayWglrPWMRsU2VJ1hLn1HE2huDk6VKadw+Lu1ANqeNid8t3d/paCUOOaOOlJrUeeh+
        eCHyogEvB1OFRVSIpLQcVyN4c7WEEIZxBOMjnymXSo7tCLrLkmYdhudNEkFUheCcId8zjCIw
        t7xDLpUfXgvX6prFLuyPQ+Cybdj9LIFHCDD2vSJcCwqvgkunatwGGY4HvanYzZM4DCZ+NLqj
        A/BOsJobxILGF56XDJEu7IVXwJixQuTCBA6ED0MGD14ExtFSdxjgczTcfz9CCL3Xw3Sd04P9
        4LulWSLghfCy6CwpGOoQTJ+2edxGBFVFTkpQrYYOS/dMDXomIgLq22IEeg3ctH8TuWjAPtA3
        6iuU8AFdyxVCoGVwukAuqMOh4VYDNRtb2HqbuIgU+jmn6eeco59zjv5/7nVE1qBALotPV3P8
        Mg2XE82r0vksjTp6b0Z6I5r5ey+dFscD9GRqjwlhGim8ZXkhG1PlYlU2n5tuQkATCn9ZD52U
        KpftU+Ue5bQZu7RZaRxvQkE0qQiUHZs3mCLHalUmd5DjDnHa2a2I9lqQh46I8ZaTS4Yfs51k
        72TR2XvBEerHbb4r235xmx86zU9zB38vNpQT2/SEsXWgfIXmTW05jov8FHQlJ/dOZ7HZTuww
        qZSByk1Q07w8tD/sReauoK/zE6MvLd1q8J60dWdPBZv8UzJ8rM8uFiTaZFMBvpH8OhTbH/r3
        uPICd3e75LCC5PerlkQSWl71DwnCwKR3AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrGIsWRmVeSWpSXmKPExsVy+t/xe7r+Ub6xBqvvSVmseeFg8XfSMXaL
        M2/usltc+fqezaJ58Xo2ixVfZrJb3P96lNFiyp/lTBabHl9jtTjR94HV4vKuOWwWs5f0s1is
        n3+LzWL/FS8HPo/fvyYxenz7OonFY+esu+weh78uZPG4c20Pm8f+uWvYPe53H2fy2Lyk3uP4
        je1MHp83yQVwRenZFOWXlqQqZOQXl9gqRRtaGOkZWlroGZlY6hkam8daGZkq6dvZpKTmZJal
        FunbJehlHPm6k7ngn27FnEPpDYxb1boYOTkkBEwk5p/czN7FyMUhJLCUUWLDkSVADgdQQkbi
        +PoyiBphiT/Xutggal4zSiw7so8dJCEs4CQxe90WVhBbREBRYuqLZ8wgRcwC75glDra+ZIHo
        2MIo8eDSe2aQKjYBK4mJ7asYQWxeATuJWYemgMVZBFQkfr7bxAZiiwpESJx5v4IFokZQ4uTM
        J2A2p4CZxIfti5hAbGYBdYk/8y4xQ9jiEreezIeKy0tsfzuHeQKj0Cwk7bOQtMxC0jILScsC
        RpZVjCKppcW56bnFhnrFibnFpXnpesn5uZsYgXG+7djPzTsYL20MPsQowMGoxMPboOgTK8Sa
        WFZcmXuIUYKDWUmE9wqHb6wQb0piZVVqUX58UWlOavEhRlOg5yYyS4km5wNTUF5JvKGpobmF
        paG5sbmxmYWSOG+HwMEYIYH0xJLU7NTUgtQimD4mDk6pBsaClkMbog6dW8Kts7f9q5t0hPOh
        pBl3T7cvqulka/yamtCwVzLaWOjdbvP2hJr66huXdlz2u6q+27rP43g2/8+4uyox5x+2iX/6
        EOOe4TMl8+6t0rq1mw/ffbJdN1ZY4coiCQdhg+8n5EVn7jxXkP98pvkFfgeXq+nt5xQ+xvFe
        yvjzjMlx/1olluKMREMt5qLiRAAasRAgCQMAAA==
X-CMS-MailID: 20190809113439eucas1p144308b9053ba07b7ae6ed948e059543f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190808213111epcas1p2128deb055f9138740eda1a70187e4172
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190808213111epcas1p2128deb055f9138740eda1a70187e4172
References: <20190808212234.2213262-1-arnd@arndb.de>
        <CGME20190808213111epcas1p2128deb055f9138740eda1a70187e4172@epcas1p2.samsung.com>
        <20190808212234.2213262-10-arnd@arndb.de>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


On 8/8/19 11:22 PM, Arnd Bergmann wrote:
> All the headers we actually need are now in include/linux/soc,
> so use those versions instead and allow compile-testing on
> other architectures.
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
>  drivers/video/backlight/Kconfig          | 4 ++--
>  drivers/video/backlight/omap1_bl.c       | 4 ++--
>  drivers/video/fbdev/omap/Kconfig         | 4 ++--
>  drivers/video/fbdev/omap/lcd_ams_delta.c | 2 +-
>  drivers/video/fbdev/omap/lcd_dma.c       | 3 ++-
>  drivers/video/fbdev/omap/lcd_inn1510.c   | 2 +-
>  drivers/video/fbdev/omap/lcd_osk.c       | 4 ++--
>  drivers/video/fbdev/omap/lcdc.c          | 2 ++
>  drivers/video/fbdev/omap/omapfb_main.c   | 3 +--
>  drivers/video/fbdev/omap/sossi.c         | 1 +
>  10 files changed, 16 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
> index 8b081d61773e..195c71130827 100644
> --- a/drivers/video/backlight/Kconfig
> +++ b/drivers/video/backlight/Kconfig
> @@ -213,8 +213,8 @@ config BACKLIGHT_LOCOMO
>  
>  config BACKLIGHT_OMAP1
>  	tristate "OMAP1 PWL-based LCD Backlight"
> -	depends on ARCH_OMAP1
> -	default y
> +	depends on ARCH_OMAP1 || COMPILE_TEST
> +	default ARCH_OMAP1
>  	help
>  	  This driver controls the LCD backlight level and power for
>  	  the PWL module of OMAP1 processors.  Say Y if your board
> diff --git a/drivers/video/backlight/omap1_bl.c b/drivers/video/backlight/omap1_bl.c
> index 74263021b1b3..69a49384b3de 100644
> --- a/drivers/video/backlight/omap1_bl.c
> +++ b/drivers/video/backlight/omap1_bl.c
> @@ -14,8 +14,8 @@
>  #include <linux/slab.h>
>  #include <linux/platform_data/omap1_bl.h>
>  
> -#include <mach/hardware.h>
> -#include <mach/mux.h>
> +#include <linux/soc/ti/omap1-io.h>
> +#include <linux/soc/ti/omap1-mux.h>
>  
>  #define OMAPBL_MAX_INTENSITY		0xff
>  
> diff --git a/drivers/video/fbdev/omap/Kconfig b/drivers/video/fbdev/omap/Kconfig
> index df2a5d0d4aa2..b1786cf1b486 100644
> --- a/drivers/video/fbdev/omap/Kconfig
> +++ b/drivers/video/fbdev/omap/Kconfig
> @@ -2,7 +2,7 @@
>  config FB_OMAP
>  	tristate "OMAP frame buffer support"
>  	depends on FB
> -	depends on ARCH_OMAP1
> +	depends on ARCH_OMAP1 || (ARM && COMPILE_TEST)
>  	select FB_CFB_FILLRECT
>  	select FB_CFB_COPYAREA
>  	select FB_CFB_IMAGEBLIT
> @@ -42,7 +42,7 @@ config FB_OMAP_LCD_MIPID
>  
>  config FB_OMAP_LCD_H3
>  	bool "TPS65010 LCD controller on OMAP-H3"
> -	depends on MACH_OMAP_H3
> +	depends on MACH_OMAP_H3 || COMPILE_TEST
>  	depends on TPS65010=y
>  	default y
>  	help
> diff --git a/drivers/video/fbdev/omap/lcd_ams_delta.c b/drivers/video/fbdev/omap/lcd_ams_delta.c
> index 8e54aae544a0..da2e32615abe 100644
> --- a/drivers/video/fbdev/omap/lcd_ams_delta.c
> +++ b/drivers/video/fbdev/omap/lcd_ams_delta.c
> @@ -14,7 +14,7 @@
>  #include <linux/gpio/consumer.h>
>  #include <linux/lcd.h>
>  
> -#include <mach/hardware.h>
> +#include <linux/soc/ti/omap1-io.h>
>  
>  #include "omapfb.h"
>  
> diff --git a/drivers/video/fbdev/omap/lcd_dma.c b/drivers/video/fbdev/omap/lcd_dma.c
> index 867a63c06f42..f85817635a8c 100644
> --- a/drivers/video/fbdev/omap/lcd_dma.c
> +++ b/drivers/video/fbdev/omap/lcd_dma.c
> @@ -25,7 +25,8 @@
>  
>  #include <linux/omap-dma.h>
>  
> -#include <mach/hardware.h>
> +#include <linux/soc/ti/omap1-soc.h>
> +#include <linux/soc/ti/omap1-io.h>
>  
>  #include "lcdc.h"
>  #include "lcd_dma.h"
> diff --git a/drivers/video/fbdev/omap/lcd_inn1510.c b/drivers/video/fbdev/omap/lcd_inn1510.c
> index 37ed0c14aa5a..bb915637e9b6 100644
> --- a/drivers/video/fbdev/omap/lcd_inn1510.c
> +++ b/drivers/video/fbdev/omap/lcd_inn1510.c
> @@ -10,7 +10,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/io.h>
>  
> -#include <mach/hardware.h>
> +#include <linux/soc/ti/omap1-soc.h>
>  
>  #include "omapfb.h"
>  
> diff --git a/drivers/video/fbdev/omap/lcd_osk.c b/drivers/video/fbdev/omap/lcd_osk.c
> index 5d5762128c8d..8168ba0d47fd 100644
> --- a/drivers/video/fbdev/omap/lcd_osk.c
> +++ b/drivers/video/fbdev/omap/lcd_osk.c
> @@ -11,8 +11,8 @@
>  #include <linux/platform_device.h>
>  #include <linux/gpio.h>
>  
> -#include <mach/hardware.h>
> -#include <mach/mux.h>
> +#include <linux/soc/ti/omap1-io.h>
> +#include <linux/soc/ti/omap1-mux.h>
>  
>  #include "omapfb.h"
>  
> diff --git a/drivers/video/fbdev/omap/lcdc.c b/drivers/video/fbdev/omap/lcdc.c
> index 65953b7fbdb9..3af758f12afd 100644
> --- a/drivers/video/fbdev/omap/lcdc.c
> +++ b/drivers/video/fbdev/omap/lcdc.c
> @@ -17,6 +17,8 @@
>  #include <linux/clk.h>
>  #include <linux/gfp.h>
>  
> +#include <linux/soc/ti/omap1-io.h>
> +#include <linux/soc/ti/omap1-soc.h>
>  #include <linux/omap-dma.h>
>  
>  #include <asm/mach-types.h>
> diff --git a/drivers/video/fbdev/omap/omapfb_main.c b/drivers/video/fbdev/omap/omapfb_main.c
> index dc06057de91d..af73a3f9ac53 100644
> --- a/drivers/video/fbdev/omap/omapfb_main.c
> +++ b/drivers/video/fbdev/omap/omapfb_main.c
> @@ -19,8 +19,7 @@
>  
>  #include <linux/omap-dma.h>
>  
> -#include <mach/hardware.h>
> -
> +#include <linux/soc/ti/omap1-soc.h>
>  #include "omapfb.h"
>  #include "lcdc.h"
>  
> diff --git a/drivers/video/fbdev/omap/sossi.c b/drivers/video/fbdev/omap/sossi.c
> index ade9d452254c..6b99d89fbe6e 100644
> --- a/drivers/video/fbdev/omap/sossi.c
> +++ b/drivers/video/fbdev/omap/sossi.c
> @@ -13,6 +13,7 @@
>  #include <linux/interrupt.h>
>  
>  #include <linux/omap-dma.h>
> +#include <linux/soc/ti/omap1-io.h>
>  
>  #include "omapfb.h"
>  #include "lcd_dma.h"
