Return-Path: <linux-omap+bounces-5497-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E85CD314E1
	for <lists+linux-omap@lfdr.de>; Fri, 16 Jan 2026 13:48:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5F94B3045F79
	for <lists+linux-omap@lfdr.de>; Fri, 16 Jan 2026 12:48:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2DDC217723;
	Fri, 16 Jan 2026 12:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=couthit.com header.i=@couthit.com header.b="LDVrAvcq"
X-Original-To: linux-omap@vger.kernel.org
Received: from server.couthit.com (server.couthit.com [162.240.164.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B65E17BCA;
	Fri, 16 Jan 2026 12:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.240.164.96
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768567682; cv=none; b=o9iAkvSMEk0JhkMdOM0ZXWy/xTWQnvG0Yh1huq+4WuAEDfE+iFy4jlazETy6+YVE4bOatjsaJAd0Y5JWdhDi5HHoE5fjFQj+/4afPYDZF1UZHKnkLg9l5EEmkZRq2GoKhmCrznD5pRUUVadNqqeSyAyJwaGkFEwtpOzyLEVQ/GA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768567682; c=relaxed/simple;
	bh=1DZFT/iBQ2jNPK3zXoqKoM/fFDsK3uxKb0FNkehKUto=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=tNwpfrCmOou70VrV48u5In8c4X6wYlEetAnfyT0mDUK+1N6hw1v/6wPgddaVQV2CeLMvNYYlbkvx3bmxbbMyjucIjcQeWPZktbwFIPW7aBxa7dgDiUFInP4IVa3ByN+2W0czZgFURpclRfzKtrvJgK4tDYZo3jOEIuuAcz9M6Xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=couthit.com; spf=pass smtp.mailfrom=couthit.com; dkim=pass (2048-bit key) header.d=couthit.com header.i=@couthit.com header.b=LDVrAvcq; arc=none smtp.client-ip=162.240.164.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=couthit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=couthit.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=Cv+XGdsNlrOuQHJWMJtivmMYWFGXGamn47OP1Rpv/Os=; b=LDVrAvcqLAPhf7N2fZLeG76T7q
	Zyy7iO30b5Kr7oKiY2jfZ9PewzYfd+6CeOTcpVPmUALG0RHY7JQOaAqE7YxArGMYXD/fJB/NOIead
	OD4H8dui2w1J/oaeSH/mw8QSpOAfBjhWMcRLxuJkrkct81KT+QI+asF0Kbuyz+VuXd9vyPAJynQNI
	GUV1Ms8D0j0vhNVNHeZZ7AjJyhsUs65JECfMAlmzdwvnE0BSHy1v9uU7xk08WlJVXgoOfudNQA8kN
	H7LYSnYi7uHUFgNB4+xIlWRMvTyfHrnS2dC61ucbMV6ezdADWRe38LG3+HP/8cujaiWPD8trA257i
	RaYmlaLQ==;
Received: from [122.175.9.182] (port=3146 helo=zimbra.couthit.local)
	by server.couthit.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <parvathi@couthit.com>)
	id 1vgjF1-00000007Abd-05xU;
	Fri, 16 Jan 2026 07:47:51 -0500
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id 9A9F21B23990;
	Fri, 16 Jan 2026 18:17:43 +0530 (IST)
Received: from zimbra.couthit.local ([127.0.0.1])
 by localhost (zimbra.couthit.local [127.0.0.1]) (amavis, port 10032)
 with ESMTP id 0tjnhtPYWrx0; Fri, 16 Jan 2026 18:17:39 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id 97B451B23F13;
	Fri, 16 Jan 2026 18:17:39 +0530 (IST)
X-Virus-Scanned: amavis at couthit.local
Received: from zimbra.couthit.local ([127.0.0.1])
 by localhost (zimbra.couthit.local [127.0.0.1]) (amavis, port 10026)
 with ESMTP id nmZss4_yFM5M; Fri, 16 Jan 2026 18:17:39 +0530 (IST)
Received: from zimbra.couthit.local (zimbra.couthit.local [10.10.10.103])
	by zimbra.couthit.local (Postfix) with ESMTP id 632CD1B23990;
	Fri, 16 Jan 2026 18:17:39 +0530 (IST)
Date: Fri, 16 Jan 2026 18:17:39 +0530 (IST)
From: Parvathi Pudi <parvathi@couthit.com>
To: Andrew Davis <afd@ti.com>
Cc: nm <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
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
	Murali Karicheri <m-karicheri2@ti.com>, 
	parvathi <parvathi@couthit.com>
Message-ID: <180076068.145887.1768567659299.JavaMail.zimbra@couthit.local>
In-Reply-To: <2110802326.88645.1767873743162.JavaMail.zimbra@couthit.local>
References: <20260105162546.1809714-1-parvathi@couthit.com> <20260105162546.1809714-3-parvathi@couthit.com> <84b08398-5622-45c9-a8fa-54639c1cf0b3@ti.com> <2110802326.88645.1767873743162.JavaMail.zimbra@couthit.local>
Subject: Re: [PATCH v4 2/2] arm: dts: ti: Adds support for AM335x and AM437x
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: Zimbra 9.0.0_ZEXTRAS_20240927 (ZimbraWebClient - GC138 (Linux)/9.0.0_ZEXTRAS_20240927)
Thread-Topic: Adds support for AM335x and AM437x
Thread-Index: q8z9cKWgO4NEoGv8PQwa5viWNmn8o92ndJ67
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

> Hi,
>=20
>> On 1/5/26 10:21 AM, Parvathi Pudi wrote:
>>> From: Roger Quadros <rogerq@ti.com>
>>>=20
>>> PRU-ICSS instance consists of two PRU cores along with various
>>> peripherals such as the Interrupt Controller (PRU_INTC), the Industrial
>>> Ethernet Peripheral(IEP), the Real Time Media Independent Interface
>>> controller (MII_RT), and the Enhanced Capture (eCAP) event module.
>>>=20
>>> The TI Sitara AM335x ICE-V2 consists of single PRU-ICSS instance,
>>> This patch adds the new device tree overlay file in-order to enable
>>> PRU-ICSS instance, along with makefile changes.
>>>=20
>>> The TI Sitara AM437x series of devices consists of 2 PRU-ICSS instances
>>> (PRU-ICSS0 and PRU-ICSS1). This patch adds the device tree nodes for th=
e
>>> PRU-ICSS1 instance to support DUAL-MAC mode of operation. Support for
>>> Ethernet over PRU is available only for ICSS1 instance.
>>>=20
>>> am33xx-l4.dtsi, am4372.dtsi - Adds IEP and eCAP peripheral as child nod=
es
>>> of the PRUSS subsystem node.
>>>=20
>>> am335x-icev2-prueth.dtso, am437x-idk-evm.dts - Adds PRU-ICSS
>>> instance node along with PRU eth port information and corresponding
>>> port configuration. It includes interrupt mapping for packet reception,
>>> HW timestamp collection, and PRU Ethernet ports in MII mode,
>>>=20
>>> GPIO configuration, boot strapping along with delay configuration for
>>> individual PRU Ethernet port and other required nodes.
>>>=20
>>> Signed-off-by: Roger Quadros <rogerq@ti.com>
>>> Signed-off-by: Andrew F. Davis <afd@ti.com>
>>> Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
>>> Signed-off-by: Basharath Hussain Khaja <basharath@couthit.com>
>>> Signed-off-by: Parvathi Pudi <parvathi@couthit.com>
>>> ---
>>>   arch/arm/boot/dts/ti/omap/Makefile            |   5 +
>>>   .../ti/omap/am335x-icev2-prueth-overlay.dtso  | 190 +++++++++++++++++=
+
>>>   arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi      |  11 +
>>>   arch/arm/boot/dts/ti/omap/am4372.dtsi         |  11 +
>>>   arch/arm/boot/dts/ti/omap/am437x-idk-evm.dts  | 137 ++++++++++++-
>>>   5 files changed, 353 insertions(+), 1 deletion(-)
>>>   create mode 100644 arch/arm/boot/dts/ti/omap/am335x-icev2-prueth-over=
lay.dtso
>>>=20
>>> diff --git a/arch/arm/boot/dts/ti/omap/Makefile
>>> b/arch/arm/boot/dts/ti/omap/Makefile
>>> index 14e500846875..c68948035eca 100644
>>> --- a/arch/arm/boot/dts/ti/omap/Makefile
>>> +++ b/arch/arm/boot/dts/ti/omap/Makefile
>>> @@ -82,6 +82,10 @@ dtb-$(CONFIG_ARCH_OMAP4) +=3D \
>>>   =09omap4-var-stk-om44.dtb \
>>>   =09omap4-xyboard-mz609.dtb \
>>>   =09omap4-xyboard-mz617.dtb
>>> +
>>> +am335x-icev2-prueth-dtbs :=3D am335x-icev2.dtb \
>>> +=09am335x-icev2-prueth-overlay.dtbo
>>> +
>>>   dtb-$(CONFIG_SOC_AM33XX) +=3D \
>>>   =09am335x-baltos-ir2110.dtb \
>>>   =09am335x-baltos-ir3220.dtb \
>>> @@ -100,6 +104,7 @@ dtb-$(CONFIG_SOC_AM33XX) +=3D \
>>>   =09am335x-evmsk.dtb \
>>>   =09am335x-guardian.dtb \
>>>   =09am335x-icev2.dtb \
>>> +=09am335x-icev2-prueth.dtb \
>>>   =09am335x-lxm.dtb \
>>>   =09am335x-mba335x.dtb \
>>>   =09am335x-moxa-uc-2101.dtb \
>>> diff --git a/arch/arm/boot/dts/ti/omap/am335x-icev2-prueth-overlay.dtso
>>> b/arch/arm/boot/dts/ti/omap/am335x-icev2-prueth-overlay.dtso
>>> new file mode 100644
>>> index 000000000000..abde5119875f
>>> --- /dev/null
>>> +++ b/arch/arm/boot/dts/ti/omap/am335x-icev2-prueth-overlay.dtso
>>> @@ -0,0 +1,190 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +/*
>>> + * DT overlay for IDK AM335x
>>> + *
>>> + * Copyright (C) 2018 Texas Instruments Incorporated - http://www.ti.c=
om/
>>> + */
>>> +
>>> +/*
>>> + * AM335x ICE V2 board
>>> + * http://www.ti.com/tool/tmdsice3359
>>> + */
>>> +
>>> +/dts-v1/;
>>> +/plugin/;
>>> +
>>> +#include <dt-bindings/bus/ti-sysc.h>
>>> +#include <dt-bindings/gpio/gpio.h>
>>> +#include <dt-bindings/pinctrl/am33xx.h>
>>> +#include <dt-bindings/clock/am3.h>
>>> +
>>> +&{/} {
>>> +        /* Dual-MAC Ethernet application node on PRU-ICSS */
>>> +        pruss_eth: pruss-eth {
>>> +                compatible =3D "ti,am3359-prueth";
>>> +                ti,prus =3D <&pru0>, <&pru1>;
>>> +                sram =3D <&ocmcram>;
>>> +                ti,mii-rt =3D <&pruss_mii_rt>;
>>> +                ti,iep =3D <&pruss_iep>;
>>> +                ti,ecap =3D <&pruss_ecap>;
>>> +                interrupts =3D <20 2 2>, <21 3 3>;
>>> +                interrupt-names =3D "rx_hp", "rx_lp";
>>> +                interrupt-parent =3D <&pruss_intc>;
>>> +
>>> +                pinctrl-0 =3D <&pruss_eth_default>;
>>> +                pinctrl-names =3D "default";
>>> +
>>> +                ethernet-ports {
>>> +                        #address-cells =3D <1>;
>>> +                        #size-cells =3D <0>;
>>> +                        pruss_emac0: ethernet-port@0 {
>>> +                                reg =3D <0>;
>>> +                                phy-handle =3D <&pruss_eth0_phy>;
>>> +                                phy-mode =3D "mii";
>>> +                                interrupts =3D <20 2 2>, <26 6 6>, <23=
 6 6>;
>>> +                                interrupt-names =3D "rx", "emac_ptp_tx=
",
>>> +                                                  "hsr_ptp_tx";
>>> +                                /* Filled in by bootloader */
>>> +                                local-mac-address =3D [00 00 00 00 00 =
00];
>>> +                        };
>>> +
>>> +                        pruss_emac1: ethernet-port@1 {
>>> +                                reg =3D <1>;
>>> +                                phy-handle =3D <&pruss_eth1_phy>;
>>> +                                phy-mode =3D "mii";
>>> +                                interrupts =3D <21 3 3>, <27 9 7>, <24=
 9 7>;
>>> +                                interrupt-names =3D "rx", "emac_ptp_tx=
",
>>> +                                                  "hsr_ptp_tx";
>>> +                                /* Filled in by bootloader */
>>> +                                local-mac-address =3D [00 00 00 00 00 =
00];
>>> +                        };
>>> +                };
>>> +        };
>>> +};
>>> +
>>> +&am33xx_pinmux {
>>> +=09/* MDIO node for PRU-ICSS */
>>> +        pruss_mdio_default: pruss_mdio_default {
>>> +                pinctrl-single,pins =3D <
>>> +                        /* gpmc_clk.pr1_mdio_mdclk */
>>> +                        AM33XX_PADCONF(0x88c, PIN_OUTPUT, MUX_MODE5)
>>> +                        /* gpmc_csn3.pr1_mdio_data */
>>> +                        AM33XX_PADCONF(0x888, PIN_INPUT, MUX_MODE5)
>>=20
>> Have you regenerated this list lately? The pinmux tool usually puts the
>> comment after the PADCONF entry. It also now also shows the pin number
>> in the comment which is nice:
>>=20
>>=09AM33XX_IOPAD(0x88c, PIN_OUTPUT, MUX_MODE5) /* (V12) gpmc_clk.pr1_mdio_=
mdclk */
>>=09AM33XX_IOPAD(0x888, PIN_INPUT, MUX_MODE5) /* (T13) gpmc_csn3.pr1_mdio_=
data */
>>=20
>> I'd recommend regenerating these nodes to match the latest pinmux tool o=
utput.
>>=20
>=20
> Sure, we will check and regenerate these nodes using the pinmux tool and
> update accordingly.
>=20
>>> +                        /* gpmc_ben0_cle.gpio2_5 */
>>> +                        AM33XX_PADCONF(0x89c, PIN_INPUT_PULLUP, MUX_MO=
DE7)
>>> +                        /* disable CPSW MDIO */
>>=20
>> Is this needed? If you disable the CPSW MDIO node the pinmux should be u=
nset,
>> so not sure why you are muxing these to GPIO pins.
>>=20
>=20
> We will review and get back with more details on this.
>=20

On the AM335x board, the CPSW MDIO and PRUSS MDIO signals are routed to the=
 same physical
pins (as shown in the schematic, see page 10 =E2=80=9CMII_MUX=E2=80=9D in t=
mdxice3359_sch_3h0013_v2_1a.pdf
from https://www.ti.com/lit/zip/TIDR336 ). Because of this shared routing, =
the pinmux
configuration applied by U-Boot for CPSW MDIO remains active even if the CP=
SW MDIO node is
later disabled in Linux, and Linux does not automatically revert the pins t=
o their reset state.

To prevent signal contention and ensure correct PRUSS MDIO operation, we ex=
plicitly re-mux
the CPSW MDIO pins to GPIO in the PRUSS pinctrl. Without this explicit reco=
nfiguration, we
observed PHY connection issues during startup.


Thanks and Regards,
Parvathi.

