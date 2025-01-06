Return-Path: <linux-omap+bounces-3001-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 75AC5A03279
	for <lists+linux-omap@lfdr.de>; Mon,  6 Jan 2025 23:13:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 00FB91882706
	for <lists+linux-omap@lfdr.de>; Mon,  6 Jan 2025 22:13:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 332001E049C;
	Mon,  6 Jan 2025 22:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="D2W3TPK8"
X-Original-To: linux-omap@vger.kernel.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3169A132103;
	Mon,  6 Jan 2025 22:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736201624; cv=none; b=r1X0I7nsfo5uM1idMHxwWoog+R/3PIi9xkRb09+6hzXa2J4af2JmgTYO4sfrVd2i3+bAJIEh6kT9P/MhpDWiyya6BL6WDubhHCfvZqbzdes8VUEdpmjy9I6KO5y6KtYvstyb8fE4bQlt5i0LkQgR9RhjoERzAk8HJV49goKNaGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736201624; c=relaxed/simple;
	bh=CnCf8SOD6ziuzZzGPo/cDhsUf0V7lf+M8S9Z1Bb1v/w=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=uJmt1/QHKTNKaN661U/RlW1P1kH+pOfOhM5XNeU0glq8sMDc3VRLfbrF0XtE2hk1HMNomuHxkyfpS6KSovB74O6AgvP13MYRq1rAckXZQZAwXD35iks4YEJSizYLdRVBKP9lHmassDzCBo+dQ6v+PRAe3dzJIjDz21WYuirpVVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=D2W3TPK8; arc=none smtp.client-ip=198.47.19.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 506MD7Ft067203;
	Mon, 6 Jan 2025 16:13:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736201588;
	bh=CnCf8SOD6ziuzZzGPo/cDhsUf0V7lf+M8S9Z1Bb1v/w=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=D2W3TPK8QmOs+usdMyTpIXzphUF/MTRK5OJ8fPdRIfjEUkoZ3nvHkATjSFEiWZumw
	 K/aDLGq7peplsKG1WpHWX6ON+CsZS5E6R7DO9/v9Qjr7Z/xoG9NIJMyXatztyd+KRw
	 E3bDH6j5J8gM4nbChAtjlWPK2jYKsvYM92Ll3LKw=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 506MD7Kg021848
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 6 Jan 2025 16:13:07 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 6
 Jan 2025 16:13:07 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 6 Jan 2025 16:13:07 -0600
Received: from [10.250.35.198] ([10.250.35.198])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 506MD7od080987;
	Mon, 6 Jan 2025 16:13:07 -0600
Message-ID: <1e23f5d3-4af1-47d3-a977-ab25dde7e1ec@ti.com>
Date: Mon, 6 Jan 2025 16:13:07 -0600
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] mfd: tps65215: Add support for TI TPS65215 PMIC
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, <aaro.koskinen@iki.fi>,
        <andreas@kemnade.info>, <khilman@baylibre.com>, <rogerq@kernel.org>,
        <tony@atomide.com>, <lee@kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <m-leonard@ti.com>, <praneeth@ti.com>
References: <20250103225732.196636-1-s-ramamoorthy@ti.com>
 <20250103225732.196636-2-s-ramamoorthy@ti.com>
 <58e4118c-f705-4565-842e-2baca4ea5abd@wanadoo.fr>
Content-Language: en-US
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
In-Reply-To: <58e4118c-f705-4565-842e-2baca4ea5abd@wanadoo.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi,

On 1/4/2025 5:30 AM, Christophe JAILLET wrote:
> Le 03/01/2025 à 23:57, Shree Ramamoorthy a écrit :
>> Use chip ID and chip_data struct to differentiate between devices in
>> probe(). Add TPS65215 resource information. Update descriptions and
>> copyright information to reflect the driver supports 2 PMIC devices.
>>
>> Signed-off-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>
>
> ...
>
>> @@ -218,10 +333,29 @@ static const struct regmap_irq_chip
>> tps65219_irq_chip = {
>>       .sub_reg_offsets = tps65219_sub_irq_offsets,
>>   };
>>   +struct tps65219_chip_data {
>
> Maybe tps6521x_chip_data?
> (and if so, same for gpio-tps65219.c)
>
I tried to keep tps65219 as the main prefix where possible to avoid the confusion
that the function applies to all devices starting with TPS6521X, when this
driver doesn't. I will revert any functions that start with tps6521x to avoid that
confusion as well.

>> +    const struct regmap_irq_chip *irq_chip;
>> +    const struct mfd_cell *cells;
>> +    int n_cells;
>> +};
>> +
>> +static struct tps65219_chip_data chip_info_table[] = {
>> +    [TPS65215] = {
>> +        .irq_chip = &tps65215_irq_chip,
>> +        .cells = tps65215_cells,
>> +        .n_cells = ARRAY_SIZE(tps65215_cells),
>> +    },
>> +    [TPS65219] = {
>> +        .irq_chip = &tps65219_irq_chip,
>> +        .cells = tps65219_cells,
>> +        .n_cells = ARRAY_SIZE(tps65219_cells),
>> +    },
>> +};
>
> ...
>
>> @@ -291,7 +427,10 @@ static int tps65219_probe(struct i2c_client
>> *client)
>>   }
>>     static const struct of_device_id of_tps65219_match_table[] = {
>> -    { .compatible = "ti,tps65219", },
>> +    { .compatible = "ti,tps65215", .data = (void *)TPS65215, },
>> +    { .compatible = "ti,tps65219", .data = (void *)TPS65219, },
>> +    { .compatible = "ti,tps65219", .data = (void *)TPS65219, },
>> +    { .compatible = "ti,tps65215", .data = (void *)TPS65215, },
>>       {}
>
> Entries look duplicated.
>
Thanks for catching this. I have applied this feedback!

>>   };
>
> ...
>
> CJ
>

