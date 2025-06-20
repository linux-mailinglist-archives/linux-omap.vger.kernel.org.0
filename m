Return-Path: <linux-omap+bounces-3945-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A47AE1E7C
	for <lists+linux-omap@lfdr.de>; Fri, 20 Jun 2025 17:24:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B9E236A10C7
	for <lists+linux-omap@lfdr.de>; Fri, 20 Jun 2025 15:23:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01CBA2C375A;
	Fri, 20 Jun 2025 15:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="fxRU3LEn"
X-Original-To: linux-omap@vger.kernel.org
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D749B8F5B;
	Fri, 20 Jun 2025 15:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750432955; cv=none; b=WSmDKI2CgnLdY67LvrXTx+Cdq4plZAxtTKRgO9TxLITQvkvoRiRJPP777TyWn/c+FIYq6Zw9Gn4eL5QyuiPJ1wRKYLNrFdZWY5ZyiYH+dYBczn27C1A0jEGAfWg+wO/Ti6wkJT/UHMs7/jHEtpZ4RKOcbgb1QtTpl3csZ59R970=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750432955; c=relaxed/simple;
	bh=YoPXOUic11vJF3GRbjfM7M+Cn8Dt3albNubMT928Hb0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Fk/64G17CqHYy0qZVxqmhIMCBdHUGziphAb2xp8rG9eW3OzAi2dTq3IBiLvau+i6fZ2OjlnLT6osn7edHQMJ4Y9gjvO0p60z6Uclc0ENK2txwUSC7rfIIII5rS7nzwoTnRoX7ZfIhHEN5qLxHtpl0bq7VQgo37lN3zcK4t0Qzd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=fxRU3LEn; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55KFM3qG694915;
	Fri, 20 Jun 2025 10:22:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750432923;
	bh=pxplz14NMSwtV/r5FVNyw7ZRY4aQja4bLKODUVK5LkQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=fxRU3LEn+T686BUU8jyQZGQBjG1hmc9U0m3qQc4HoXNFI/jtS6Xahq+wX70fjR7HW
	 h3lJJEm/lFTnqx3zEsZ6DuozqkaXJ8AqVZFhAjM89hqOugzsW0GT0ubk6qYcwHDKjJ
	 lFxQV+XWlLkZJogc+/IHj1EdOnl549a8HNk81tFk=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55KFM3VT2369394
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 20 Jun 2025 10:22:03 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 20
 Jun 2025 10:22:02 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 20 Jun 2025 10:22:02 -0500
Received: from [10.249.32.27] ([10.249.32.27])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55KFM2Ri3405308;
	Fri, 20 Jun 2025 10:22:02 -0500
Message-ID: <bdb6de80-d65e-4f86-8bc0-cc0d127ab8a6@ti.com>
Date: Fri, 20 Jun 2025 10:22:02 -0500
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
 <CAOCHtYjYTfrJ_pNCsQOXX7Hj6A7wBXKdMQYvog-5h-=WLtorhw@mail.gmail.com>
Content-Language: en-US
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
In-Reply-To: <CAOCHtYjYTfrJ_pNCsQOXX7Hj6A7wBXKdMQYvog-5h-=WLtorhw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea


On 6/20/2025 9:52 AM, Robert Nelson wrote:
> On Fri, Jun 20, 2025 at 8:30 AM Robert Nelson <robertcnelson@gmail.com> wrote:
>> On Thu, Jun 19, 2025 at 7:09 PM Shree Ramamoorthy <s-ramamoorthy@ti.com> wrote:
>>> In probe(), devm_kmalloc uses pmic->common_irq_size to allocate an array of
>>> 2 bytes, but pmic->common_irq_size is being used like an array of structs.
>>> The param sent should've been pmic->common_irq_size * sizeof(*irq_data).
>>> This led to an issue with the kmalloc'd buffer being corrupted and EVM boot
>>> issues. The common and device-specific structs are now allocated one at a
>>> time within the loop.
>>>
>>> Fixes: 38c9f98db20a ("regulator: tps65219: Add support for TPS65215 Regulator IRQs")
>>> Reported-by: Dhruva Gole <d-gole@ti.com>
>>> Signed-off-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>
> Sweet!  With 4 PB2's and 2 BeaglePlays... Power on, boot, Power off,
> wait 30 seconds.. (repeat 10 times)
>
> Before:
> 36/60: Bootup to File System
>
> After
> 60/60: Bootup to File System
>
> Tested-by: Robert Nelson <robertcnelson@gmail.com>
>
> SInce i applied directly to rc2, here's my fixup of your patch for
> reference: https://github.com/RobertCNelson/arm64-multiplatform/blob/v6.16.x-arm64-k3/patches/fixes/0001-regulator-tps65219-Fix-devm_kmalloc-size-allocation.patch
>
> For TI, we also need to cherry pick this in v6.12.x-ti, to fix
> BeaglePlay and PB2..
>
> Thanks Everyone!

Awesome! Glad to hear this resolved those boards :) I will backport this to ti-6.12y-cicd as well.

>

