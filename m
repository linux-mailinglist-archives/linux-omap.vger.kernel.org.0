Return-Path: <linux-omap+bounces-3051-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 269B1A07516
	for <lists+linux-omap@lfdr.de>; Thu,  9 Jan 2025 12:50:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 60BB53A796F
	for <lists+linux-omap@lfdr.de>; Thu,  9 Jan 2025 11:50:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBD0A216E30;
	Thu,  9 Jan 2025 11:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="lGhWg8zT"
X-Original-To: linux-omap@vger.kernel.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7861A1FF1BF;
	Thu,  9 Jan 2025 11:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736423413; cv=none; b=qF8Mo32gPoTnZ+Zp8joZ76Toz7I94ujxTXLHWNxoj1V7gpC/JnqTiAd1C64K+xBEuabFTNsCLPDMUgyMtaJijmc2PYGEJeoeF4rOdXyL8Qh4OyfIpALyD8vqcSNWQxF+ghnbIbzw2jvRMWvgx5LuamlZSLNTtw1lIBV/XjcfnYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736423413; c=relaxed/simple;
	bh=nRmbhT3eiEsY8u7OXDBFzc0T4sjK9WyP0gIatVKdbAM=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tmVYZPpPjhBchhyo4cgsCJdN681RYxY4dD/N91oWMkctcvOk67fOgmQ32A7qD22YFdNOOjxiMW+cGemXfSbKuwkKUXuvxLdA4HqEUKZokfH9Fq8ozg/kmepGVqOO2rLHp6jpSx5Lo+hX3A9wNAfqSuDN48vzrUx4CsRVFj3d+t4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=lGhWg8zT; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 509BnwEK3155882
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 9 Jan 2025 05:49:58 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736423398;
	bh=cjlJPdHZfFlnWi9zFpTiPy4i/wlFmKUpofmp/B7kgII=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=lGhWg8zTGMA3RxVhxbjdXCKCKTUWgoiq2kq6TVUfw/I+NMSKnEE27ZSy2j1e+81YF
	 HzOzK/i2xsxpEDD9zXQf96TTA3Oj/RgXSMX9sJHlaQZUr3Z+MVulXwonWjzOgCI7x9
	 YmaJaB3UvRFMuIGnGrSkV7nSFFBGVwjlVqhD3URY=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 509BnwYF041983;
	Thu, 9 Jan 2025 05:49:58 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 9
 Jan 2025 05:49:57 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 9 Jan 2025 05:49:57 -0600
Received: from localhost (uda0492258.dhcp.ti.com [10.24.72.104])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 509BnukD112901;
	Thu, 9 Jan 2025 05:49:57 -0600
Date: Thu, 9 Jan 2025 17:19:55 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Romain Naour <romain.naour@smile.fr>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-omap@vger.kernel.org>, <conor+dt@kernel.org>,
        <krzk+dt@kernel.org>, <robh@kernel.org>, <kristo@kernel.org>,
        <vigneshr@ti.com>, <nm@ti.com>, <afd@ti.com>,
        Romain Naour <romain.naour@skf.com>,
        Siddharth Vadapalli
	<s-vadapalli@ti.com>
Subject: Re: [PATCH v4 2/2] arm64: dts: ti: k3-j721e-beagleboneai64: Enable
 ACSPCIE output for PCIe1
Message-ID: <eu5xmihnffmqas2x2ioleuzzvyfbffl5eqlwuqfe4mh6qa2rzy@7mmuxsbkmz4o>
References: <20250109102627.1366753-1-romain.naour@smile.fr>
 <20250109102627.1366753-2-romain.naour@smile.fr>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250109102627.1366753-2-romain.naour@smile.fr>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On Thu, Jan 09, 2025 at 11:26:27AM +0100, Romain Naour wrote:

Hello Romain,

> From: Romain Naour <romain.naour@skf.com>
> 
> Unlike the SK-TDA4VM (k3-j721e-sk) board, there is no clock generator
> (CDCI6214RGET) on the BeagleBone AI-64 (k3-j721e-beagleboneai64) to
> provide PCIe refclk signal to PCIe Endponts. So the ACSPCIE module must
> provide refclk through PCIe_REFCLK pins.
> 
> Use the new "ti,syscon-acspcie-proxy-ctrl" property to enable ACSPCIE
> module's PAD IO Buffers.
> 
> Cc: Siddharth Vadapalli <s-vadapalli@ti.com>
> Signed-off-by: Romain Naour <romain.naour@skf.com>
> ---
> With this patch, we can remove "HACK: Sierra: Drive clock out" patch
> applied on vendor kernel for BeagleBone AI-64:
> https://openbeagle.org/beagleboard/linux/-/commit/ad65d7ef675966cdbc5d75f2bd545fad1914ba9b

[trimmed]

> diff --git a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
> index af3d730154ac..32a232a90100 100644
> --- a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
> @@ -5,6 +5,7 @@
>   * Copyright (C) 2016-2024 Texas Instruments Incorporated - https://www.ti.com/
>   */
>  #include <dt-bindings/phy/phy.h>
> +#include <dt-bindings/phy/phy-cadence.h>
>  #include <dt-bindings/phy/phy-ti.h>
>  #include <dt-bindings/mux/mux.h>
>  
> @@ -82,6 +83,11 @@ ehrpwm_tbclk: clock-controller@4140 {
>  			reg = <0x4140 0x18>;
>  			#clock-cells = <1>;
>  		};
> +
> +		acspcie0_proxy_ctrl: syscon@18090 {
> +			compatible = "ti,j721e-acspcie-proxy-ctrl", "syscon";
> +			reg = <0x18090 0x4>;

0x_0011_8090 is probably *not* the "PROXY" register i.e. it could be
locked with the help of "CTRLMMR_LOCK0_KICK0" and "CTRLMMR_LOCK0_KICK1"
registers, in which case the CTRL_MMR region needs to be unlocked to write
to that register. On J784S4, that happens to be true, which is why the
proxy register 0x_0011_a090 was used at [0]. Please test with 0x_0011_a090
which is the "PROXY" register on J721E as well, i.e. it can be written to
unconditionally.

[0]:
https://lore.kernel.org/r/20240930111505.3101047-1-s-vadapalli@ti.com/

[trimmed]

Regards,
Siddharth.

