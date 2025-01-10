Return-Path: <linux-omap+bounces-3075-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F12CA089A4
	for <lists+linux-omap@lfdr.de>; Fri, 10 Jan 2025 09:16:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9A1C7168DB5
	for <lists+linux-omap@lfdr.de>; Fri, 10 Jan 2025 08:16:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF4B5207A2B;
	Fri, 10 Jan 2025 08:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="GGUkiL3m"
X-Original-To: linux-omap@vger.kernel.org
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA18257D;
	Fri, 10 Jan 2025 08:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736496962; cv=none; b=IkJcCF8c0FG7PrKOuC5eouFM8vhIfP6A16W9tfWoasUREdKq3dUC7J5+DoQbIK8nQnXxjuW7u51xxXqbWth7Db+ZG3fCJBqOGRGYpfFth4hh3p8aRn7HImMZMTOwu6v+SelyChZdScvrxRHzXP51w3WQ+mqsB3LZxxBNc425hCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736496962; c=relaxed/simple;
	bh=GHdmJza7OGRMere4DeQbKiImIAOXz9GQNUwhg1aoNOk=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OBd4ivqVG0XQaK1c1mMIYdkk99BjoU+VDJOv6Bc50cNhoiNDmBNGhxpySXtQ5EDpKPabzrUbwUUqwPNleGmUCywY0Qi4Fp3oDKDYavW75PNbgCURvntWuR+ITKUqGtS3qPRnCwp4xQhXNNZzGMQqldXcbZTnr91u5vouSnvqTaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=GGUkiL3m; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50A8FgJ03388909
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Jan 2025 02:15:42 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736496942;
	bh=F6cUrTX5Q8/qLyjIBBgLzoKHKRO/z/Z5bORJ6yC/hEU=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=GGUkiL3mLBFk2uBzUGEGk5QbpuoVLy4rs4PMwPIIr6GiNKrnIrTQlMj7M0F572fcI
	 YCnHo92ahTF6r/h899tTjkuCQ/nKLusQYy1s+lgs3GsMTrpFF/A1NaTn4k5pIjHBvf
	 oOAO5dYUa5m9u6vRH8JysaaYOaE3vLtd8g+htCrE=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50A8FgRk015538
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 10 Jan 2025 02:15:42 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 10
 Jan 2025 02:15:42 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 10 Jan 2025 02:15:42 -0600
Received: from localhost (uda0492258.dhcp.ti.com [10.24.72.104])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50A8Ff7O043640;
	Fri, 10 Jan 2025 02:15:41 -0600
Date: Fri, 10 Jan 2025 13:45:40 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Romain Naour <romain.naour@smile.fr>
CC: Siddharth Vadapalli <s-vadapalli@ti.com>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-omap@vger.kernel.org>,
        <conor+dt@kernel.org>, <krzk+dt@kernel.org>, <robh@kernel.org>,
        <kristo@kernel.org>, <vigneshr@ti.com>, <nm@ti.com>, <afd@ti.com>,
        Romain
 Naour <romain.naour@skf.com>
Subject: Re: [PATCH v4 2/2] arm64: dts: ti: k3-j721e-beagleboneai64: Enable
 ACSPCIE output for PCIe1
Message-ID: <begojbvvrpyjfr3pye7mqwiw73ucw5ynepdfujssr4jx4vs33a@pwahnph3qesl>
References: <20250109102627.1366753-1-romain.naour@smile.fr>
 <20250109102627.1366753-2-romain.naour@smile.fr>
 <eu5xmihnffmqas2x2ioleuzzvyfbffl5eqlwuqfe4mh6qa2rzy@7mmuxsbkmz4o>
 <8ff7ca4f-227d-40c5-867d-497e03bef72a@smile.fr>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8ff7ca4f-227d-40c5-867d-497e03bef72a@smile.fr>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On Thu, Jan 09, 2025 at 02:51:23PM +0100, Romain Naour wrote:
> Hello Siddharth, All,

Hello Romain,

