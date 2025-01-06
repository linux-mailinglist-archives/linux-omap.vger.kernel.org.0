Return-Path: <linux-omap+bounces-3002-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 93161A03284
	for <lists+linux-omap@lfdr.de>; Mon,  6 Jan 2025 23:19:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 299F81885E79
	for <lists+linux-omap@lfdr.de>; Mon,  6 Jan 2025 22:19:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61B4D1DDC0F;
	Mon,  6 Jan 2025 22:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="aFsh1tAD"
X-Original-To: linux-omap@vger.kernel.org
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2717714884C;
	Mon,  6 Jan 2025 22:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736201957; cv=none; b=ARRW19Q/+OWBmL6XTwxBHLdMujk3GGFJNGThCn2hx1CuVIgAoRpxfrkYHW50xezPEuPVz1eMLtkXG2Hh0Zeee1F2389UaF9Tp9DNTCDS/gx0Mkjtts7ZQfPlv7eEfCHIYo+oBTIzQx3SQlVZCDoojlRakmDTRjwJZJ+wkjl8xPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736201957; c=relaxed/simple;
	bh=g6o493N8jIdQ/NIfJpRnWWh/V2M6Xctsw71s9L4DFI8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=osN9m2t60Dnktwvhebbr1DsCUV9yC7kzwXwa+g8FCOv3ghuy9MCgeUjmy/zmNG1gHtzZ90qVJLvD4DBddklEwJN5ihwWST67KL8qOT+On8/6X3K7uFso9X0fKLmvVl1UzkBJcnDmGZXgr5A6UydB/GQvkXa9D4DbFqAVXSP6/Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=aFsh1tAD; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 506MInvK2853320
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 6 Jan 2025 16:18:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736201929;
	bh=T0mGFaGkXaKMcx9P8RuweFxexPKVwdrhuxk81G5w3cc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=aFsh1tADaDLNI7Ipo2exzxGnzZj+ZvIh4FSapfZCOrGe0r/ceRTjPbHuTJKAmsm3i
	 1jopb3FVP6TLOuFyVgHJSfMYbz5S9hOOWO7LPI172nfBnF1wBpFLH4HvfEn/33WIxb
	 G5lZFVoUQE+m+/SRs//DH8jOmKFnlOQ/GkuBmycE=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 506MIm2J025076
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 6 Jan 2025 16:18:48 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 6
 Jan 2025 16:18:48 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 6 Jan 2025 16:18:48 -0600
Received: from [10.250.35.198] ([10.250.35.198])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 506MIlOr066060;
	Mon, 6 Jan 2025 16:18:48 -0600
Message-ID: <630b8727-cffa-4118-93e4-2dd8ce97ebde@ti.com>
Date: Mon, 6 Jan 2025 16:18:47 -0600
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] mfd: tps65215: Remove regmap_read check
To: Roger Quadros <rogerq@kernel.org>, <aaro.koskinen@iki.fi>,
        <andreas@kemnade.info>, <khilman@baylibre.com>, <tony@atomide.com>,
        <lee@kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <m-leonard@ti.com>, <praneeth@ti.com>, <christophe.jaillet@wanadoo.fr>
References: <20250103225732.196636-1-s-ramamoorthy@ti.com>
 <20250103225732.196636-3-s-ramamoorthy@ti.com>
 <8b086855-d381-4219-93f3-7da8b44e2551@kernel.org>
Content-Language: en-US
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
In-Reply-To: <8b086855-d381-4219-93f3-7da8b44e2551@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi,

On 1/4/2025 12:16 PM, Roger Quadros wrote:
>
> On 04/01/2025 00:57, Shree Ramamoorthy wrote:
>> The chipid macro/variable and regmap_read function call is not needed
>> because the TPS65219_REG_TI_DEV_ID register value is not a consistent value
>> across TPS65219 PMIC config versions. Reading from the DEV_ID register
>> without a consistent value to compare it to isn't useful. There isn't a
>> way to verify the match data ID is the same ID read from the DEV_ID device
>> register. 0xF0 isn't a DEV_ID value consistent across TPS65219 NVM
>> configurations.
>>
>> For TPS65215, there is a consistent value in bits 5-0 of the DEV_ID
>> register. However, there are other error checks in place within probe()
>> that apply to both PMICs rather than keeping this isolated check for one
>> PMIC.
>>
>> Signed-off-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>
> In that case this could be squashed with 1?

Since this change does not have to do with TPS65215 support directly
and is a different type of change, I wanted to keep this patch separate.
I can instead have this patch be first, then the MFD add TPS65215 support
will follow this to avoid any confusion about regmap_read being modified then removed.

>> ---
>>  drivers/mfd/tps65219.c       | 6 ------
>>  include/linux/mfd/tps65219.h | 2 --
>>  2 files changed, 8 deletions(-)
>>
>> diff --git a/drivers/mfd/tps65219.c b/drivers/mfd/tps65219.c
>> index 816b271990a2..d3267bf7cd77 100644
>> --- a/drivers/mfd/tps65219.c
>> +++ b/drivers/mfd/tps65219.c
>> @@ -382,12 +382,6 @@ static int tps65219_probe(struct i2c_client *client)
>>  	if (ret)
>>  		return ret;
>>  
>> -	ret = regmap_read(tps->regmap, TPS65219_REG_TI_DEV_ID, &tps->chip_id);
>> -	if (ret) {
>> -		dev_err(tps->dev, "Failed to read device ID: %d\n", ret);
>> -		return ret;
>> -	}
>> -
>>  	ret = devm_mfd_add_devices(tps->dev, PLATFORM_DEVID_AUTO,
>>  				   pmic->cells, pmic->n_cells,
>>  				   NULL, 0, regmap_irq_get_domain(tps->irq_data));
>> diff --git a/include/linux/mfd/tps65219.h b/include/linux/mfd/tps65219.h
>> index 9892b6e4c85c..535115bfa4a4 100644
>> --- a/include/linux/mfd/tps65219.h
>> +++ b/include/linux/mfd/tps65219.h
>> @@ -15,8 +15,6 @@
>>  #include <linux/regmap.h>
>>  #include <linux/regulator/driver.h>
>>  
>> -/* TPS chip id list */
>> -#define TPS65219					0xF0
>>  /* Chip id list*/
>>  enum pmic_id {
>>  	TPS65215,
> Looking at TRM, TPS65215 device_id is 0x15 and TPS6521901 device_id is 0x00.
>
> shouldn't we use that here as well?

The device_id value set varies across TPS65219 hardware versions.
Having the device_id as the chip_id differentiator will fail for TPS65219,
even though the system engineers have now kept the TPS65215 device_id value
consistent across all hardware versions.


