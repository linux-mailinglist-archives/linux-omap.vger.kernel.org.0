Return-Path: <linux-omap+bounces-3927-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6226EAE1045
	for <lists+linux-omap@lfdr.de>; Fri, 20 Jun 2025 02:15:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 160BF4A1524
	for <lists+linux-omap@lfdr.de>; Fri, 20 Jun 2025 00:15:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B78A186A;
	Fri, 20 Jun 2025 00:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="OnwLyjdc"
X-Original-To: linux-omap@vger.kernel.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7E4EBE;
	Fri, 20 Jun 2025 00:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750378541; cv=none; b=qRwTFr6A1WgCtgd7dfGz16686AIlX/l1MY8bFT9ln10v25kqMecbdQXmqhgNq+z4k+TGvibhgTDGuxuVQhDB9W1NHTHgwUI4RqnZgXmDRtrsoHPJn0+03YiTYTitB39p2ShRS8jvqoJC8kUSk1qEUPXgQ0LXAPXkZZEcv60P5eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750378541; c=relaxed/simple;
	bh=e6PUvRTJSmaqea6lu1amVWDSUsUOK8CDnQiceXZWUeE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=bioPKjDnxOYroWnAoKdOdx21mAQTL5LuEQZJp1cb/IySejC73OuZcE9A7O+o1SNXsiEZZanI1SPIz3ziQA/dffHBAZKP+Btg7XFEr0ciGfxstcbQRf0KnlCM2mYJtu+x4RZJC6YA8gS0fd3hIeXwdrKAyl1RrNegjFGEjN42UIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=OnwLyjdc; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55K0FCCg760724;
	Thu, 19 Jun 2025 19:15:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750378512;
	bh=QukmTRfi9xF8L8Kp5D+iDJT0jTYg0jLPd+qbgDL3Ep8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=OnwLyjdc4RV112HYIsbIb9KDddM31DIf6Goh8OzT7Bmw1JPLszkbAXqn927Xh9Lsa
	 I6uOvO/OuluV2n3g8Vs3q6U+Y+kfLI6UrvUI/CF6SqEH8QN2h/MF4xDOmjqnMfFZY3
	 eCeUoDnX3vNgiTf1KLN+UdFLddMafri+G9wJuTbM=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55K0FCfc162323
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 19 Jun 2025 19:15:12 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 19
 Jun 2025 19:15:11 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 19 Jun 2025 19:15:11 -0500
Received: from [10.249.33.201] ([10.249.33.201])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55K0FBqh2252500;
	Thu, 19 Jun 2025 19:15:11 -0500
Message-ID: <1cee7d78-247b-4ae3-a2d5-f478dac1985b@ti.com>
Date: Thu, 19 Jun 2025 19:15:10 -0500
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "regulator: tps65219: Add TI TPS65214 Regulator
 Support"
To: Robert Nelson <robertcnelson@gmail.com>
CC: Dhruva Gole <d-gole@ti.com>, <lgirdwood@gmail.com>, <broonie@kernel.org>,
        <aaro.koskinen@iki.fi>, <andreas@kemnade.info>, <khilman@baylibre.com>,
        <rogerq@kernel.org>, <tony@atomide.com>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <m-leonard@ti.com>, <praneeth@ti.com>
References: <20250619153526.297398-1-d-gole@ti.com>
 <c04c4bef-2773-41f7-b2e6-ea465cb9f164@ti.com>
 <CAOCHtYhjSnypDcd5iojg_0KM9aBX6QH+0hMfauGccL6MvyLXzg@mail.gmail.com>
Content-Language: en-US
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
In-Reply-To: <CAOCHtYhjSnypDcd5iojg_0KM9aBX6QH+0hMfauGccL6MvyLXzg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Robert,

On 6/19/2025 6:24 PM, Robert Nelson wrote:
> On Thu, Jun 19, 2025 at 2:58 PM Shree Ramamoorthy <s-ramamoorthy@ti.com> wrote:
>> Hi,
>>
>> On 6/19/25 10:35 AM, Dhruva Gole wrote:
>>> This reverts commit f1471bc435afa31c8c0c58551922830dc8f4b06b.
>> I will be sending a patch soon with a fix regarding the devm_kmalloc use in the probe() function.
>> I'll keep looking into these bugs to see if there's anything else to fix.

I submitted a patch that addresses the incorrect kmalloc size occurring
in the regulator probe().

When ya'll have time, could you verify if this patch [0] addresses the
boot failure you're encountering.

Regardless, this is a logic error that should be updated. Thank you for
your time & sorry for the headache this caused!

[0]:
https://lore.kernel.org/all/20250620000924.2636542-1-s-ramamoorthy@ti.com/

>>
>>> This was causing boot regressions [1] on many BeagleBoard platforms
>>> like the AM62x based BeaglePlay and PocketBeagle-2.
>>>
>>> [1] https://gist.github.com/DhruvaG2000/75b7d5ced6c09d508ee0ad5ab1f19707
> This bug is nasty... ugh! My BeaglePlay (am62) just triggered the same
> classic bug on startup.  Seems like it's related to the phase of the
> moon/etc.. Something in the PMIC doesn't like what we are doing with
> the new devices bolted on top..
>
> Here is my boot log with only f1471bc435afa31c8c0c58551922830dc8f4b06b
> reverted https://gist.github.com/RobertCNelson/745bc4f9e219be264722b2093ef03fa8
>
> So there's been 4 patches on "tps65219-regulator.c" :
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/log/drivers/regulator/tps65219-regulator.c?h=v6.16-rc2
>
> f1471bc435afa31c8c0c58551922830dc8f4b06b regulator: tps65219: Add TI
> TPS65214 Regulator Support
> 38c9f98db20a649a1f8454f507608b6aef0c9297 regulator: tps65219: Add
> support for TPS65215 Regulator IRQs
> 3f2e457efdad5af4164f155bd7ac902258a9b1ce regulator: tps65219: Add
> support for TPS65215 regulator resources
> 8c04144e156b49980a786e80c855e41f6c71685c regulator: tps65219: Update
> struct names
>
> Back to retesting the 3 other commits tomorrow!
>
> Fun note... I'm testing 4 PocketBeagle2 's and 2 BeaglePlays,
> depending on the day one board will trigger this bug 80% of the time,
> someday it takes hours to trigger.
>
> Regards,
>

