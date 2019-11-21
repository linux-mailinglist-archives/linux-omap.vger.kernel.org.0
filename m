Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A1F61050FF
	for <lists+linux-omap@lfdr.de>; Thu, 21 Nov 2019 12:04:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726574AbfKULEq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 21 Nov 2019 06:04:46 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:45178 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726014AbfKULEq (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 21 Nov 2019 06:04:46 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xALB4b55104361;
        Thu, 21 Nov 2019 05:04:37 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1574334277;
        bh=qq1APsO74u8maku5zjIkQXSYBIsW1ugU4Qx/gKZD3C4=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=vxGPywh94ndDGN2+3C2xnucorViji/AHkpVBxlcPKzoyVhD8yIZb7xKHp3lNVF3s4
         vI7d3wrdWxuCaSu8XNgGJ15bFVQulFKelP3sDeFCFZj1BWJM8aZslPUNyLi82p4003
         RQSnsnj54HpY40wwaFaeHEXqpHcisAMowI8ffyzc=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xALB4b1X041551
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 21 Nov 2019 05:04:37 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 21
 Nov 2019 05:04:36 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 21 Nov 2019 05:04:36 -0600
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xALB4WLT076246;
        Thu, 21 Nov 2019 05:04:32 -0600
Subject: Re: [PATCH 1/1] ARM: dts: am5729: beaglebone-ai: adding device tree
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
References: <20191119202850.18149-1-c-robey@ti.com>
 <20191119202850.18149-2-c-robey@ti.com>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <8465b8c3-db4b-31fd-a299-3d5251ec99cf@ti.com>
Date:   Thu, 21 Nov 2019 13:04:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191119202850.18149-2-c-robey@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 19/11/2019 22:28, Caleb Robey wrote:
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
> Signed-off-by: Caleb Robey <c-robey@ti.com>
> Cc: Robert Nelson <robertcnelson@gmail.com>
> 
> ---
>   arch/arm/boot/dts/Makefile                |   1 +
>   arch/arm/boot/dts/am5729-beagleboneai.dts | 782 ++++++++++++++++++++++
>   2 files changed, 783 insertions(+)
>   create mode 100644 arch/arm/boot/dts/am5729-beagleboneai.dts
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index b21b3a64641a..b1154dbda73c 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile

[..]

> +
> +&uart1 {
> +	status = "okay";
> +};
> +
> +&davinci_mdio {
> +	reset-gpios = <&gpio2 23 GPIO_ACTIVE_LOW>;
> +	reset-delay-us = <2>;
> +
> +	phy0: ethernet-phy@1 {
> +		reg = <4>;
> +		compatible = "ethernet-phy-id004d.d072",
> +			"ethernet-phy-ieee802.3-c22";

Pls, do not ignore my comments.

Above compatible should not be required.

> +		eee-broken-100tx;
> +		eee-broken-1000t;
> +	};
> +};
> +
> +&mac {
> +	slaves = <1>;
> +	status = "okay";
> +};

Pls, move cpsw node here

> +
> +&ocp {
> +	pruss1_shmem: pruss_shmem@4b200000 {
> +		status = "okay";
> +		compatible = "ti,pruss-shmem";
> +		reg = <0x4b200000 0x020000>;
> +	};
> +

[..]

> +
> +&cpsw_emac0 {
> +	phy-handle = <&phy0>;
> +	phy-mode = "rgmii";
> +};

Move it up, pls.

-- 
Best regards,
grygorii
