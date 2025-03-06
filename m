Return-Path: <linux-omap+bounces-3342-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AE427A55A47
	for <lists+linux-omap@lfdr.de>; Thu,  6 Mar 2025 23:59:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC6DF1898999
	for <lists+linux-omap@lfdr.de>; Thu,  6 Mar 2025 22:59:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF63727CB39;
	Thu,  6 Mar 2025 22:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="jIz0dKih"
X-Original-To: linux-omap@vger.kernel.org
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5DF4207DEB;
	Thu,  6 Mar 2025 22:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741301962; cv=none; b=fGXSuYaMO6DO4tN09qYXrYR4Q4SMoA7wX9U6gaO8l9cV80nRM52ITOqLQ1PdxZmbOXNYWtEF918Axf/NuLJCwoQkwh7XjgFGbLoOEhqBUeADmU90oTf2VbQWv2+jwWzeT91BeL/UNh+y2WfxOhw8Is9u2rB32+C+Ps9+zcHCs4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741301962; c=relaxed/simple;
	bh=Jf0MxEB10sflgfsvRkT5hws5jwvyGsK7uJS7JlC8ThM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=JAHg84tfKicWXx3W3nEPiBXqE5WajJlEHG/FfZWKrBKSddC/z2fUKgy4PVgnGTlRwQaiTEIkn0lkZRD2hkdnNoXLsNXsIuyEWuVXJwWdAb/gB6rCOI4RvDeQfHI9LwbnZIqO8Rl2frXBZj3oSfiCrDtT2rdEY4vRRQ3NjpZTPfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=jIz0dKih; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 526Mwn6O3789931
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 6 Mar 2025 16:58:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741301929;
	bh=Ao1UCJvy5o35BF452S6POkKpCsYW0YF06kyYzjy1P9Q=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=jIz0dKihK45sdAhxyua/6cD8mSzTIXdWaHKJwlmosUljXiD+UOcwk3F6vSDtCCU2k
	 dOp2XKKBijaJpChxkTeTh3VKcuXIqQISf93EGpLsCwQDNphB407BDMGhuVTgi6un6c
	 8Nz8IC82ROkXdze5WZKwPGl/Ait/1/pz43PD4W78=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 526Mwn2d039476
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 6 Mar 2025 16:58:49 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 6
 Mar 2025 16:58:49 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 6 Mar 2025 16:58:48 -0600
Received: from [10.247.26.234] (lt5cd3040qtn.dhcp.ti.com [10.247.26.234])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 526MwmfT002376;
	Thu, 6 Mar 2025 16:58:48 -0600
Message-ID: <d4e183c7-4ad6-4454-b854-8f1d64f296fa@ti.com>
Date: Thu, 6 Mar 2025 16:58:48 -0600
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/9] regulator: dt-bindings: Add TI TPS65214 PMIC
 bindings
To: Krzysztof Kozlowski <krzk@kernel.org>, <lgirdwood@gmail.com>,
        <broonie@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <aaro.koskinen@iki.fi>, <andreas@kemnade.info>,
        <khilman@baylibre.com>, <rogerq@kernel.org>, <tony@atomide.com>,
        <lee@kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
CC: <m-leonard@ti.com>, <praneeth@ti.com>
References: <20250305210351.249811-1-s-ramamoorthy@ti.com>
 <20250305210351.249811-3-s-ramamoorthy@ti.com>
 <acea75f2-337e-4125-88d8-fbb07c8bf6c3@kernel.org>
Content-Language: en-US
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
In-Reply-To: <acea75f2-337e-4125-88d8-fbb07c8bf6c3@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi,

On 3/6/2025 1:25 AM, Krzysztof Kozlowski wrote:
> On 05/03/2025 22:03, Shree Ramamoorthy wrote:
>>  
>> @@ -102,7 +106,9 @@ allOf:
>>        properties:
>>          compatible:
>>            contains:
>> -            const: ti,tps65215
>> +            enum:
>> +              - ti,tps65214
>> +              - ti,tps65215
> I do not see improvements and you did not respond to my comment.
>
> Best regards,
> Krzysztof

Sorry for missing the enum fix, I thought I had included that and should've double checked.
Thank you again for reviewing these patches!


