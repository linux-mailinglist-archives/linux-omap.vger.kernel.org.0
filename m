Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1827511DEC8
	for <lists+linux-omap@lfdr.de>; Fri, 13 Dec 2019 08:42:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725890AbfLMHml (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 13 Dec 2019 02:42:41 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:48892 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725747AbfLMHml (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 13 Dec 2019 02:42:41 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBD7gbqu051326;
        Fri, 13 Dec 2019 01:42:37 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1576222957;
        bh=pfosKWY+DPLN2snhBDjr+kFJG45sxdEpRrJaIyk+4yw=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=bbL6Rm5keRegYLGlwMIpi6/23iadkdBBo8P8Mg8irbEZr6TXOvJZQKM21yu5eKt6L
         0nlVDZG8zJlkLXjhpXTuWEkBUATpo0UGRq+zuAo7UhmrwxpMMGgN+6oH7OTodYecuj
         KV/DSlc8LyiJ/51g7vxHlIRglEhkOK0yM7A5yymw=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBD7gb2J061928;
        Fri, 13 Dec 2019 01:42:37 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 13
 Dec 2019 01:42:35 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 13 Dec 2019 01:42:34 -0600
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBD7gWJu119926;
        Fri, 13 Dec 2019 01:42:33 -0600
Subject: Re: [Patch v3 0/3] ARM: dts: am43x-vpfe/ov2659.patch
To:     Tony Lindgren <tony@atomide.com>, Benoit Parrot <bparrot@ti.com>
CC:     <linux-omap@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20191211140720.10539-1-bparrot@ti.com>
 <20191212174123.GF35479@atomide.com>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <c4ae58dc-3c81-f493-a665-6926baa0f04c@ti.com>
Date:   Fri, 13 Dec 2019 09:42:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191212174123.GF35479@atomide.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 12/12/2019 19:41, Tony Lindgren wrote:
> * Benoit Parrot <bparrot@ti.com> [191211 06:04]:
>> This patch series adds the missing camera endpoint (ov2659) as well as
>> the required source clocks nodes for the sensor.
>>
>> On the am437x-sk-evm the camera sensor is sourced from clkout1 but that
>> clock nodes/tree was removed as it was unsed at the time, we are
>> re-adding the needed clock nodes here.
> 
> Tero, it seems I can already pick this series?

I believe it is ready if you approve the clkout1 clock patch.

> Or ou want to queue the changes to am43xx-clocks.dtsi along with all
> your other clock patches?

Well, I have actually never queued any omap2+ dts patches myself, and I 
don't think there would be too many of those coming for next merge either.

-Tero

> 
> Regards,
> 
> Tony
> 
>   
>> Changes since v2:
>> - Fixed/added Tony's ack
>>
>> Changes since v1:
>> - Fix clock name to make it generic
>> - Add non-standard clock node naming to commit message as per Tony's
>>    comment
>> - Rename all clock nodes to use '-' instead of '_'
>>
>> Benoit Parrot (2):
>>    ARM: dts: am437x-sk-evm: Add VPFE and OV2659 entries
>>    ARM: dts: am43x-epos-evm: Add VPFE and OV2659 entries
>>
>> Tero Kristo (1):
>>    ARM: dts: am43xx: add support for clkout1 clock
>>
>>   arch/arm/boot/dts/am437x-sk-evm.dts  | 27 +++++++++++++-
>>   arch/arm/boot/dts/am43x-epos-evm.dts | 23 +++++++++++-
>>   arch/arm/boot/dts/am43xx-clocks.dtsi | 54 ++++++++++++++++++++++++++++
>>   3 files changed, 102 insertions(+), 2 deletions(-)
>>
>> -- 
>> 2.17.1
>>

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
