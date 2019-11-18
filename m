Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A87710043F
	for <lists+linux-omap@lfdr.de>; Mon, 18 Nov 2019 12:33:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726646AbfKRLdi (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 18 Nov 2019 06:33:38 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:48502 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726552AbfKRLdi (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 18 Nov 2019 06:33:38 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAIBXUlB080670;
        Mon, 18 Nov 2019 05:33:30 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1574076810;
        bh=U20YmeyGvb3fuVn86ScVQQeSXmImKgQ4tuZlR17nxtE=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=SaHRA7Yf9B0D6P80GZK+NhzjrOlfTEmYh9aRQXD3RrZK14wEymg/FB3h7MTZJSj95
         u3KLDue4ZQfL3GlJ6pX09SWWW3Pis28aXV0aMbRnOsFtAvHxG/BtLqz0oFGiv7abJP
         8kES1S/ClJY5UFJoTAjcQwNDHQrfaFyV/e0ExMj4=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xAIBXTUU084668
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 18 Nov 2019 05:33:29 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 18
 Nov 2019 05:33:29 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 18 Nov 2019 05:33:28 -0600
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAIBXMDQ059095;
        Mon, 18 Nov 2019 05:33:23 -0600
Subject: Re: [PATCH 2/2] ARM: dts: am5729: beaglebone-ai: adding device tree
To:     Caleb Robey <c-robey@ti.com>, <linux-omap@vger.kernel.org>
CC:     Jason Kridner <jkridner@gmail.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, Jason Kridner <jdk@ti.com>,
        Faiz Abbas <faiz_abbas@ti.com>,
        Andreas Dannenberg <dannenberg@ti.com>,
        Jean-Jacques Hiblot <jjhiblot@ti.com>,
        Praneeth Bajjuri <praneeth@ti.com>,
        "Andrew F . Davis" <afd@ti.com>, Tom Rini <trini@konsulko.com>,
        Robert Nelson <robertcnelson@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20191114170933.12623-1-c-robey@ti.com>
 <20191114170933.12623-3-c-robey@ti.com>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <ff7aa0c6-b0d5-c87e-1d96-be77f5a7e2af@ti.com>
Date:   Mon, 18 Nov 2019 13:33:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191114170933.12623-3-c-robey@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 14/11/2019 19:09, Caleb Robey wrote:
> From: Jason Kridner <jdk@ti.com>
> 
> BeagleBoard.org BeagleBone AI is an open source hardware single
> board computer based on the Texas Instruments AM5729 SoC featuring
> dual-core 1.5GHz Arm Cortex-A15 processor, dual-core C66 digital
> signal processor (DSP), quad-core embedded vision engine (EVE),
> Arm Cortex-M4 processors, dual programmable realtime unit
> industrial control subsystems and more. The board features 1GB
> DDR3L, USB3.0 Type-C, USB HS Type-A, microHDMI, 16GB eMMC flash,
> 1G Ethernet, 802.11ac 2/5GHz, Bluetooth, and BeagleBone expansion
> headers.
> 
> For more information, refer to:
> https://beaglebone.ai
> 
> This patch introduces the BeagleBone AI device tree.
> 
> Note that the device use the "ti,tpd12s016" component which is
> software compatible with "ti,tpd12s015". Thus we only use the
> latter driver.
> 
> Signed-off-by: Jason Kridner <jdk@ti.com>
> Cc: Robert Nelson <robertcnelson@gmail.com>
> Cc: Caleb Robey <c-robey@ti.com>
> 
> ---
>   arch/arm/boot/dts/Makefile                |   1 +
>   arch/arm/boot/dts/am5729-beagleboneai.dts | 733 ++++++++++++++++++++++
>   2 files changed, 734 insertions(+)
>   create mode 100644 arch/arm/boot/dts/am5729-beagleboneai.dts
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index b21b3a64641a..b1154dbda73c 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -791,6 +791,7 @@ dtb-$(CONFIG_SOC_DRA7XX) += \
>   	am57xx-beagle-x15.dtb \
>   	am57xx-beagle-x15-revb1.dtb \

[..]

> +
> +&davinci_mdio {
> +	reset-gpios = <&gpio2 23 GPIO_ACTIVE_LOW>;
> +	reset-delay-us = <2>;
> +
> +	phy0: ethernet-phy@1 {
> +		reg = <4>;
> +		compatible = "ethernet-phy-id004d.d072",
> +			"ethernet-phy-ieee802.3-c22";

is it really required to have above compatible prop?
It's expected to work without it.

> +		eee-broken-100tx;
> +		eee-broken-1000t;
> +	};
> +};
> +
> +&mac {
> +	slaves = <1>;
> +	status = "okay";
> +};
> +
> +&cpsw_emac0 {
> +	phy-handle = <&phy0>;
> +	phy-mode = "rgmii";
> +};
> +

[...]

-- 
Best regards,
grygorii
