Return-Path: <linux-omap+bounces-5392-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EFEB6D04A31
	for <lists+linux-omap@lfdr.de>; Thu, 08 Jan 2026 18:02:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 51C7E3131C50
	for <lists+linux-omap@lfdr.de>; Thu,  8 Jan 2026 15:54:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C00AB483807;
	Thu,  8 Jan 2026 12:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=couthit.com header.i=@couthit.com header.b="QCjcHtxj"
X-Original-To: linux-omap@vger.kernel.org
Received: from server.couthit.com (server.couthit.com [162.240.164.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86087483817;
	Thu,  8 Jan 2026 12:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.240.164.96
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767873767; cv=none; b=pfBlzyFovhmVGCV6CZ3GLJS7hv9udHo670vJPvLRUfoOcTOAFpT8WH1bpvRVg743Nd7iS3tKKMEXoTsMqOywn8j59fY7ZUUrW3CcUExHa2D53wMqHBZIPDWLNorfn4QORebD86sNMJyg2Yua/4Hv1PmOEYGsAthVgD5fsEkM/yM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767873767; c=relaxed/simple;
	bh=6H7El0KrlREwMD6n9HpCMSMKIilzMD7JYSAu1RPoHfs=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=vCdTrdYQcM/rSomwIboGNGLST+Cb5Ky2qkOm1hSRH5ICOgDv2nXk7c/SKuS+Wn3mszB7D3SJ1idCkyM4CnCeOvxkM2FuDC6xQCb2ZTSoHrCJRp+EXmBbLlqprXuGTjcis5IpnXIFP5rDl/fZ5kYIZQn/XtYA7ZxA4bmcIBHtEXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=couthit.com; spf=pass smtp.mailfrom=couthit.com; dkim=pass (2048-bit key) header.d=couthit.com header.i=@couthit.com header.b=QCjcHtxj; arc=none smtp.client-ip=162.240.164.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=couthit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=couthit.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=toBZ9wB9UjYA/F/GIAjEX8Vx9aqxKz7DvDgXm2wrmcU=; b=QCjcHtxjynL1ZuDv0nLAFrYa/d
	8snQkIDaxAq8ev8Ibn03muSTZvU4o/lXLnhTHU3bwGWcY8YPkmLDIs08yPlXW1QolYmjVnNc7/Shz
	JVqAO1Ph7Sg7FyF5wJU1YlPSJSYfkisQorYOXcC9Ic4m+A7Kb6A3Wk7x4aV+IIlmr4vHFsQGxXvTL
	LQjAeLBtpyjI8EMGnEoMLAHzOkfBdbkFAMHx4o8yuYVWAzZEGvl2OUoeSQxYq0cOIfvQ2FRX5HnpS
	DI3AjgGDLRI2oj1q61uAOgYNwDTiSVXJz930enom+Gwf4+54Rfdffew2QFyEmGcmdOLBVc3eLq43H
	2g//Iiyg==;
Received: from [122.175.9.182] (port=29271 helo=zimbra.couthit.local)
	by server.couthit.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <parvathi@couthit.com>)
	id 1vdoil-0000000036V-0S6z;
	Thu, 08 Jan 2026 07:02:31 -0500
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id 583AA1A80E0F;
	Thu,  8 Jan 2026 17:32:24 +0530 (IST)
Received: from zimbra.couthit.local ([127.0.0.1])
 by localhost (zimbra.couthit.local [127.0.0.1]) (amavis, port 10032)
 with ESMTP id mAcZArUnjiuA; Thu,  8 Jan 2026 17:32:23 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id 5AD781A80E27;
	Thu,  8 Jan 2026 17:32:23 +0530 (IST)
X-Virus-Scanned: amavis at couthit.local
Received: from zimbra.couthit.local ([127.0.0.1])
 by localhost (zimbra.couthit.local [127.0.0.1]) (amavis, port 10026)
 with ESMTP id ouwfcrParFdQ; Thu,  8 Jan 2026 17:32:23 +0530 (IST)
Received: from zimbra.couthit.local (zimbra.couthit.local [10.10.10.103])
	by zimbra.couthit.local (Postfix) with ESMTP id 3387F1A80E0F;
	Thu,  8 Jan 2026 17:32:23 +0530 (IST)
Date: Thu, 8 Jan 2026 17:32:23 +0530 (IST)
From: Parvathi Pudi <parvathi@couthit.com>
To: Andrew Davis <afd@ti.com>
Cc: Parvathi Pudi <parvathi@couthit.com>, nm <nm@ti.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, 
	Kevin Hilman <khilman@baylibre.com>, rogerq <rogerq@kernel.org>, 
	tony <tony@atomide.com>, robh <robh@kernel.org>, 
	krzk+dt <krzk+dt@kernel.org>, conor+dt <conor+dt@kernel.org>, 
	richardcochran <richardcochran@gmail.com>, 
	aaro koskinen <aaro.koskinen@iki.fi>, andreas <andreas@kemnade.info>, 
	Andrew Lunn <andrew@lunn.ch>, 
	linux-omap <linux-omap@vger.kernel.org>, 
	devicetree <devicetree@vger.kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	netdev <netdev@vger.kernel.org>, danishanwar <danishanwar@ti.com>, 
	pratheesh <pratheesh@ti.com>, j-rameshbabu <j-rameshbabu@ti.com>, 
	praneeth <praneeth@ti.com>, srk <srk@ti.com>, rogerq <rogerq@ti.com>, 
	krishna <krishna@couthit.com>, mohan <mohan@couthit.com>, 
	pmohan <pmohan@couthit.com>, basharath <basharath@couthit.com>, 
	Murali Karicheri <m-karicheri2@ti.com>
Message-ID: <2110802326.88645.1767873743162.JavaMail.zimbra@couthit.local>
In-Reply-To: <84b08398-5622-45c9-a8fa-54639c1cf0b3@ti.com>
References: <20260105162546.1809714-1-parvathi@couthit.com> <20260105162546.1809714-3-parvathi@couthit.com> <84b08398-5622-45c9-a8fa-54639c1cf0b3@ti.com>
Subject: Re: [PATCH v4 2/2] arm: dts: ti: Adds support for AM335x and AM437x
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 9.0.0_ZEXTRAS_20240927 (ZimbraWebClient - GC143 (Mac)/9.0.0_ZEXTRAS_20240927)
Thread-Topic: Adds support for AM335x and AM437x
Thread-Index: q8z9cKWgO4NEoGv8PQwa5viWNmn8ow==
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - server.couthit.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - couthit.com
X-Get-Message-Sender-Via: server.couthit.com: authenticated_id: smtp@couthit.com
X-Authenticated-Sender: server.couthit.com: smtp@couthit.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Hi,

> On 1/5/26 10:21 AM, Parvathi Pudi wrote:
>> From: Roger Quadros <rogerq@ti.com>
>> 
>> PRU-ICSS instance consists of two PRU cores along with various
>> peripherals such as the Interrupt Controller (PRU_INTC), the Industrial
>> Ethernet Peripheral(IEP), the Real Time Media Independent Interface
>> controller (MII_RT), and the Enhanced Capture (eCAP) event module.
>> 
>> The TI Sitara AM335x ICE-V2 consists of single PRU-ICSS instance,
>> This patch adds the new device tree overlay file in-order to enable
>> PRU-ICSS instance, along with makefile changes.
>> 
>> The TI Sitara AM437x series of devices consists of 2 PRU-ICSS instances
>> (PRU-ICSS0 and PRU-ICSS1). This patch adds the device tree nodes for the
>> PRU-ICSS1 instance to support DUAL-MAC mode of operation. Support for
>> Ethernet over PRU is available only for ICSS1 instance.
>> 
>> am33xx-l4.dtsi, am4372.dtsi - Adds IEP and eCAP peripheral as child nodes
>> of the PRUSS subsystem node.
>> 
>> am335x-icev2-prueth.dtso, am437x-idk-evm.dts - Adds PRU-ICSS
>> instance node along with PRU eth port information and corresponding
>> port configuration. It includes interrupt mapping for packet reception,
>> HW timestamp collection, and PRU Ethernet ports in MII mode,
>> 
>> GPIO configuration, boot strapping along with delay configuration for
>> individual PRU Ethernet port and other required nodes.
>> 
>> Signed-off-by: Roger Quadros <rogerq@ti.com>
>> Signed-off-by: Andrew F. Davis <afd@ti.com>
>> Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
>> Signed-off-by: Basharath Hussain Khaja <basharath@couthit.com>
>> Signed-off-by: Parvathi Pudi <parvathi@couthit.com>
>> ---
>>   arch/arm/boot/dts/ti/omap/Makefile            |   5 +
>>   .../ti/omap/am335x-icev2-prueth-overlay.dtso  | 190 ++++++++++++++++++
>>   arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi      |  11 +
>>   arch/arm/boot/dts/ti/omap/am4372.dtsi         |  11 +
>>   arch/arm/boot/dts/ti/omap/am437x-idk-evm.dts  | 137 ++++++++++++-
>>   5 files changed, 353 insertions(+), 1 deletion(-)
>>   create mode 100644 arch/arm/boot/dts/ti/omap/am335x-icev2-prueth-overlay.dtso
>> 
>> diff --git a/arch/arm/boot/dts/ti/omap/Makefile
>> b/arch/arm/boot/dts/ti/omap/Makefile
>> index 14e500846875..c68948035eca 100644
>> --- a/arch/arm/boot/dts/ti/omap/Makefile
>> +++ b/arch/arm/boot/dts/ti/omap/Makefile
>> @@ -82,6 +82,10 @@ dtb-$(CONFIG_ARCH_OMAP4) += \
>>   	omap4-var-stk-om44.dtb \
>>   	omap4-xyboard-mz609.dtb \
>>   	omap4-xyboard-mz617.dtb
>> +
>> +am335x-icev2-prueth-dtbs := am335x-icev2.dtb \
>> +	am335x-icev2-prueth-overlay.dtbo
>> +
>>   dtb-$(CONFIG_SOC_AM33XX) += \
>>   	am335x-baltos-ir2110.dtb \
>>   	am335x-baltos-ir3220.dtb \
>> @@ -100,6 +104,7 @@ dtb-$(CONFIG_SOC_AM33XX) += \
>>   	am335x-evmsk.dtb \
>>   	am335x-guardian.dtb \
>>   	am335x-icev2.dtb \
>> +	am335x-icev2-prueth.dtb \
>>   	am335x-lxm.dtb \
>>   	am335x-mba335x.dtb \
>>   	am335x-moxa-uc-2101.dtb \
>> diff --git a/arch/arm/boot/dts/ti/omap/am335x-icev2-prueth-overlay.dtso
>> b/arch/arm/boot/dts/ti/omap/am335x-icev2-prueth-overlay.dtso
>> new file mode 100644
>> index 000000000000..abde5119875f
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/ti/omap/am335x-icev2-prueth-overlay.dtso
>> @@ -0,0 +1,190 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * DT overlay for IDK AM335x
>> + *
>> + * Copyright (C) 2018 Texas Instruments Incorporated - http://www.ti.com/
>> + */
>> +
>> +/*
>> + * AM335x ICE V2 board
>> + * http://www.ti.com/tool/tmdsice3359
>> + */
>> +
>> +/dts-v1/;
>> +/plugin/;
>> +
>> +#include <dt-bindings/bus/ti-sysc.h>
>> +#include <dt-bindings/gpio/gpio.h>
>> +#include <dt-bindings/pinctrl/am33xx.h>
>> +#include <dt-bindings/clock/am3.h>
>> +
>> +&{/} {
>> +        /* Dual-MAC Ethernet application node on PRU-ICSS */
>> +        pruss_eth: pruss-eth {
>> +                compatible = "ti,am3359-prueth";
>> +                ti,prus = <&pru0>, <&pru1>;
>> +                sram = <&ocmcram>;
>> +                ti,mii-rt = <&pruss_mii_rt>;
>> +                ti,iep = <&pruss_iep>;
>> +                ti,ecap = <&pruss_ecap>;
>> +                interrupts = <20 2 2>, <21 3 3>;
>> +                interrupt-names = "rx_hp", "rx_lp";
>> +                interrupt-parent = <&pruss_intc>;
>> +
>> +                pinctrl-0 = <&pruss_eth_default>;
>> +                pinctrl-names = "default";
>> +
>> +                ethernet-ports {
>> +                        #address-cells = <1>;
>> +                        #size-cells = <0>;
>> +                        pruss_emac0: ethernet-port@0 {
>> +                                reg = <0>;
>> +                                phy-handle = <&pruss_eth0_phy>;
>> +                                phy-mode = "mii";
>> +                                interrupts = <20 2 2>, <26 6 6>, <23 6 6>;
>> +                                interrupt-names = "rx", "emac_ptp_tx",
>> +                                                  "hsr_ptp_tx";
>> +                                /* Filled in by bootloader */
>> +                                local-mac-address = [00 00 00 00 00 00];
>> +                        };
>> +
>> +                        pruss_emac1: ethernet-port@1 {
>> +                                reg = <1>;
>> +                                phy-handle = <&pruss_eth1_phy>;
>> +                                phy-mode = "mii";
>> +                                interrupts = <21 3 3>, <27 9 7>, <24 9 7>;
>> +                                interrupt-names = "rx", "emac_ptp_tx",
>> +                                                  "hsr_ptp_tx";
>> +                                /* Filled in by bootloader */
>> +                                local-mac-address = [00 00 00 00 00 00];
>> +                        };
>> +                };
>> +        };
>> +};
>> +
>> +&am33xx_pinmux {
>> +	/* MDIO node for PRU-ICSS */
>> +        pruss_mdio_default: pruss_mdio_default {
>> +                pinctrl-single,pins = <
>> +                        /* gpmc_clk.pr1_mdio_mdclk */
>> +                        AM33XX_PADCONF(0x88c, PIN_OUTPUT, MUX_MODE5)
>> +                        /* gpmc_csn3.pr1_mdio_data */
>> +                        AM33XX_PADCONF(0x888, PIN_INPUT, MUX_MODE5)
> 
> Have you regenerated this list lately? The pinmux tool usually puts the
> comment after the PADCONF entry. It also now also shows the pin number
> in the comment which is nice:
> 
>	AM33XX_IOPAD(0x88c, PIN_OUTPUT, MUX_MODE5) /* (V12) gpmc_clk.pr1_mdio_mdclk */
>	AM33XX_IOPAD(0x888, PIN_INPUT, MUX_MODE5) /* (T13) gpmc_csn3.pr1_mdio_data */
> 
> I'd recommend regenerating these nodes to match the latest pinmux tool output.
> 

Sure, we will check and regenerate these nodes using the pinmux tool and
update accordingly.

>> +                        /* gpmc_ben0_cle.gpio2_5 */
>> +                        AM33XX_PADCONF(0x89c, PIN_INPUT_PULLUP, MUX_MODE7)
>> +                        /* disable CPSW MDIO */
> 
> Is this needed? If you disable the CPSW MDIO node the pinmux should be unset,
> so not sure why you are muxing these to GPIO pins.
> 

We will review and get back with more details on this.

> Also, this patch is a bit busy, might be easier to review if you split it
> into one for AM335x and one for AM437x changes.
> 

We will split the changes into two patches, one for AM335x
and one for AM437x, and address this in the next version.


Thanks and Regards,
Parvathi.

