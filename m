Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4CAD15ACEBC
	for <lists+linux-omap@lfdr.de>; Mon,  5 Sep 2022 11:23:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236283AbiIEJVW (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 5 Sep 2022 05:21:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236216AbiIEJVM (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 5 Sep 2022 05:21:12 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5826A3ECEE;
        Mon,  5 Sep 2022 02:21:11 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id A622BCE10E1;
        Mon,  5 Sep 2022 09:21:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFBA8C433D6;
        Mon,  5 Sep 2022 09:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1662369667;
        bh=ptxuZG4Zk9G7RVWmKc5/Z8aPFdisqj7T38aPHulvzAc=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=O2lakoHqF27D7zQCvZjexwQldXiyCCpAoQv+9Tjr0l+CZKZaxkLGiOb0LPKwrZLzh
         9C44U4Ul1v186uSJbhofcDvazfrZjcVEXAtPxk2Iry2XZOwKnwU2l2M4frd2mgEp0O
         jvE4uRzY7EdsZXgVTk1vCHG7BUofwNhT1mPfQK5yJ0KBT9Bt+beKHgnCokhNPnYW4n
         TJf5uSdHof6zDuK7ctFtOLjBTCSnXKI1t+XYSDshuh8sC4Ga+IafbuQ1e2WPbuE+Qf
         UZxfbcUQbHR4CioDHXjplwh+eBFgGwv69UGawBvNCLvNY5P9b2VmV848EO1crRJqsV
         3JuBIiUmPxfbw==
Message-ID: <eedebc54-7817-d61b-f854-09eb11be4ada@kernel.org>
Date:   Mon, 5 Sep 2022 12:21:03 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 3/3] dt-bindings: memory-controllers: gpmc-child: Add
 binding for wait-pin-polarity
Content-Language: en-US
To:     "Niedermayr, BENEDIKT" <benedikt.niedermayr@siemens.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
Cc:     "tony@atomide.com" <tony@atomide.com>,
        "krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
References: <20220905071717.1500568-1-benedikt.niedermayr@siemens.com>
 <20220905071717.1500568-4-benedikt.niedermayr@siemens.com>
 <d75ff1cf-64a6-e794-87a2-204e93c852cf@kernel.org>
 <e284855271a3fdf6bb2cd304629c2aa3bb8401f3.camel@siemens.com>
From:   Roger Quadros <rogerq@kernel.org>
In-Reply-To: <e284855271a3fdf6bb2cd304629c2aa3bb8401f3.camel@siemens.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-8.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 05/09/2022 12:14, Niedermayr, BENEDIKT wrote:
> On Mon, 2022-09-05 at 11:56 +0300, Roger Quadros wrote:
>> Hi Benedikt,
>>
>> On 05/09/2022 10:17, B. Niedermayr wrote:
>>> From: Benedikt Niedermayr <benedikt.niedermayr@siemens.com>
>>>
>>> Add a new dt-binding for the wait-pin-polarity property
>>>
>>> Signed-off-by: Benedikt Niedermayr <benedikt.niedermayr@siemens.com
>>>>
>>> ---
>>>  .../bindings/memory-controllers/ti,gpmc-child.yaml         | 7
>>> +++++++
>>>  1 file changed, 7 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/memory-
>>> controllers/ti,gpmc-child.yaml
>>> b/Documentation/devicetree/bindings/memory-controllers/ti,gpmc-
>>> child.yaml
>>> index 6e3995bb1630..7c721206f10b 100644
>>> --- a/Documentation/devicetree/bindings/memory-controllers/ti,gpmc-
>>> child.yaml
>>> +++ b/Documentation/devicetree/bindings/memory-controllers/ti,gpmc-
>>> child.yaml
>>> @@ -230,6 +230,13 @@ properties:
>>>        Wait-pin used by client. Must be less than "gpmc,num-
>>> waitpins".
>>>      $ref: /schemas/types.yaml#/definitions/uint32
>>>  
>>> +  gpmc,wait-pin-polarity:
>>> +    description: |
>>> +      Wait-pin polarity used by the clien. It relates to the pin
>>> defined
>>
>> did you mean "client?"
>> Can you please specify what value is for Active Low vs Active High?
> 
> Yes, that makes sense. And yes I meant "client". My typo.....
>>
>>> +      with "gpmc,wait-pin".
>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>
>> Why can't type be boolean?
> 
> Of course we can use the boolean there. In that case I should give the
> property a more meaningful name e.g. wait-pin-active-high or wait-pin-
> active-low. 
> Since the default behavour of this pin is Active High,
> a bool property "gpmc,wait-pin-active-low" would make more sense for
> backwards compatibility. 
> If the property is missing, than the polarity stays on Active High like
> before.
> 

OK, in that case you don't have to clarify the polarity in description.

>>
>>> +    default: 0
>>> +
>>>    gpmc,wait-on-read:
>>>      description: Enables wait monitoring on reads.
>>>      type: boolean
>>
>> cheers,
>> -roger
> 
> cheers,
> benedikt
> 

cheers,
-roger
