Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C17140C27F
	for <lists+linux-omap@lfdr.de>; Wed, 15 Sep 2021 11:11:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237058AbhIOJMa (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 15 Sep 2021 05:12:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:54620 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237219AbhIOJM1 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 15 Sep 2021 05:12:27 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C946161242;
        Wed, 15 Sep 2021 09:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631697068;
        bh=bccyqd4Mgjh1Dt3QIgyk+eVgSktxwaJgdDXfU+Wh/RI=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=lJRVRJOC2nhd84Q1PWIANjsOBuCNPNTzZq8mnfjNtsfg0FVowkQlUWrBfID7BDhib
         noB8FLVfGwbSu84dj7RdMy7/PymTS1FB2VfqdQgxLLaQTbRHg+mHIdxXUY1/gxG4M/
         jLRaTE5cssIgWhCh6HEnEqZ9L38di6gWrkHPLz4nN7Q6pL+wALQ2ZokD+NcKTTTqij
         dYB1vKwji71Z79j0mwMflVoakx1mKJWYGCM6pvuniIrd4fcPE8k8iAOPfi5TfZ6r/D
         n1e6lTDpLqTekuBFUvrVOQq64OHZykrkdwIctYnpoZpJ5wH9jh5g0PKBDL04tzl4K8
         Mka+wiOnt6bAg==
Subject: Re: [PATCH v3 8/8] memory: gpmc-omap: "gpmc,device-width" DT property
 is optional
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        tony@atomide.com
Cc:     robh+dt@kernel.org, grygorii.strashko@ti.com, nm@ti.com,
        lokeshvutla@ti.com, nsekhar@ti.com, miquel.raynal@bootlin.com,
        devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210907113226.31876-1-rogerq@kernel.org>
 <20210907113226.31876-9-rogerq@kernel.org>
 <aa465bd9-b3d5-8d75-3e59-e86c2cd093cd@canonical.com>
From:   Roger Quadros <rogerq@kernel.org>
Message-ID: <a881ac1f-2f00-e675-aea6-154b28ca6eff@kernel.org>
Date:   Wed, 15 Sep 2021 12:11:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <aa465bd9-b3d5-8d75-3e59-e86c2cd093cd@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Krzysztof,

On 07/09/2021 15:36, Krzysztof Kozlowski wrote:
> On 07/09/2021 13:32, Roger Quadros wrote:
>> Check for valid gpmc,device-width, nand-bus-width and bank-width
>> at one place. Default to 8-bit width if none present.
> 
> I don't understand the message in the context of the patch. The title
> says one property is optional - that's it. The message says you
> consolidate checks. How is this related to the title?
> 
> The patch itself moves around checking of properties and reads
> nand-bus-width *always*. It does not "check at one place" but rather
> "check always". In the same time, the patch does not remove
> gpmc,device-width check in other place.
> 
> All three elements - the title, message and patch - do different things.
> What did you want to achieve here? Can you help in clarifying it?
> 

OK I will explain it better in commit log in next revision. Let me explain here a bit.

Prior to this patch it was working like this

	/* in gpmc_read_settings_dt() */
	s->device_width = 0;	/* invalid width, should be 1 for 8-bit, 2 for 16-bit */
	of_property_read_u32(np, "gpmc,device-width", s->device_width);

	/* in gpmc_probe_generic_child () */
	if (of_device_is_compatible(child, "ti,omap2-nand")) {
		/* check for nand-bus-width, if absent set s->device_width to 1 (i.e. 8-bit) */
	} else {
		/* check for bank-width, if absent and s->device_width not set, error out */
	}

So that means if all three, "gpmc,device-width". "nand-bus-width" and "bank-width" are missing then
it would create an error situation.

The patch is doing 3 things.
1) Make sure all DT checks related to bus width are being done at one place for better readability.
2) even if all 3 width properties are absent, we will not treat it as error and default to 8-bit.
3) check for nand-bus-width regardless of whether compatible to "ti,omap2-nand" or not.

Hope this explains well.

cheers,
-roger

> 
> Best regards,
> Krzysztof
> 
> 
>>
>> Signed-off-by: Roger Quadros <rogerq@kernel.org>
>> ---
>>  drivers/memory/omap-gpmc.c | 41 ++++++++++++++++++++++++--------------
>>  1 file changed, 26 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/memory/omap-gpmc.c b/drivers/memory/omap-gpmc.c
>> index f80c2ea39ca4..32d7c665f33c 100644
>> --- a/drivers/memory/omap-gpmc.c
>> +++ b/drivers/memory/omap-gpmc.c
>> @@ -2171,10 +2171,8 @@ static int gpmc_probe_generic_child(struct platform_device *pdev,
>>  		}
>>  	}
>>  
>> -	if (of_device_is_compatible(child, "ti,omap2-nand")) {
>> -		/* NAND specific setup */
>> -		val = 8;
>> -		of_property_read_u32(child, "nand-bus-width", &val);
>> +	/* DT node can have "nand-bus-width" or "bank-width" or "gpmc,device-width" */
>> +	if (!of_property_read_u32(child, "nand-bus-width", &val)) {
>>  		switch (val) {
>>  		case 8:
>>  			gpmc_s.device_width = GPMC_DEVWIDTH_8BIT;
>> @@ -2183,24 +2181,37 @@ static int gpmc_probe_generic_child(struct platform_device *pdev,
>>  			gpmc_s.device_width = GPMC_DEVWIDTH_16BIT;
>>  			break;
>>  		default:
>> -			dev_err(&pdev->dev, "%pOFn: invalid 'nand-bus-width'\n",
>> -				child);
>> +			dev_err(&pdev->dev,
>> +				"%pOFn: invalid 'nand-bus-width':%d\n", child, val);
>> +			ret = -EINVAL;
>> +			goto err;
>> +		}
>> +	} else if (!of_property_read_u32(child, "bank-width", &val)) {
>> +		if (val != 1 && val != 2) {
>> +			dev_err(&pdev->dev,
>> +				"%pOFn: invalid 'bank-width':%d\n", child, val);
>>  			ret = -EINVAL;
>>  			goto err;
>>  		}
>> +		gpmc_s.device_width = val;
>> +	} else if (!of_property_read_u32(child, "gpmc,device-width", &val)) {
>> +		if (val != 1 && val != 2) {
>> +			dev_err(&pdev->dev,
>> +				"%pOFn: invalid 'gpmc,device-width':%d\n", child, val);
>> +			ret = -EINVAL;
>> +			goto err;
>> +		}
>> +		gpmc_s.device_width = val;
>> +	} else {
>> +		/* default to 8-bit */
>> +		gpmc_s.device_width = GPMC_DEVWIDTH_8BIT;
>> +	}
>>  
>> +	if (of_device_is_compatible(child, "ti,omap2-nand")) {
>> +		/* NAND specific setup */
>>  		/* disable write protect */
>>  		gpmc_configure(GPMC_CONFIG_WP, 0);
>>  		gpmc_s.device_nand = true;
>> -	} else {
>> -		ret = of_property_read_u32(child, "bank-width",
>> -					   &gpmc_s.device_width);
>> -		if (ret < 0 && !gpmc_s.device_width) {
>> -			dev_err(&pdev->dev,
>> -				"%pOF has no 'gpmc,device-width' property\n",
>> -				child);
>> -			goto err;
>> -		}
>>  	}
>>  
>>  	/* Reserve wait pin if it is required and valid */
>>
> 
> 
