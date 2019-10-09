Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 782E3D0B95
	for <lists+linux-omap@lfdr.de>; Wed,  9 Oct 2019 11:43:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730121AbfJIJnX (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 9 Oct 2019 05:43:23 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:54232 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730590AbfJIJnX (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 9 Oct 2019 05:43:23 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x999hINa043594;
        Wed, 9 Oct 2019 04:43:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570614198;
        bh=wrfoEpV+Uf++x5uALcAx9d6ygJrwhHW9qTOsbUfCQZg=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=mDyWF3kheN91U85957S8G40q/KVJx9BUiTwCRFJSIeXeIfISRfg5MVMdny7aOr0sd
         ksu0NjTX36ZM+GslaMcfMTfXwRsFXw3SdeCsl+lfACIxqVEz5WfIndzju3tSiMp/9W
         UdOezRT5c/GNzCfvFGN6Yck8uMz1UccFcHUs1iZ0=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x999hIF7121315
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 9 Oct 2019 04:43:18 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 9 Oct
 2019 04:43:15 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 9 Oct 2019 04:43:15 -0500
Received: from [10.250.98.116] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x999hGb6054291;
        Wed, 9 Oct 2019 04:43:17 -0500
Subject: Re: [PATCH] ARM: dts: am335x-sancloud-bbe: Fix PHY mode for ethernet
To:     Tony Lindgren <tony@atomide.com>,
        Jeroen Hofstee <jhofstee@victronenergy.com>
CC:     "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
        Koen Kooi <koen@dominion.thruhere.net>,
        =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>,
        open list <linux-kernel@vger.kernel.org>
References: <20191002095416.19603-1-jhofstee@victronenergy.com>
 <d027ef07-807d-6a7b-2939-b67be4542469@ti.com>
 <436f1712-7dec-db40-d08f-1a3032af3596@victronenergy.com>
 <d85cd860-22a3-6142-7f2d-736a428d7a31@ti.com>
 <20191008142349.GE5610@atomide.com>
 <1f779973-1702-47eb-158f-7000770c435a@victronenergy.com>
 <20191008161416.GG5610@atomide.com>
 <4fa5393d-0b2c-4b8c-128a-81ab05a14a82@victronenergy.com>
 <20191008165154.GH5610@atomide.com>
 <a8a72544-7f30-c896-22e4-7d85bd0b4235@victronenergy.com>
 <20191008170259.GI5610@atomide.com>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <6dbdf76a-5c04-63ef-0676-5b02fd29c456@ti.com>
Date:   Wed, 9 Oct 2019 12:43:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191008170259.GI5610@atomide.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 08/10/2019 20:02, Tony Lindgren wrote:
> * Jeroen Hofstee <jhofstee@victronenergy.com> [191008 17:00]:
>> Hi,
>>
>> On 10/8/19 6:51 PM, Tony Lindgren wrote:
>>> * Jeroen Hofstee <jhofstee@victronenergy.com> [191008 16:43]:
>>>> Hello Tony,
>>>>
>>>> On 10/8/19 6:14 PM, Tony Lindgren wrote:
>>>>> * Jeroen Hofstee <jhofstee@victronenergy.com> [191008 16:03]:
>>>>>> Hello Tony,
>>>>>>
>>>>>> On 10/8/19 4:23 PM, Tony Lindgren wrote:
>>>>>>> * Grygorii Strashko <grygorii.strashko@ti.com> [191003 02:32]:
>>>>>>>> On 03/10/2019 11:16, Jeroen Hofstee wrote:
>>>>>>>>> Furthermore 4.19 is fine, so there is no need to include it in stable
>>>>>>>>> and have a note to make sure also other patches are required etc.
>>>>>>>> Hence all above patches went in 5.1 it would be correct to mention only
>>>>>>>> 6d4cd041f0af net: phy: at803x: disable delay only for RGMII mode
>>>>>>> Jeroen, can you please send an updated patch with the fixes
>>>>>>> tag changed?
>>>>>>>
>>>>>> For completeness, there is no "Fixes tag" as you mentioned.
>>>>>> The commit only refers to another commit which introduces
>>>>>> a problem.
>>>>> Well please add the fixes tag, that way this will get
>>>>> properly applied to earlier stable kernels too :)
>>>> But 4.19 is fine, this is an issue in 5.1 as in EOL...
>>>> I really don't understand why I should waste time
>>>> to figure out what happened exactly during the 5.1
>>>> release cycle...
>>> Hmm so what's the issue with just adding the fixes tag Grygorii
>>> suggested:
>>>
>>> 6d4cd041f0af ("net: phy: at803x: disable delay only for RGMII mode")
>>>
>>> No need to dig further?
>>
>> Grygorii doesn't suggest to add a fixes tag, just to change the referenced
>> commit to another. Obviously I would like to understand why another commit
>> should be referenced. And then I should read and parse the response, so there
>> is no special reason, just time...
> 
> OK sure. Well once you guys have the commit figured out, let me
> know what to apply. And we know Grygorii is mostly right based
> on his history of comments so best to not ignore that :)

Sry, but I do not think my request is somehow special.
Yes, your patch is correct by itself, but commit description is not:
1) commit cd28d1d6e52e: ("net: phy: at803x: Disable phy delay for RGMII mode")  which you've mentioned is A BUG
and should not be merged first of all (which you can find out by reading corresponding thread).

just try checkout that commit and apply your patch on top - networking should not work.

But it was merged and not reverted - instead two more patches were applied to fix regression.

2) Those commits are defined final behavior (which i again explained above) and that new behavior hardly can
be called "the bug in the at803x driver" as, unfortunately, there were no common conclusion how default values for
RX/TX delay should be handled vs phy-mode = "rgmii-txid"/"rgmii-rxid".
Originally many PHY driver kept them default (as per boot strapping/bootloader configuration), but now
some driver (including at803x) started disabling RX delay if "rgmii-txid" or TX delay if "rgmii-rxid".

Hence, pls update commit message and add proper fixes tag. smth like:
"Now after commit 6d4cd041f0af net: phy: at803x: disable delay only for RGMII mode the driver will forcibly disable
RGMII RX delay if phy-mode = "rgmii-txid" is specified in DT which will break networking on ..

Hence change .. to ensure ...
Fixes: "


-- 
Best regards,
grygorii
