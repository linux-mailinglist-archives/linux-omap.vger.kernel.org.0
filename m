Return-Path: <linux-omap+bounces-3984-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04884AEAA85
	for <lists+linux-omap@lfdr.de>; Fri, 27 Jun 2025 01:23:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8170B64027C
	for <lists+linux-omap@lfdr.de>; Thu, 26 Jun 2025 23:22:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8C49223322;
	Thu, 26 Jun 2025 23:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Q9rqQSRh"
X-Original-To: linux-omap@vger.kernel.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD26921FF47;
	Thu, 26 Jun 2025 23:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750980186; cv=none; b=Z8SaWjPafU1TCVFcMWPiW7tlRiB8jexIgrXUKxoxYOSEsWI5dJy0A+0pNWSBGRioBIQGhbqzVHw32HjRynNCNrpbp+fgNmcFciNPB61Qsbb16cU43RdT/la0pf2UmT/cQMZuTkg83k53dkXhxYchMhYh8ZL3TmWO7H6aVUoA4TI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750980186; c=relaxed/simple;
	bh=dM3fad0aYF7xhw5qhluTNSyTBUUZhxy+O6kv065vpZs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=UYu6MI/QrSOpcUQBDhXkfDLOxyW0R8+jPOjCRu+0xnEN77zP9mRwEpyddF/Xa8XgxDMlkFdNLAjqJX8uiKmEXIJP0Sdf9ME5Mb1YLm6vI8bY5G3RCv2aDKUJl7K5oUJKMy/SaNJvlN/tg/RPAf4cGA15j4eKoEYoXbGS2v3UsC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Q9rqQSRh; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55QNMJug2580697;
	Thu, 26 Jun 2025 18:22:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750980139;
	bh=/LQM2y0c1hypruTZ0kUlI64jy128/WyN5WOrBAa7oaU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Q9rqQSRhDPnDsODGwL4CGAzbDJ7RnHulNsnAq1BepY5QqUb7TQCGXWV+YFPW8OE8u
	 SzweOksJp2+vpInqroBecKAIll/JhqJXSpt7OD49WPbqYQq9jT5/XljLK20TkdGi66
	 n5+/eNLZSI2PFOguDirq5pGbntdao2ee5C5vsgI0=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55QNMIun2412991
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 26 Jun 2025 18:22:18 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 26
 Jun 2025 18:22:18 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 26 Jun 2025 18:22:18 -0500
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55QNMINR1805323;
	Thu, 26 Jun 2025 18:22:18 -0500
Message-ID: <e49a3fff-8a50-44aa-aa0c-1ba1bf478eb6@ti.com>
Date: Thu, 26 Jun 2025 18:22:18 -0500
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/5] Add support for BeagleBone Green Eco board
To: Kory Maincent <kory.maincent@bootlin.com>,
        Tony Lindgren
	<tony@atomide.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Aaro Koskinen
	<aaro.koskinen@iki.fi>,
        Andreas Kemnade <andreas@kemnade.info>,
        Kevin Hilman
	<khilman@baylibre.com>,
        Roger Quadros <rogerq@kernel.org>,
        Russell King
	<linux@armlinux.org.uk>,
        Paul Barker <paul.barker@sancloud.com>,
        Marc Murphy
	<marc.murphy@sancloud.com>
CC: Jason Kridner <jkridner@gmail.com>, Andrew Davis <afd@ti.com>,
        Bajjuri
 Praneeth <praneeth@ti.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
	<broonie@kernel.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        <linux-omap@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
        Romain Gantois
	<romain.gantois@bootlin.com>,
        Conor Dooley <conor.dooley@microchip.com>
References: <20250620-bbg-v5-0-84f9b9a2e3a8@bootlin.com>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <20250620-bbg-v5-0-84f9b9a2e3a8@bootlin.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Kory,

On 6/20/25 3:15 AM, Kory Maincent wrote:
> SeeedStudio BeagleBone Green Eco (BBGE) is a clone of the BeagleBone Green
> (BBG). It has minor differences from the BBG, such as a different PMIC,
> a different Ethernet PHY, and a larger eMMC.

Thanks for the patches.
I was testing against next and noticed a kernel paging request error:
https://gist.github.com/jmenti/d861528f98035b07259c29e76e5fae8b

Did you see this by chance?

I will double check that I tested correctly and come back, but was just
curious to see if this is expected.

~ Judith

> 
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> ---
> Changes in v5:
> - Split the patch series. As the cleaning process faced some pushback,
>    I prefer to first get this support accepted and separately work on the
>    devicetree and binding cleaning process.
> - Link to v4: https://lore.kernel.org/r/20250617-bbg-v4-0-827cbd606db6@bootlin.com
> 
> Changes in v4:
> - Drop model value change to avoid conflict with script based on this
>    value like:
>    https://salsa.debian.org/installer-team/flash-kernel/-/blob/master/db/all.db?ref_type=heads
> - Rename ti,am335x-shc to bosch,am335x-shc
> - Forgot to change to "Seeed" in BeagleBone Green Eco model description.
> - Link to v3: https://lore.kernel.org/r/20250613-bbg-v3-0-514cdc768448@bootlin.com
> 
> Changes in v3:
> - Update multi_v7_defconfig with TPS65219 config.
> - Remove extraneous compatible strings.
> - Replace BeagleBone compatible board name vendor to use "beagle" instead
>    of "ti".
> - Link to v2: https://lore.kernel.org/r/20250609-bbg-v2-0-5278026b7498@bootlin.com
> 
> Changes in v2:
> - Add patch 1 to 3 to fix binding and devicetree inconsistencies.
> - Rename tps node name to generic pmic node name in am335x-bone-common.
> - Link to v1: https://lore.kernel.org/r/20250523-bbg-v1-0-ef4a9e57eeee@bootlin.com
> 
> ---
> Kory Maincent (5):
>        arm: dts: omap: am335x-bone-common: Rename tps to generic pmic node
>        dt-bindings: omap: Add Seeed BeagleBone Green Eco
>        arm: dts: omap: Add support for BeagleBone Green Eco board
>        arm: omap2plus_defconfig: Enable TPS65219 regulator
>        arm: multi_v7_defconfig: Enable TPS65219 regulator
> 
>   Documentation/devicetree/bindings/arm/ti/omap.yaml |   1 +
>   arch/arm/boot/dts/ti/omap/Makefile                 |   1 +
>   arch/arm/boot/dts/ti/omap/am335x-bone-common.dtsi  |   2 +-
>   arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dts | 169 +++++++++++++++++++++
>   arch/arm/configs/multi_v7_defconfig                |   3 +
>   arch/arm/configs/omap2plus_defconfig               |   3 +
>   6 files changed, 178 insertions(+), 1 deletion(-)
> ---
> base-commit: e22b9ddaf3afd031abc350c303c7c07a51c569d8
> change-id: 20250523-bbg-769018d1f2a7
> 
> Best regards,
> --
> Köry Maincent, Bootlin
> Embedded Linux and kernel engineering
> https://bootlin.com
> 
> 


