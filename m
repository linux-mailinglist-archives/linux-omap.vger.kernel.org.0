Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49CD35BDE8A
	for <lists+linux-omap@lfdr.de>; Tue, 20 Sep 2022 09:41:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231163AbiITHkt (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 20 Sep 2022 03:40:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231271AbiITHkF (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 20 Sep 2022 03:40:05 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A6FC1F2FA
        for <linux-omap@vger.kernel.org>; Tue, 20 Sep 2022 00:39:40 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id f14so2371153lfg.5
        for <linux-omap@vger.kernel.org>; Tue, 20 Sep 2022 00:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=nc7FAnhJslPM3aj8fWk0BlLztY57x3kAnKtRYymnzVI=;
        b=ICSaCjJ3Z8yhjSzU+1bRQzjF0WCTMASmaRiTYwnitYObRN75qRZIIA8ZVATkwocZZp
         AhjWbIFIMOT6ipm8byi1mjkZRnfYIfonS/bf5VQxVm7JJ6EUMnkR+WEma24pjyjXeCaP
         LD9Brlb5/wV008y2JHDHXh7nNSVsWCLaSutxM98QMuSa0bUi0u5RJxaKsC+mHS7Ka0Uj
         HrYqxWjrXgnsmflDmI94iZovBIQhoWyiAiR1mcDsuf1E4BTk0PAGVGnKiZfcDwQaMk6b
         vZJqAcy4kGE6qktNgm5LMGSSjrNaIhe4zBZEKcK/8sInVniaJ5el6HiKznA+lCz5UPJW
         uoHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=nc7FAnhJslPM3aj8fWk0BlLztY57x3kAnKtRYymnzVI=;
        b=bBMP/E9xA6rQQron0gjSNFf/uU33rqiDH3F3sgU1bcYGxH4dN0szrJol537p7zOi+K
         vhKh4er/Eh/uHxaGVS7GPmZpUQ2tk6mhf0w2syDCHsDNC97wu5APQxTjBVCWWkKvfNQr
         0elBjibxEkK6hiW3Ysuw1CUAx6020jakOXQL3KZ9y/1mcLQLjbpAVHlcuMhFpbNNAge2
         E0xWGRofEPtnx0/jJSQb/SvZIccRiEy988W6oLVFXUZ4GQACRYZmkEvHEJx1kYAZ/Wwu
         Dgne50bXQ5ixVUbpbsHmNz+oVu7E2fxRZAfDD4/I70iCTLCeQQMcXko2yC8iwhCsLjQa
         2OLw==
X-Gm-Message-State: ACrzQf2UG0filwH11+vQHa6CdNMNwWePGDBoMo6eueb+7cBdDxgfihg3
        Gu/TtOp7bvufjl3NaQed2dnlOw==
X-Google-Smtp-Source: AMsMyM6O5nk67vvEFT3y/FNnvEcEBbKYpUGpV1HXphGrKS4OuRoCLdsYouFN4hpTbbe5q3pxiG0dEw==
X-Received: by 2002:a19:5e50:0:b0:497:a331:91d9 with SMTP id z16-20020a195e50000000b00497a33191d9mr7855037lfi.162.1663659578265;
        Tue, 20 Sep 2022 00:39:38 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id 1-20020ac25f01000000b0049f5358062dsm180311lfq.98.2022.09.20.00.39.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Sep 2022 00:39:37 -0700 (PDT)
Message-ID: <cdc59072-648c-ce53-b9a5-b796d379e575@linaro.org>
Date:   Tue, 20 Sep 2022 09:39:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v5 2/3] memory: omap-gpmc: add support for wait pin
 polarity
Content-Language: en-US
To:     "Niedermayr, BENEDIKT" <benedikt.niedermayr@siemens.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
Cc:     "rogerq@kernel.org" <rogerq@kernel.org>,
        "tony@atomide.com" <tony@atomide.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
References: <20220916120749.2517727-1-benedikt.niedermayr@siemens.com>
 <20220916120749.2517727-3-benedikt.niedermayr@siemens.com>
 <6dd3d41b-eb75-3754-8a17-a8cb4bc838a8@linaro.org>
 <f6f59421ac9b0e2c0b85918282c33f325726c4bd.camel@siemens.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <f6f59421ac9b0e2c0b85918282c33f325726c4bd.camel@siemens.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 19/09/2022 15:25, Niedermayr, BENEDIKT wrote:
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

In many cases drivers do not accept blindly a DT, but perform some basic
sanity on it, especially if mistake is easy to make (e.g. with
overlays). Such design of DT is just fragile. Schema cannot validate it,
driver does not care, mistake is quite possible.

> 
> I'm not sure how to proceed here? Does it make sense to add a check for different 
> waitpin polarities?

I don't know. I would just disallow such sharing entirely or disallow
sharing if DT is misconfigured.


> 
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

I don't see it. Your code is:

p->wait_pin_polarity = WAITPINPOLARITY_DEFAULT;
# and DT has WAITPINPOLARITY_DEFAULT
if (....) {
  pr_err
  p->wait_pin_polarity = WAITPINPOLARITY_DEFAULT;
} else {
  pr_err
}

so how this helps in case no configuration from DT is done?

Best regards,
Krzysztof
