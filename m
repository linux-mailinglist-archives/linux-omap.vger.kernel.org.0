Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64FB95BDE4A
	for <lists+linux-omap@lfdr.de>; Tue, 20 Sep 2022 09:34:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229568AbiITHeG (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 20 Sep 2022 03:34:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229543AbiITHeF (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 20 Sep 2022 03:34:05 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B21C15FF62;
        Tue, 20 Sep 2022 00:34:04 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 6DDB9B82552;
        Tue, 20 Sep 2022 07:34:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A93FC433D6;
        Tue, 20 Sep 2022 07:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1663659242;
        bh=12BU8+Ojmc1Pl56NS83NlbBfNGt5agiHM6EFDTuNZAk=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=cc6flRrBxNkKWfdsgS1WcvtTxH/UxgYankgAJJ06M749lTQrdlhGLmD52q/ltyPtW
         TKVdPuAo2ebQ8ptd83EaLIVfURT/2RKs68UZEyTFHBINScaBzwsBFNYjCqkFmtyewx
         asH/gSP7zLudXFxg8jutHyqTKEI1NEHmcH4qr8Tb2BgxUDClBrsEM9woV9nwwq5a9n
         0U+4jqZFGjX+RAx/q7OUK4NBOOZObXbel9Pv9Jn0u5CmGQ7GeRwcl4mQlXMMPOLUOc
         mSY+RnrGcEODGvaj/He6M7ITx+ZbRj7jMTwKIRczqJxp7Oyq7LSHBzS1r806qqB/rs
         rMERUmGw2bPEg==
Message-ID: <acb1648d-3382-960a-6711-d1bad816f000@kernel.org>
Date:   Tue, 20 Sep 2022 10:33:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v5 2/3] memory: omap-gpmc: add support for wait pin
 polarity
Content-Language: en-US
To:     "Niedermayr, BENEDIKT" <benedikt.niedermayr@siemens.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
Cc:     "tony@atomide.com" <tony@atomide.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
References: <20220916120749.2517727-1-benedikt.niedermayr@siemens.com>
 <20220916120749.2517727-3-benedikt.niedermayr@siemens.com>
 <6dd3d41b-eb75-3754-8a17-a8cb4bc838a8@linaro.org>
 <f6f59421ac9b0e2c0b85918282c33f325726c4bd.camel@siemens.com>
From:   Roger Quadros <rogerq@kernel.org>
In-Reply-To: <f6f59421ac9b0e2c0b85918282c33f325726c4bd.camel@siemens.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-9.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 19/09/2022 16:25, Niedermayr, BENEDIKT wrote:
> Hi Krzysztof,
> 
> On Mon, 2022-09-19 at 11:38 +0200, Krzysztof Kozlowski wrote:
>> On 16/09/2022 14:07, B. Niedermayr wrote:
>>> From: Benedikt Niedermayr <benedikt.niedermayr@siemens.com>
>>>
>>> The waitpin polarity can be configured via the WAITPIN<X>POLARITY bits
>>> in the GPMC_CONFIG register. This is currently not supported by the
>>> driver. This patch adds support for setting the required register bits
>>> with the "gpmc,wait-pin-polarity" dt-property.
>>>
>>> Signed-off-by: Benedikt Niedermayr <benedikt.niedermayr@siemens.com>
>>> ---
>>>  drivers/memory/omap-gpmc.c              | 27 +++++++++++++++++++++++++
>>>  include/linux/platform_data/gpmc-omap.h |  6 ++++++
>>>  2 files changed, 33 insertions(+)
>>>
>>> diff --git a/drivers/memory/omap-gpmc.c b/drivers/memory/omap-gpmc.c
>>> index ea495e93766b..2853fc28bccc 100644
>>> --- a/drivers/memory/omap-gpmc.c
>>> +++ b/drivers/memory/omap-gpmc.c
>>> @@ -132,6 +132,7 @@
>>>  #define GPMC_CONFIG_DEV_SIZE	0x00000002
>>>  #define GPMC_CONFIG_DEV_TYPE	0x00000003
>>>  
>>> +#define GPMC_CONFIG_WAITPINPOLARITY(pin)	(BIT(pin) << 8)
>>>  #define GPMC_CONFIG1_WRAPBURST_SUPP     (1 << 31)
>>>  #define GPMC_CONFIG1_READMULTIPLE_SUPP  (1 << 30)
>>>  #define GPMC_CONFIG1_READTYPE_ASYNC     (0 << 29)
>>> @@ -1882,6 +1883,17 @@ int gpmc_cs_program_settings(int cs, struct gpmc_settings *p)
>>>  
>>>  	gpmc_cs_write_reg(cs, GPMC_CS_CONFIG1, config1);
>>>  
>>> +	if (p->wait_pin_polarity != WAITPINPOLARITY_DEFAULT) {
>>> +		config1 = gpmc_read_reg(GPMC_CONFIG);
>>> +
>>> +		if (p->wait_pin_polarity == WAITPINPOLARITY_ACTIVE_LOW)
>>> +			config1 &= ~GPMC_CONFIG_WAITPINPOLARITY(p->wait_pin);
>>> +		else if (p->wait_pin_polarity == WAITPINPOLARITY_ACTIVE_HIGH)
>>> +			config1 |= GPMC_CONFIG_WAITPINPOLARITY(p->wait_pin);
>>> +
>>> +		gpmc_write_reg(GPMC_CONFIG, config1);
>>
>> What happens if wait pin is shared and you have different polarities in
>> both of devices?
> In this case the second one wins and will overwrite the polarity of the first one.
> But that would be the result of a misconfiguration in the DT. 
> 
> I'm not sure how to proceed here? Does it make sense to add a check for different 
> waitpin polarities?
> 

Yes I think it is better to check and fail if different polarity is requested than the first time.
Else it will be a potential debugging nightmare. ;)

> 
>>
>>> +	}
>>> +
>>>  	return 0;
>>>  }
>>>  
>>> @@ -1981,7 +1993,22 @@ void gpmc_read_settings_dt(struct device_node *np, struct gpmc_settings *p)
>>>  				__func__);
>>>  	}
>>>  
>>> +	p->wait_pin_polarity = WAITPINPOLARITY_DEFAULT;
>>> +
>>>  	if (!of_property_read_u32(np, "gpmc,wait-pin", &p->wait_pin)) {
>>> +		if (!of_property_read_u32(np, "gpmc,wait-pin-polarity",
>>> +					  &p->wait_pin_polarity)) {
>>> +			if (p->wait_pin_polarity != WAITPINPOLARITY_ACTIVE_HIGH &&
>>> +			    p->wait_pin_polarity != WAITPINPOLARITY_ACTIVE_LOW &&
>>> +			    p->wait_pin_polarity != WAITPINPOLARITY_DEFAULT) {
>>
>> WAITPINPOLARITY_DEFAULT is not allowed in DT, so you can skip it.
> This value is not assigned from the DT. It is only assigned within the GPMC and serves as a init
> value (right before the if clause). This helps in case no configuration from DT is done where the 
> GPMC registers should stay untouched.
> 
>>
>>> +				pr_err("%s: Invalid wait-pin-polarity (pin: %d, pol: %d)\n",
>>
>> dev_err, not pr_err
> 
> Ok. I didn't want to introduce dev_* functions. Currently pr_* functions where used all over the place.
> 
>>
>>> +				       __func__, p->wait_pin, p->wait_pin_polarity);
>>
>> Skip __func__
>>
> Ok.
> 
>>> +				p->wait_pin_polarity = WAITPINPOLARITY_DEFAULT;
>>> +			}
>>> +		} else {
>>> +			pr_err("%s: Failed to read gpmc,wait-pin-polarity\n", __func__);
>>
>> Ditto.
> Ok.
> 
>>
>>> +		}
>>> +
>>>  		p->wait_on_read = of_property_read_bool(np,
>>>  							"gpmc,wait-on-read");
>>>  		p->wait_on_write = of_property_read_bool(np,
>>> diff --git a/include/linux/platform_data/gpmc-omap.h b/include/linux/platform_data/gpmc-omap.h
>>> index c9cc4e32435d..c46c28069c31 100644
>>> --- a/include/linux/platform_data/gpmc-omap.h
>>> +++ b/include/linux/platform_data/gpmc-omap.h
>>> @@ -136,6 +136,11 @@ struct gpmc_device_timings {
>>>  #define GPMC_MUX_AAD			1	/* Addr-Addr-Data multiplex */
>>>  #define GPMC_MUX_AD			2	/* Addr-Data multiplex */
>>>  
>>> +/* Wait pin polarity values */
>>> +#define WAITPINPOLARITY_DEFAULT -1
>>
>> Missing prefix. This is a global header.
> Ok. Makes sense.
>>
>>> +#define WAITPINPOLARITY_ACTIVE_LOW 0
>>> +#define WAITPINPOLARITY_ACTIVE_HIGH 1
>>> +
>>>  struct gpmc_settings {
>>>  	bool burst_wrap;	/* enables wrap bursting */
>>>  	bool burst_read;	/* enables read page/burst mode */
>>> @@ -149,6 +154,7 @@ struct gpmc_settings {
>>>  	u32 device_width;	/* device bus width (8 or 16 bit) */
>>>  	u32 mux_add_data;	/* multiplex address & data */
>>>  	u32 wait_pin;		/* wait-pin to be used */
>>> +	u32 wait_pin_polarity;	/* wait-pin polarity */
>>
>> Skip the comment. You just copied the name of variable. Such comments
>> are useless.
>>
>> We do not have KPIs in kernel to achieve some comment-ratio...
>>
> Ok, makes sense.
> 
>> Best regards,
>> Krzysztof
> 

cheers,
-roger
