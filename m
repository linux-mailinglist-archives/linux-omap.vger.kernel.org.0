Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D144945D9EB
	for <lists+linux-omap@lfdr.de>; Thu, 25 Nov 2021 13:20:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347935AbhKYMYF (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 25 Nov 2021 07:24:05 -0500
Received: from mail.kernel.org ([198.145.29.99]:35188 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239650AbhKYMWF (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 25 Nov 2021 07:22:05 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6E7A6603E5;
        Thu, 25 Nov 2021 12:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637842732;
        bh=lFfGKss/qS/TiL5sYYjPBk2n1JD8OdsKZA9q69hDafk=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=d87xb1Quc+VVnWKM5scF8rWdA3RTXV2VEC96LbiwAVHbQ4NaAU7PPgDHBV6VKGqLz
         aZ1+H8hLVO+rwadc/0x73JA55atNsXNm85FCV+bHc3Cq1+pOxGxAI+a7B9uAIf7egi
         ZJkycrnbyMY9gq8VQhnfqOFQJOc/gb42uePPq3diI2fNrWuhaNWaVKH+t1ESZMq6kJ
         r2J9DOcCqODvF9d4juG4rd6WzBSvwfOSWAKv+3Pf6JT52WtC4KMerpfyhaVZ0vG9BF
         3Gn9X53HEQe1ILSqKOik68P4IlasoLGtlP8brbECKrR6vPjFEuGM2kNrHd1zMVF9J5
         6bMTddrsrQQXQ==
Subject: Re: [PATCH 1/4] dt-bindings: memory-controllers: ti,gpmc: Add
 compatible for AM64
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        tony@atomide.com
Cc:     kishon@ti.com, nm@ti.com, vigneshr@ti.com,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
References: <20211123102607.13002-1-rogerq@kernel.org>
 <20211123102607.13002-2-rogerq@kernel.org>
 <a28532b1-bfa0-031b-91cc-070cad557599@canonical.com>
From:   Roger Quadros <rogerq@kernel.org>
Message-ID: <782c626b-bbe5-38a0-85ea-1e34bd8b887d@kernel.org>
Date:   Thu, 25 Nov 2021 14:18:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <a28532b1-bfa0-031b-91cc-070cad557599@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 23/11/2021 21:47, Krzysztof Kozlowski wrote:
> On 23/11/2021 11:26, Roger Quadros wrote:
>> AM64 SoC contains the GPMC module. Add compatible for it.
>>
>> Newer SoCs don't necessarily map GPMC data region at the same place
>> as legacy SoCs. Add reg-names "data", to provide this information to
>> the device driver.
>>
>> Cc: Rob Herring <robh+dt@kernel.org>
>> Signed-off-by: Roger Quadros <rogerq@kernel.org>
>> ---
>>  .../bindings/memory-controllers/ti,gpmc.yaml         | 12 +++++++++++-
>>  1 file changed, 11 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml b/Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml
>> index 25b42d68f9b3..1869cc6f949b 100644
>> --- a/Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml
>> +++ b/Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml
>> @@ -23,13 +23,20 @@ properties:
>>      items:
>>        - enum:
>>            - ti,am3352-gpmc
>> +          - ti,am64-gpmc
>>            - ti,omap2420-gpmc
>>            - ti,omap2430-gpmc
>>            - ti,omap3430-gpmc
>>            - ti,omap4430-gpmc
>>  
>>    reg:
>> -    maxItems: 1
>> +    minItems: 1
>> +    maxItems: 2
>> +
>> +  reg-names:
>> +    items:
>> +      - const: cfg
>> +      - const: data
> 
> I see your driver handles cases with only one reg item, but I have other

The support for these two items is added in patch 3 of this series "memory: omap-gpmc: Add support for GPMC on AM64 SoC"

> question - is it correct to have older (ARMv7) platform with two reg
> items? Or can am64-gpmc come with only one reg?

Older platforms currently have only one reg, but they can be updated to come with two without breaking functionality.
am64-gpmc cannot come with one reg as the defaults for data window are not suitable for AM64.

All legacy platforms were using a fixed Data IO window (first 1 GB) but from AM64 this was moved elsewhere, so the need for this change.

> IOW, I am surprised there is no if-else case precising this minItems
> requirement for different SocS.
> 

OK. I will add this.

>>  
>>    interrupts:
>>      maxItems: 1
>> @@ -44,6 +51,9 @@ properties:
>>      items:
>>        - const: fck
>>  
>> +  power-domains:
>> +    maxItems: 1
> 
> Similar, but looks like a weaker requirement - could an older SoC define
> power-domain?

No. Will add SoC specific constraint for this as well.

> 
>> +
>>    dmas:
>>      items:
>>        - description: DMA channel for GPMC NAND prefetch
>>
> 
> 
> Best regards,
> Krzysztof
> 

cheers,
-roger
