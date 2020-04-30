Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 671591BF2E9
	for <lists+linux-omap@lfdr.de>; Thu, 30 Apr 2020 10:34:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726743AbgD3IeU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 30 Apr 2020 04:34:20 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:42402 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726565AbgD3IeU (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 30 Apr 2020 04:34:20 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03U8YEac027937;
        Thu, 30 Apr 2020 03:34:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1588235654;
        bh=mGhh3XHLeWJQvoY4oyWDEdJofRv7HgLlVcRUNvoWdJw=;
        h=Subject:From:To:CC:References:Date:In-Reply-To;
        b=FgNfD3WljwSo7655F7xcvcOS/hZpmUoxvetj8S6AbJ+6uygnZkUjcXgJfrs5E9mzs
         KCU3t1UTAi66ToqilyEhuzu9foCAsa/9Il1LBJ4yPKlsq0EYsvFK7Ud9VFHXRb+1oT
         UKgJ3VwOMxcxOIT3kplX+jJYMc7we45psb5J5x+E=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03U8YEuN072938;
        Thu, 30 Apr 2020 03:34:14 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 30
 Apr 2020 03:34:14 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 30 Apr 2020 03:34:14 -0500
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03U8YCJc065680;
        Thu, 30 Apr 2020 03:34:13 -0500
Subject: Re: [PATCH 1/8] ARM: dts: omap4: fix node names for the l4_cm clkctrl
 nodes
From:   Tero Kristo <t-kristo@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20200429143002.5050-1-t-kristo@ti.com>
 <20200429143002.5050-2-t-kristo@ti.com> <20200429220714.GV37466@atomide.com>
 <fef91f43-df5f-99e4-7861-05190fcc2040@ti.com>
Message-ID: <cb563fb2-4909-a11a-d167-a5e982f38968@ti.com>
Date:   Thu, 30 Apr 2020 11:34:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <fef91f43-df5f-99e4-7861-05190fcc2040@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 30/04/2020 07:55, Tero Kristo wrote:
> On 30/04/2020 01:07, Tony Lindgren wrote:
>> * Tero Kristo <t-kristo@ti.com> [200429 14:31]:
>>> The node name for these should be clk instead of clock. Otherwise the
>>> clock driver won't be able to map the parent/child relationships
>>> properly, and large number of clocks end up in orphaned state.
>>>
>>> Signed-off-by: Tero Kristo <t-kristo@ti.com>
>>> ---
>>>   arch/arm/boot/dts/omap44xx-clocks.dtsi | 4 ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/arch/arm/boot/dts/omap44xx-clocks.dtsi 
>>> b/arch/arm/boot/dts/omap44xx-clocks.dtsi
>>> index 532868591107..b82b1ca0e557 100644
>>> --- a/arch/arm/boot/dts/omap44xx-clocks.dtsi
>>> +++ b/arch/arm/boot/dts/omap44xx-clocks.dtsi
>>> @@ -1279,13 +1279,13 @@
>>>           #size-cells = <1>;
>>>           ranges = <0 0x1400 0x200>;
>>> -        l4_per_clkctrl: clock@20 {
>>> +        l4_per_clkctrl: clk@20 {
>>>               compatible = "ti,clkctrl-l4-per", "ti,clkctrl";
>>>               reg = <0x20 0x144>;
>>>               #clock-cells = <2>;
>>>           };
>>> -        l4_secure_clkctrl: clock@1a0 {
>>> +        l4_secure_clkctrl: clk@1a0 {
>>>               compatible = "ti,clkctrl-l4-secure", "ti,clkctrl";
>>>               reg = <0x1a0 0x3c>;
>>>               #clock-cells = <2>;
>>
>> Heh this is no longer needed since commit 6c3090520554
>> ("clk: ti: clkctrl: Fix hidden dependency to node name")
>> that added support for using the compatible name :)
>>
>> Maybe you are using some older tree? Or else there's
>> still something wrong somewhere.
> 
> I was using 5.7-rc1 as baseline so can't be that.
> 
> Let me try to check this one again.

Ok you can ignore this and patch #2 for omap5 for similar case. It seems 
like the patch 6c3090520554 actually forgot to fix the subclock names, 
and it causes issues in mixed clock node setup. Will post a fix against 
the clock driver shortly.

-Tero

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
