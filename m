Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B0831CF658
	for <lists+linux-omap@lfdr.de>; Tue,  8 Oct 2019 11:45:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730150AbfJHJpG (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 8 Oct 2019 05:45:06 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:51653 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728866AbfJHJpF (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 8 Oct 2019 05:45:05 -0400
X-Originating-IP: 2.139.156.91
Received: from localhost (91.red-2-139-156.staticip.rima-tde.net [2.139.156.91])
        (Authenticated sender: gregory.clement@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 0001520011;
        Tue,  8 Oct 2019 09:44:59 +0000 (UTC)
From:   Gregory CLEMENT <gregory.clement@bootlin.com>
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Jason Cooper <jason@lakedaemon.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH v3 05/10] ARM: dts: dove: Rename "sa-sram" node to "sram"
In-Reply-To: <20191002164316.14905-5-krzk@kernel.org>
References: <20191002164316.14905-1-krzk@kernel.org> <20191002164316.14905-5-krzk@kernel.org>
Date:   Tue, 08 Oct 2019 11:44:58 +0200
Message-ID: <87imoztvtx.fsf@FE-laptop>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Krzysztof Kozlowski,

> The device node name should reflect generic class of a device so rename
> the "sa-sram" node to "sram".  This will be also in sync with upcoming DT
> schema.  No functional change.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Applied on mvebu/dt

Thanks,

Gregory

> ---
>  arch/arm/boot/dts/dove.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/dove.dtsi b/arch/arm/boot/dts/dove.dtsi
> index 2e8a3977219f..3081b04e8c08 100644
> --- a/arch/arm/boot/dts/dove.dtsi
> +++ b/arch/arm/boot/dts/dove.dtsi
> @@ -784,7 +784,7 @@
>  				status = "disabled";
>  			};
>  
> -			crypto_sram: sa-sram@ffffe000 {
> +			crypto_sram: sram@ffffe000 {
>  				compatible = "mmio-sram";
>  				reg = <0xffffe000 0x800>;
>  				clocks = <&gate_clk 15>;
> -- 
> 2.17.1
>

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
