Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2BB845AE6B8
	for <lists+linux-omap@lfdr.de>; Tue,  6 Sep 2022 13:38:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232298AbiIFLiU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 6 Sep 2022 07:38:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232100AbiIFLiT (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 6 Sep 2022 07:38:19 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECA764B489;
        Tue,  6 Sep 2022 04:38:17 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7F26C60BBC;
        Tue,  6 Sep 2022 11:38:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BC74C433C1;
        Tue,  6 Sep 2022 11:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1662464296;
        bh=BVuc9xFybbikdkJt51oO5pgW6cjptM3MqTB1J0apSto=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=G5QQT5qfM0IoJW6eDbmXZY3gJ8flwEgAgGdS8ilvUAKQuzN7iY1mg8jD2VkcBlM/a
         pxmHvtI07xK+kQXybGpQLappRc/TKDxEjVfNx8jtXRShObaPSGuH6NyhF+Ugwy1rhh
         8yecR0PrZimODE4HCmqpAZNNWVylHGJcPSF5V86TVm8NxNZz6xDHgqRjYNRYyqSetT
         fdLIXYBnC4U63qx3e6LPlXW4fU0vsawAy9RqyJRa8qaN2ORHXTNbHQZ65w9AkzUoZe
         /1CkB96ZI7Z6iARWlr7+fg6FFp71m4Q+hhYEmpY2t+ZskIgABU7rYIHzZX8acI/3qZ
         mQLU3oKEcw1uQ==
Message-ID: <bd6048b7-3fb1-e68f-e34f-9f0c1c8c2603@kernel.org>
Date:   Tue, 6 Sep 2022 14:38:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 3/3] dt-bindings: memory-controllers: gpmc-child: Add
 binding for wait-pin-polarity
Content-Language: en-US
To:     "Niedermayr, BENEDIKT" <benedikt.niedermayr@siemens.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
Cc:     "tony@atomide.com" <tony@atomide.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
References: <20220905071717.1500568-1-benedikt.niedermayr@siemens.com>
 <20220905071717.1500568-4-benedikt.niedermayr@siemens.com>
 <d75ff1cf-64a6-e794-87a2-204e93c852cf@kernel.org>
 <e284855271a3fdf6bb2cd304629c2aa3bb8401f3.camel@siemens.com>
 <eedebc54-7817-d61b-f854-09eb11be4ada@kernel.org>
 <0ee691a3-d22e-b685-9d5c-f974ac3afe19@linaro.org>
 <6397b5d11c786ee6194776e096380103976049dd.camel@siemens.com>
 <7e7a1cf6-8a11-2179-8fe6-c40e7cd8be62@linaro.org>
 <cea66905a1f9ae09c9742b5040195c93759d5a1d.camel@siemens.com>
From:   Roger Quadros <rogerq@kernel.org>
In-Reply-To: <cea66905a1f9ae09c9742b5040195c93759d5a1d.camel@siemens.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-8.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

