Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 97E39AC132
	for <lists+linux-omap@lfdr.de>; Fri,  6 Sep 2019 22:02:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728816AbfIFUCo (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 6 Sep 2019 16:02:44 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:59172 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726008AbfIFUCo (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 6 Sep 2019 16:02:44 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x86K2Xel029433;
        Fri, 6 Sep 2019 15:02:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1567800153;
        bh=10xvcQ++kK8vjq26QxAoqES7mAlIWPQnmIIF8zI5Vpk=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=e08jr+zRuuFY02gyAUTOdMfhNxS4qFUivbE2kp/hbOeacg5gMDr0g/U4G8ZlClpVw
         Lbleby8yDxxoWN/YAjMQsMMk1lwuS/7OmNsI17+/WcpIaPeCJ7uEsiSNqX5ruaxUE6
         25UxtZwfy5pVDGoNo8RqUjG6Er0tUnBRJuX4kDb0=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x86K2XFd119951
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 6 Sep 2019 15:02:33 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 6 Sep
 2019 15:02:32 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 6 Sep 2019 15:02:32 -0500
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x86K2Tjo091944;
        Fri, 6 Sep 2019 15:02:30 -0500
Subject: Re: [PATCHv4 01/10] dt-bindings: omap: add new binding for PRM
 instances
To:     Tony Lindgren <tony@atomide.com>, Rob Herring <robh+dt@kernel.org>
CC:     Santosh Shilimkar <ssantosh@kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        Suman Anna <s-anna@ti.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>
References: <20190830121816.30034-2-t-kristo@ti.com>
 <20190906103558.17694-1-t-kristo@ti.com>
 <CAL_JsqLHTsEz6RJSi3rZ9AKyTBc00abyAxqwG8B9zAqL6cnv+w@mail.gmail.com>
 <20190906153658.GB52127@atomide.com>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <e2b75368-df70-b6c9-e019-61610859f146@ti.com>
Date:   Fri, 6 Sep 2019 23:02:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190906153658.GB52127@atomide.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 06/09/2019 18:36, Tony Lindgren wrote:
> * Rob Herring <robh+dt@kernel.org> [190906 12:57]:
>> On Fri, Sep 6, 2019 at 11:36 AM Tero Kristo <t-kristo@ti.com> wrote:
>>>
>>> Add new binding for OMAP PRM (Power and Reset Manager) instances. Each
>>> of these will act as a power domain controller and potentially as a reset
>>> provider.
>>>
>>> Signed-off-by: Tero Kristo <t-kristo@ti.com>
>>> ---
>>> v4:
>>> - renamed nodes as power-controller
>>> - added documentation about hierarchy
>>>
>>>   .../devicetree/bindings/arm/omap/prm-inst.txt | 31 +++++++++++++++++++
>>>   1 file changed, 31 insertions(+)
>>>   create mode 100644 Documentation/devicetree/bindings/arm/omap/prm-inst.txt
>>
>> Reviewed-by: Rob Herring <robh@kernel.org>
> 
> Looks good to me too:
> 
> Reviewed-by: Tony Lindgren <tony@atomide.com>
> 

I may need to re-spin slightly new version of this. Stephen has some 
comments on the clock driver side I am depending on, he does not like 
the hard link between reset + clocks, so I may need to ditch the 
"clocks" property from this one also.

I'll see next week which direction I need to go.

-Tero
--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
