Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CE8B1BEF74
	for <lists+linux-omap@lfdr.de>; Thu, 30 Apr 2020 06:55:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726180AbgD3Ezi (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 30 Apr 2020 00:55:38 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:39178 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726337AbgD3Ezh (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 30 Apr 2020 00:55:37 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03U4tVE8121395;
        Wed, 29 Apr 2020 23:55:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1588222531;
        bh=/G6Mzbyf9lh0LZ/LmPuHyv+oSnTdGGeYpa0gLdkICyQ=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=TMSdJ49r6Vc+CNj7DA8E4ISYRqM+AId5PRiwb08eUuzJ93B6qXbfg+C6wiHnmNU80
         yy4HKj6ogClfQ4TGto8aseOAsuGL4cZF57lJ8O+Ki3rqbZmME9ABnJAh4baxW6ndGx
         sPMHqQeJua7vMrbgbW1mm5mPh+FmnWe8Y2UpkZWI=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 03U4tVUj119890
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 29 Apr 2020 23:55:31 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 29
 Apr 2020 23:55:31 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 29 Apr 2020 23:55:31 -0500
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03U4tUHp061722;
        Wed, 29 Apr 2020 23:55:30 -0500
Subject: Re: [PATCH 1/8] ARM: dts: omap4: fix node names for the l4_cm clkctrl
 nodes
To:     Tony Lindgren <tony@atomide.com>
CC:     <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20200429143002.5050-1-t-kristo@ti.com>
 <20200429143002.5050-2-t-kristo@ti.com> <20200429220714.GV37466@atomide.com>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <fef91f43-df5f-99e4-7861-05190fcc2040@ti.com>
Date:   Thu, 30 Apr 2020 07:55:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200429220714.GV37466@atomide.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 30/04/2020 01:07, Tony Lindgren wrote:
> * Tero Kristo <t-kristo@ti.com> [200429 14:31]:
>> The node name for these should be clk instead of clock. Otherwise the
>> clock driver won't be able to map the parent/child relationships
>> properly, and large number of clocks end up in orphaned state.
>>
>> Signed-off-by: Tero Kristo <t-kristo@ti.com>
>> ---
>>   arch/arm/boot/dts/omap44xx-clocks.dtsi | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/omap44xx-clocks.dtsi b/arch/arm/boot/dts/omap44xx-clocks.dtsi
>> index 532868591107..b82b1ca0e557 100644
>> --- a/arch/arm/boot/dts/omap44xx-clocks.dtsi
>> +++ b/arch/arm/boot/dts/omap44xx-clocks.dtsi
>> @@ -1279,13 +1279,13 @@
>>   		#size-cells = <1>;
>>   		ranges = <0 0x1400 0x200>;
>>   
>> -		l4_per_clkctrl: clock@20 {
>> +		l4_per_clkctrl: clk@20 {
>>   			compatible = "ti,clkctrl-l4-per", "ti,clkctrl";
>>   			reg = <0x20 0x144>;
>>   			#clock-cells = <2>;
>>   		};
>>   
>> -		l4_secure_clkctrl: clock@1a0 {
>> +		l4_secure_clkctrl: clk@1a0 {
>>   			compatible = "ti,clkctrl-l4-secure", "ti,clkctrl";
>>   			reg = <0x1a0 0x3c>;
>>   			#clock-cells = <2>;
> 
> Heh this is no longer needed since commit 6c3090520554
> ("clk: ti: clkctrl: Fix hidden dependency to node name")
> that added support for using the compatible name :)
> 
> Maybe you are using some older tree? Or else there's
> still something wrong somewhere.

I was using 5.7-rc1 as baseline so can't be that.

Let me try to check this one again.

-Tero
--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
