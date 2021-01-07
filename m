Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAAFA2EC733
	for <lists+linux-omap@lfdr.de>; Thu,  7 Jan 2021 01:04:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726449AbhAGAEO (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 6 Jan 2021 19:04:14 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:48708 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726293AbhAGAEO (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 6 Jan 2021 19:04:14 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 10703Q2G098696;
        Wed, 6 Jan 2021 18:03:26 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1609977806;
        bh=tQrVlUnNzpbNpbVX/IO4V0JvoJkj7OSMnP+9H9h9UJA=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=ZwjmnLknoQ8Ahwzpf1rRAvCFiXzyQFMEGeD8+4EYe1FIDZh4MuVMBFfKb1JF8DYBL
         G6swATQ9kJsfej/rWjyegqWjUbOg1KSiJ7nrmmDsWZ6DLuACvXo0g1gPd4T97zJ4K7
         UXsDanqiAXESMCyYF250A3EkqJXIxX6mQ79MgxHw=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 10703Qpx127037
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 6 Jan 2021 18:03:26 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 6 Jan
 2021 18:03:26 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 6 Jan 2021 18:03:26 -0600
Received: from [10.250.66.86] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 10703PVP035418;
        Wed, 6 Jan 2021 18:03:25 -0600
Subject: Re: [PATCH v2 0/5] Introduce PRU remoteproc consumer API
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
CC:     <ohad@wizery.com>, <bjorn.andersson@linaro.org>,
        <robh+dt@kernel.org>, <ssantosh@kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <lee.jones@linaro.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <praneeth@ti.com>,
        <rogerq@kernel.org>
References: <20201216165239.2744-1-grzegorz.jaszczyk@linaro.org>
 <20210106232704.GE9149@xps15>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <11303a1b-5ab4-def5-77b1-c500894c9c87@ti.com>
Date:   Wed, 6 Jan 2021 18:03:25 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210106232704.GE9149@xps15>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Mathieu,

On 1/6/21 5:27 PM, Mathieu Poirier wrote:
> On Wed, Dec 16, 2020 at 05:52:34PM +0100, Grzegorz Jaszczyk wrote:
>> Hi All,
>>
>> The Programmable Real-Time Unit and Industrial Communication Subsystem
>> (PRU-ICSS or simply PRUSS) on various TI SoCs consists of dual 32-bit
>> RISC cores (Programmable Real-Time Units, or PRUs) for program execution.
>>
>> There are 3 foundation components for PRUSS subsystem: the PRUSS platform
>> driver, the PRUSS INTC driver and the PRUSS remoteproc driver. All were
>> already merged and can be found under:
>> 1) drivers/soc/ti/pruss.c
>>    Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml
>> 2) drivers/irqchip/irq-pruss-intc.c
>>    Documentation/devicetree/bindings/interrupt-controller/ti,pruss-intc.yaml
>> 3) drivers/remoteproc/pru_rproc.c
>>    Documentation/devicetree/bindings/remoteproc/ti,pru-rproc.yaml
>>
>> The programmable nature of the PRUs provide flexibility to implement custom
>> peripheral interfaces, fast real-time responses, or specialized data handling.
>> Example of a PRU consumer drivers will be:
>>   - Software UART over PRUSS
>>   - PRU-ICSS Ethernet EMAC
>>
>> In order to make usage of common PRU resources and allow the consumer drivers to
>> configure the PRU hardware for specific usage the PRU API is introduced.
>>
>> Patch #3 of this series depends on one not merged remteproc related patch [1].
>>
>> Please see the individual patches for exact changes in each patch, following is
>> the only change from v1:
>>  - Change the 'prus' property name to 'ti,prus' as suggested by Rob Herring,
>>  which influences patch #1 and patch #2
>>
>> [1] https://patchwork.kernel.org/project/linux-remoteproc/patch/20201121030156.22857-3-s-anna@ti.com/
>>
>> Best regards,
>> Grzegorz
>>
>> Roger Quadros (1):
>>   remoteproc: pru: Add pru_rproc_set_ctable() function
>>
>> Suman Anna (2):
>>   dt-bindings: remoteproc: Add PRU consumer bindings
>>   remoteproc: pru: Deny rproc sysfs ops for PRU client driven boots
>>
>> Tero Kristo (2):
>>   remoteproc: pru: Add APIs to get and put the PRU cores
>>   remoteproc: pru: Configure firmware based on client setup
>>
>>  .../bindings/remoteproc/ti,pru-consumer.yaml  |  64 +++++
>>  drivers/remoteproc/pru_rproc.c                | 221 +++++++++++++++++-
>>  include/linux/pruss.h                         |  78 +++++++
> 
> This patchset is giving checkpatch.pl errors and as such will not go further
> with this revision.

Yeah, I am aware of those. Greg has intentionally skipped the checkpatch
warnings around ENOTSUPP, based on some similar discussion on a different patch,
https://lkml.org/lkml/2020/11/10/764.

Let me know if you prefer that we change these to EOPNOTSUPP.

regards
Suman

> 
>>  3 files changed, 360 insertions(+), 3 deletions(-)
>>  create mode 100644 Documentation/devicetree/bindings/remoteproc/ti,pru-consumer.yaml
>>  create mode 100644 include/linux/pruss.h
>>
>> -- 
>> 2.29.0
>>

