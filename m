Return-Path: <linux-omap+bounces-2947-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF80A001C1
	for <lists+linux-omap@lfdr.de>; Fri,  3 Jan 2025 00:30:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8FAAB1885BC1
	for <lists+linux-omap@lfdr.de>; Thu,  2 Jan 2025 23:30:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74E571BEF9C;
	Thu,  2 Jan 2025 23:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="UPbujzD+"
X-Original-To: linux-omap@vger.kernel.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F8F41BEF99;
	Thu,  2 Jan 2025 23:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735860385; cv=none; b=Q65uStWgCoM3qRZdLkBnzECAGpaY46eB3le/eBV2Xx7i27RyYxAfgf8ycAEE7rpjZcwmUCkBqmFHXKNZ79ohhUXW4LkVkg053TIOf5PpmQxSnNcG1wOV5aoCD7/l2eyHySopVDrJ9yqdmR+ss2GJJUMxEPHuahWLxF3pQv9uazY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735860385; c=relaxed/simple;
	bh=sRBnipD3NSZbJG7q2+wDLgsYHh233Gv54He269dBkUA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=NOuSButnPjURE9DqW3WJ0yPd2qAoY2vcEFVtg8VyJ4arNM456e5LpoO5yN9HOD05bC/plMXuyten3Xw2Bkrx5FbP1JzH/8Q/jJaQjDE0e6PZ19UKbgbvPRN0v2GFZtaKr2WjeBnBymfBFrkbeNSgcn+VIJMbTSLmvBBD/H70oQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=UPbujzD+; arc=none smtp.client-ip=198.47.23.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 502NQ0Dr091333;
	Thu, 2 Jan 2025 17:26:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1735860360;
	bh=jTEsHWBwxjooxJ+StmMdEASpdKFbxKymWvUjd4gOXqc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=UPbujzD+2QU285B2XuJ5SxmsSoFyp/6Ghyia9qFIwDvH5J0EOthfJx14wZjYQ/J2k
	 S8tPWOTb8ofxOEHzEe1GWspJCvm/Mokt4Jz6cgn+xd4pGNbMQxFzDnG9P+etRzdxOQ
	 TbduHnz/oFlH/2QbZ86cqvQJudkA3U1UkvRDQ6po=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 502NQ0Si004182
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 2 Jan 2025 17:26:00 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 2
 Jan 2025 17:26:00 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 2 Jan 2025 17:26:00 -0600
Received: from [128.247.29.228] (dmz007xyy.dhcp.ti.com [128.247.29.228])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 502NQ0JU082004;
	Thu, 2 Jan 2025 17:26:00 -0600
Message-ID: <3d2e87de-2aa9-43b0-99be-74ff5f08b28d@ti.com>
Date: Thu, 2 Jan 2025 17:26:00 -0600
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] mfd: tps65215: Add support for TI TPS65215 PMIC
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, <aaro.koskinen@iki.fi>,
        <andreas@kemnade.info>, <khilman@baylibre.com>, <rogerq@kernel.org>,
        <tony@atomide.com>, <lee@kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <m-leonard@ti.com>, <praneeth@ti.com>
References: <20241226214922.374987-1-s-ramamoorthy@ti.com>
 <20241226214922.374987-3-s-ramamoorthy@ti.com>
 <89569f43-e6ee-452e-91b5-eeee2838f9b5@wanadoo.fr>
Content-Language: en-US
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
Organization: PMIC
In-Reply-To: <89569f43-e6ee-452e-91b5-eeee2838f9b5@wanadoo.fr>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi,


