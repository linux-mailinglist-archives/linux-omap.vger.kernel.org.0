Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3FC275B6E3F
	for <lists+linux-omap@lfdr.de>; Tue, 13 Sep 2022 15:18:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231702AbiIMNSe (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 13 Sep 2022 09:18:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232236AbiIMNSO (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 13 Sep 2022 09:18:14 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BAD7175A7;
        Tue, 13 Sep 2022 06:18:07 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 25A03612E7;
        Tue, 13 Sep 2022 13:18:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1332AC433C1;
        Tue, 13 Sep 2022 13:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1663075086;
        bh=xuogeMmae4zT8SIRfPgSZkOLLfxJdslWB0l9uOwRQKg=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=pDJEW/H4/D/borWfO0g1TfUN8Jwp1Q5NggtFMs769QUfZ1AjjQRjRBFZLgkMd5AFR
         FjBWZbBatC00zcbi/p3ViM4oeU382BEP753zhf7+7pglOiKHBS0+oTNtMYCzKysUuh
         epEb4TKK/SsyVXywwuK3ZNEAdL8XNSCs6j2K9Pe6DolSfHdGOh6Jo9BnMNPVO3GBcr
         PQQiWYtmGDzKpKw6MUllfSxrbBTUEptWndN51AQA9bGVk9QH9/u6puep7NoBn/sFlY
         p7uU7+f3WahEQkfkwMDtyvMWYCIwCtaMoY69gRLuHPaSP5w9voC7Sxmb9/Qvqfxshg
         59wpOZiB7DIGQ==
Message-ID: <4ffb1f04-ebd2-0d18-b909-5aeb3e0ded81@kernel.org>
Date:   Tue, 13 Sep 2022 16:18:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v3 3/3] dt-bindings: memory-controllers: gpmc-child: add
 wait-pin polarity
Content-Language: en-US
To:     "Niedermayr, BENEDIKT" <benedikt.niedermayr@siemens.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
Cc:     "tony@atomide.com" <tony@atomide.com>,
        "krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
References: <20220906124747.1767318-1-benedikt.niedermayr@siemens.com>
 <20220906124747.1767318-5-benedikt.niedermayr@siemens.com>
 <70a2fec4-e7b9-e8ed-4d8a-d547003dbb9e@kernel.org>
 <125ea34a12928fcdd8ef118eced8b2c59039d2ab.camel@siemens.com>
 <8326572f-8a88-6e8b-edda-7730a0a3597d@kernel.org>
 <ca4f7a8f6f48b02e9dacb1dae27e90edaab2fcc3.camel@siemens.com>
From:   Roger Quadros <rogerq@kernel.org>
In-Reply-To: <ca4f7a8f6f48b02e9dacb1dae27e90edaab2fcc3.camel@siemens.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Benedikt,

On 13/09/2022 11:23, Niedermayr, BENEDIKT wrote:
> Roger,
> 
> On Mon, 2022-09-12 at 14:04 +0300, Roger Quadros wrote:
>> Benedikt,
>>
>> On 12/09/2022 10:43, Niedermayr, BENEDIKT wrote:
>>> On Thu, 2022-09-08 at 15:09 +0300, Roger Quadros wrote:
>>>> Benedikt,
>>>>
>>>>
>>>> On 06/09/2022 15:47, B. Niedermayr wrote:
>>>>> From: Benedikt Niedermayr <benedikt.niedermayr@siemens.com>
>>>>>
>>>>> The GPMC controller has the ability to configure the polarity
>>>>> for
>>>>> the
>>>>> wait pin. The current properties do not allow this
>>>>> configuration.
>>>>> This binding directly configures the WAITPIN<X>POLARITY bit
>>>>> in the GPMC_CONFIG register.
>>>>>
>>>>> Signed-off-by: Benedikt Niedermayr <
>>>>> benedikt.niedermayr@siemens.com
>>>>> ---
>>>>>  .../bindings/memory-controllers/ti,gpmc-child.yaml          |
>>>>> 6
>>>>> ++++++
>>>>>  1 file changed, 6 insertions(+)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/memory-
>>>>> controllers/ti,gpmc-child.yaml
>>>>> b/Documentation/devicetree/bindings/memory-controllers/ti,gpmc-
>>>>> child.yaml
>>>>> index 6e3995bb1630..a115b544a407 100644
>>>>> --- a/Documentation/devicetree/bindings/memory-
>>>>> controllers/ti,gpmc-
>>>>> child.yaml
>>>>> +++ b/Documentation/devicetree/bindings/memory-
>>>>> controllers/ti,gpmc-
>>>>> child.yaml
>>>>> @@ -230,6 +230,12 @@ properties:
>>>>>        Wait-pin used by client. Must be less than "gpmc,num-
>>>>> waitpins".
>>>>>      $ref: /schemas/types.yaml#/definitions/uint32
>>>>>  
>>>>> +  gpmc,wait-pin-active-low:
>>>>> +    description: |
>>>>> +      Set the polarity for the selected wait pin to active
>>>>> low.
>>>>> +      Defaults to active high if this is not set.
>>>>> +    type: boolean
>>>>> +
>>>>
>>>> I just checked that the default behaviour is active low.
>>>> Reset value of the polarity register field is 0, which means
>>>> active
>>>> low.
>>>>
>>>> We will need to use the property "gpmc,wait-pin-active-high"
>>>> instead.
>>>>
>>>> Sorry for not catching this earlier.
>>>
>>> It's ok. No worries.
>>>
>>> Well, the Datasheets are telling me different reset values here. 
>>> The am335x TRM (Rev. Q) defines the reset value of WAIT1PINPOLARITY
>>> as
>>> 0x0, whereas the am64x TRM (Rev. C) defines the reset value of
>>> WAIT1PIN
>>> POLARITY as 0x1. The am64x TRM also defines different reset values
>>> for 
>>> WAIT0PINPOLARITY and WAIT1PINPOLARITY.
>>>
>>> The interesting thing is that I'm currently working on an am335x
>>> platform and I dumped the GPMC_CONFIG register and got 0x00000a00
>>> (WAIT1PINPOLARITY == 0x1). So It doesn't behave like the TRM
>>> specifies.
>>
>> I can confirm the same behaviour on am642 EVM as well.
>> I get 0xa00 on reading GPMC_CONFIG.
>>
>>>
>>> Nevertheless, I'm setting the WAITXPINPOLARITY bits in both cases
>>> accordingly.  
>>> 0x0 in case "gpmc,wait-pin-active-low" is set and 0x1 in case
>>> "gpmc,wait-pin-active-low" is not set. So the reset value is always
>>> overwritten.
>>>
>>>
>>> Using "gpmc,wait-pin-active-high" rather than "gpmc,wait-pin-
>>> active-low
>>> " is also ok for me, but it feels more like a cosmetic thing at
>>> this
>>> point. 
>>
>> My main concern is for legacy platforms not specifying the property
>> in DT.
>> Earlier we were not touching the WAITPINPOLARITY config and now we
>> are
>> so we might break some legacy platforms that don't specify
>> the polarity and we flip it here.
>>
>> Fortunately, there are only few boards using gpmc wait-pin and mostly
>> wait-pin 0
>> for which there is no discrepancy as far as wait-pin reset value is
>> concerned.
>>
>> logicpd-torpedo-baseboard.dtsi:		gpmc,wait-pin = <0>;
>> omap3-devkit8000-common.dtsi:		gpmc,wait-pin = <0>;
>> Binary file omap3-devkit8000.dtb matches
>> Binary file omap3-devkit8000-lcd43.dtb matches
>> Binary file omap3-devkit8000-lcd70.dtb matches
>> omap3-lilly-a83x.dtsi:		gpmc,wait-pin = <0>;
>> Binary file omap3-lilly-dbb056.dtb matches
>> Binary file omap3-zoom3.dtb matches
>>
>> Only 1 board is using wait-pin 1
>> omap-zoom-common.dtsi:		gpmc,wait-pin = <1>;
>>
>> from OMP36xx TRM, here are the reset values
>> WAIT3PINPOLARITY 0x1
>> WAIT2PINPOLARITY 0x0
>> WAIT1PINPOLARITY 0x1
>> WAIT0PINPOLARITY 0x0
> 
> Ah ok. The picture is getting clearer.
> 
> Does it make sense then not to use a boolean property in that case?
> With a boolean property we are only able to change the polarity bits
> into one direction (0 -> 1 or 1 -> 0) but we have different reset
> values for each bit.
> 
> This part of my patch may then break the mentioned legacy platforms
> because it even overwrites the register in case the property is not
> set:
> 
> 
> +	if (p->wait_pin_active_low)
> +		config1 &= ~GPMC_CONFIG_WAITPINPOLARITY(p->wait_pin);
> +	else
> +		config1 |= GPMC_CONFIG_WAITPINPOLARITY(p->wait_pin);
> +
> +	gpmc_write_reg(GPMC_CONFIG, config1);
> 
> 
> So in order to preserve compatibility as well as the possibility to
> change the polarity bits into the desired value I would propose to use
> an uint32 value for the desired value and in case the dt-property is
> not set we should not touch the register at all.

I'm sorry I didn't understand how uint32 value solves this issue.
Could you please explain with a DT example?

cheers,
-roger
