Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A6B511D404
	for <lists+linux-omap@lfdr.de>; Thu, 12 Dec 2019 18:31:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730190AbfLLRbr (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 12 Dec 2019 12:31:47 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:47680 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730162AbfLLRbr (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 12 Dec 2019 12:31:47 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBCHViuk063763;
        Thu, 12 Dec 2019 11:31:44 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1576171904;
        bh=dpVEqGfJvVpzG0vsE4BBXpWsXdrm7DfW4+Bvly+lNN8=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=fVfxOpSjgYdEuk6nJrsVzVQr1qjkpFVBA34FWC4RqT3M0CYO2+jCQNN9gaMLokra1
         zuPkPxSEQbm3GH3REreqkekLO80zXc95Ev+9j3YO6Ufchrs+loaLJhHbQrLCrHouCp
         NQyz8ZPFOqa0002SADBIGXpE6iOp9ycuu++tVGNE=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBCHVino012306
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 12 Dec 2019 11:31:44 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 12
 Dec 2019 11:31:44 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 12 Dec 2019 11:31:44 -0600
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBCHVheg057542;
        Thu, 12 Dec 2019 11:31:43 -0600
Subject: Re: [PATCH] ARM: dts: omap3: name mdio node properly
To:     Tony Lindgren <tony@atomide.com>
CC:     <linux-omap@vger.kernel.org>
References: <20191127153212.22209-1-grygorii.strashko@ti.com>
 <2c2f3c8f-4062-f3ce-e1ce-aa128565b901@ti.com>
 <86f18a06-2039-266f-5cff-c6d1c521c0df@ti.com>
 <20191212161909.GT35479@atomide.com>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <2872c208-e0d4-0b3f-321d-24ddcbfdb5b5@ti.com>
Date:   Thu, 12 Dec 2019 19:31:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191212161909.GT35479@atomide.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 12/12/2019 18:19, Tony Lindgren wrote:
> * Grygorii Strashko <grygorii.strashko@ti.com> [191212 10:09]:
>> Hi Tony,
>>
>> On 27/11/2019 18:26, Grygorii Strashko wrote:
>>>
>>>
>>> On 27/11/2019 17:32, Grygorii Strashko wrote:
>>>> Rename davinci_mdio DT node "ethernet"->"mdio"
>>>> This fixes the following DT schemas check errors:
>>>> am3517-craneboard.dt.yaml: ethernet@5c030000: $nodename:0: 'ethernet@5c030000' does not match '^mdio(@.*)?'
>>>>
>>>> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
>>>> ---
>>>
>>> This can be for next material.
>>>
>>>>    arch/arm/boot/dts/am3517.dtsi | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/arch/arm/boot/dts/am3517.dtsi b/arch/arm/boot/dts/am3517.dtsi
>>>> index 76f819f4ba48..84e13778a64a 100644
>>>> --- a/arch/arm/boot/dts/am3517.dtsi
>>>> +++ b/arch/arm/boot/dts/am3517.dtsi
>>>> @@ -74,7 +74,7 @@
>>>>                clock-names = "ick";
>>>>            };
>>>> -        davinci_mdio: ethernet@5c030000 {
>>>> +        davinci_mdio: mdio@5c030000 {
>>>>                compatible = "ti,davinci_mdio";
>>>>                ti,hwmods = "davinci_mdio";
>>>>                status = "disabled";
>>>>
>>>
>>
>> Any comments here?
> 
> No comments looks fine. I just have not yet gotten to applying
> patches for v5.6 merge window yet.

Oh. Ok. Thank you.

-- 
Best regards,
grygorii
