Return-Path: <linux-omap+bounces-3853-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 988CFAD714C
	for <lists+linux-omap@lfdr.de>; Thu, 12 Jun 2025 15:12:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A99163B224F
	for <lists+linux-omap@lfdr.de>; Thu, 12 Jun 2025 13:10:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16550243371;
	Thu, 12 Jun 2025 13:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="R49oWCXa"
X-Original-To: linux-omap@vger.kernel.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D968E946F;
	Thu, 12 Jun 2025 13:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749733865; cv=none; b=FMz8Ps5MlBzfzlcyMwp35zQTPsNi30Aw0W83mJK/1FzqZD1Q5cKLgIbamuXCwLEj4ViR+4Nj+Id07/xjznBot3Y3OW3X3cAMK3a5HAhF7w7+XztwZTygFVXPCV4d4gVC+UAXL9ZKuvrZBWW4Jd9j8eDrpLoG4Sp84Mjo9VuUhvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749733865; c=relaxed/simple;
	bh=vrQyTyacU7Ij/hd4JULIJv8TrZZjFmKfYlNixSpiJok=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=WGtyWLuNUeRA1IHe4IMzEAEEgS01PGFSHbZ8LD7b3dBjp12bdcTaEGA5vXV1GFOll2xWRdC8Sdmf+3GXKhRGknwR5Hl3ODlI8S6wnkvYa0o03rteXz18QVH745e883XEHOvR6nJskwEdiAE1mErVtl+0YYpqcyxKzLGitSHHtEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=R49oWCXa; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55CDA0Z32925702;
	Thu, 12 Jun 2025 08:10:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1749733800;
	bh=SZsYXdUJxDqqAruGjKI1G6QK33eagQBI2kBAS/U2H9E=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=R49oWCXaLeCfto2fyhcX2Jk6U0KZNdPtDpKrvGWbubbskG+aLLBqLbREwF7QbmKcd
	 7OYm7RcUMzTCdwG00Bsk6z945Ucq/sEKFUXc0NzL6jS8KN0MCl2uGmQYws+UoISeqp
	 Dz5eCdTo+xIsSS7Ve7zKvmFGNXi+y3yACikjK5pk=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55CDA0Q91974279
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 12 Jun 2025 08:10:00 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 12
 Jun 2025 08:09:59 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 12 Jun 2025 08:09:59 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55CD9xgi2202130;
	Thu, 12 Jun 2025 08:09:59 -0500
Message-ID: <ef6d6315-6517-4c8b-bf76-e41bb72bae8d@ti.com>
Date: Thu, 12 Jun 2025 08:09:59 -0500
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] arm: omap2plus_defconfig: Enable TPS65219
 regulator
To: Andreas Kemnade <andreas@kemnade.info>
CC: Kory Maincent <kory.maincent@bootlin.com>,
        Tony Lindgren
	<tony@atomide.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Aaro Koskinen
	<aaro.koskinen@iki.fi>,
        Kevin Hilman <khilman@baylibre.com>,
        Roger Quadros
	<rogerq@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Bajjuri Praneeth
	<praneeth@ti.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
	<broonie@kernel.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        <linux-omap@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20250609-bbg-v2-0-5278026b7498@bootlin.com>
 <20250609-bbg-v2-5-5278026b7498@bootlin.com>
 <1d87fa3b-c3b9-44fd-9e61-7f1ffadcfb0c@ti.com> <20250612081255.255be21e@akair>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250612081255.255be21e@akair>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 6/12/25 1:12 AM, Andreas Kemnade wrote:
> Am Wed, 11 Jun 2025 16:13:05 -0500
> schrieb Andrew Davis <afd@ti.com>:
> 
>> On 6/9/25 10:43 AM, Kory Maincent wrote:
>>> Enable the TPS65219 regulator in the defconfig, as the TPS65214
>>> variant is used by the newly introduced BeagleBoard Green Eco board.
>>>
>>> Reviewed-by: Andreas Kemnade <andreas@kemnade.info>
>>> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
>>> ---
>>>    arch/arm/configs/omap2plus_defconfig | 3 +++
>>>    1 file changed, 3 insertions(+)
>>>
>>> diff --git a/arch/arm/configs/omap2plus_defconfig b/arch/arm/configs/omap2plus_defconfig
>>> index 9f9780c8e62a..2ad669f7b202 100644
>>> --- a/arch/arm/configs/omap2plus_defconfig
>>> +++ b/arch/arm/configs/omap2plus_defconfig
>>
>> Why omap2plus_defconfig? OMAP3 and newer are all ARMv7 and
>> boards with those can/should use multi_v7_defconfig.
>>
> if there are enough drivers enabled there, it would work, but it is not.
> So there need to be a bunch of patches to add the missing stuff.
> omap2plus_defconfig is there and support for boards are added.
> 

Yes multi_v7 is still missing stuff for some boards we want to
support, and we are working on adding those needed modules now.

We won't get feature parity in multi_v7 if we keep adding new
boards to the old omap2plus_defconfig. For this patch series
how about we add support to both defconfigs?

> So I think until multi_v7_defconfig is really usable for OMAP3+, we
> should stick with the name omap2plus_defconfig and add stuff.
> If we rename omap2plus_defconfig to omap2_defconfig, we should imho
> disable OMAP3/4/5 there to avoid confusion.
> 

Yes, that was part of the plan, right now these SoCs are enabled
in both configs, so new boards often get enabled in one or the other
but rarely both.

Andrew

> Regards,
> Andreas

