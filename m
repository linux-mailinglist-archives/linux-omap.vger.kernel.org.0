Return-Path: <linux-omap+bounces-3341-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB7DA55A40
	for <lists+linux-omap@lfdr.de>; Thu,  6 Mar 2025 23:57:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4FEAF3ADC5A
	for <lists+linux-omap@lfdr.de>; Thu,  6 Mar 2025 22:57:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F73B27CB33;
	Thu,  6 Mar 2025 22:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="eK/2Vjt4"
X-Original-To: linux-omap@vger.kernel.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2172E206F22;
	Thu,  6 Mar 2025 22:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741301837; cv=none; b=N78yKz8dkJyq5dQdBlKY8OC6iZGr17D+mQlOoUkGu9RwBV5ByJQ++j0ggxj0JSQgTwS+03n6ZLPG3MaiAQgBSQX81T5Q1j3Ct0TNMRgIEQGhpdRDPG4c166gyBZnD3oXmgdMjLk2RNwyRbuKp1nSYHU4FiM3vYCCJjZ0uevooRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741301837; c=relaxed/simple;
	bh=S+6FO9HIm+is6xlTUsl3PW1047Cte8SauuoCrskzDq8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=e+8qzSFblNYRT9aALQ1B0oVTaGgeKqKJX89SyWoI1CCtHrLjw2XCc1Weru3FjyaN67tBpYEEgCRdT/MrImwLwSuppSyYaB5xPphk8cysiaCh/WExkGtdCmlZgPtGloWGWEfkV7he2bRPq/mnlCpDMQnw096JatOZyHC3yZfWYoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=eK/2Vjt4; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 526Muve6088276
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 6 Mar 2025 16:56:57 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741301817;
	bh=bYwYTAQz3+wTUvn8VajZxAuhwOkXkPbWMk9F6b/kN40=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=eK/2Vjt4gR+V/nSonmyaHFI0HEDI1shBhipQegw2PhaC91ypL7qVhstLor+0DpfBW
	 //4qgsyMRzqTafBabIkM4nadb+qxlJ6w+wPSe4I1x24lOOc8pOWHC28lTpQOB/Fhr2
	 x476mBI1kequnrp+eAoTGOV8YFX/sCogs5ADcEN8=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 526Muv00116311;
	Thu, 6 Mar 2025 16:56:57 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 6
 Mar 2025 16:56:56 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 6 Mar 2025 16:56:56 -0600
Received: from [10.247.26.234] (lt5cd3040qtn.dhcp.ti.com [10.247.26.234])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 526MuuOB130990;
	Thu, 6 Mar 2025 16:56:56 -0600
Message-ID: <c0f28cb1-d2a8-4583-937d-4908e4b70b4a@ti.com>
Date: Thu, 6 Mar 2025 16:56:56 -0600
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/5] Add TI TPS65214 & TPS65215 PMIC MFD Driver Support
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <m-leonard@ti.com>, <praneeth@ti.com>, <conor+dt@kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <khilman@baylibre.com>, <rogerq@kernel.org>, <lgirdwood@gmail.com>,
        <linux-omap@vger.kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <tony@atomide.com>, <andreas@kemnade.info>, <aaro.koskinen@iki.fi>,
        <broonie@kernel.org>, Lee Jones <lee@kernel.org>
References: <20250206173725.386720-1-s-ramamoorthy@ti.com>
 <173928615760.2233464.12306998726512431222.b4-ty@kernel.org>
 <7f33b5c7-b1a7-4db9-9e19-e30cbb0066ab@ti.com>
 <471cdd13-3250-46b1-b7a0-a4f236a47773@kernel.org>
Content-Language: en-US
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
In-Reply-To: <471cdd13-3250-46b1-b7a0-a4f236a47773@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi,

On 3/6/2025 1:26 AM, Krzysztof Kozlowski wrote:
> On 05/03/2025 22:09, Shree Ramamoorthy wrote:
>> Hi Lee,
>>
>>
>> On 2/11/25 9:02 AM, Lee Jones wrote:
>>> On Thu, 06 Feb 2025 11:37:20 -0600, Shree Ramamoorthy wrote:
>>>> TPS65214 and TPS65215 are Power Management Integrated Circuits (PMICs) that
>>>> have significant register map overlap with TPS65219 and each other. The
>>>> series introduces the 2 new PMICs and restructures the existing driver to
>>>> support multiple devices.
>>>>
>>>> - TPS65214, TPS65215, and TPS65219 each have 3 Buck regulators
>>>> - TPS65214 has 2 LDOS and 1 GPO, whereas TPS65219 has 4 LDOs and 2 GPOs.
>>>> - TPS65214's LDO1 maps to TPS65219's LDO3.
>>>> - A key difference between TPS65215 & TPS65214 are the LDO current and
>>>>    voltage output ranges and the configurable options available.
>>>> - TPS65215 has 2 LDOs, whereas TPS65219 has 4 LDOs.
>>>> - TPS65215's LDO2 maps to TPS65219's LDO3.
>>>> - TPS65215 has 1 GPO, whereas TPS65219 has 2 GPOs.
>>>>
>>>> [...]
>>> Applied, thanks!
>>>
>>> [1/5] regulator: dt-bindings: Add TI TPS65215 PMIC bindings
>>>        commit: 85e7aef57a9e057545017d55b02073e3c4756b2c
>>> [2/5] regulator: dt-bindings: Add TI TPS65214 PMIC bindings
>>>        commit: 34beb3c87cbb8747f521db5cf1b2a608833f3967
>>> [3/5] mfd: tps65219: Remove regmap_read check
>>>        commit: 5342c8a9e04fc05f485a3886605b803a5180bd64
>>> [4/5] mfd: tps65219: Add support for TI TPS65215 PMIC
>>>        commit: ebcbd21550853b16f307d7da8c846b862e138a98
>>> [5/5] mfd: tps65219: Add support for TI TPS65214 PMIC
>>>        commit: c9878d8d9ac2ecfadfa4fa3543730026c66ad843
>>>
>>> --
>>> Lee Jones [李琼斯]
>> Would you be able to remove this series from your branch & replace it with this v6 [0],
>> so Mark Brown will be able to apply the dependent regulator series [1]? Thank you!
> You replied 3 weeks later. If something was applied not as it should,
> you ought to reply IMMEDIATELY, not 3 weeks after.
>
> The trees are mostly immutable after publishing.
>
> Best regards,
> Krzysztof

Completely understand, sorry for re-sending the first 5 patches that were already applied!
I'll wait for the next merge window, so there won't be dependencies between the MFD and regulator tree then.