> 
> Le 09/01/2025 à 12:49, Siddharth Vadapalli a écrit :
> > On Thu, Jan 09, 2025 at 11:26:27AM +0100, Romain Naour wrote:
> > 
> > Hello Romain,
> > 
> >> From: Romain Naour <romain.naour@skf.com>
> >>
> >> Unlike the SK-TDA4VM (k3-j721e-sk) board, there is no clock generator
> >> (CDCI6214RGET) on the BeagleBone AI-64 (k3-j721e-beagleboneai64) to
> >> provide PCIe refclk signal to PCIe Endponts. So the ACSPCIE module must
> >> provide refclk through PCIe_REFCLK pins.
> >>
> >> Use the new "ti,syscon-acspcie-proxy-ctrl" property to enable ACSPCIE
> >> module's PAD IO Buffers.
> >>
> >> Cc: Siddharth Vadapalli <s-vadapalli@ti.com>
> >> Signed-off-by: Romain Naour <romain.naour@skf.com>
> >> ---
> >> With this patch, we can remove "HACK: Sierra: Drive clock out" patch
> >> applied on vendor kernel for BeagleBone AI-64:
> >> https://openbeagle.org/beagleboard/linux/-/commit/ad65d7ef675966cdbc5d75f2bd545fad1914ba9b
> > 
> > [trimmed]
> > 
> >> diff --git a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
> >> index af3d730154ac..32a232a90100 100644
> >> --- a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
> >> +++ b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
> >> @@ -5,6 +5,7 @@
> >>   * Copyright (C) 2016-2024 Texas Instruments Incorporated - https://www.ti.com/
> >>   */
> >>  #include <dt-bindings/phy/phy.h>
> >> +#include <dt-bindings/phy/phy-cadence.h>
> >>  #include <dt-bindings/phy/phy-ti.h>
> >>  #include <dt-bindings/mux/mux.h>
> >>  
> >> @@ -82,6 +83,11 @@ ehrpwm_tbclk: clock-controller@4140 {
> >>  			reg = <0x4140 0x18>;
> >>  			#clock-cells = <1>;
> >>  		};
> >> +
> >> +		acspcie0_proxy_ctrl: syscon@18090 {
> >> +			compatible = "ti,j721e-acspcie-proxy-ctrl", "syscon";
> >> +			reg = <0x18090 0x4>;
> > 
> > 0x_0011_8090 is probably *not* the "PROXY" register i.e. it could be
> > locked with the help of "CTRLMMR_LOCK0_KICK0" and "CTRLMMR_LOCK0_KICK1"
> > registers, in which case the CTRL_MMR region needs to be unlocked to write
> > to that register. On J784S4, that happens to be true, which is why the
> > proxy register 0x_0011_a090 was used at [0]. Please test with 0x_0011_a090
> > which is the "PROXY" register on J721E as well, i.e. it can be written to
> > unconditionally.
> > 
> > [0]:
> > https://lore.kernel.org/r/20240930111505.3101047-1-s-vadapalli@ti.com/
> 
> Thanks for the review!
> 
> Actually the Proxy0 vs Proxy1 choice is not really clear for me. We have two
> proxy to reach the same register:
> 
>   CTRLMMR_ACSPCIE0_CTRL Register (Proxy0 Offset = 18090h; Proxy1 Offset = 1A090h)
> 
> From my testing both addresses works (maybe since my SoC is a general purpose one).
> 
> When and why Proxy1 must be used?

Yes, both Proxy0 and Proxy1 work, but Proxy0 is the default access path
when we look at it in the context of J784S4. On J784S4, instead of
calling out Proxy0, the register is called ACSPCIE0_CTRL when it falls
in the Proxy0 range, while it is called ACSPCIE0_PROXY_CTRL when it
falls in the Proxy1 range. Therefore, from the perspective of the naming
convention followed on J784S4 for which a compatible was first introduced,
Proxy1 address would correspond to the ACSPCIE0_PROXY_CTRL register.

> 
> Otherwise I'm fine to use  0x_0011_a090.
> 
> Best regards,
> Romain

Regards,
Siddharth.

