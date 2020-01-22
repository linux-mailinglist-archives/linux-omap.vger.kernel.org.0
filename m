Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F0A7145B5A
	for <lists+linux-omap@lfdr.de>; Wed, 22 Jan 2020 19:09:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725933AbgAVSJP (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 22 Jan 2020 13:09:15 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:44790 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725802AbgAVSJP (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 22 Jan 2020 13:09:15 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00MI9CLo120991;
        Wed, 22 Jan 2020 12:09:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1579716552;
        bh=hudcEPFRSIGSIHw+jPyyUY7WSm950jM9wfPNiqe6x00=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=DXn9jhr4TeNjWgztoDvGranJ3NSoQfcy0zE9JKu3BUj9qFtpRQO3LxTYo67+YdaIP
         E/XoJM/rOTt6U2vzDhnMgRhVSQKV9Zz/FbSYTvbjZ7hHafLs9PMerMFRMft7BS0lyj
         S1lGEQQ70xeTAratzByyoG0wOMKqQQ458PnI7XVo=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00MI9CMt072058
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 22 Jan 2020 12:09:12 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 22
 Jan 2020 12:09:11 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 22 Jan 2020 12:09:11 -0600
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00MI9BUW069155;
        Wed, 22 Jan 2020 12:09:11 -0600
Subject: Re: [PATCH] ARM: OMAP2+: Fix undefined reference to omap_secure_init
To:     "Andrew F. Davis" <afd@ti.com>, Tony Lindgren <tony@atomide.com>
CC:     <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20200122172017.4791-1-afd@ti.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <f183f31e-32ae-3e9e-96b4-a6f40984cd6e@ti.com>
Date:   Wed, 22 Jan 2020 12:06:04 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200122172017.4791-1-afd@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Andrew

On 1/22/20 11:20 AM, Andrew F. Davis wrote:
> omap_secure_init() is now called from all OMAP2+ platforms during their
> init_early() call. This function is in omap-secure.o so include that
> in the build for these platforms.
>
> Fixes: db711893eac8 ("ARM: OMAP2+: Add omap_secure_init callback hook for secure initialization")
> Reported-by: Dan Murphy <dmurphy@ti.com>
> Signed-off-by: Andrew F. Davis <afd@ti.com>
> ---
>   arch/arm/mach-omap2/Makefile | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm/mach-omap2/Makefile b/arch/arm/mach-omap2/Makefile
> index f07cfda85156..e1135b9d67c6 100644
> --- a/arch/arm/mach-omap2/Makefile
> +++ b/arch/arm/mach-omap2/Makefile
> @@ -16,11 +16,11 @@ hwmod-common				= omap_hwmod.o omap_hwmod_reset.o \
>   clock-common				= clock.o
>   secure-common				= omap-smc.o omap-secure.o
>   
> -obj-$(CONFIG_ARCH_OMAP2) += $(omap-2-3-common) $(hwmod-common)
> +obj-$(CONFIG_ARCH_OMAP2) += $(omap-2-3-common) $(hwmod-common) $(secure-common)
>   obj-$(CONFIG_ARCH_OMAP3) += $(omap-2-3-common) $(hwmod-common) $(secure-common)
>   obj-$(CONFIG_ARCH_OMAP4) += $(hwmod-common) $(secure-common)
> -obj-$(CONFIG_SOC_AM33XX) += $(hwmod-common)
> -obj-$(CONFIG_SOC_OMAP5)	 += $(hwmod-common) $(secure-common)
> +obj-$(CONFIG_SOC_AM33XX) += $(hwmod-common) $(secure-common)
> +obj-$(CONFIG_SOC_OMAP5)  += $(hwmod-common) $(secure-common)
>   obj-$(CONFIG_SOC_AM43XX) += $(hwmod-common) $(secure-common)
>   obj-$(CONFIG_SOC_DRA7XX) += $(hwmod-common) $(secure-common)
>   


Tested-by: Dan Murphy <dmurphy@ti.com>

