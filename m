Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C54E5966CA
	for <lists+linux-omap@lfdr.de>; Tue, 20 Aug 2019 18:51:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727272AbfHTQvR (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 20 Aug 2019 12:51:17 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:56330 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726345AbfHTQvR (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 20 Aug 2019 12:51:17 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7KGpBgC060459;
        Tue, 20 Aug 2019 11:51:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1566319871;
        bh=KcyOfR8Cu+0kW7PJcSG2BYRDkc98ta3TUYno7667hwI=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=CyZdzT6xgsqKqNo5OCdTb3yFz087dFuG+TdNxK7dGMsSaWt99Omk8nnxZOaAx5it+
         wT/8K3vDMhm6g2zO2JphhxYfJCj7sL9j3M+zxuQpj3byTr3PYIhw8B/DYUfRC6KjQM
         Ff6evVTQyaAae2nY3A9aakm53CKcgDS4UU/NBH3U=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7KGpB7h073104
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 20 Aug 2019 11:51:11 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 20
 Aug 2019 11:51:11 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 20 Aug 2019 11:51:11 -0500
Received: from [128.247.58.153] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7KGpAjf010013;
        Tue, 20 Aug 2019 11:51:10 -0500
Subject: Re: [PATCH 0/8] soc: ti: Add OMAP PRM driver
To:     Tero Kristo <t-kristo@ti.com>, <ssantosh@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-omap@vger.kernel.org>, <robh+dt@kernel.org>
CC:     <tony@atomide.com>, <devicetree@vger.kernel.org>
References: <1565164139-21886-1-git-send-email-t-kristo@ti.com>
 <432a70fc-2683-42ca-3ac7-9775efa3ca41@ti.com>
 <b991f374-9e2a-5f1d-d48d-5f50a3c41756@ti.com>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <88446f5f-60ae-1205-33e5-a225a2764c72@ti.com>
Date:   Tue, 20 Aug 2019 11:51:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <b991f374-9e2a-5f1d-d48d-5f50a3c41756@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 8/20/19 2:54 AM, Tero Kristo wrote:
> On 20.8.2019 2.20, Suman Anna wrote:
>> Hi Tero,
>>
>> On 8/7/19 2:48 AM, Tero Kristo wrote:
>>> Hi,
>>>
>>> This series adds OMAP PRM driver which initially supports only reset
>>> handling. Later on, power domain support can be added to this to get
>>> rid of the current OMAP power domain handling code which resides
>>> under the mach-omap2 platform directory. Initially, reset data is
>>> added for AM3, OMAP4 and DRA7 SoCs.
>>
>> Wakeup M3 remoteproc driver is fully upstream, so we should be able to
>> test that driver as well if you can add the AM4 data. That will also
>> unblock my PRUSS.
>>
>> If you can add the data to others as well, it will help in easier
>> migration of the individual drivers, otherwise the ti-sysc interconnect,
>> hwmod, and hwmod reset data combinations will all have to be supported
>> in code.
> 
> Ok, so you are saying you would need the PRM data for am4 in addition? I
> can generate that one also.

Yes, if you can include the data for AM4 and OMAP5 as well, then we can
convert all the SoCs other than OMAP2/OMAP3 at the same time as per your
comment on bindings. Almost all of the active remoteprocs will be
covered by these.

OMAP3 ISP driver is also fully upstream, so we would have to manage its
legacy compatibility.

regards
Suman

> 
> -Tero
> 
>>
>> regards
>> Suman
>>
>>>
>>> I've been testing the reset handling logic with OMAP remoteproc
>>> driver which has been converted to use generic reset framework. This
>>> part is a work in progress, so will be posting patches from that part
>>> later on.
>>>
>>> -Tero
>>>
>>> -- 
>>>
>>
> 
> -- 
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

