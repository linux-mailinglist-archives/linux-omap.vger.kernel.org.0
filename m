Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C6711A4F60
	for <lists+linux-omap@lfdr.de>; Mon,  2 Sep 2019 08:51:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729456AbfIBGvO (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 2 Sep 2019 02:51:14 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:43682 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729359AbfIBGvO (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 2 Sep 2019 02:51:14 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x826oq5V049395;
        Mon, 2 Sep 2019 01:50:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1567407052;
        bh=ox3ufaLMVDgFuqEZpqLT51isg/cyX5JQ6XMTFXw8veU=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=cIHMXK/iZ8iNX114dUzNvVAZWBnAaoAPYxYr9hmovMIzMOC8ea4E0VU8F2o9j6QpW
         0D8W+837wZsTy5TcrP8u7vgdsjnOQo+aLM9thxs7nSGV3B5B1AJ3ioaX7pQVmmBkvS
         UfwW9xxQ8EdN8ljnJrmWBhGnutOJM399b+bgMRkI=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x826opBQ082261
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 2 Sep 2019 01:50:51 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 2 Sep
 2019 01:50:51 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 2 Sep 2019 01:50:51 -0500
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x826onNI003681;
        Mon, 2 Sep 2019 01:50:49 -0500
Subject: Re: [PATCHv3 00/10] soc: ti: add OMAP PRM driver (for reset)
To:     <santosh.shilimkar@oracle.com>, <ssantosh@kernel.org>,
        <linux-omap@vger.kernel.org>, <tony@atomide.com>, <s-anna@ti.com>,
        <p.zabel@pengutronix.de>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>
References: <20190830121816.30034-1-t-kristo@ti.com>
 <f7d6a2fb-175c-361b-00ff-ddde67700daa@oracle.com>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <178f8d3a-3658-132f-e937-64313c912dd0@ti.com>
Date:   Mon, 2 Sep 2019 09:50:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <f7d6a2fb-175c-361b-00ff-ddde67700daa@oracle.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 30/08/2019 19:50, santosh.shilimkar@oracle.com wrote:
> On 8/30/19 5:18 AM, Tero Kristo wrote:
>> Hi,
>>
>> V3 of the series, ended up re-sending the whole series as I squashed one
>> patch from v2 and because of that the ordering has changed a bit. Changes
>> in v3 contain fixes for the comments from Philipp Zabel.
>>
>> - added spinlock to protect register writes
>> - added own xlate function to prevent bad reset IDs to be registered
>> - use mask for the valid reset detection instead of parsing reset map
>> - fixed reset status bit handling
>> - used iopoll macro instead of handwritten poll loop for timeouts
>> - squashed patch #6 into #4 from v2 of the series
>> - some other minor fixes.
>>
>> This series still depends on the clk driver changes for the reset<->clk
>> syncing [1].
>>
> This has to wait for another merge window. It will also take care of 
> dependencies landing in mainline. Will push this to linux-next as
> soon as v5.4-rc1 is out. Please remind me in case you don't see it
> in next after 5.4-rc1.

Yep it is very late so did not expect it getting in, just wanted to get 
the patches rolling. I still hope to see the clock patches getting in 
this cycle due to dependency, lets keep fingers crossed.

-Tero
--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