On 05/09/2022 16:33, Niedermayr, BENEDIKT wrote:
> On Mon, 2022-09-05 at 14:08 +0200, Krzysztof Kozlowski wrote:
>> On 05/09/2022 13:48, Niedermayr, BENEDIKT wrote:
>>> On Mon, 2022-09-05 at 11:54 +0200, Krzysztof Kozlowski wrote:
>>>> On 05/09/2022 11:21, Roger Quadros wrote:
>>>>> On 05/09/2022 12:14, Niedermayr, BENEDIKT wrote:
>>>>>> On Mon, 2022-09-05 at 11:56 +0300, Roger Quadros wrote:
>>>>>>> Hi Benedikt,
>>>>>>>
>>>>>>> On 05/09/2022 10:17, B. Niedermayr wrote:
>>>>>>>> From: Benedikt Niedermayr <
>>>>>>>> benedikt.niedermayr@siemens.com>
>>>>>>>>
>>>>>>>> Add a new dt-binding for the wait-pin-polarity property
>>>>>>>>
>>>>>>>> Signed-off-by: Benedikt Niedermayr <
>>>>>>>> benedikt.niedermayr@siemens.com
>>>>>>>> ---
>>>>>>>>  .../bindings/memory-controllers/ti,gpmc-
>>>>>>>> child.yaml         | 
>>>>>>>> 7
>>>>>>>> +++++++
>>>>>>>>  1 file changed, 7 insertions(+)
>>>>>>>>
>>>>>>>> diff --git a/Documentation/devicetree/bindings/memory-
>>>>>>>> controllers/ti,gpmc-child.yaml
>>>>>>>> b/Documentation/devicetree/bindings/memory-
>>>>>>>> controllers/ti,gpmc-
>>>>>>>> child.yaml
>>>>>>>> index 6e3995bb1630..7c721206f10b 100644
>>>>>>>> --- a/Documentation/devicetree/bindings/memory-
>>>>>>>> controllers/ti,gpmc-
>>>>>>>> child.yaml
>>>>>>>> +++ b/Documentation/devicetree/bindings/memory-
>>>>>>>> controllers/ti,gpmc-
>>>>>>>> child.yaml
>>>>>>>> @@ -230,6 +230,13 @@ properties:
>>>>>>>>        Wait-pin used by client. Must be less than
>>>>>>>> "gpmc,num-
>>>>>>>> waitpins".
>>>>>>>>      $ref: /schemas/types.yaml#/definitions/uint32
>>>>>>>>  
>>>>>>>> +  gpmc,wait-pin-polarity:
>>>>>>>> +    description: |
>>>>>>>> +      Wait-pin polarity used by the clien. It relates to
>>>>>>>> the
>>>>>>>> pin
>>>>>>>> defined
>>>>>>>
>>>>>>> did you mean "client?"
>>>>>>> Can you please specify what value is for Active Low vs
>>>>>>> Active
>>>>>>> High?
>>>>>>
>>>>>> Yes, that makes sense. And yes I meant "client". My typo.....
>>>>>>>> +      with "gpmc,wait-pin".
>>>>>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>>>>>>
>>>>>>> Why can't type be boolean?
>>>>>>
>>>>>> Of course we can use the boolean there. In that case I should
>>>>>> give the
>>>>>> property a more meaningful name e.g. wait-pin-active-high or
>>>>>> wait-pin-
>>>>>> active-low. 
>>>>>> Since the default behavour of this pin is Active High,
>>>>>> a bool property "gpmc,wait-pin-active-low" would make more
>>>>>> sense
>>>>>> for
>>>>>> backwards compatibility. 
>>>>>> If the property is missing, than the polarity stays on Active
>>>>>> High like
>>>>>> before.
>>>>>>
>>>>>
>>>>> OK, in that case you don't have to clarify the polarity in
>>>>> description.
>>>>
>>>> I don't understand (and it is not explained in commit msg), why
>>>> do
>>>> you
>>>> need such property instead of using standard GPIO flags.
>>>>
>>>> The driver should use standard GPIO descriptor and standard
>>>> bindings.
>>>> If
>>>> it cannot, this has to be explained.
>>>>
>>>> Best regards,
>>>> Krzysztof
>>>
>>> I think this is beacause the GPMC controller itself is not
>>> respecting
>>> the GPIO flags. Instead the GPMC is reading the Line Level directly
>>> (high,low) and then evaluates the logic depending how
>>> the WAIT<x>PINPOLARITY bit is set in the GPMPC_CONFIG register.
>>>
>>> Until now gpiochip_request_own_desc() was hardcorded
>>> to GPIO_ACTIVE_HIGH. An the GPMC_CONFIG register configuration has
>>> no
>>> relation to the GPIO setting (in the current implementation).
>>> My first approach was to make this part configurable via a new
>>> device
>>> tree property (wait-pin-polarity).
>>>
>>> IMHO (correct me if I'm wrong) the current implementation also does
>>> not
>>> make ues of standart GPIO bindings and defines the wait pin via a
>>> separate "gpmc,waitpin" binding.
>>>
>>> E.g. gpmc,watipin = <0> or gpmc,waitpin=<1>
>>>
>>> The best solution would should be when setting the binding this way
>>> for
>>> example: gpmc,wait-pin = <&gpiox y ACTIVE_X>
>>
>> Yes and I am afraid this will grow instead of adding proper GPIO
>> usage.
>> Any reason why it cannot be a standard GPIO pin desc?
> 
> This change (gpmc,wait-pin = <&gpiox y ACTIVE_X>) may break current
> implementations when the GPMC is used with NAND devices. It comes to
> some configuration in the GPMC_CONFIG register when IRQs are setup
> in Nand Mode. 
> 
> But when using the Nand mode the register configuration in question is
> properly configured, but in a complete different context:
> 
> E.g. in am335x-baltos.dtsi:

Let me clarify a bit.

The GPMC subsystem has one wait_pin per Chip select region. Some SoCs
may have 2 Chip Selects some may have more.

Each wait_pin can be used in 2 ways currently.
1) As a General purpose GPIO (GPI actually as output not supported)
via the Linux GPIO subsystem
2) As a wait state signalling for memory interface independently to
Linux GPIO subsystem. Via GPMC configuration.

