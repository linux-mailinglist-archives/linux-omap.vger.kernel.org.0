Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C88831052CC
	for <lists+linux-omap@lfdr.de>; Thu, 21 Nov 2019 14:19:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726500AbfKUNTz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 21 Nov 2019 08:19:55 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:38562 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726293AbfKUNTy (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 21 Nov 2019 08:19:54 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xALDJjiG073035;
        Thu, 21 Nov 2019 07:19:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1574342385;
        bh=psikJZvvqnwRexjytLKhngRm7GTd1V7SDTQoU6tJ2c8=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=rYm3g8vpuRE+0cCmJ3qtUR3lfFQjdOTZNXorvP7Oqrq/iNkhZiSmcTCdzq+jT5Fbd
         g9CJ+LnSfJn9+JiN4BWYdHIQtwVeL1gp6HhYHCdbn1QL9v2J+EWPCjt7SsA0t/OLSk
         9hCclpGzFlI31AVH6XcayOUsND8EzQgJFWFQFPgA=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xALDJjMp007881
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 21 Nov 2019 07:19:45 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 21
 Nov 2019 07:19:44 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 21 Nov 2019 07:19:44 -0600
Received: from [10.250.45.147] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xALDJhF1041633;
        Thu, 21 Nov 2019 07:19:43 -0600
Subject: Re: [PATCH 1/1] ARM: dts: am5729: beaglebone-ai: adding device tree
To:     Caleb Robey <c-robey@ti.com>, <linux-omap@vger.kernel.org>
CC:     Jason Kridner <jkridner@gmail.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, Jason Kridner <jdk@ti.com>,
        Faiz Abbas <faiz_abbas@ti.com>,
        Andreas Dannenberg <dannenberg@ti.com>,
        Jean-Jacques Hiblot <jjhiblot@ti.com>,
        Praneeth Bajjuri <praneeth@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Tom Rini <trini@konsulko.com>,
        Robert Nelson <robertcnelson@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20191119202850.18149-1-c-robey@ti.com>
 <20191119202850.18149-2-c-robey@ti.com>
From:   "Andrew F. Davis" <afd@ti.com>
Message-ID: <0926767e-111b-22f5-e87d-51a7269307aa@ti.com>
Date:   Thu, 21 Nov 2019 08:19:43 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191119202850.18149-2-c-robey@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 11/19/19 3:28 PM, Caleb Robey wrote:
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
>  arch/arm/boot/dts/Makefile                |   1 +
>  arch/arm/boot/dts/am5729-beagleboneai.dts | 782 ++++++++++++++++++++++
>  2 files changed, 783 insertions(+)
>  create mode 100644 arch/arm/boot/dts/am5729-beagleboneai.dts
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index b21b3a64641a..b1154dbda73c 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -791,6 +791,7 @@ dtb-$(CONFIG_SOC_DRA7XX) += \
>  	am57xx-beagle-x15.dtb \
>  	am57xx-beagle-x15-revb1.dtb \
>  	am57xx-beagle-x15-revc.dtb \
> +	am5729-beagleboneai.dtb \
>  	am57xx-cl-som-am57x.dtb \
>  	am57xx-sbc-am57x.dtb \
>  	am572x-idk.dtb \
> diff --git a/arch/arm/boot/dts/am5729-beagleboneai.dts b/arch/arm/boot/dts/am5729-beagleboneai.dts
> new file mode 100644
> index 000000000000..7d0e132e6a23
> --- /dev/null
> +++ b/arch/arm/boot/dts/am5729-beagleboneai.dts
> @@ -0,0 +1,782 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2014-2019 Texas Instruments Incorporated - http://www.ti.com/


I know this is mostly a copy/paste from other boards, but lets not claim
copyright 5 years back on a file describing a device that was not even
thought up then.


> + */
> +
> +/dts-v1/;
> +
> +#include "dra74x.dtsi"
> +#include "am57xx-commercial-grade.dtsi"
> +#include "dra74x-mmc-iodelay.dtsi"
> +#include "dra74-ipu-dsp-common.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/pinctrl/dra.h>
> +
> +/ {
> +	model = "BeagleBoard.org BeagleBone AI";
> +	compatible = "beagleboard.org,am5729-beagleboneai", "ti,am5728",
> +		     "ti,dra742", "ti,dra74", "ti,dra7";
> +
> +	aliases {
> +		rtc0 = &tps659038_rtc;
> +		rtc1 = &rtc;
> +		display0 = &hdmi_conn;
> +	};
> +
> +	chosen {
> +		stdout-path = &uart1;
> +	};
> +
> +	memory@0 {
> +		device_type = "memory";
> +		reg = <0x0 0x80000000 0x0 0x40000000>;
> +	};
> +
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		ipu2_memory_region: ipu2-memory@95800000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x0 0x95800000 0x0 0x3800000>;
> +			reusable;
> +			status = "okay";
> +		};


Now these reserved memories are unused.

Andrew


> +
> +		dsp1_memory_region: dsp1-memory@99000000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x0 0x99000000 0x0 0x4000000>;
> +			reusable;
> +			status = "okay";
> +		};
> +
> +		ipu1_memory_region: ipu1-memory@9d000000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x0 0x9d000000 0x0 0x2000000>;
> +			reusable;
> +			status = "okay";
> +		};
> +
> +		dsp2_memory_region: dsp2-memory@9f000000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x0 0x9f000000 0x0 0x800000>;
> +			reusable;
> +			status = "okay";
> +		};
> +
> +	};
> +
