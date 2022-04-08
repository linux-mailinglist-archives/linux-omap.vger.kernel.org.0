Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 83BAF4F921A
	for <lists+linux-omap@lfdr.de>; Fri,  8 Apr 2022 11:34:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232690AbiDHJgE (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 8 Apr 2022 05:36:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231565AbiDHJgD (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 8 Apr 2022 05:36:03 -0400
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D888711F796;
        Fri,  8 Apr 2022 02:33:59 -0700 (PDT)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2389XtfV092058;
        Fri, 8 Apr 2022 04:33:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1649410435;
        bh=GM08IxHjLIIcJ5xl3ARUS34Woda4fEV1n8Qg5c2a0cw=;
        h=Date:Subject:To:CC:References:From:In-Reply-To;
        b=vdZIr3ajGfOljFxOtPtHy0IgEloF050DO1Nntm3AXAH9gsjLkFHjaITRA6re9pvpr
         HGlYEUxZdLOijGMRLy8itkz/cUFEkV+CQd406WEuOpq3SlWjBPuveGVMKNhgd6U8lR
         0PRDNt9O13j1ZQf3b/Sw7SQWCN5M8FSiZWYWk8AQ=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2389Xtfm102664
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 8 Apr 2022 04:33:55 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 8
 Apr 2022 04:33:54 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 8 Apr 2022 04:33:54 -0500
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2389XpK3059178;
        Fri, 8 Apr 2022 04:33:52 -0500
Message-ID: <e0cdf420-7a8c-e1a1-c60e-692a77b465e4@ti.com>
Date:   Fri, 8 Apr 2022 12:33:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] ARM: dts: Drop unused ti,am4372-timer compatible
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Tony Lindgren <tony@atomide.com>
CC:     <linux-omap@vger.kernel.org>,
        =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>,
        <devicetree@vger.kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Keerthy <j-keerthy@ti.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Nishanth Menon <nm@ti.com>, Rob Herring <robh+dt@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>
References: <20220408081216.57146-1-tony@atomide.com>
 <3a4b5e26-e770-d778-5ae5-f46ba00066ce@linaro.org>
 <Yk/yaqWHSpaO2eRe@atomide.com>
 <f7e83ba9-32b6-bb13-3b0e-a1f82bf0ae02@linaro.org>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
In-Reply-To: <f7e83ba9-32b6-bb13-3b0e-a1f82bf0ae02@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 08/04/2022 11:33, Krzysztof Kozlowski wrote:
> On 08/04/2022 10:29, Tony Lindgren wrote:
>> * Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> [220408 08:22]:
>>> On 08/04/2022 10:12, Tony Lindgren wrote:
>>>> Drop unused (and undocumented) ti,am4372-timer related compatible
>>>> properties to avoid dtb warnings when updating the binding to yaml.
>>>>
>>>> The dual-mode timer instances on am43 are compatible with the am3
>>>> timers.
>>>
>>> Are you sure this is correct approach? Maybe some other user of DTS
>>> references the am43 compatible, so instead it should be documented in
>>> the bindings?
>>
>> No users.
> 
> You sure you check all operating systems and all out-of-tree users? I
> did not talk about in-kernel DTS...
> 
>> The driver does not parse these. The am4 SoCs boot using
>> the am3 related compatible properties.
>>
>>> See also recommendation "DO use fallback compatibles...":
>>> Documentation/devicetree/bindings/writing-bindings.rst
>>> which maybe applies here?
>>
>> Yes I'd agree if there were users for this, or if this was already
>> documented :) But I don't see a need to keep these am4 specific
>> properties.
> 

I'd prefer to drop it if not used and not documented.
conversation to yaml is good time for clean up.
if somebody complains - can always return back and document it.

-- 
Best regards,
Grygorii, Ukraine