> 
> interrupts = <0 IRQ_TYPE_NONE>, /* fifoevent */
>              <1
> IRQ_TYPE_NONE>; /* termcount */
> rb-gpios = <&gpmc 0 GPIO_ACTIVE_HIGH>;

The rb-gpios is an example of (1) I listed above. Here you can use
the standard GPIO polarity specifier and it should work currently.

An example of (2) you can see in omap3-devkit8000-common.dtsi:
        ethernet@6,0 {
                compatible = "davicom,dm9000";
		...
                gpmc,mux-add-data = <0>;
                gpmc,device-width = <1>;
-->             gpmc,wait-pin = <0>;
		..
        };

Here we set the GPMC hardware configuration to use wait_pin of
Chip Select 0 to add wait state to each bus access cycle to the
external Ethernet device. Linux GPIO subsystem has no role to play
here and everything is dealt with in GPMC hardware.

Now what this current patch series is trying to do is to add a
polarity specifier to the use case (2).
There is a GPMC hardware setting to decide the polarity of the wait_pin.
The code just needs to get the polarity setting from DT and set
this setting correctly.
I don't think this has got to do anything with GPIO as it is very specific
to GPMC configuration. So the vendor specific property, "gpmc,wait-pin-active-low"
is appropriate I think.

Hope this clarifies everything ;)


> /* gpmc_wait0 */
> 
> The "interrupts" property will configure the GPMC_CONFIG register bits
> for the waitpins. 
> 
> But in a non-NAND case, the "interrupt" configuration wouldn't make any
> sense, since interrupts are not used at all.
> 
> The "rb-gpios" is *not* handled by the omap-gpmc(maybe somewhere in the
> NAND subsystem?). 
> 
> Changing the wait-pin property to "gpmc,wait-pin = <&gpmc X ACTIVE_X>"
> will currently break at least 3 device trees:
> 
> arch/arm/boot/dts/omap3-devkit8000-common.dtsi
> arch/arm/boot/dts/omap-zoom-common.dtsi
> arch/arm/boot/dts/omap3-lilly-a83x.dtsi
> 
>  
> I think it makes sense to implement a v3 as POC?
> 
>>> But I think the current omap-gpmc.c implementation does not offer
>>> such
>>> a usecase and as roger already mentioned: 
>>> "GPMC wait_pin polarity logic is hard-wired and doesn't depend on
>>> GPIO
>>> subsystem for its polarity"
>>
>> This part I don't get. You mean hard-wired in the driver or hard-
>> wired
>> in the hardware? If the first, please un-wire it. If the latter, your
>> property makes no sense, right?
>>
> IMHO roger meant that configuring the GPMC registers via gpiolib
> callbacks would be the wrong place to implementent. I implemented 
> the gpmc register configuration in the gpio_direction_input function.
> 
> 
>> Best regards,
>> Krzysztof
> 

cheers,
-roger
