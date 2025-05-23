Return-Path: <linux-omap+bounces-3736-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F15ABAC2A4F
	for <lists+linux-omap@lfdr.de>; Fri, 23 May 2025 21:17:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 97F1C5422CC
	for <lists+linux-omap@lfdr.de>; Fri, 23 May 2025 19:17:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B31B1D54E2;
	Fri, 23 May 2025 19:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c3s6c3fp"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34CCA1D130E;
	Fri, 23 May 2025 19:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748027831; cv=none; b=fSHPSuUkdoTJeJoUHVqrHtzIrVNSRGvgde9SLbKGb4yjnGwytSs7ZdAecx/QThKqczfnVYfkhnWUXQ82GPr1rXRitiZAiZko75Pb+Pc5jUDTJYkxf+bBrkEOqJgO9xE89fGiGf8IltHztFklypL35gJ1W/im2qVmlrkrGb7X0nA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748027831; c=relaxed/simple;
	bh=JuPUQZHZmst0YQeF37wUUV/+HL+i6FkH+REzgyhCD/M=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=VP2pHkh44mOfa2gMKxbhNKamQKcoBo4Km/kxoOHr5JZ/wCkiPbs8ut29ICDO658giNsu2QqLyqjjqzM1BcAvWhLTaJwB8ROvqjKJ30OYE6Gr6+MK2NgcO/60MzN55Q261nL1o1dzg7U6aePfyv/U7Ng3NiZhDurhHAnXcrf/DXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c3s6c3fp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 186DDC4CEE9;
	Fri, 23 May 2025 19:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748027830;
	bh=JuPUQZHZmst0YQeF37wUUV/+HL+i6FkH+REzgyhCD/M=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=c3s6c3fp4O+kCDxk1P7Zg4v+F5MDRPrHzM9ZKcsJlC28ZvOM/NPZhJgyVLQAB4QlD
	 FyB6CjUnNb/CrrHY6aIp9v90/8bI8Yrfe+ErVlsBZxrVjGqnpvhPtE6BYsPed7IH1D
	 7xX3CdIx+oOfABG/3o3cI0VWHG47bkuxUDmJGSwK42Xcs0p0Pw2r8v1ZTdjuD4iDla
	 1rqjG/mGUZ3QwR60kTWRiA12nKUDjrP5X++ds9tjIi1b9nXpcwKOhwL0prXK5MQiWM
	 K8x4VzOH/6l2u6YCMXB/pfP8udN0qWkq1jNS5h5aSD5oR8SFPgDXtObhKP96RP9bvi
	 L+FNGoFJuBI+w==
Date: Fri, 23 May 2025 14:17:06 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, Bajjuri Praneeth <praneeth@ti.com>, 
 Tony Lindgren <tony@atomide.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Andreas Kemnade <andreas@kemnade.info>, 
 Aaro Koskinen <aaro.koskinen@iki.fi>, linux-arm-kernel@lists.infradead.org, 
 Mark Brown <broonie@kernel.org>, linux-omap@vger.kernel.org, 
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Russell King <linux@armlinux.org.uk>, 
 Liam Girdwood <lgirdwood@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Roger Quadros <rogerq@kernel.org>
To: Kory Maincent <kory.maincent@bootlin.com>
In-Reply-To: <20250523-bbg-v1-0-ef4a9e57eeee@bootlin.com>
References: <20250523-bbg-v1-0-ef4a9e57eeee@bootlin.com>
Message-Id: <174802762814.2701142.18240955701897278423.robh@kernel.org>
Subject: Re: [PATCH 0/2] Add support for BeagleBone Green Eco board


On Fri, 23 May 2025 17:57:41 +0200, Kory Maincent wrote:
> SeeedStudio BeagleBone Green Eco (BBGE) is a clone of the BeagleBone Green
> (BBG). It has minor differences from the BBG, such as a different PMIC,
> a different Ethernet PHY, and a larger eMMC.
> 
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> ---
> Kory Maincent (2):
>       arm: dts: omap: Add support for BeagleBone Green Eco board
>       arm: omap2plus_defconfig: Enable TPS65219 regulator
> 
>  arch/arm/boot/dts/ti/omap/Makefile                 |   1 +
>  arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dts | 170 +++++++++++++++++++++
>  arch/arm/configs/omap2plus_defconfig               |   3 +
>  3 files changed, 174 insertions(+)
> ---
> base-commit: a02c7665c216471413ed5442637a34364221e91c
> change-id: 20250523-bbg-769018d1f2a7
> 
> Best regards,
> --
> Köry Maincent, Bootlin
> Embedded Linux and kernel engineering
> https://bootlin.com
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