On 1/1/25 4:58 AM, Christophe JAILLET wrote:
> Le 26/12/2024 à 22:49, Shree Ramamoorthy a écrit :
>> Use chip ID and chip_data struct to differentiate between devices in
>> probe(). Add TPS65215 resource information. Update descriptions and
>> copyright information to reflect the driver supports 2 PMIC devices.
>>
>> Signed-off-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>
>
> ...
>
>> +static struct chip_data chip_info_table[] = {
>> +    [TPS65219] = {
>> +        .irq_chip = &tps65219_irq_chip,
>> +        .cells = tps65219_cells,
>> +        .n_cells = ARRAY_SIZE(tps65219_cells),
>> +    },
>> +    [TPS65215] = {
>
> Maybe keep alphabetical order?

Thank you for reviewing! I will apply all the feedback across the related series & send v2 soon.

Shree

>
>> +        .irq_chip = &tps65215_irq_chip,
>> +        .cells = tps65215_cells,
>> +        .n_cells = ARRAY_SIZE(tps65215_cells),
>> +    },
>> +};
>> +
>>   static int tps65219_probe(struct i2c_client *client)
>>   {
>>       struct tps65219 *tps;
>> +    struct chip_data *pmic;
>>       bool pwr_button;
>>       int ret;
>>   @@ -231,6 +366,8 @@ static int tps65219_probe(struct i2c_client 
>> *client)
>>       i2c_set_clientdata(client, tps);
>>         tps->dev = &client->dev;
>> +    tps->chip_id = (uintptr_t)i2c_get_match_data(client);
>> +    pmic = &chip_info_table[tps->chip_id];
>>         tps->regmap = devm_regmap_init_i2c(client, 
>> &tps65219_regmap_config);
>>       if (IS_ERR(tps->regmap)) {
>> @@ -239,14 +376,14 @@ static int tps65219_probe(struct i2c_client 
>> *client)
>>           return ret;
>>       }
>>   -    ret = devm_regmap_add_irq_chip(&client->dev, tps->regmap, 
>> client->irq,
>> -                       IRQF_ONESHOT, 0, &tps65219_irq_chip,
>> +    ret = devm_regmap_add_irq_chip(tps->dev, tps->regmap, client->irq,
>> +                       IRQF_ONESHOT, 0, pmic->irq_chip,
>>                          &tps->irq_data);
>>       if (ret)
>>           return ret;
>>         ret = devm_mfd_add_devices(tps->dev, PLATFORM_DEVID_AUTO,
>> -                   tps65219_cells, ARRAY_SIZE(tps65219_cells),
>> +                   pmic->cells, pmic->n_cells,
>>                      NULL, 0, regmap_irq_get_domain(tps->irq_data));
>>       if (ret) {
>>           dev_err(tps->dev, "Failed to add child devices: %d\n", ret);
>> @@ -284,7 +421,8 @@ static int tps65219_probe(struct i2c_client *client)
>>   }
>>     static const struct of_device_id of_tps65219_match_table[] = {
>> -    { .compatible = "ti,tps65219", },
>> +    { .compatible = "ti,tps65219", .data = (void *)TPS65219, },
>> +    { .compatible = "ti,tps65215", .data = (void *)TPS65215, },
>
> Maybe keep alphabetical order?
>
>>       {}
>>   };
>>   MODULE_DEVICE_TABLE(of, of_tps65219_match_table);
>> @@ -299,5 +437,5 @@ static struct i2c_driver tps65219_driver = {
>>   module_i2c_driver(tps65219_driver);
>>     MODULE_AUTHOR("Jerome Neanne <jneanne@baylibre.com>");
>> -MODULE_DESCRIPTION("TPS65219 power management IC driver");
>> +MODULE_DESCRIPTION("TPS65215/TPS65219 PMIC driver");
>>   MODULE_LICENSE("GPL");
>> diff --git a/include/linux/mfd/tps65219.h b/include/linux/mfd/tps65219.h
>> index 6ed2ec4264d9..945ab805fa6d 100644
>> --- a/include/linux/mfd/tps65219.h
>> +++ b/include/linux/mfd/tps65219.h
>> @@ -1,8 +1,10 @@
>>   /* SPDX-License-Identifier: GPL-2.0 */
>>   /*
>> - * Functions to access TPS65219 Power Management IC.
>> + * Functions to access TPS65215/TPS65219 Integrated Power Management
>> + * Integrated Chips (PMIC)
>>    *
>>    * Copyright (C) 2022 BayLibre Incorporated - 
>> https://www.baylibre.com/
>> + * Copyright (C) 2024 Texas Instruments Incorporated - 
>> https://www.ti.com/
>>    */
>>     #ifndef MFD_TPS65219_H
>> @@ -13,6 +15,12 @@
>>   #include <linux/regmap.h>
>>   #include <linux/regulator/driver.h>
>>   +/* Chip id list*/
>> +enum pmic_id {
>> +    TPS65219,
>> +    TPS65215,
>
> Maybe keep alphabetical order?
>
>> +};
>
> ...
>
> CJ

-- 
Best,
Shree Ramamoorthy
PMIC Software Engineer


