Return-Path: <linux-omap+bounces-3738-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F0049AC2ABD
	for <lists+linux-omap@lfdr.de>; Fri, 23 May 2025 22:15:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0986B3B5088
	for <lists+linux-omap@lfdr.de>; Fri, 23 May 2025 20:14:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5CB11F237E;
	Fri, 23 May 2025 20:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="XjUHdm32"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB1F1F03D8;
	Fri, 23 May 2025 20:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748031304; cv=none; b=KEr+eAWN2KdJpgu9X6Dn0eL+WUIQLj79/+eHjHOkQ26j8LarmEuYJNHZxoQhj2o+qSTgfCUKtJaEVx3lY7XU9qhI330TXYLPgYXNrzrD00vex7Ya8aFcnzYqGO+oB6V7aelsNmx8Ox6TLqTPgvC93UAKGR+Kh2rielEDw+GeQcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748031304; c=relaxed/simple;
	bh=ZzKsQe0lj6WOuUIPmss5hEmhtTxyrfgkMdWlZ1pZ5J8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=repmCJm/J2iJN6Xkd2AohUaGX8dFzfz6TkNf57x/EmL2p/zg2adr09evOi3g+j3XDxysGwHkfunVHrGijaIIyMuPjTZHQiH76Rnn0PRCJkHduDC0SSSavf8VkFEYX/dV5Bz3skocvFuHxqse5eKdys7YFx/0WC05uYIXSFdro3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=XjUHdm32; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=MgDBO0Rfj6StKE9ETlKlxeDYg7F6wFKoUAt1aJj9SlY=; b=XjUHdm32g+dcVpd6SoiNniNl4z
	kqn1xD6s/XYQ0twDkuSY5DUdE24+/kPHm4uJVYjmAasJkaB/UC/7jOBYbAWuh8XTO8zlNMdaksrBd
	vUpxdgL7qhe0sN0jIzSWvfNJhno6pG7YVs/ERs6Dv4seK6y195C/FORaIaIpt9BDN7RnpMnzPpn8n
	oI6NyRNjnZFPa6BHwNLe4+uE78xNXLskEX1PoflkoKlidKnMXCSpLBOq9QkopZz7OAwXYvtgsbj3m
	B5sYuz2/noU/7TIiPxtEUXC8kVLVRVc+t1jaT+BF0BX4aiS3Z+lrhBHd0JbdJaGipf9g2XVzMigAG
	OPnCU+Rg==;
Date: Fri, 23 May 2025 21:43:53 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, Kevin Hilman
 <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, Russell King
 <linux@armlinux.org.uk>, Bajjuri Praneeth <praneeth@ti.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, linux-omap@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] arm: dts: omap: Add support for BeagleBone Green
 Eco board
Message-ID: <20250523214353.6e46574a@akair>
In-Reply-To: <20250523-bbg-v1-1-ef4a9e57eeee@bootlin.com>
References: <20250523-bbg-v1-0-ef4a9e57eeee@bootlin.com>
	<20250523-bbg-v1-1-ef4a9e57eeee@bootlin.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Am Fri, 23 May 2025 17:57:42 +0200
schrieb Kory Maincent <kory.maincent@bootlin.com>:

> SeeedStudio BeagleBone Green Eco (BBGE) is a clone of the BeagleBone Green
> (BBG). It has minor differences from the BBG, such as a different PMIC,
> a different Ethernet PHY, and a larger eMMC.
> 
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> ---
> 
> The pmic binding is currently only in regulator tree. I don't know if it
> should be merged in omap tree or in regulator tree due to that binding
> dependency.

Well, the pull request for omap stuff to soc is already sent, so this
will go into 6.17 probably while the regulator stuff seems to be
scheduled for 6.16. So this issue will solve itself.

> ---
>  arch/arm/boot/dts/ti/omap/Makefile                 |   1 +
>  arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dts | 170 +++++++++++++++++++++
>  2 files changed, 171 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/ti/omap/Makefile b/arch/arm/boot/dts/ti/omap/Makefile
> index 95c68135dd0c..1aef60eef671 100644
> --- a/arch/arm/boot/dts/ti/omap/Makefile
> +++ b/arch/arm/boot/dts/ti/omap/Makefile
> @@ -93,6 +93,7 @@ dtb-$(CONFIG_SOC_AM33XX) += \
>  	am335x-boneblue.dtb \
>  	am335x-bonegreen.dtb \
>  	am335x-bonegreen-wireless.dtb \
> +	am335x-bonegreen-eco.dtb \
>  	am335x-chiliboard.dtb \
>  	am335x-cm-t335.dtb \
>  	am335x-evm.dtb \
> diff --git a/arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dts b/arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dts
> new file mode 100644
> index 000000000000..521f92347bbe
> --- /dev/null
> +++ b/arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dts
> @@ -0,0 +1,170 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2025 Bootlin
> + */
> +/dts-v1/;
> +
> +#include "am33xx.dtsi"
> +#include "am335x-bone-common.dtsi"
> +#include "am335x-bonegreen-common.dtsi"
> +#include <dt-bindings/net/ti-dp83867.h>
> +
> +/ {
> +	model = "TI AM335x BeagleBone Green Eco";
> +	compatible = "ti,am335x-bone-green-eco", "ti,am335x-bone-green",
> +		     "ti,am335x-bone-black", "ti,am335x-bone", "ti,am33xx";
> +
these compatibles should be defined in
Documentation/devicetree/bindings/arm/ti/omap.yaml

But are that much really necessary? At least ti,am335x-bone-black looks
strange in the list, it does not look as it is derived from it.

> +	cpus {
> +		cpu@0 {
> +			cpu0-supply = <&buck1>;
> +		};
> +	};
> +
> +	sys_5v: sys-5v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "sys_5v";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-always-on;
> +	};
> +
> +	v3v3: v3v3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "v3v3";
> +		regulator-always-on;
> +	};
> +};
> +
> +&usb0 {
> +	interrupts-extended = <&intc 18>;
> +	interrupt-names = "mc";
> +};
> +
> +&baseboard_eeprom {
> +	vcc-supply = <&v3v3>;
> +};
> +
> +&i2c0 {
> +	/delete-node/ tps@24;
> +
> +	tps65214: tps@30 {

generic node names please, so pmic@30.
And maybe while you are at it, maybe you can clean up the tps@24 stuff.

Regards,
Andreas

