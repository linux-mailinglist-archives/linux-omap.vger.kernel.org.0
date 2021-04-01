Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AB86351AC9
	for <lists+linux-omap@lfdr.de>; Thu,  1 Apr 2021 20:07:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234276AbhDASDQ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 1 Apr 2021 14:03:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:60752 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236545AbhDAR57 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 1 Apr 2021 13:57:59 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 29D3A61387;
        Thu,  1 Apr 2021 16:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617295360;
        bh=riU2tj1yT3F0IuQjhXa4pac/YO1rxRb6i7I4npVo5pc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uy4xXAI3nBUkXRgA0xxeelm039DdHmY9QrvgEaqV7c/hD+R3nWhON3cXTJoePyVOK
         65TLCm9Vvx8Oono/XektCuGvkxxtS/OpzP76l7X9ArmZWC3T9HAzTqG3kthfICS8B0
         TLdgjhWO7aHkT4ac/gDc6bhLz/wOtaNe9Q2BvGjDoG8PGAJrtS+Kvl9AzYZjn3IoMC
         sdagP+R3Sfh0a9YiJqDSHpdR5RiVuJOd715GMoSWZaJBGv/IJUDbh73XeR76dbe9dC
         d3xqhz16ddFbbOyiBFs0T1p/9STP7/TVn5CSiH0humaQcteVWfIoMVADqs2KRvSB0/
         NmJAKJdL5fBRg==
Date:   Thu, 1 Apr 2021 09:42:35 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Maciej Falkowski <maciej.falkowski9@gmail.com>
Cc:     aaro.koskinen@iki.fi, tony@atomide.com, linux@armlinux.org.uk,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com
Subject: Re: [PATCH] usb: isp1301-omap: Add missing gpiod_add_lookup_table
 function
Message-ID: <20210401164235.cb6hrx55vkqiuvz2@archlinux-ax161>
References: <20210401162032.10150-1-maciej.falkowski9@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210401162032.10150-1-maciej.falkowski9@gmail.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Apr 01, 2021 at 06:20:32PM +0200, Maciej Falkowski wrote:
> The gpiod table was added without any usage making it unused
> as reported by Clang compilation from omap1_defconfig on linux-next:
> 
> arch/arm/mach-omap1/board-h2.c:347:34: warning: unused variable 'isp1301_gpiod_table' [-Wunused-variable]
> static struct gpiod_lookup_table isp1301_gpiod_table = {
>                                  ^
> 1 warning generated.
> 
> The patch adds the missing gpiod_add_lookup_table() function.
> 
> Signed-off-by: Maciej Falkowski <maciej.falkowski9@gmail.com>
> Fixes: f3ef38160e3d ("usb: isp1301-omap: Convert to use GPIO descriptors")
> Link: https://github.com/ClangBuiltLinux/linux/issues/1325

Thanks for the patch!

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  arch/arm/mach-omap1/board-h2.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mach-omap1/board-h2.c b/arch/arm/mach-omap1/board-h2.c
> index c40cf5ef8607..977b0b744c22 100644
> --- a/arch/arm/mach-omap1/board-h2.c
> +++ b/arch/arm/mach-omap1/board-h2.c
> @@ -320,7 +320,7 @@ static int tps_setup(struct i2c_client *client, void *context)
>  {
>  	if (!IS_BUILTIN(CONFIG_TPS65010))
>  		return -ENOSYS;
> -	
> +
>  	tps65010_config_vregs1(TPS_LDO2_ENABLE | TPS_VLDO2_3_0V |
>  				TPS_LDO1_ENABLE | TPS_VLDO1_3_0V);
>  
> @@ -394,6 +394,8 @@ static void __init h2_init(void)
>  	BUG_ON(gpio_request(H2_NAND_RB_GPIO_PIN, "NAND ready") < 0);
>  	gpio_direction_input(H2_NAND_RB_GPIO_PIN);
>  
> +	gpiod_add_lookup_table(&isp1301_gpiod_table);
> +
>  	omap_cfg_reg(L3_1610_FLASH_CS2B_OE);
>  	omap_cfg_reg(M8_1610_FLASH_CS2B_WE);
>  
> -- 
> 2.26.3
> 
