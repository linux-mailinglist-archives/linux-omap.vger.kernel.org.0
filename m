Return-Path: <linux-omap+bounces-3150-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E935BA18613
	for <lists+linux-omap@lfdr.de>; Tue, 21 Jan 2025 21:23:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 36B3416A339
	for <lists+linux-omap@lfdr.de>; Tue, 21 Jan 2025 20:22:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32E781F707D;
	Tue, 21 Jan 2025 20:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ktuC5PtU"
X-Original-To: linux-omap@vger.kernel.org
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF0F1F76AB;
	Tue, 21 Jan 2025 20:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737490974; cv=none; b=C0qu5VpAxzxvHhQRTk0LeQRjWUGu3dvCAUlKWYbHFibuhdlP9fKv3YqzOv/ouKfjeORx4Cd7Fucm4DdtU6FypRwO7cfXsbkOUvaa6fGYKxk2ui7lIAI9M04GBtHEMd+46zBbUppt2JsWOPXlTNdUvK7UzGXB0MuNqGKgySgrA6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737490974; c=relaxed/simple;
	bh=gb3Ic2/yRo2vRsw2HvzFexfz3yuUPMoSUw0ijh6eD1E=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=cURT9VIDQCx06nk3wIeAf+hw/CwPAeATpqMRFGPn1jtUixw/6xN5IIzsXiS27sLRL9gddruWKUh9j70h7ihXWB327N7aVoSAntpBR7wX6n/heDeVB+szhdmZ7vN1uLnWSRAqP5U59VgDkJBZooy0eAPMBXs+OxQzBxU/rEaISQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=ktuC5PtU; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50LKMNAe866304
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 21 Jan 2025 14:22:23 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1737490943;
	bh=Qxy2h9L0b2gGYfJIIHNHpr6oPtNTPHKQEyOTLEfPWFo=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=ktuC5PtUzfGK85Es9aXab85Ojwz2c+aaBa4h26XLPzsuhaXyJXCD7h4w+pBq9z3k8
	 JrAuykhMQzZgWph1Egg5BNekxkDS2CaGYV9QV5R3O7OAXcC3JNY8T6aMW728+Lo3E2
	 IExil+GA9Ixk5pxrIUvZDY7iMwbKRmWIEBkslvIo=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50LKMNrI090897
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 21 Jan 2025 14:22:23 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 21
 Jan 2025 14:22:22 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 21 Jan 2025 14:22:22 -0600
Received: from [10.250.42.221] ([10.250.42.221])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50LKMMmn130538;
	Tue, 21 Jan 2025 14:22:22 -0600
Message-ID: <a0192bfb-2124-42e9-9571-f8ef5b05a14c@ti.com>
Date: Tue, 21 Jan 2025 14:22:22 -0600
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] mfd: tps65215: Remove regmap_read check
To: Roger Quadros <rogerq@kernel.org>, <aaro.koskinen@iki.fi>,
        <andreas@kemnade.info>, <khilman@baylibre.com>, <tony@atomide.com>,
        <lee@kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <m-leonard@ti.com>, <praneeth@ti.com>, <christophe.jaillet@wanadoo.fr>
References: <20250113230750.124843-1-s-ramamoorthy@ti.com>
 <20250113230750.124843-2-s-ramamoorthy@ti.com>
 <37028baa-d0d2-4cb0-938b-0653eeb118bf@kernel.org>
Content-Language: en-US
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
In-Reply-To: <37028baa-d0d2-4cb0-938b-0653eeb118bf@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi,

On 1/20/2025 6:25 AM, Roger Quadros wrote:
>
> On 14/01/2025 01:07, Shree Ramamoorthy wrote:
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
> subject should be "mfd: tps65219:.."?
>
>> ---
>>  drivers/mfd/tps65219.c       | 6 ------
>>  include/linux/mfd/tps65219.h | 7 +++++--
>>  2 files changed, 5 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/mfd/tps65219.c b/drivers/mfd/tps65219.c
>> index 081c5a30b04a..15b874ee59e5 100644
>> --- a/drivers/mfd/tps65219.c
>> +++ b/drivers/mfd/tps65219.c
>> @@ -246,12 +246,6 @@ static int tps65219_probe(struct i2c_client *client)
>>  	if (ret)
>>  		return ret;
>>  
>> -	ret = regmap_read(tps->regmap, TPS65219_REG_TI_DEV_ID, &chipid);
>> -	if (ret) {
>> -		dev_err(tps->dev, "Failed to read device ID: %d\n", ret);
>> -		return ret;
>> -	}
>> -
> But now chipid has no users. So please drop that variable as well.
>
>>  	ret = devm_mfd_add_devices(tps->dev, PLATFORM_DEVID_AUTO,
>>  				   tps65219_cells, ARRAY_SIZE(tps65219_cells),
>>  				   NULL, 0, regmap_irq_get_domain(tps->irq_data));
>> diff --git a/include/linux/mfd/tps65219.h b/include/linux/mfd/tps65219.h
>> index 546bceec7173..0d88e92ff8f2 100644
>> --- a/include/linux/mfd/tps65219.h
>> +++ b/include/linux/mfd/tps65219.h
>> @@ -13,8 +13,11 @@
>>  #include <linux/regmap.h>
>>  #include <linux/regulator/driver.h>
>>  
>> -/* TPS chip id list */
>> -#define TPS65219					0xF0
>> +/* Chip id list*/
>> +enum pmic_id {
>> +	TPS65215,
>> +	TPS65219,
>> +};
> This change is not part of subject. Please merge it with next patch.

Thank you for reviewing! Will make these 3 changes & include it in the next version.

>>  
>>  /* I2C ID for TPS65219 part */
>>  #define TPS65219_I2C_ID					0x24

