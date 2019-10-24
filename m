Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C6BF7E325D
	for <lists+linux-omap@lfdr.de>; Thu, 24 Oct 2019 14:28:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2501932AbfJXM2d (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 24 Oct 2019 08:28:33 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:56270 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2501931AbfJXM2d (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 24 Oct 2019 08:28:33 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9OCSSqQ038775;
        Thu, 24 Oct 2019 07:28:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1571920108;
        bh=hfPqO/klBgDMRmYwPflNbrIJlYYCwQVsEnyhBzWarfw=;
        h=Subject:From:To:CC:References:Date:In-Reply-To;
        b=gGOM9d1BsZVd5RL0mEfO/mVPJcQdTOu+CNKe61mY/ED5JarPB94yhSqKv5JWS/9ci
         Mp2cdh6a18UrQVQ02RzINoG7e9xiWR3kP62g1gKJn1JilZ8z1msnmHhooUaILFJAF2
         PfI1vYoBA7lSJt5ci3HrWpsrrLVJpu1cxflIcHjg=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9OCSSl2055911;
        Thu, 24 Oct 2019 07:28:28 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 24
 Oct 2019 07:28:16 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 24 Oct 2019 07:28:16 -0500
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9OCSOaQ000878;
        Thu, 24 Oct 2019 07:28:25 -0500
Subject: Re: [PATCHv3 00/10] clk: ti: remoteproc / iommu support patches
From:   Tero Kristo <t-kristo@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     <linux-omap@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <sboyd@kernel.org>, <mturquette@baylibre.com>, <s-anna@ti.com>
References: <20190912132613.28093-1-t-kristo@ti.com>
 <ef764d1c-8ebc-4b64-4543-7b296327e197@ti.com>
 <20191010143521.GX5610@atomide.com>
 <e37f9a2f-c554-300f-0866-8c8651941585@ti.com>
Message-ID: <a88261a3-4012-1497-dd82-e41c0f328afd@ti.com>
Date:   Thu, 24 Oct 2019 15:28:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <e37f9a2f-c554-300f-0866-8c8651941585@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 10/10/2019 18:32, Tero Kristo wrote:
> On 10/10/2019 17:35, Tony Lindgren wrote:
>> * Tero Kristo <t-kristo@ti.com> [191010 08:34]:
>>> On 12/09/2019 16:26, Tero Kristo wrote:
>>>> Hi,
>>>>
>>>> V3 of this series sort of reverted back to pretty much V1 which expects
>>>> strict sequencing of events from the bus driver. This one doesn't have
>>>> any dependency towards the reset driver either, and the controversial
>>>> reset handling APIs have been removed.
>>>>
>>>> -Tero
>>>
>>> Stephen, any comments on this one or shall I just craft a 
>>> pull-request for
>>> this and rest of the TI clock driver changes towards 5.5? There seems 
>>> to be
>>> a pile of them coming this time over...
>>
>> Sounds like we need an immutable branch for the clkctrl related
>> changes against v5.4-rc1 that I can also merge into omap-for-v5.5/prm
>> branch in addition to the immutable prm reset driver branch.
>>
>> Otherwise I can't apply any of the consumer device related dts
>> changes into that branch AFAIK.
> 
> Well, the sgx patch you can probably merge, as it will fail silently and 
> only cause issues if you actually try to enable the device.
> 
> However, yes I agree, we should probably setup an immutable branch here.

Queued this series towards 5.5, thanks.

-Tero
--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
