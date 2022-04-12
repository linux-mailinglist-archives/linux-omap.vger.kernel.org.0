Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DD544FDCEF
	for <lists+linux-omap@lfdr.de>; Tue, 12 Apr 2022 13:07:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356954AbiDLKsg (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 12 Apr 2022 06:48:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358951AbiDLKrL (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 12 Apr 2022 06:47:11 -0400
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C99115831;
        Tue, 12 Apr 2022 02:48:18 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 23C9m9fX068820;
        Tue, 12 Apr 2022 04:48:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1649756889;
        bh=oo/tXq73UbjZAm3rmxiOUmk5elaZWHi5nZWbvKutxNs=;
        h=Date:Subject:To:CC:References:From:In-Reply-To;
        b=bnRbeBCLWi9CKTN2UR2+QtlX+9i+TZJ4KWTeaG9FRJedDMkxGhm649EQOmI8oDgz/
         KaNoZTbNLuviV1ICohpeTzBv2ve4kXj44NDXk4oE/Ou2ALc39i7o+RXW51tzUTJ1Vo
         j8iXgP6L7iY9s8qpN6kFu/F8Bp8FnvEj78b3QCFY=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 23C9m8GX012241
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 12 Apr 2022 04:48:09 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 12
 Apr 2022 04:48:08 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 12 Apr 2022 04:48:08 -0500
Received: from [10.249.96.184] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 23C9m5sc101666;
        Tue, 12 Apr 2022 04:48:05 -0500
Message-ID: <863f6209-9c33-ed02-5b33-606cbaea865f@ti.com>
Date:   Tue, 12 Apr 2022 12:48:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/2] dt-bindings: timer: Update TI timer to yaml
Content-Language: en-US
To:     Tony Lindgren <tony@atomide.com>
CC:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-omap@vger.kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>
References: <20220411111858.16814-1-tony@atomide.com>
 <173629f2-b37e-75ad-7601-4f24b8561f8a@ti.com> <YlU9mtM23bllohK3@atomide.com>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
In-Reply-To: <YlU9mtM23bllohK3@atomide.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Spam-Status: No, score=-5.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 12/04/2022 11:51, Tony Lindgren wrote:
> * Grygorii Strashko <grygorii.strashko@ti.com> [220412 08:35]:
>> On 11/04/2022 14:18, Tony Lindgren wrote:
>>> +  reg:
>>> +    minItems: 1
>>> +    maxItems: 2
>>> +    description: Timer IO register range
>>
>> if i'm not mistaken - you need to provide description for every item unless it's obviously determined by "-names" properties
> 
> OK thanks will update for reg and clocks.
> 
>>> +  clock-names:
>>> +    description:
>>> +      Timer clock names like "fck", "timer_sys_ck".
>>
>> and description here make no sense
> 
> So you just want to leave out the description from the clock-names if
> I read your comment above right?

yes.

> 
> Regards,
> 
> Tony

-- 
Best regards,
Grygorii, Ukraine