This patch series was applied (using b4) to base:
 Base: using specified base-commit a02c7665c216471413ed5442637a34364221e91c

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/ti/' for 20250523-bbg-v1-0-ef4a9e57eeee@bootlin.com:

arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: / (ti,am335x-bone-green-eco): compatible: 'oneOf' conditional failed, one must be fixed:
	['ti,am335x-bone-green-eco', 'ti,am335x-bone-green', 'ti,am335x-bone-black', 'ti,am335x-bone', 'ti,am33xx'] is too long
	'ti,am335x-bone-green-eco' is not one of ['nokia,n800', 'nokia,n810', 'nokia,n810-wimax', 'ti,omap2420-h4']
	'ti,am335x-bone-green-eco' is not one of ['ti,omap2430-sdp']
	'ti,am335x-bone-green-eco' is not one of ['compulab,omap3-cm-t3530', 'logicpd,dm3730-som-lv-devkit', 'logicpd,dm3730-torpedo-devkit', 'nokia,omap3-n900', 'openpandora,omap3-pandora-600mhz', 'ti,omap3430-sdp', 'ti,omap3-beagle', 'ti,omap3-evm', 'ti,omap3-ldp', 'timll,omap3-devkit8000']
	'ti,omap3-beagle-ab4' was expected
	'ti,am335x-bone-green-eco' is not one of ['gumstix,omap3-overo-alto35', 'gumstix,omap3-overo-chestnut43', 'gumstix,omap3-overo-gallop43', 'gumstix,omap3-overo-palo35', 'gumstix,omap3-overo-palo43', 'gumstix,omap3-overo-summit', 'gumstix,omap3-overo-tobi', 'gumstix,omap3-overo-tobiduo']
	'ti,am335x-bone-green-eco' is not one of ['amazon,omap3-echo', 'compulab,omap3-cm-t3730', 'goldelico,gta04', 'lg,omap3-sniper', 'logicpd,dm3730-som-lv-devkit', 'logicpd,dm3730-torpedo-devkit', 'nokia,omap3-n9', 'nokia,omap3-n950', 'openpandora,omap3-pandora-1ghz', 'ti,omap3-beagle-xm', 'ti,omap3-evm-37xx', 'ti,omap3-zoom3']
	'ti,am335x-bone-green-eco' is not one of ['compulab,omap3-sbc-t3517', 'teejet,mt_ventoux', 'ti,am3517-craneboard', 'ti,am3517-evm']
	'ti,am335x-bone-green-eco' is not one of ['compulab,cm-t335', 'moxa,uc-8100-me-t', 'novatech,am335x-lxm', 'ti,am335x-bone', 'ti,am335x-evm', 'ti,am3359-icev2']
	'ti,am335x-bone-green-eco' is not one of ['compulab,sbc-t335']
	'ti,am335x-bone-green-eco' is not one of ['phytec,am335x-wega', 'phytec,am335x-pcm-953', 'phytec,am335x-regor']
	'ti,am335x-bone-green-eco' is not one of ['amazon,omap4-kc1', 'motorola,droid4', 'motorola,droid-bionic', 'motorola,xyboard-mz609', 'motorola,xyboard-mz617', 'ti,omap4-panda', 'ti,omap4-sdp']
	'ti,omap4-panda-a4' was expected
	'gumstix,omap4-duovero-parlor' was expected
	'ti,am335x-bone-green-eco' is not one of ['epson,embt2ws', 'ti,omap4-panda-es']
	'ti,am335x-bone-green-eco' is not one of ['variscite,var-dvk-om44', 'variscite,var-stk-om44']
	'ti,am335x-bone-green-eco' is not one of ['compulab,omap5-cm-t54', 'isee,omap5-igep0050', 'ti,omap5-uevm']
	'ti,omap2420' was expected
	'ti,omap2430' was expected
	'ti,omap3430' was expected
	'ti,omap3-beagle' was expected
	'gumstix,omap3-overo' was expected
	'ti,omap3630' was expected
	'ti,am3517' was expected
	'ti,am33xx' was expected
	'compulab,cm-t335' was expected
	'phytec,am335x-phycore-som' was expected
	'ti,omap4430' was expected
	'ti,omap4-panda' was expected
	'gumstix,omap4-duovero' was expected
	'ti,omap4460' was expected
	'variscite,var-som-om44' was expected
	'ti,omap5' was expected
	'ti,omap2' was expected
	'ti,omap3' was expected
	'ti,am335x-bone-black' is not one of ['ti,omap3430', 'ti,omap3630']
	'ti,omap4' was expected
	from schema $id: http://devicetree.org/schemas/arm/ti/omap.yaml#
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: /: failed to match any schema with compatible: ['ti,am335x-bone-green-eco', 'ti,am335x-bone-green', 'ti,am335x-bone-black', 'ti,am335x-bone', 'ti,am33xx']
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: /: failed to match any schema with compatible: ['ti,am335x-bone-green-eco', 'ti,am335x-bone-green', 'ti,am335x-bone-black', 'ti,am335x-bone', 'ti,am33xx']
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: /: failed to match any schema with compatible: ['ti,am335x-bone-green-eco', 'ti,am335x-bone-green', 'ti,am335x-bone-black', 'ti,am335x-bone', 'ti,am33xx']
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: idle-states: 'mpu_gate' does not match any of the regexes: '^(cpu|cluster)-', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/cpu/idle-states.yaml#
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: /soc: failed to match any schema with compatible: ['ti,omap-infra']
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: ocp (simple-pm-bus): $nodename:0: 'ocp' does not match '^bus(@[0-9a-f]+)?$'
	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: interconnect@44c00000 (ti,am33xx-l4-wkup): $nodename:0: 'interconnect@44c00000' does not match '^bus(@[0-9a-f]+)?$'
	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: /ocp/interconnect@44c00000: failed to match any schema with compatible: ['ti,am33xx-l4-wkup', 'simple-pm-bus']
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
	'clocks' is a required property
	'power-domains' is a required property
	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: segment@0 (simple-pm-bus): $nodename:0: 'segment@0' does not match '^bus(@[0-9a-f]+)?$'
	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: segment@100000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
	'clocks' is a required property
	'power-domains' is a required property
	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: segment@100000 (simple-pm-bus): $nodename:0: 'segment@100000' does not match '^bus(@[0-9a-f]+)?$'
	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: /ocp/interconnect@44c00000/segment@100000/target-module@0/cpu@0: failed to match any schema with compatible: ['ti,am3352-wkup-m3']
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: segment@200000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
	'clocks' is a required property
	'power-domains' is a required property
	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: segment@200000 (simple-pm-bus): $nodename:0: 'segment@200000' does not match '^bus(@[0-9a-f]+)?$'
	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: prcm@0 (ti,am3-prcm): clocks: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: prcm@0 (ti,am3-prcm): clockdomains: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: prcm@0 (ti,am3-prcm): $nodename:0: 'prcm@0' does not match '^([a-z][a-z0-9\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0: failed to match any schema with compatible: ['ti,am3-prcm', 'simple-bus']
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/clocks/clock@490: failed to match any schema with compatible: ['ti,am3-dpll-core-clock']
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/clocks/clock-dpll-core-x2: failed to match any schema with compatible: ['ti,am3-dpll-x2-clock']
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/clocks/clock@488: failed to match any schema with compatible: ['ti,am3-dpll-clock']
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/clocks/clock@494: failed to match any schema with compatible: ['ti,am3-dpll-no-gate-clock']
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/clocks/clock@498: failed to match any schema with compatible: ['ti,am3-dpll-no-gate-clock']
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/clocks/clock@48c: failed to match any schema with compatible: ['ti,am3-dpll-no-gate-j-type-clock']
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/clock@0: failed to match any schema with compatible: ['ti,omap4-cm']
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: clock@0 (ti,omap4-cm): '#clock-cells' is a dependency of 'clock-output-names'
	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/clock@400: failed to match any schema with compatible: ['ti,omap4-cm']
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: clock@400 (ti,omap4-cm): '#clock-cells' is a dependency of 'clock-output-names'
	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/clock@600: failed to match any schema with compatible: ['ti,omap4-cm']
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: clock@600 (ti,omap4-cm): '#clock-cells' is a dependency of 'clock-output-names'
	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/clock@800: failed to match any schema with compatible: ['ti,omap4-cm']
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: clock@800 (ti,omap4-cm): '#clock-cells' is a dependency of 'clock-output-names'
	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/clock@900: failed to match any schema with compatible: ['ti,omap4-cm']
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: clock@900 (ti,omap4-cm): '#clock-cells' is a dependency of 'clock-output-names'
	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/clock@a00: failed to match any schema with compatible: ['ti,omap4-cm']
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: clock@a00 (ti,omap4-cm): '#clock-cells' is a dependency of 'clock-output-names'
	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/prm@c00: failed to match any schema with compatible: ['ti,am3-prm-inst', 'ti,omap-prm-inst']
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/prm@c00: failed to match any schema with compatible: ['ti,am3-prm-inst', 'ti,omap-prm-inst']
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/prm@d00: failed to match any schema with compatible: ['ti,am3-prm-inst', 'ti,omap-prm-inst']
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/prm@d00: failed to match any schema with compatible: ['ti,am3-prm-inst', 'ti,omap-prm-inst']
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/prm@e00: failed to match any schema with compatible: ['ti,am3-prm-inst', 'ti,omap-prm-inst']
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/prm@e00: failed to match any schema with compatible: ['ti,am3-prm-inst', 'ti,omap-prm-inst']
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/prm@f00: failed to match any schema with compatible: ['ti,am3-prm-inst', 'ti,omap-prm-inst']
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/prm@f00: failed to match any schema with compatible: ['ti,am3-prm-inst', 'ti,omap-prm-inst']
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/prm@1000: failed to match any schema with compatible: ['ti,am3-prm-inst', 'ti,omap-prm-inst']
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/prm@1000: failed to match any schema with compatible: ['ti,am3-prm-inst', 'ti,omap-prm-inst']
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/prm@1100: failed to match any schema with compatible: ['ti,am3-prm-inst', 'ti,omap-prm-inst']
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/prm@1100: failed to match any schema with compatible: ['ti,am3-prm-inst', 'ti,omap-prm-inst']
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/prm@1200: failed to match any schema with compatible: ['ti,am3-prm-inst', 'ti,omap-prm-inst']
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/prm@1200: failed to match any schema with compatible: ['ti,am3-prm-inst', 'ti,omap-prm-inst']
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: serial@0 (ti,am3352-uart): compatible: 'oneOf' conditional failed, one must be fixed:
	['ti,am3352-uart', 'ti,omap3-uart'] is too long
	'ti,am3352-uart' is not one of ['ti,am64-uart', 'ti,j721e-uart']
	'ti,am654-uart' was expected
	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: scm@0 (ti,am3-scm): clockdomains: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: scm@0 (ti,am3-scm): $nodename:0: 'scm@0' does not match '^([a-z][a-z0-9\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0: failed to match any schema with compatible: ['ti,am3-scm', 'simple-bus']
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: scm_conf@0 (syscon): clocks: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: scm_conf@0 (syscon): phy-gmii-sel: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: scm_conf@0 (syscon): $nodename:0: 'scm_conf@0' does not match '^([a-z][a-z0-9\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0/control@620: failed to match any schema with compatible: ['ti,am335x-usb-ctrl-module']
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0/dma-router@f90: failed to match any schema with compatible: ['ti,am335x-edma-crossbar']
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@35000/wdt@0: failed to match any schema with compatible: ['ti,omap3-wdt']
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@3e000/rtc@0: failed to match any schema with compatible: ['ti,am3352-rtc', 'ti,da830-rtc']
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@3e000/rtc@0: failed to match any schema with compatible: ['ti,am3352-rtc', 'ti,da830-rtc']
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: interconnect@48000000 (ti,am33xx-l4-per): $nodename:0: 'interconnect@48000000' does not match '^bus(@[0-9a-f]+)?$'
	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: /ocp/interconnect@48000000: failed to match any schema with compatible: ['ti,am33xx-l4-per', 'simple-pm-bus']
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
	'clocks' is a required property
	'power-domains' is a required property
	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: segment@0 (simple-pm-bus): $nodename:0: 'segment@0' does not match '^bus(@[0-9a-f]+)?$'
	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: serial@0 (ti,am3352-uart): compatible: 'oneOf' conditional failed, one must be fixed:
	['ti,am3352-uart', 'ti,omap3-uart'] is too long
	'ti,am3352-uart' is not one of ['ti,am64-uart', 'ti,j721e-uart']
	'ti,am654-uart' was expected
	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: serial@0 (ti,am3352-uart): compatible: 'oneOf' conditional failed, one must be fixed:
	['ti,am3352-uart', 'ti,omap3-uart'] is too long
	'ti,am3352-uart' is not one of ['ti,am64-uart', 'ti,j721e-uart']
	'ti,am654-uart' was expected
	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: /ocp/interconnect@48000000/segment@0/target-module@60000/mmc@0: failed to match any schema with compatible: ['ti,am335-sdhci']
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: segment@100000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
	'clocks' is a required property
	'power-domains' is a required property
	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: segment@100000 (simple-pm-bus): $nodename:0: 'segment@100000' does not match '^bus(@[0-9a-f]+)?$'
	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: serial@0 (ti,am3352-uart): compatible: 'oneOf' conditional failed, one must be fixed:
	['ti,am3352-uart', 'ti,omap3-uart'] is too long
	'ti,am3352-uart' is not one of ['ti,am64-uart', 'ti,j721e-uart']
	'ti,am654-uart' was expected
	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: serial@0 (ti,am3352-uart): compatible: 'oneOf' conditional failed, one must be fixed:
	['ti,am3352-uart', 'ti,omap3-uart'] is too long
	'ti,am3352-uart' is not one of ['ti,am64-uart', 'ti,j721e-uart']
	'ti,am654-uart' was expected
	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: serial@0 (ti,am3352-uart): compatible: 'oneOf' conditional failed, one must be fixed:
	['ti,am3352-uart', 'ti,omap3-uart'] is too long
	'ti,am3352-uart' is not one of ['ti,am64-uart', 'ti,j721e-uart']
	'ti,am654-uart' was expected
	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: /ocp/interconnect@48000000/segment@100000/target-module@d8000/mmc@0: failed to match any schema with compatible: ['ti,am335-sdhci']
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: segment@200000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
	'clocks' is a required property
	'power-domains' is a required property
	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: segment@200000 (simple-pm-bus): $nodename:0: 'segment@200000' does not match '^bus(@[0-9a-f]+)?$'
	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: /ocp/interconnect@48000000/segment@200000/target-module@0/mpu@0: failed to match any schema with compatible: ['ti,omap3-mpu']
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: segment@300000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
	'clocks' is a required property
	'power-domains' is a required property
	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: segment@300000 (simple-pm-bus): $nodename:0: 'segment@300000' does not match '^bus(@[0-9a-f]+)?$'
	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: /ocp/interconnect@48000000/segment@300000/target-module@0/epwmss@0: failed to match any schema with compatible: ['ti,am33xx-pwmss']
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: /ocp/interconnect@48000000/segment@300000/target-module@2000/epwmss@0: failed to match any schema with compatible: ['ti,am33xx-pwmss']
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: /ocp/interconnect@48000000/segment@300000/target-module@4000/epwmss@0: failed to match any schema with compatible: ['ti,am33xx-pwmss']
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: /ocp/interconnect@48000000/segment@300000/target-module@e000/lcdc@0: failed to match any schema with compatible: ['ti,am33xx-tilcdc']
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: interconnect@47c00000 (ti,am33xx-l4-fw): $nodename:0: 'interconnect@47c00000' does not match '^([a-z][a-z0-9\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: /ocp/interconnect@47c00000: failed to match any schema with compatible: ['ti,am33xx-l4-fw', 'simple-bus']
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: segment@0 (simple-bus): $nodename:0: 'segment@0' does not match '^([a-z][a-z0-9\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: interconnect@4a000000 (ti,am33xx-l4-fast): $nodename:0: 'interconnect@4a000000' does not match '^bus(@[0-9a-f]+)?$'
	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: /ocp/interconnect@4a000000: failed to match any schema with compatible: ['ti,am33xx-l4-fast', 'simple-pm-bus']
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
	'clocks' is a required property
	'power-domains' is a required property
	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: segment@0 (simple-pm-bus): $nodename:0: 'segment@0' does not match '^bus(@[0-9a-f]+)?$'
	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: /ocp/interconnect@4a000000/segment@0/target-module@100000/ethernet@0: failed to match any schema with compatible: ['ti,am335x-cpsw', 'ti,cpsw']
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: /ocp/interconnect@4a000000/segment@0/target-module@100000/ethernet@0: failed to match any schema with compatible: ['ti,am335x-cpsw', 'ti,cpsw']
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: interconnect@4b140000 (ti,am33xx-l4-mpuss): $nodename:0: 'interconnect@4b140000' does not match '^([a-z][a-z0-9\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: /ocp/interconnect@4b140000: failed to match any schema with compatible: ['ti,am33xx-l4-mpuss', 'simple-bus']
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: segment@0 (simple-bus): $nodename:0: 'segment@0' does not match '^([a-z][a-z0-9\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: /ocp/interrupt-controller@48200000: failed to match any schema with compatible: ['ti,am33xx-intc']
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: /ocp/target-module@49000000/dma@0: failed to match any schema with compatible: ['ti,edma3-tpcc']
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: /ocp/target-module@49800000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: /ocp/target-module@49900000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: /ocp/target-module@49a00000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: /ocp/target-module@47810000/mmc@0: failed to match any schema with compatible: ['ti,am335-sdhci']
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: /ocp/target-module@47400000/usb-phy@1300: failed to match any schema with compatible: ['ti,am335x-usb-phy']
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: /ocp/target-module@47400000/usb@1400: failed to match any schema with compatible: ['ti,musb-am33xx']
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: usb@1400 (ti,musb-am33xx): {'compatible': ['ti,musb-am33xx'], 'reg': [[5120, 1024], [4096, 512]], 'reg-names': ['mc', 'control'], 'interrupts': [[18]], 'interrupt-names': ['mc'], 'dr_mode': ['peripheral'], 'mentor,multipoint': [1], 'mentor,num-eps': [16], 'mentor,ram-bits': [12], 'mentor,power': [500], 'phys': [[90]], 'dmas': [[91, 0, 0], [91, 1, 0], [91, 2, 0], [91, 3, 0], [91, 4, 0], [91, 5, 0], [91, 6, 0], [91, 7, 0], [91, 8, 0], [91, 9, 0], [91, 10, 0], [91, 11, 0], [91, 12, 0], [91, 13, 0], [91, 14, 0], [91, 0, 1], [91, 1, 1], [91, 2, 1], [91, 3, 1], [91, 4, 1], [91, 5, 1], [91, 6, 1], [91, 7, 1], [91, 8, 1], [91, 9, 1], [91, 10, 1], [91, 11, 1], [91, 12, 1], [91, 13, 1], [91, 14, 1]], 'dma-names': ['rx1', 'rx2', 'rx3', 'rx4', 'rx5', 'rx6', 'rx7', 'rx8', 'rx9', 'rx10', 'rx11', 'rx12', 'rx13', 'rx14', 'rx15', 'tx1', 'tx2', 'tx3', 'tx4', 'tx5', 'tx6', 'tx7', 'tx8', 'tx9', 'tx10', 'tx11', 'tx12', 'tx13', 'tx14', 'tx15'], 'interrup
 ts-extended': [[1, 18]], '$nodename': ['usb@1400']} is valid under each of {'required': ['interrupts-extended']}, {'required': ['interrupts']}
	from schema $id: http://devicetree.org/schemas/interrupts.yaml#
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: /ocp/target-module@47400000/usb-phy@1b00: failed to match any schema with compatible: ['ti,am335x-usb-phy']
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: /ocp/target-module@47400000/usb@1800: failed to match any schema with compatible: ['ti,musb-am33xx']
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: /ocp/target-module@47400000/dma-controller@2000: failed to match any schema with compatible: ['ti,am3359-cppi41']
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: sram@0 (mmio-sram): 'pm-code-sram@0', 'pm-data-sram@1000' do not match any of the regexes: '^([a-z0-9]*-)?sram(-section)?@[a-f0-9]+$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: /ocp/target-module@40300000/sram@0/pm-code-sram@0: failed to match any schema with compatible: ['ti,sram']
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: /ocp/target-module@40300000/sram@0/pm-data-sram@1000: failed to match any schema with compatible: ['ti,sram']
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: /ocp/target-module@4c000000/emif@0: failed to match any schema with compatible: ['ti,emif-am3352']
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: sham@0 (ti,omap4-sham): 'ti,hwmods' is a required property
	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml#
arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: /ocp/target-module@53500000/aes@0: failed to match any schema with compatible: ['ti,omap4-aes']






