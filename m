Return-Path: <linux-omap+bounces-3016-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5EBA03FA3
	for <lists+linux-omap@lfdr.de>; Tue,  7 Jan 2025 13:48:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 85C8A7A0557
	for <lists+linux-omap@lfdr.de>; Tue,  7 Jan 2025 12:47:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 275C31DF25C;
	Tue,  7 Jan 2025 12:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nVrzqPtO"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C481E521;
	Tue,  7 Jan 2025 12:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736254064; cv=none; b=Q9I+JH4M5jTf28cR/mPnSiAmGB90M+jDU+qlfnkd1pyzijgx8NF7iHe9/SFCEB4D4P7yGh0qz3bKKrFQKrAtJ+vIRkVAPh1GVO7n9XlPfKHq307j4J8BkO2HHqPaK4qf015U1z32ugvkvoBeU5yANBlkTlzEMSpkxmo3oBU/PH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736254064; c=relaxed/simple;
	bh=Md/5QSRijDXTJegBZ7p49tOr/KlAMJz0r0WGdqwBH4o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L5wa2XZTW07dfIxkxr9J0PkjqeoB2TZomRELzYcjrpWGqzR7Tw8wPTAEXTlVd5cph1Snct9QNU8v+lgbZFJaHisN9CstJ5caE6V4ZIlfPxwVZLjHYNUXJSA9qW0u+llF1fjGh2Z2VNc7lrB3sVFY2kveRdeTQmXafuly5KUmJPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nVrzqPtO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36A43C4CED6;
	Tue,  7 Jan 2025 12:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736254063;
	bh=Md/5QSRijDXTJegBZ7p49tOr/KlAMJz0r0WGdqwBH4o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nVrzqPtONy7j/JSIcmjAsbW0vCUMQiuYzOkuMhr5wHrG+M7/AtgKCyJ9FV7RvXNFV
	 /re1hAj1/FI5TmFO+v/e4xxSGMcRoF799JaUQZY3ERhSQVqwTnw+sVwZ6WjoFld6KH
	 yacpORnfB6ZSwhkt1cN/Pvy8EZCE80GIL3R5mCq9PiS6PCID00B15+WxKkUqCTgnYr
	 KNZTvzLmAjTxR5Aiz+JtBxcs7YHIbyZBqOJTMaPuUS2J923AwBwxD8mVjCOEB1JFBF
	 RIv9FdUq6C+w0SsNqhFTyKBndGAyiFaf8RrzXOCH0Zp+BMCV+o/+Df0DR0EWQmHKsR
	 fN07z+ESBnToA==
Message-ID: <107f9bb2-341c-48ef-ae4d-ef45e61fce6c@kernel.org>
Date: Tue, 7 Jan 2025 14:47:38 +0200
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] mfd: tps65215: Remove regmap_read check
To: Shree Ramamoorthy <s-ramamoorthy@ti.com>, aaro.koskinen@iki.fi,
 andreas@kemnade.info, khilman@baylibre.com, tony@atomide.com,
 lee@kernel.org, linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: m-leonard@ti.com, praneeth@ti.com, christophe.jaillet@wanadoo.fr
References: <20250103225732.196636-1-s-ramamoorthy@ti.com>
 <20250103225732.196636-3-s-ramamoorthy@ti.com>
 <8b086855-d381-4219-93f3-7da8b44e2551@kernel.org>
 <630b8727-cffa-4118-93e4-2dd8ce97ebde@ti.com>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <630b8727-cffa-4118-93e4-2dd8ce97ebde@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 07/01/2025 00:18, Shree Ramamoorthy wrote:
> Hi,
> 
> On 1/4/2025 12:16 PM, Roger Quadros wrote:
>>
>> On 04/01/2025 00:57, Shree Ramamoorthy wrote:
>>> The chipid macro/variable and regmap_read function call is not needed
>>> because the TPS65219_REG_TI_DEV_ID register value is not a consistent value
>>> across TPS65219 PMIC config versions. Reading from the DEV_ID register
>>> without a consistent value to compare it to isn't useful. There isn't a
>>> way to verify the match data ID is the same ID read from the DEV_ID device
>>> register. 0xF0 isn't a DEV_ID value consistent across TPS65219 NVM
>>> configurations.
>>>
>>> For TPS65215, there is a consistent value in bits 5-0 of the DEV_ID
>>> register. However, there are other error checks in place within probe()
>>> that apply to both PMICs rather than keeping this isolated check for one
>>> PMIC.
>>>
>>> Signed-off-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>
>> In that case this could be squashed with 1?
> 
> Since this change does not have to do with TPS65215 support directly
> and is a different type of change, I wanted to keep this patch separate.
> I can instead have this patch be first, then the MFD add TPS65215 support
> will follow this to avoid any confusion about regmap_read being modified then removed.
> 

OK thanks.

>>> ---
>>>  drivers/mfd/tps65219.c       | 6 ------
>>>  include/linux/mfd/tps65219.h | 2 --
>>>  2 files changed, 8 deletions(-)
>>>
>>> diff --git a/drivers/mfd/tps65219.c b/drivers/mfd/tps65219.c
>>> index 816b271990a2..d3267bf7cd77 100644
>>> --- a/drivers/mfd/tps65219.c
>>> +++ b/drivers/mfd/tps65219.c
>>> @@ -382,12 +382,6 @@ static int tps65219_probe(struct i2c_client *client)
>>>  	if (ret)
>>>  		return ret;
>>>  
>>> -	ret = regmap_read(tps->regmap, TPS65219_REG_TI_DEV_ID, &tps->chip_id);
>>> -	if (ret) {
>>> -		dev_err(tps->dev, "Failed to read device ID: %d\n", ret);
>>> -		return ret;
>>> -	}
>>> -
>>>  	ret = devm_mfd_add_devices(tps->dev, PLATFORM_DEVID_AUTO,
>>>  				   pmic->cells, pmic->n_cells,
>>>  				   NULL, 0, regmap_irq_get_domain(tps->irq_data));
>>> diff --git a/include/linux/mfd/tps65219.h b/include/linux/mfd/tps65219.h
>>> index 9892b6e4c85c..535115bfa4a4 100644
>>> --- a/include/linux/mfd/tps65219.h
>>> +++ b/include/linux/mfd/tps65219.h
>>> @@ -15,8 +15,6 @@
>>>  #include <linux/regmap.h>
>>>  #include <linux/regulator/driver.h>
>>>  
>>> -/* TPS chip id list */
>>> -#define TPS65219					0xF0
>>>  /* Chip id list*/
>>>  enum pmic_id {
>>>  	TPS65215,
>> Looking at TRM, TPS65215 device_id is 0x15 and TPS6521901 device_id is 0x00.
>>
>> shouldn't we use that here as well?
> 
> The device_id value set varies across TPS65219 hardware versions.

Do you foresee any software quirks being applied for specific versions of
TPS65219? If not then probably not worth the effort to keep track of all the
versions.

> Having the device_id as the chip_id differentiator will fail for TPS65219,
> even though the system engineers have now kept the TPS65215 device_id value
> consistent across all hardware versions.
> 

-- 
cheers,
-roger


