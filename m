Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02B103B289D
	for <lists+linux-omap@lfdr.de>; Thu, 24 Jun 2021 09:28:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231475AbhFXHbN (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 24 Jun 2021 03:31:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231434AbhFXHbM (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 24 Jun 2021 03:31:12 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2641FC061574;
        Thu, 24 Jun 2021 00:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=G1JEYhqSFm1y2jZMFU+nvmNL2Z9dp8rh+B2bQpR6PGs=; b=TwQAIQDP5X5MeSdELo3dCno+l
        GWR6CZDtYBvm3Z0tZr35Uk1Snw1t7656q1c6wGjuE14zHCsVCbBf5GQ+bU5QPBTZdM8vV/LMZQ61b
        VaBr/0GWgw+VH9n1HWb2ECmuJnSD/naSePsiGf6HVCP3xtuUjJ0iMZH6KeHWLetmKj16mLhm0PED/
        MSUhqYvNntfh6wBQ1gkj7/GufgMz+y2GmH1m2E/OpJZMSpkn4hmlblvQTAsugwLuXdYOI+3YkzFPE
        1e6BHE2ZBLsGhdjgvTzu1XXLgMhroHuJeUHwsZFp42tG+0oiaREwjqXDeiSmXYlwV+J7hiYkE2RM2
        lM/jWuGvg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:45296)
        by pandora.armlinux.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <linux@armlinux.org.uk>)
        id 1lwJn1-0007JR-4G; Thu, 24 Jun 2021 08:28:43 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1lwJmw-0005WS-P9; Thu, 24 Jun 2021 08:28:38 +0100
Date:   Thu, 24 Jun 2021 08:28:38 +0100
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     13145886936@163.com
Cc:     tony@atomide.com, linux-arm-kernel@lists.infradead.org,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        gushengxian <gushengxian@yulong.com>
Subject: Re: [PATCH] ARM: omap2: remove unneeded variable: "errata"
Message-ID: <20210624072838.GA1343@shell.armlinux.org.uk>
References: <20210624032751.24315-1-13145886936@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210624032751.24315-1-13145886936@163.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Jun 23, 2021 at 08:27:51PM -0700, 13145886936@163.com wrote:
> From: gushengxian <gushengxian@yulong.com>
> 
> Remove unneeded variable: "errata".
> 
> Signed-off-by: gushengxian <gushengxian@yulong.com>

NAK.

> diff --git a/arch/arm/mach-omap2/dma.c b/arch/arm/mach-omap2/dma.c
> index dfc9b21ff19b..ba4a48e3d264 100644
> --- a/arch/arm/mach-omap2/dma.c
> +++ b/arch/arm/mach-omap2/dma.c
> @@ -79,7 +79,6 @@ static const struct omap_dma_reg reg_map[] = {
>  
>  static unsigned configure_dma_errata(void)
>  {
> -	unsigned errata = 0;
>  
>  	/*
>  	 * Errata applicable for OMAP2430ES1.0 and all omap2420
> @@ -158,7 +157,7 @@ static unsigned configure_dma_errata(void)
>  	if (cpu_is_omap34xx() && (omap_type() != OMAP2_DEVICE_TYPE_GP))
>  		SET_DMA_ERRATA(DMA_ROMCODE_BUG);
>  
> -	return errata;
> +	return 0;

It is _not_ "unneeded" and you clearly have not compiled the resulting
code from your patch.

#define SET_DMA_ERRATA(id)              (errata |= (id))

errata is used inside the SET_DMA_ERRATA() macro. Hence, building
mach-omap2/dma.c would have failed.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
