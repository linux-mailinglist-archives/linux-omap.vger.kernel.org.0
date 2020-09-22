Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15910273B3F
	for <lists+linux-omap@lfdr.de>; Tue, 22 Sep 2020 08:54:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728278AbgIVGy2 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 22 Sep 2020 02:54:28 -0400
Received: from mslow2.mail.gandi.net ([217.70.178.242]:49222 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727710AbgIVGy2 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 22 Sep 2020 02:54:28 -0400
Received: from relay1-d.mail.gandi.net (unknown [217.70.183.193])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id 04FCA3AE602;
        Tue, 22 Sep 2020 06:49:26 +0000 (UTC)
X-Originating-IP: 90.65.88.165
Received: from localhost (lfbn-lyo-1-1908-165.w90-65.abo.wanadoo.fr [90.65.88.165])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 02909240007;
        Tue, 22 Sep 2020 06:49:01 +0000 (UTC)
Date:   Tue, 22 Sep 2020 08:49:01 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Support Opensource <support.opensource@diasemi.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Milo Kim <milo.kim@ti.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sangbeom Kim <sbkim73@samsung.com>,
        Tony Lindgren <tony@atomide.com>,
        patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH 04/42] mfd: atmel-hlcdc: use PLATFORM_DEVID_NONE
Message-ID: <20200922064901.GM9675@piout.net>
References: <20200921205016.20461-1-krzk@kernel.org>
 <20200921205016.20461-4-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200921205016.20461-4-krzk@kernel.org>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 21/09/2020 22:49:38+0200, Krzysztof Kozlowski wrote:
> Use PLATFORM_DEVID_NONE define instead of "-1" value because:
>  - it brings some meaning,
>  - it might point attention why auto device ID was not used.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> ---
>  drivers/mfd/atmel-hlcdc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mfd/atmel-hlcdc.c b/drivers/mfd/atmel-hlcdc.c
> index 3c2414ba4b01..8ba13bc6fcf8 100644
> --- a/drivers/mfd/atmel-hlcdc.c
> +++ b/drivers/mfd/atmel-hlcdc.c
> @@ -129,7 +129,7 @@ static int atmel_hlcdc_probe(struct platform_device *pdev)
>  
>  	dev_set_drvdata(dev, hlcdc);
>  
> -	return devm_mfd_add_devices(dev, -1, atmel_hlcdc_cells,
> +	return devm_mfd_add_devices(dev, PLATFORM_DEVID_NONE, atmel_hlcdc_cells,
>  				    ARRAY_SIZE(atmel_hlcdc_cells),
>  				    NULL, 0, NULL);
>  }
> -- 
> 2.17.1
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
