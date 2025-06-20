Return-Path: <linux-omap+bounces-3944-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D742AE1E58
	for <lists+linux-omap@lfdr.de>; Fri, 20 Jun 2025 17:19:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D95095A77E6
	for <lists+linux-omap@lfdr.de>; Fri, 20 Jun 2025 15:19:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F22E32BFC60;
	Fri, 20 Jun 2025 15:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="sj6aKunY"
X-Original-To: linux-omap@vger.kernel.org
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 920BD1CAA6D;
	Fri, 20 Jun 2025 15:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750432769; cv=none; b=O7liH9ol7XpikNotJtY3M2HVzlMfoMmaFgio/ulxn8zRCvdL/xIMO0/ZW5XHg5Ppd9rL4ACSYwonQMrIY7o0fkkDfuOMtcFzTTwuPcsKrcWd7cBeYYjSNTPvvlmXK9COwQmCJkCN8rfodk+uwF2rCpanpFCc+EpO7wokCoFvPus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750432769; c=relaxed/simple;
	bh=D+NBxxS/s7lAkhzv5kblgQFQ0K3/wljS6mGdAQtA3R8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=UDMyegvKHTRpX+LpawwiUNoZ3Mstl/yFunk5mpif1+liLmmRxTycx2ibYRtY8OMC7hvC/bAYuQMsz+Uw/Z0vMCzwo4dEsc5ycwtbarQl4Q6CGLajcMOREZv1q4mjvP/uzD1+4WUordkwPxEQTufwHslEsS3qzl8r5fQk+5PIPTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=sj6aKunY; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55KFJEa6694542;
	Fri, 20 Jun 2025 10:19:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750432754;
	bh=cmNHTwVBLJviuFOTOh0wl60eo4uFjud5nAeWBEfxhVA=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=sj6aKunYigUauKJDygtl1MeGQJ4aB0kaAb0DxzJY5KPtfQcsT5yuyfdMLZx6mj8oA
	 UFHeUS5p1j2Mk+0yd5526GP6oOOSnRRtg77UWB4YhT8/tE3lfh6q2naootGnGye/uj
	 TUrP4EmIwMVQEpeUfCsIfVN5XhexOFSCtqYEbosw=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55KFJD9i1886801
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 20 Jun 2025 10:19:13 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 20
 Jun 2025 10:19:13 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 20 Jun 2025 10:19:13 -0500
Received: from [10.249.32.27] ([10.249.32.27])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55KFJCAI3401552;
	Fri, 20 Jun 2025 10:19:12 -0500
Message-ID: <c517f657-ec34-4878-9b09-31c48134347e@ti.com>
Date: Fri, 20 Jun 2025 10:19:12 -0500
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] regulator: tps65219: Fix devm_kmalloc size allocation
To: Robert Nelson <robertcnelson@gmail.com>
CC: <aaro.koskinen@iki.fi>, <andreas@kemnade.info>, <khilman@baylibre.com>,
        <rogerq@kernel.org>, <tony@atomide.com>, <lee@kernel.org>,
        <d-gole@ti.com>, <jkridner@gmail.com>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <m-leonard@ti.com>, <praneeth@ti.com>,
        <afd@ti.com>
References: <20250620000924.2636542-1-s-ramamoorthy@ti.com>
 <CAOCHtYgweLhO4nNhNLtJ-_25guqER7ohDf7TNy8WNFwo898wPw@mail.gmail.com>
Content-Language: en-US
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
In-Reply-To: <CAOCHtYgweLhO4nNhNLtJ-_25guqER7ohDf7TNy8WNFwo898wPw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Robert,

On 6/20/2025 8:30 AM, Robert Nelson wrote:
> On Thu, Jun 19, 2025 at 7:09 PM Shree Ramamoorthy <s-ramamoorthy@ti.com> wrote:
>> In probe(), devm_kmalloc uses pmic->common_irq_size to allocate an array of
>> 2 bytes, but pmic->common_irq_size is being used like an array of structs.
>> The param sent should've been pmic->common_irq_size * sizeof(*irq_data).
>> This led to an issue with the kmalloc'd buffer being corrupted and EVM boot
>> issues. The common and device-specific structs are now allocated one at a
>> time within the loop.
>>
>> Fixes: 38c9f98db20a ("regulator: tps65219: Add support for TPS65215 Regulator IRQs")
>> Reported-by: Dhruva Gole <d-gole@ti.com>
>> Signed-off-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>
> Thanks Shree!  Starting testing on PB2/BeaglePlay's..
>
>
>> base-commit: 5c8013ae2e86ec36b07500ba4cacb14ab4d6f728
>> prerequisite-patch-id: cd76c901948780de20e932cf620806959e2177b1
>> prerequisite-patch-id: e847098a38d07e5ff31e8c80d86d9702d132fdad
>> prerequisite-patch-id: e6a01f111e527c6da442f6756f8daa4e79d0fa3c
> ps, worked around these 3 missing in v6.16-rc2, which git tree do you
> have them staged?

I have them staged in master, but those 3 commits (see links below) snuck in. 
I'll rebase this commit on a new branch & remove those for v2.
https://lore.kernel.org/all/aB3hiEM0CB8m_X8m@stanley.mountain/
https://lore.kernel.org/all/175034639178.919047.12885250485072078236.b4-ty@kernel.org/

>
> Regards,
>

