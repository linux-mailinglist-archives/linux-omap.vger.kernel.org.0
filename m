Return-Path: <linux-omap+bounces-2540-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 554A79B6FF9
	for <lists+linux-omap@lfdr.de>; Wed, 30 Oct 2024 23:42:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8562D1C21016
	for <lists+linux-omap@lfdr.de>; Wed, 30 Oct 2024 22:42:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EDCE21730A;
	Wed, 30 Oct 2024 22:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="00GX5QV+"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 472331BD9EB;
	Wed, 30 Oct 2024 22:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730328151; cv=none; b=Ob6WOsJw6jmHCkJ1Ghv3kX0lz6nORb4HUANLeyEkhQ3xDuNdU8g+3tLhYkAvgXnPQqGz6D40uvHlXJXHOXDzxC4lwKRlQKcbENPY3+1AlhiuIEQZ2EZCuUDyLGKki+oTGAAXpfHBIMZvUE2r3b/8i6b9iLxi5KKAeywzZC3WzFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730328151; c=relaxed/simple;
	bh=DT9pXJgvQX5AoW7dMqWsYEaIWt1s6GH3Zy1zRV6DS2o=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Mhm8sbcM+7aiIpUDsUnvi7QGeAHY3vXrayivWNKCcfq4nbLUGBuZxCskf9bKWD5sZjew1IyV1jpuyIn4xXs/qN++bs1rPGQ9edmdcDnxfctnkIaCVSpdHkYRgfQrOL79IqgAVMwIkTEQ9XyQDH1eNkFKJa4N58/42jxmYKXd0o4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=00GX5QV+; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=/W1gnm6AuW6BiVpiHLFOI6HfP0cwzclLuehGNTmJEiQ=; b=00GX5QV+tX1qkKGx+RyXSzKDho
	Kux6Mjn7iGMuDxARmDJm0d5PuUapZC/Fnwq4sQf2idXitSJCTmFVK6aAk/hTOtIfPuJZUHY226XDd
	w4XrFQmvzUM3OTv6QjO+S8R6QF9Rl2QtFsWLbo5aRyfZbvxoQ6hrFnxVO10nCaodXsdcFSaxeIlQ8
	+YLrPqjE6RH4WG1j+dzm7EqT+GO2FUiff2Ewikwp0P8oSgFglSRX4/wGkJ8EQmt8Psmsy+NdTlSf9
	uRXlumfQIe8zGBBmWGo+kJzVtb7V5erNALFp1lg7+1B93TZA8nRljUJxx+8SLqeu56aZnQYqrHMns
	aAeMDHAg==;
Date: Wed, 30 Oct 2024 23:42:19 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Mithil Bavishi <bavishimithil@gmail.com>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, Kevin Hilman
 <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, Tony Lindgren
 <tony@atomide.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 2/6] arm/dts: Add common device tree for Samsung
 Galaxy Tab 2 series
Message-ID: <20241030234219.2d918b34@akair>
In-Reply-To: <20241030211215.347710-3-bavishimithil@gmail.com>
References: <20241030211215.347710-1-bavishimithil@gmail.com>
	<20241030211215.347710-3-bavishimithil@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Mithil,

Am Wed, 30 Oct 2024 21:12:11 +0000
schrieb Mithil Bavishi <bavishimithil@gmail.com>:

> +	twl: twl@48 {
> +		reg = <0x48>;
> +		#clock-cells = <1>;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <
> +			&twl6030_pins
> +			&twl6030_wkup_pins
> +		>;
> +
> +		/* SPI = 0, IRQ# = 7, 4 = active high
> level-sensitive */
> +		interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>; /*
> IRQ_SYS_1N cascaded to gic */
> +		interrupt-parent = <&gic>;
> +		ti,system-power-controller;

this has to be system-power-controller;

And you have it correctly here:
https://gitlab.postmarketos.org/postmarketOS/pmaports/-/blob/master/device/community/linux-postmarketos-omap/0002-arm-dts-Add-common-dtsi-for-espresso.patch?ref_type=heads#L532

so, please double-check if you are trying to mainline the right branch.
No need to respin just for this line. There is still a lot other stuff
to fix here but I want to make sure we are looking at the right thing.

Regards,
Andreas

