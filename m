Return-Path: <linux-omap+bounces-3829-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D0AAD60DA
	for <lists+linux-omap@lfdr.de>; Wed, 11 Jun 2025 23:14:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5EDF93AA0CA
	for <lists+linux-omap@lfdr.de>; Wed, 11 Jun 2025 21:13:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A090E2BDC2D;
	Wed, 11 Jun 2025 21:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="dE0mmlgJ"
X-Original-To: linux-omap@vger.kernel.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BFF11F7904;
	Wed, 11 Jun 2025 21:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749676434; cv=none; b=JTRVbGis5LmbiABX2DMXa3Isw9jyDPoiHzl9OAM/fiNNYXiXLOjTJUGjyyZXvsmvNziBoYxCZoBhy1ERaGF2VNlCfi6Od87xmdSgY57Jbe4IlpDZFhHSwnOKNhvPsfKGEWQa34n9b8FuIFLCrueKktF+dYek31MU2hFv8pHxJXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749676434; c=relaxed/simple;
	bh=ayf4MxTJT3l5fo3kpVYbW6H4t8k6I/d2JD5oWmRS3lE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=paT1cVKN7Hw5wTZwGhm7Mmk/lyvNVd1IWsJPJZG7XECIU2hPK8ReOkXixZcuyb+bz0rhWzbSs+2yq14ytRQ8e095DFyyS6qzO5E6amPeGc31sw527lnbMD0fcRsNvUEz5JuYsPrhA8lbX83jzF4fHMXugC9hPySHcez/+QxxDwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=dE0mmlgJ; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55BLD7hs1489819;
	Wed, 11 Jun 2025 16:13:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1749676387;
	bh=P+Ei0nVTdPkuikDxd53VFZwYxoc432vn+t6Xh2VDjE0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=dE0mmlgJbKsvhfBls2pR1EbemC7uEJZuES1EahQoc8L6WSOnP8d1R9evWoC6GzdP3
	 oeZpSbqnZmO5dq24iQEK0m9FEziQiySjMvgU0x0naAIIDm3umuYzmD6IUgybyolKJc
	 hG6C/5SmGkOAHrNVcr2M3+Jm9jQXsDOCg+Hx05JM=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55BLD7Iq1414936
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 11 Jun 2025 16:13:07 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 11
 Jun 2025 16:13:06 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 11 Jun 2025 16:13:06 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55BLD55v923069;
	Wed, 11 Jun 2025 16:13:06 -0500
Message-ID: <1d87fa3b-c3b9-44fd-9e61-7f1ffadcfb0c@ti.com>
Date: Wed, 11 Jun 2025 16:13:05 -0500
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] arm: omap2plus_defconfig: Enable TPS65219
 regulator
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
	<linux@armlinux.org.uk>
CC: Bajjuri Praneeth <praneeth@ti.com>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Thomas Petazzoni
	<thomas.petazzoni@bootlin.com>,
        <linux-omap@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20250609-bbg-v2-0-5278026b7498@bootlin.com>
 <20250609-bbg-v2-5-5278026b7498@bootlin.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250609-bbg-v2-5-5278026b7498@bootlin.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 6/9/25 10:43 AM, Kory Maincent wrote:
> Enable the TPS65219 regulator in the defconfig, as the TPS65214
> variant is used by the newly introduced BeagleBoard Green Eco board.
> 
> Reviewed-by: Andreas Kemnade <andreas@kemnade.info>
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> ---
>   arch/arm/configs/omap2plus_defconfig | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm/configs/omap2plus_defconfig b/arch/arm/configs/omap2plus_defconfig
> index 9f9780c8e62a..2ad669f7b202 100644
> --- a/arch/arm/configs/omap2plus_defconfig
> +++ b/arch/arm/configs/omap2plus_defconfig

Why omap2plus_defconfig? OMAP3 and newer are all ARMv7 and
boards with those can/should use multi_v7_defconfig.

OMAP1 and OMAP2 are the only devices that cannot use multi_v7_defconfig
as they are not ARMv7. So I'd almost recommend we rename
omap2plus_defconfig to just omap2_defconfig to avoid more confusion.
Then we would have:

OMAP1:  ARMv4/5: omap1_defconfig
OMAP2:  ARMv6:   omap2_defconfig
OMAP3+: ARMv7:   multi_v7_defconfig

Any issue with that I'm missing?

Andrew

> @@ -385,6 +385,7 @@ CONFIG_TOUCHSCREEN_TSC2007=m
>   CONFIG_INPUT_MISC=y
>   CONFIG_INPUT_CPCAP_PWRBUTTON=m
>   CONFIG_INPUT_TPS65218_PWRBUTTON=m
> +CONFIG_INPUT_TPS65219_PWRBUTTON=m
>   CONFIG_INPUT_TWL4030_PWRBUTTON=m
>   CONFIG_INPUT_UINPUT=m
>   CONFIG_INPUT_PALMAS_PWRBUTTON=m
> @@ -454,6 +455,7 @@ CONFIG_MFD_TPS65217=y
>   CONFIG_MFD_TI_LP873X=y
>   CONFIG_MFD_TI_LP87565=y
>   CONFIG_MFD_TPS65218=y
> +CONFIG_MFD_TPS65219=y
>   CONFIG_MFD_TPS65910=y
>   CONFIG_TWL6040_CORE=y
>   CONFIG_REGULATOR_CPCAP=y
> @@ -470,6 +472,7 @@ CONFIG_REGULATOR_TPS65023=y
>   CONFIG_REGULATOR_TPS6507X=y
>   CONFIG_REGULATOR_TPS65217=y
>   CONFIG_REGULATOR_TPS65218=y
> +CONFIG_REGULATOR_TPS65219=y
>   CONFIG_REGULATOR_TPS65910=y
>   CONFIG_REGULATOR_TWL4030=y
>   CONFIG_RC_CORE=m
> 

