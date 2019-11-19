Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B0D2102E2E
	for <lists+linux-omap@lfdr.de>; Tue, 19 Nov 2019 22:22:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727082AbfKSVVj (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 19 Nov 2019 16:21:39 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:49088 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726948AbfKSVVj (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 19 Nov 2019 16:21:39 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAJLLVpJ038875;
        Tue, 19 Nov 2019 15:21:31 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1574198491;
        bh=2gWLhEbFHNoDN8m0bQkCKW7dcdar3l1iywGpZK9DtcM=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=HegsaQ5hqHr4Z+4g5tEK1D6dXaAaWqk3QBa2o9K8Giiksi45zDECLoozPgoxASGm2
         DfzBMifAvYj+UKxSyR6uxjkWM7FAPjKlAjurJNHIo7Xw92626eFix94uDdVNEwNK5r
         D7JyIaZLVgM2hCACPoQ3YdIihpNLbS/RrgE9Xftk=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xAJLLVrk053860
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 19 Nov 2019 15:21:31 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 19
 Nov 2019 15:21:31 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 19 Nov 2019 15:21:31 -0600
Received: from [10.250.45.147] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAJLLUk5112287;
        Tue, 19 Nov 2019 15:21:30 -0600
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
Message-ID: <05e71585-2480-c764-d6d0-c6a59dcffd21@ti.com>
Date:   Tue, 19 Nov 2019 16:21:25 -0500
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


What do you need all this for, the IPU/DSP should use system memory and
their IOMMUs here.

Looking more at this it looks like you just took this whole file
directly from our evil vendor tree. If you are trying to get this
upstream you need to drop all the parts that have bindings that are not
upstream yet. That includes, most notably, all the PRUSS/IPC stuff.

Andrew
