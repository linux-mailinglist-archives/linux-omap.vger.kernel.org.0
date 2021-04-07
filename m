Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EE28356ED5
	for <lists+linux-omap@lfdr.de>; Wed,  7 Apr 2021 16:35:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353004AbhDGOfm (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 7 Apr 2021 10:35:42 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:40956 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353009AbhDGOfe (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 7 Apr 2021 10:35:34 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 137EYHA3037410;
        Wed, 7 Apr 2021 09:34:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1617806057;
        bh=P7s3BojRUYzZI+LPERcl8NdOIdH0Wwr5DaeL5x0Za5A=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=SzavdAqQoRHHEDBtHOYwCEB8DOkHvGuzgwAxLho6hwX2yKmOpENOQhfLvFoP96lZi
         utRAK5HvAW183JV6ZWhSRrCk+zyi8L0IoJu0X+f6WeBZynM1LWXb2d1xCIwSCq1a3Z
         zad8AH8Pxd/xMOJUL+Eqx8ZZpURRByfTCfHO6H80=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 137EYHq6049658
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 7 Apr 2021 09:34:17 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 7 Apr
 2021 09:34:17 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Wed, 7 Apr 2021 09:34:17 -0500
Received: from [10.250.37.105] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 137EYGEG006674;
        Wed, 7 Apr 2021 09:34:16 -0500
Subject: Re: [PATCH 3/3] remoteproc: pru: Fix and cleanup firmware interrupt
 mapping logic
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
References: <20210323223839.17464-1-s-anna@ti.com>
 <20210323223839.17464-4-s-anna@ti.com> <20210406234747.GC330882@xps15>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <98a3bc08-5740-3e2c-0ed6-0381cb20283d@ti.com>
Date:   Wed, 7 Apr 2021 09:34:16 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210406234747.GC330882@xps15>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Mathieu,

On 4/6/21 6:47 PM, Mathieu Poirier wrote:
> On Tue, Mar 23, 2021 at 05:38:39PM -0500, Suman Anna wrote:
>> The PRU firmware interrupt mappings are configured and unconfigured in
>> .start() and .stop() callbacks respectively using the variables 'evt_count'
>> and a 'mapped_irq' pointer. These variables are modified only during these
>> callbacks but are not re-initialized/reset properly during unwind or
>> failure paths. These stale values caused a kernel crash while stopping a
>> PRU remoteproc running a different firmware with no events on a subsequent
>> run after a previous run that was running a firmware with events.
>>
>> Fix this crash by ensuring that the evt_count is 0 and the mapped_irq
>> pointer is set to NULL in pru_dispose_irq_mapping(). Also, reset these
>> variables properly during any failures in the .start() callback. While
>> at this, the pru_dispose_irq_mapping() callsites are all made to look
>> the same, moving any conditional logic to inside the function.
>>
>> Fixes: c75c9fdac66e ("remoteproc: pru: Add support for PRU specific interrupt configuration")
>> Reported-by: Vignesh Raghavendra <vigneshr@ti.com>
>> Signed-off-by: Suman Anna <s-anna@ti.com>
>> ---
>>  drivers/remoteproc/pru_rproc.c | 12 +++++++++---
>>  1 file changed, 9 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/remoteproc/pru_rproc.c b/drivers/remoteproc/pru_rproc.c
>> index 87b43976c51b..5df19acb90ed 100644
>> --- a/drivers/remoteproc/pru_rproc.c
>> +++ b/drivers/remoteproc/pru_rproc.c
>> @@ -266,12 +266,17 @@ static void pru_rproc_create_debug_entries(struct rproc *rproc)
>>  
>>  static void pru_dispose_irq_mapping(struct pru_rproc *pru)
>>  {
>> -	while (pru->evt_count--) {
>> +	if (!pru->mapped_irq)
>> +		return;
>> +
>> +	while (pru->evt_count) {
>> +		pru->evt_count--;
>>  		if (pru->mapped_irq[pru->evt_count] > 0)
>>  			irq_dispose_mapping(pru->mapped_irq[pru->evt_count]);
>>  	}
>>  
>>  	kfree(pru->mapped_irq);
>> +	pru->mapped_irq = NULL;
>>  }
>>  
>>  /*
>> @@ -324,6 +329,8 @@ static int pru_handle_intrmap(struct rproc *rproc)
>>  	of_node_put(parent);
>>  	if (!irq_parent) {
>>  		kfree(pru->mapped_irq);
>> +		pru->mapped_irq = NULL;
>> +		pru->evt_count = 0;
> 
> Patch 1/3 introduced a check on @parent that doesn't free pru->mapped_irq.  I
> would also expect that error path to do the same has what is done here.  And
> looking further up I see the error path for !pru->mapped_irq doesn't set
> pru->evt_count to zero.

Good catch, thank you. I will fix these up in v2.

regards
Suman

> 
> Thanks,
> Mathieu
> 
>>  		return -ENODEV;
>>  	}
>>  
>> @@ -398,8 +405,7 @@ static int pru_rproc_stop(struct rproc *rproc)
>>  	pru_control_write_reg(pru, PRU_CTRL_CTRL, val);
>>  
>>  	/* dispose irq mapping - new firmware can provide new mapping */
>> -	if (pru->mapped_irq)
>> -		pru_dispose_irq_mapping(pru);
>> +	pru_dispose_irq_mapping(pru);
>>  
>>  	return 0;
>>  }
>> -- 
>> 2.30.1
>>

