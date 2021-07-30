Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01F353DB77D
	for <lists+linux-omap@lfdr.de>; Fri, 30 Jul 2021 12:59:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238520AbhG3K77 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 30 Jul 2021 06:59:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:57900 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238461AbhG3K76 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 30 Jul 2021 06:59:58 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 57F8D60F9B;
        Fri, 30 Jul 2021 10:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627642794;
        bh=7G8XPhtyHOsQOBrdu6AY5KW4NxFLaa/KplGrDdA8Mn8=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=V4cT09UFGn1FlQxEKbRS4g0/ToJp5VmSrNF2NBcUrJpZgFuB6x+wrlDk73aQFX1aK
         uSzGtv7M6HwSE+4z2lPDhm9fZvKKbI1KvT4905okIknu/QdDnocaE8jHio/WJEVWtO
         jMu95MNGUiapvvaSsO6IAWncaL4K57Lrp5l+SKjq/dftKGT7gDC4scniEVPz8i6T9S
         U/++szs+4hiKF27XBJGiRx8M1jyJQ5KQrPN6W15HGf3+9gSdo5r5oXjv9tRr2wDygt
         yCFr+mYPGHK4SQJ5DCmWDOGJ16/jad5/yVZgI5RPA5JcPU5aaasFPSAsZ3wPK7GcvM
         Eh5eT88/SwdZw==
Subject: Re: [PATCH 1/2] memory: omap-gpmc: Clear GPMC_CS_CONFIG7 register on
 restore if unused
To:     Tony Lindgren <tony@atomide.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
References: <20210727101034.32148-1-tony@atomide.com>
From:   Roger Quadros <rogerq@kernel.org>
Message-ID: <f0a0dfe8-a185-2b14-e12a-ebdd6e2c909f@kernel.org>
Date:   Fri, 30 Jul 2021 13:59:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210727101034.32148-1-tony@atomide.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 27/07/2021 13:10, Tony Lindgren wrote:
> We want to clear any unused GPMC_CS_CONFIG7 register on restore to
> ensure unused chip selects are not enabled.
> 
> Cc: Roger Quadros <rogerq@kernel.org>
> Signed-off-by: Tony Lindgren <tony@atomide.com>

Acked-by: Roger Quadros <rogerq@kernel.org>

Sorry if you got this twice. I got a bounce back on the previous Ack.

cheers,
-roger

> ---
>  drivers/memory/omap-gpmc.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/memory/omap-gpmc.c b/drivers/memory/omap-gpmc.c
> --- a/drivers/memory/omap-gpmc.c
> +++ b/drivers/memory/omap-gpmc.c
> @@ -2595,6 +2595,8 @@ void omap3_gpmc_restore_context(void)
>  				gpmc_context.cs_context[i].config6);
>  			gpmc_cs_write_reg(i, GPMC_CS_CONFIG7,
>  				gpmc_context.cs_context[i].config7);
> +		} else {
> +			gpmc_cs_write_reg(i, GPMC_CS_CONFIG7, 0);
>  		}
>  	}
>  }
> 
