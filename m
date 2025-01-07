Return-Path: <linux-omap+bounces-3018-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E123BA04976
	for <lists+linux-omap@lfdr.de>; Tue,  7 Jan 2025 19:46:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6104618878F6
	for <lists+linux-omap@lfdr.de>; Tue,  7 Jan 2025 18:46:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEE2D1F4287;
	Tue,  7 Jan 2025 18:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="MZSmfLTN"
X-Original-To: linux-omap@vger.kernel.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9641C1F37B8;
	Tue,  7 Jan 2025 18:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736275555; cv=none; b=pfbPBvJw4oi6UHvUCrC8eZHpTBIUnNY2XihCYS8CByte18O/UVMS2LrqxDWnTDzy4BNRu17H3AtPqA4TD97t6BtPHdAoRM0/dL+e/n0cejRdOQzCK68KVPezIK0ARbgX/eiSqe7hBxDA/PZj9elb4hjoSM6uZmDlMotrrIc+NnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736275555; c=relaxed/simple;
	bh=soW3tu83nQwQRERHcX2iD3GfmF8xvA2NR9YjpTbtKQM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=EbHLmIfCYXuiRZhERSIdm2agCMSAqj2+Tou62CRGy62S5rpeI5OkKmCAE7kME9/0VKjeByRA47x6EtGUk9AQnpn/ivXO0LKkw03hu+8DgDIUS+RoTwtpvtyH/yheCQqjlxGm4KYn9O+M7fhGzoPGbu16Ahb7FTQ73Rs4AGf23As=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=MZSmfLTN; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 507IjLY82684540
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 7 Jan 2025 12:45:21 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736275521;
	bh=YXb48ykkq/s3R+qPOF47QMvHmhMelBZNl1LVJXBG3hY=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=MZSmfLTNgA7EpKj1hY8+wtH248HC3BI3KPIs4goYkBkYbH80Te1gBbwKSbvv1kzoj
	 6ePU0ugPGzHyGSX6AFqKzGkY8W9QCXtyxscsIN6ahY0ff3BWBzjJNj6dtihakVdoKz
	 w7wcLaQFjdsFwr+pw1EL/k7qVos/11eRN3YUEhLI=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 507IjLDT028018
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 7 Jan 2025 12:45:21 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 7
 Jan 2025 12:45:20 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 7 Jan 2025 12:45:20 -0600
Received: from [128.247.29.228] (dmz007xyy.dhcp.ti.com [128.247.29.228])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 507IjKSZ109957;
	Tue, 7 Jan 2025 12:45:20 -0600
Message-ID: <48d409b5-6e2d-493f-8ce4-e6510061c854@ti.com>
Date: Tue, 7 Jan 2025 12:45:20 -0600
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
 <630b8727-cffa-4118-93e4-2dd8ce97ebde@ti.com>
 <107f9bb2-341c-48ef-ae4d-ef45e61fce6c@kernel.org>
Content-Language: en-US
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
Organization: PMIC
In-Reply-To: <107f9bb2-341c-48ef-ae4d-ef45e61fce6c@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi,


On 1/7/25 6:47 AM, Roger Quadros wrote:
>
> On 07/01/2025 00:18, Shree Ramamoorthy wrote:
>> Hi,
>>
>> On 1/4/2025 12:16 PM, Roger Quadros wrote:
>>> On 04/01/2025 00:57, Shree Ramamoorthy wrote:
>>>> The chipid macro/variable and regmap_read function call is not needed
>>>> because the TPS65219_REG_TI_DEV_ID register value is not a consistent value
>>>> across TPS65219 PMIC config versions. Reading from the DEV_ID register
>>>> without a consistent value to compare it to isn't useful. There isn't a
>>>> way to verify the match data ID is the same ID read from the DEV_ID device
>>>> register. 0xF0 isn't a DEV_ID value consistent across TPS65219 NVM
>>>> configurations.
>>>>
>>>> For TPS65215, there is a consistent value in bits 5-0 of the DEV_ID
>>>> register. However, there are other error checks in place within probe()
>>>> that apply to both PMICs rather than keeping this isolated check for one
>>>> PMIC.
>>>>
>>>> Signed-off-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>
>>> In that case this could be squashed with 1?
>> Since this change does not have to do with TPS65215 support directly
>> and is a different type of change, I wanted to keep this patch separate.
>> I can instead have this patch be first, then the MFD add TPS65215 support
>> will follow this to avoid any confusion about regmap_read being modified then removed.
>>
> OK thanks.
>
>>>> ---
>>>>   drivers/mfd/tps65219.c       | 6 ------
>>>>   include/linux/mfd/tps65219.h | 2 --
>>>>   2 files changed, 8 deletions(-)
>>>>
>>>> diff --git a/drivers/mfd/tps65219.c b/drivers/mfd/tps65219.c
>>>> index 816b271990a2..d3267bf7cd77 100644
>>>> --- a/drivers/mfd/tps65219.c
>>>> +++ b/drivers/mfd/tps65219.c
>>>> @@ -382,12 +382,6 @@ static int tps65219_probe(struct i2c_client *client)
>>>>   	if (ret)
>>>>   		return ret;
>>>>   
>>>> -	ret = regmap_read(tps->regmap, TPS65219_REG_TI_DEV_ID, &tps->chip_id);
>>>> -	if (ret) {
>>>> -		dev_err(tps->dev, "Failed to read device ID: %d\n", ret);
>>>> -		return ret;
>>>> -	}
>>>> -
>>>>   	ret = devm_mfd_add_devices(tps->dev, PLATFORM_DEVID_AUTO,
>>>>   				   pmic->cells, pmic->n_cells,
>>>>   				   NULL, 0, regmap_irq_get_domain(tps->irq_data));
>>>> diff --git a/include/linux/mfd/tps65219.h b/include/linux/mfd/tps65219.h
>>>> index 9892b6e4c85c..535115bfa4a4 100644
>>>> --- a/include/linux/mfd/tps65219.h
>>>> +++ b/include/linux/mfd/tps65219.h
>>>> @@ -15,8 +15,6 @@
>>>>   #include <linux/regmap.h>
>>>>   #include <linux/regulator/driver.h>
>>>>   
>>>> -/* TPS chip id list */
>>>> -#define TPS65219					0xF0
>>>>   /* Chip id list*/
>>>>   enum pmic_id {
>>>>   	TPS65215,
>>> Looking at TRM, TPS65215 device_id is 0x15 and TPS6521901 device_id is 0x00.
>>>
>>> shouldn't we use that here as well?
>> The device_id value set varies across TPS65219 hardware versions.
> Do you foresee any software quirks being applied for specific versions of
> TPS65219? If not then probably not worth the effort to keep track of all the
> versions.

I don't foresee any sw quirks that would need to be support for TPS65219,
since there haven't been any since the driver was released.

>> Having the device_id as the chip_id differentiator will fail for TPS65219,
>> even though the system engineers have now kept the TPS65215 device_id value
>> consistent across all hardware versions.
>>

-- 
Best,
Shree Ramamoorthy
PMIC Software Engineer


