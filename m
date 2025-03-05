Return-Path: <linux-omap+bounces-3334-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 439D2A50D16
	for <lists+linux-omap@lfdr.de>; Wed,  5 Mar 2025 22:09:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7C95A188988B
	for <lists+linux-omap@lfdr.de>; Wed,  5 Mar 2025 21:09:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9204B255E54;
	Wed,  5 Mar 2025 21:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="pao3sR1c"
X-Original-To: linux-omap@vger.kernel.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8545D1F8677;
	Wed,  5 Mar 2025 21:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741208984; cv=none; b=D8nGvSaKJCyb+xzq9tNWoOX0kHjLyMs8YOSrprA4LWtvRmu/p0Jr+Enw7uC07Tx4U8c9Wid4Q366p4It4zA2tf3DRIj6OeYkkQaav2Zt/AAPqGiw+ar+34/8/DxgNx1qhO/fkDWG+8V2ECpHKCHxhEZ72kxP44AVUmeNYDo70PE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741208984; c=relaxed/simple;
	bh=CIOoh9WtQkI04ypA5tVH6nPf6xdhdtwwPiodz3WceXs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=o2/E5PC91YPN45su5inKEOftmBJLUR1UPS0xdyscNUO5zBmkRdhrLxxRzdeGkQcQtLsiFyJATYqXxEsTeJgs3JKZEayNHiOve7oLo6j/7po1csM/4nWpXZ9pJ4ntgesieq+iD3mYdAtFYI/lTzlPorwT5aV5FARs08FVJdd6G38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=pao3sR1c; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 525L9EfE3970472
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Mar 2025 15:09:14 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741208954;
	bh=7CSdRozLrdWP+aapX+PEh2rvQZMTRVPuQI777U9QtZE=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=pao3sR1c1YQq57SMzEOcBGrscT5RunKLT+nXQ60TviocfXCKRhOtr8u9f1usqDkms
	 +KO51Y3c54Fpf5HVhnIDhdUYv53d9wJ3UMt3EvWswVUH9qrjZ7M/KgiGAACgd6qvVg
	 K6B7C3Bf7msfOZP30Mo2dSlEsh/X48iTTMkPZ7Zo=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 525L9EXh037326
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 5 Mar 2025 15:09:14 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 5
 Mar 2025 15:09:13 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 5 Mar 2025 15:09:13 -0600
Received: from [128.247.29.251] (dmz007xyy.dhcp.ti.com [128.247.29.251])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 525L9Dd2130862;
	Wed, 5 Mar 2025 15:09:13 -0600
Message-ID: <7f33b5c7-b1a7-4db9-9e19-e30cbb0066ab@ti.com>
Date: Wed, 5 Mar 2025 15:09:13 -0600
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/5] Add TI TPS65214 & TPS65215 PMIC MFD Driver Support
To: Lee Jones <lee@kernel.org>, <broonie@kernel.org>
CC: <m-leonard@ti.com>, <praneeth@ti.com>, <conor+dt@kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <khilman@baylibre.com>, <rogerq@kernel.org>, <lgirdwood@gmail.com>,
        <linux-omap@vger.kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <tony@atomide.com>, <andreas@kemnade.info>, <aaro.koskinen@iki.fi>
References: <20250206173725.386720-1-s-ramamoorthy@ti.com>
 <173928615760.2233464.12306998726512431222.b4-ty@kernel.org>
Content-Language: en-US
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
Organization: PMIC
In-Reply-To: <173928615760.2233464.12306998726512431222.b4-ty@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Lee,


On 2/11/25 9:02 AM, Lee Jones wrote:
> On Thu, 06 Feb 2025 11:37:20 -0600, Shree Ramamoorthy wrote:
>> TPS65214 and TPS65215 are Power Management Integrated Circuits (PMICs) that
>> have significant register map overlap with TPS65219 and each other. The
>> series introduces the 2 new PMICs and restructures the existing driver to
>> support multiple devices.
>>
>> - TPS65214, TPS65215, and TPS65219 each have 3 Buck regulators
>> - TPS65214 has 2 LDOS and 1 GPO, whereas TPS65219 has 4 LDOs and 2 GPOs.
>> - TPS65214's LDO1 maps to TPS65219's LDO3.
>> - A key difference between TPS65215 & TPS65214 are the LDO current and
>>    voltage output ranges and the configurable options available.
>> - TPS65215 has 2 LDOs, whereas TPS65219 has 4 LDOs.
>> - TPS65215's LDO2 maps to TPS65219's LDO3.
>> - TPS65215 has 1 GPO, whereas TPS65219 has 2 GPOs.
>>
>> [...]
> Applied, thanks!
>
> [1/5] regulator: dt-bindings: Add TI TPS65215 PMIC bindings
>        commit: 85e7aef57a9e057545017d55b02073e3c4756b2c
> [2/5] regulator: dt-bindings: Add TI TPS65214 PMIC bindings
>        commit: 34beb3c87cbb8747f521db5cf1b2a608833f3967
> [3/5] mfd: tps65219: Remove regmap_read check
>        commit: 5342c8a9e04fc05f485a3886605b803a5180bd64
> [4/5] mfd: tps65219: Add support for TI TPS65215 PMIC
>        commit: ebcbd21550853b16f307d7da8c846b862e138a98
> [5/5] mfd: tps65219: Add support for TI TPS65214 PMIC
>        commit: c9878d8d9ac2ecfadfa4fa3543730026c66ad843
>
> --
> Lee Jones [李琼斯]

Would you be able to remove this series from your branch & replace it with this v6 [0],
so Mark Brown will be able to apply the dependent regulator series [1]? Thank you!

[0] https://lore.kernel.org/all/20250305210351.249811-1-s-ramamoorthy@ti.com/

[1] https://lore.kernel.org/all/131466cc-dc54-4251-82f7-5ec9e9c20f26@sirena.org.uk/

-- 
Best,
Shree Ramamoorthy
PMIC Software Engineer


