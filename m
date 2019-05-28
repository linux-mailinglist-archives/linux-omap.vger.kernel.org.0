Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E1392C446
	for <lists+linux-omap@lfdr.de>; Tue, 28 May 2019 12:32:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726453AbfE1Kc5 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 28 May 2019 06:32:57 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:34426 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726305AbfE1Kc5 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 28 May 2019 06:32:57 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4SAWir0024513;
        Tue, 28 May 2019 05:32:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1559039564;
        bh=McxG6qXOV6aRVRHUHTwTeJqgXjBwYLgFzusvSu8toTI=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=teL/QmkddaZ+JzvBP0kX3Zm+hUB2eEut+CxRyf1eliUYVy2PPqICzksu1aHHx7X2O
         Fk4/Aanx/SAHDeW89PaVQ3q7A+XPnUWEp/I9coniBud2KIaEQO7WNpW9KfghmQ7NHn
         JOfGXAu1q/V2yvRu7cxIdjt6xOETDdqQDOoiSKR0=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4SAWiAY015404
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 28 May 2019 05:32:44 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 28
 May 2019 05:32:43 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 28 May 2019 05:32:43 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4SAWfN4034016;
        Tue, 28 May 2019 05:32:41 -0500
Subject: Re: [PATCHv6 0/4] omapdrm: DSI command mode panel support
To:     Tony Lindgren <tony@atomide.com>
CC:     Sebastian Reichel <sebastian.reichel@collabora.com>,
        Sebastian Reichel <sre@kernel.org>,
        Pavel Machek <pavel@ucw.cz>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        <dri-devel@lists.freedesktop.org>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@collabora.com>,
        Keerthy <j-keerthy@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>
References: <20190523200756.25314-1-sebastian.reichel@collabora.com>
 <60c45d23-de2f-d94a-c3d7-146a2bee538f@ti.com>
 <20190527112122.GJ5447@atomide.com>
 <e507c415-38de-86fe-9265-4b0aed0d7224@ti.com>
 <20190528093952.GM5447@atomide.com>
 <14c6c702-844b-756d-2d97-44e8f5a169df@ti.com>
 <20190528101847.GN5447@atomide.com>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <c2eaee25-a0d3-2632-fdea-3a81ac7085af@ti.com>
Date:   Tue, 28 May 2019 13:32:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190528101847.GN5447@atomide.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 28/05/2019 13:18, Tony Lindgren wrote:

>> This change lets me boot. I don't know that's the correct place, though:
>>
>> diff --git a/arch/arm/boot/dts/am5728.dtsi b/arch/arm/boot/dts/am5728.dtsi
>> index 82e5427ef6a9..c778f9a86b3a 100644
>> --- a/arch/arm/boot/dts/am5728.dtsi
>> +++ b/arch/arm/boot/dts/am5728.dtsi
>> @@ -31,3 +31,7 @@
>> &atl_tm {
>>         status = "disabled";
>> };
>> +
>> +&timer12 {
>> +       status = "disabled";
>> +};
> 
> OK we should disable it at the target-module level though. Interesting
> that reading the revision register works with the above, or maybe you
> still get some warning?

I don't see anything odd in the boot log with the above change. At least 
no kernel WARNs, nor anything with grepping "timer", "err", or "warn".

I just verified with clean 5.2-rc2, that it doesn't boot, and with the 
above change, boots.

>> My board is x15 rev A3, attached to AM5 EVM. I've also attached my kernel
>> config.
> 
> Strange that this is not affecting other x15? I think timer12 would
> be blocked on HS devices though?

I don't know... I can't believe my x15 would be unique =). Can it be 
something in the kernel config? u-boot?

Peter should have the same A3. Peter, can you try with my config?

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
