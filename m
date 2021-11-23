Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8478945A032
	for <lists+linux-omap@lfdr.de>; Tue, 23 Nov 2021 11:28:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235390AbhKWKbI (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 23 Nov 2021 05:31:08 -0500
Received: from mail.kernel.org ([198.145.29.99]:46384 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235321AbhKWKbI (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 23 Nov 2021 05:31:08 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id A848C60ED4;
        Tue, 23 Nov 2021 10:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637663280;
        bh=1RRsWdNyoeebH/2huJ4n8nK+cjFXicMtJEokBZI0wzo=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=N24MrWHINEFHMWoPT8t5lTT2wI7g9CTb6AkwwTVFKoOBaECh9KW+5RT5VuKO2YUkQ
         U89FTKbBxBzWOWSWaLvl8qi0rkB3yh+0KRzsXZIpNi78ka7iUjBBff9dPsgMdxhUZS
         l1Nf6Fj3a79DguKNKluGJ0sfPSGHGHJ+Ciill/2bXw5OyAlAqEb88ftd0VALNJiN1M
         igJV8qFXlEsRx8jz2JRzrMo3EHhHeoKGamhnjA81RdTtGB/00nL7vGAXWKu1mNCko5
         qoBynBEZx3JPrQ3FXM+SiELBOHik9STY+tLTtJH4pXkH9FKhwuwjNDmsdCDu/PCjbK
         Jt5tRcSyECmNQ==
Subject: Re: [PATCH 2/4] memory: gpmc: Fix menuconfig visibility
To:     krzysztof.kozlowski@canonical.com, tony@atomide.com
Cc:     kishon@ti.com, nm@ti.com, vigneshr@ti.com,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20211123102607.13002-1-rogerq@kernel.org>
 <20211123102607.13002-3-rogerq@kernel.org>
From:   Roger Quadros <rogerq@kernel.org>
Message-ID: <cdce313c-255a-855e-2567-9d70a202b80c@kernel.org>
Date:   Tue, 23 Nov 2021 12:27:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211123102607.13002-3-rogerq@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

please ignore this. Went out by mistake.

On 23/11/2021 12:26, Roger Quadros wrote:
> GPMC was not being visible if COMPILE_TEST is not enabled.
> 
> Signed-off-by: Roger Quadros <rogerq@kernel.org>
> ---
>  drivers/memory/Kconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/memory/Kconfig b/drivers/memory/Kconfig
> index 30bff6cb1b8d..da2af9c38fe3 100644
> --- a/drivers/memory/Kconfig
> +++ b/drivers/memory/Kconfig
> @@ -103,8 +103,8 @@ config TI_EMIF
>  	  temperature changes
>  
>  config OMAP_GPMC
> -	bool "Texas Instruments OMAP SoC GPMC driver" if COMPILE_TEST
> -	depends on OF_ADDRESS
> +	bool "Texas Instruments OMAP SoC GPMC driver"
> +	depends on OF_ADDRESS || COMPILE_TEST
>  	select GPIOLIB
>  	help
>  	  This driver is for the General Purpose Memory Controller (GPMC)
> 
