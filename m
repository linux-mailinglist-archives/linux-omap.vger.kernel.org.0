Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 61CB95BEA32
	for <lists+linux-omap@lfdr.de>; Tue, 20 Sep 2022 17:27:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231527AbiITP1p (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 20 Sep 2022 11:27:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231543AbiITP1n (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 20 Sep 2022 11:27:43 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A76746714B;
        Tue, 20 Sep 2022 08:27:42 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 46AE16231E;
        Tue, 20 Sep 2022 15:27:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46B6CC433C1;
        Tue, 20 Sep 2022 15:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1663687661;
        bh=e27Y6UBWhAmW6etkkY5ohj7pffHYBUnCJBLrsFeihIo=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=oATgZm/9gjk0NbJ0nA0DwCW8MN28e1QgNi2X3DOFk+/ST7xvdMQ7F97mrdZjgcxc1
         kL/+1SX8Qls4IYWM1pmGdQb5wXpWbei0/SjIh3h4kmjpSaW2eENjjroocLy4pViaw8
         6GOmqmlioBUfLqwA5myyvD/mlr112s/75lFcRbAFRyhahIFqVDVmzbl/eQ8vMcSB57
         aaBIGT+8s0u0mvmKnWI2gtwrJ6AfDr98M5I+XYLqsBafI5jMdVmjtQGdUn72YkrANh
         dVrdpxIjWJVHyXebugeDg35yL5V2o1uMRiSUOYU2oERtgsiCCxbYB7YF65C4fVjQDx
         90WMtqsJLFBig==
Message-ID: <bf2d96c3-366c-9ad2-5632-ee7ab5d99b39@kernel.org>
Date:   Tue, 20 Sep 2022 18:27:37 +0300
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
 <cdc59072-648c-ce53-b9a5-b796d379e575@linaro.org>
 <24e5fa6065f68a25226b4aee02b8f900b630befa.camel@siemens.com>
 <0afa173f-9f7f-b2c8-7abc-2384ee46429d@linaro.org>
 <df05bbf214c92fcda6d7b003b49f20fd8755b97c.camel@siemens.com>
 <8d45ba5e-4d69-899f-94f3-af4374a870b2@linaro.org>
 <d7b86ccf4c66e590c247ad24f84944ccdc3b1902.camel@siemens.com>
From:   Roger Quadros <rogerq@kernel.org>
In-Reply-To: <d7b86ccf4c66e590c247ad24f84944ccdc3b1902.camel@siemens.com>
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

Hi,

On 20/09/2022 15:17, Niedermayr, BENEDIKT wrote:
> Hi Krzysztof,
> 
> On Tue, 2022-09-20 at 13:23 +0200, Krzysztof Kozlowski wrote:
>> On 20/09/2022 12:12, Niedermayr, BENEDIKT wrote:
>>>> I commented exactly below the line which I question. I don't question
>>>> other lines. So let me be a bit more specific:
>>>>
>>>> Why do you need
>>>> "p->wait_pin_polarity != WAITPINPOLARITY_DEFAULT"
>>>> ? Can you write a scenario where this is useful?
>>>>
>>> Ok. I think I got you now. Sorry I'm relatively new to OSS contributions, so please be patient with me...
>>>
>>> If I remove that part of the if clause, then an error message would be printed in case "p->wait_pin_polarity == WAITPINPOLARITY_DEFAULT".
>>
>> Exactly this will happen. As expected. This value cannot appear in DTS,
>> therefore I would expect error message.
>>
>> Now you allow such value in DTS which is not the same as your bindings.
>>
> And now I completely got it...
> With this implementation it's even possible to set WAITPINPOLARITY_DEFAULT in the DT...
> 
> Ok, changing this will lead to an error message if the "gpmc,wait-pin-polarity" is not set in DT. Means the DT property is more orless not an optional
> property anymore.
> If one defines the wait-pin without defining the polarity the driver probes successfully but and error message is printed.
> Is this an acceptable solution for you?
> 

No this is not acceptable. As current implementations don't define polarity and rely on reset defaults.

You can check return value of "of_property_read_u32(np, "gpmc,wait-pin-polarity", &p->wait_pin_polarity))"

" * Return: 0 on success, -EINVAL if the property does not exist,
 * -ENODATA if property does not have a value, and -EOVERFLOW if the
 * property data isn't large enough."

If property is present you don't need to check for WAITPINPOLARITY_DEFAULT as that is not valid value for this property.
If property is not present you force WAITPINPOLARITY_DEFAULT and don't print error message.


> 
>>
>>> But this is a not an error case. WAITPINPOLARITY_DEFAULT is a valid value, is assigned right before the if clause as an init value(not extracted from
>>> DT),
>>> and leads to not touching the GPMC_CONFIG register in gpmc_cs_program_settings().
>>> So in gpmc_cs_program_settings() if:
>>>     p->wait_pin_polarity != WAITPINPOLARITY_ACTIVE_HIGH -> Issue a write to the GPMC_CONFIG register
>>>     p->wait_pin_polarity != WAITPINPOLARITY_ACTIVE_LOW  -> Issua a write to the GPMC_CONFIG register
>>>     p->wait_pin_polarity != WAITPINPOLARITY_DEFAULT     -> Do not touch the GPMC_CONFIG register
>>>
>>> We want to preserve the reset value of the GPMC_CONFIG register in case the DT does not use the "gpmc,wait-pin-polarity" property. Otherwise
>>> we might break platforms which rely on these reset values. 
>>
>> Best regards,
>> Krzysztof
> Cheers,
> benedikt
> 

cheers,
-roger
