Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 52757E08AF
	for <lists+linux-omap@lfdr.de>; Tue, 22 Oct 2019 18:22:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388850AbfJVQW1 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 22 Oct 2019 12:22:27 -0400
Received: from muru.com ([72.249.23.125]:39030 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388713AbfJVQW1 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 22 Oct 2019 12:22:27 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 4DCDD80FA;
        Tue, 22 Oct 2019 16:23:01 +0000 (UTC)
Date:   Tue, 22 Oct 2019 09:22:23 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Adam Ford <aford173@gmail.com>
Cc:     linux-omap@vger.kernel.org, adam.ford@logicpd.com,
        hns@goldelico.com,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] configs: ARM: omap2plus: Enable OMAP3_THERMAL
Message-ID: <20191022162223.GU5610@atomide.com>
References: <20191007220540.30690-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191007220540.30690-1-aford173@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* Adam Ford <aford173@gmail.com> [191007 15:06]:
> The some in the OMAP3 family have a bandgap thermal sensor, but
> omap2plus has it disabled.
> 
> This patch enables the OMAP3_THERMAL by default like the rest of
> the OMAP family.

Looks like this breaks off mode during idle for omap3, and that's
probably why it never got enabled. The difference in power
consumption during idle is about 7mW vs 32mW for the SoC as
measured from torpedo shunt for main_battery_som.

I think the right fix might be simply to add handling for
CPU_CLUSTER_PM_ENTER to the related thermal driver to disable
it during idle like we have for gpio-omap.c for example.

Regards,

Tony

> 
> Signed-off-by: Adam Ford <aford173@gmail.com>
> 
> diff --git a/arch/arm/configs/omap2plus_defconfig b/arch/arm/configs/omap2plus_defconfig
> index 8f1c2b6f9e56..7e14a8c8bb29 100644
> --- a/arch/arm/configs/omap2plus_defconfig
> +++ b/arch/arm/configs/omap2plus_defconfig
> @@ -292,6 +292,7 @@ CONFIG_THERMAL_GOV_FAIR_SHARE=y
>  CONFIG_THERMAL_GOV_USER_SPACE=y
>  CONFIG_CPU_THERMAL=y
>  CONFIG_TI_THERMAL=y
> +CONFIG_OMAP3_THERMAL=y
>  CONFIG_OMAP4_THERMAL=y
>  CONFIG_OMAP5_THERMAL=y
>  CONFIG_DRA752_THERMAL=y
> -- 
> 2.17.1
> 
