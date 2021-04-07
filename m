Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F976356F10
	for <lists+linux-omap@lfdr.de>; Wed,  7 Apr 2021 16:43:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239052AbhDGOnn (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 7 Apr 2021 10:43:43 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:34880 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348773AbhDGOn2 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 7 Apr 2021 10:43:28 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 137EWMlD081494;
        Wed, 7 Apr 2021 09:32:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1617805942;
        bh=/ZE3NClD3KqnjT4ROQ1TsBEaHGQZKlKWPea6oZsVB5s=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=uGmHAP1EdO5bHcQhm8Mv+BUmRytLIH1lXKUQ8ha/vXJzZszJg+g3thRoZHCfzUsjO
         nRb8tupTlEjMU8WCI2dwTSXgblZ5Rx6zPeZP0nvgW3Yh3PlorKvkS3fZPHhxcQUBnd
         wL4K79yJrIz9iBK7nzad1fSOYKKzk4LQpLSWQjjU=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 137EWMvV045630
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 7 Apr 2021 09:32:22 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 7 Apr
 2021 09:32:22 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Wed, 7 Apr 2021 09:32:22 -0500
Received: from [10.250.37.105] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 137EWLMA070655;
        Wed, 7 Apr 2021 09:32:22 -0500
Subject: Re: [PATCH 1/3] remoteproc: pru: Fixup interrupt-parent logic for fw
 events
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
 <20210323223839.17464-2-s-anna@ti.com> <20210406232837.GA330882@xps15>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <00b3fcf3-c3ed-9c2c-712e-952af019f16b@ti.com>
Date:   Wed, 7 Apr 2021 09:32:21 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210406232837.GA330882@xps15>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 4/6/21 6:28 PM, Mathieu Poirier wrote:
> On Tue, Mar 23, 2021 at 05:38:37PM -0500, Suman Anna wrote:
>> The PRU firmware interrupt mapping logic in pru_handle_intrmap() uses
>> of_irq_find_parent() with PRU device node to get a handle to the PRUSS
>> Interrupt Controller at present. This logic however requires that the
>> PRU nodes always define a interrupt-parent property. This property is
>> neither a required/defined property as per the PRU remoteproc binding,
>> nor is relevant from a DT node point of view without any associated
>> interrupts. The curret logic finds a wrong interrupt controller and
>> fails to perform proper mapping without any interrupt-parent property
>> in the PRU nodes.
>>
>> Fix this logic to always find and use the sibling interrupt controller.
>> Also, while at this, fix the acquired interrupt controller device node
>> reference properly.
>>
>> Fixes: c75c9fdac66e ("remoteproc: pru: Add support for PRU specific interrupt configuration")
>> Signed-off-by: Suman Anna <s-anna@ti.com>
>> ---
>>  drivers/remoteproc/pru_rproc.c | 15 ++++++++++++---
>>  1 file changed, 12 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/remoteproc/pru_rproc.c b/drivers/remoteproc/pru_rproc.c
>> index 16979c1cd2f4..a9d07c0751be 100644
>> --- a/drivers/remoteproc/pru_rproc.c
>> +++ b/drivers/remoteproc/pru_rproc.c
>> @@ -284,7 +284,7 @@ static int pru_handle_intrmap(struct rproc *rproc)
>>  	struct pru_rproc *pru = rproc->priv;
>>  	struct pru_irq_rsc *rsc = pru->pru_interrupt_map;
>>  	struct irq_fwspec fwspec;
>> -	struct device_node *irq_parent;
>> +	struct device_node *parent, *irq_parent;
>>  	int i, ret = 0;
>>  
>>  	/* not having pru_interrupt_map is not an error */
>> @@ -312,9 +312,16 @@ static int pru_handle_intrmap(struct rproc *rproc)
>>  
>>  	/*
>>  	 * parse and fill in system event to interrupt channel and
>> -	 * channel-to-host mapping
>> +	 * channel-to-host mapping. The interrupt controller to be used
>> +	 * for these mappings for a given PRU remoteproc is always its
>> +	 * corresponding sibling PRUSS INTC node.
>>  	 */
>> -	irq_parent = of_irq_find_parent(pru->dev->of_node);
> 
> If I understand correctly when an interrupt controller node wasn't speficied in
> the parent this was unwinding until it found one...

Correct if not specified in each PRU node, and ends up finding the complete
wrong interrupt controller (GIC) as it walks up the tree.

> 
>> +	parent = of_get_parent(dev_of_node(pru->dev));
>> +	if (!parent)
>> +		return -ENODEV;
>> +
>> +	irq_parent = of_get_child_by_name(parent, "interrupt-controller");
>> +	of_node_put(parent);
>>  	if (!irq_parent) {
>>  		kfree(pru->mapped_irq);
>>  		return -ENODEV;
>> @@ -337,11 +344,13 @@ static int pru_handle_intrmap(struct rproc *rproc)
>>  			goto map_fail;
>>  		}
>>  	}
>> +	of_node_put(irq_parent);
>>  
>>  	return ret;
>>  
>>  map_fail:
>>  	pru_dispose_irq_mapping(pru);
>> +	of_node_put(irq_parent);
> 
> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

Thanks,
Suman

> 
>>  
>>  	return ret;
>>  }
>> -- 
>> 2.30.1
>>

