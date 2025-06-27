Return-Path: <linux-omap+bounces-3989-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A8BD6AEC246
	for <lists+linux-omap@lfdr.de>; Fri, 27 Jun 2025 23:47:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF55D1C46705
	for <lists+linux-omap@lfdr.de>; Fri, 27 Jun 2025 21:47:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EEF028A725;
	Fri, 27 Jun 2025 21:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="fh2/IP5s"
X-Original-To: linux-omap@vger.kernel.org
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C191FBCB5;
	Fri, 27 Jun 2025 21:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751060805; cv=none; b=WmJtuJibPafhJUFMvQJRaYmb/GlByD+znMfQp56T4+u/rbrb8RgooXZV9L0I/GU9edTcMDTHMAPUfh42WXxeJvQQtOri3DwxOOsYwl7+h48805IBxQLEiq5pFuB5LxT4esOjM0kGpR9V9m2BNIDPTH6cDixpWHuqu+AKxs1opAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751060805; c=relaxed/simple;
	bh=MjnAslqJJMl32jVN4ZvTbGfDWSSZ3EjKaYsG3TsFGR4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=lgHAdthV1L7IUyGY5ViBzXWM5tLEegJ5sk0DTjcJpG/gezARoC4igwbaoczKJf+0g7hYlHVRelbNkCo0K84LNEbpTFatACk9T+MOwmHHIjQgVOAQrd8E9O7lJhZRHSjS50RYrzztBvMcsbOQQHpe8fdb55r6QPRyPIrDvoUd2ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=fh2/IP5s; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55RLjxNJ2516423;
	Fri, 27 Jun 2025 16:45:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751060759;
	bh=I87Av/MwXWoM8xzWi/f8xlGiaslW/Qp2/zw+nq+E/Yc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=fh2/IP5sT0iO0Fdz0SLIWRGWUqjsQ5p6QI03ou4g3cjTPnc9ZQRUidtxGED9Y4yOF
	 pWhx1EoTftKw2bxS7O+hRSColqRh+vELSsaYs3wOWp4TQGjBMJG5V6vU9NMS+QJh6/
	 DrwQiBJfpd5DMgyg2ZOASUgiQ9uiek6MaWPhL0UI=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55RLjw3G750176
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 27 Jun 2025 16:45:59 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 27
 Jun 2025 16:45:58 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 27 Jun 2025 16:45:58 -0500
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55RLjwh93486775;
	Fri, 27 Jun 2025 16:45:58 -0500
Message-ID: <a754b9e8-dc89-4188-bd2f-18c29c299fb7@ti.com>
Date: Fri, 27 Jun 2025 16:45:58 -0500
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/5] Add support for BeagleBone Green Eco board
To: Robert Nelson <robertcnelson@gmail.com>
CC: Kory Maincent <kory.maincent@bootlin.com>,
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
	<marc.murphy@sancloud.com>,
        Jason Kridner <jkridner@gmail.com>, Andrew Davis
	<afd@ti.com>,
        Bajjuri Praneeth <praneeth@ti.com>,
        Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Thomas Petazzoni
	<thomas.petazzoni@bootlin.com>,
        <linux-omap@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        Thomas Bonnefille
	<thomas.bonnefille@bootlin.com>,
        Romain Gantois <romain.gantois@bootlin.com>,
        Conor Dooley <conor.dooley@microchip.com>
References: <20250620-bbg-v5-0-84f9b9a2e3a8@bootlin.com>
 <e49a3fff-8a50-44aa-aa0c-1ba1bf478eb6@ti.com>
 <CAOCHtYgNfnAK43GBTdN675dFSHrbTJfy_2GbRE88E-0keoChrg@mail.gmail.com>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <CAOCHtYgNfnAK43GBTdN675dFSHrbTJfy_2GbRE88E-0keoChrg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Robert

On 6/26/25 7:03 PM, Robert Nelson wrote:
> On Thu, Jun 26, 2025 at 6:23 PM Judith Mendez <jm@ti.com> wrote:
>>
>> Hi Kory,
>>
>> On 6/20/25 3:15 AM, Kory Maincent wrote:
>>> SeeedStudio BeagleBone Green Eco (BBGE) is a clone of the BeagleBone Green
>>> (BBG). It has minor differences from the BBG, such as a different PMIC,
>>> a different Ethernet PHY, and a larger eMMC.
>>
>> Thanks for the patches.
>> I was testing against next and noticed a kernel paging request error:
>> https://gist.github.com/jmenti/d861528f98035b07259c29e76e5fae8b
>>
>> Did you see this by chance?
>>
>> I will double check that I tested correctly and come back, but was just
>> curious to see if this is expected.
> 
> The tps65219-regulator.c has a bug, make sure with this board you also
> have: https://patchew.org/linux/20250620154541.2713036-1-s-ramamoorthy@ti.com/


Thanks! I don't see the issue anymore! (:

~ Judith


