Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 070DB17048B
	for <lists+linux-omap@lfdr.de>; Wed, 26 Feb 2020 17:38:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727795AbgBZQik (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 26 Feb 2020 11:38:40 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:54332 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726905AbgBZQik (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 26 Feb 2020 11:38:40 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01QGcaO5059521;
        Wed, 26 Feb 2020 10:38:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1582735116;
        bh=Y3tqYQtA2KOT83i8aBDzwvA1MW/G9kqRvwSgdkDo8WY=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=N40sUK5gOMDaFCdRlsHax/ZXVSpxmArREXCpUh0YIACYZSd7tY0OqSmOGtZhEerTw
         5iax1SyAvTFQhn3hRksb7ktHFrqUsuCRQ0mc2isuI1oeduxzxbdsTGmncDCi3XJsL9
         rMNZ5dtBtYOcd/PH15fTtPl5bFVvDvd9g49oekPU=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01QGcaAh093694
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 26 Feb 2020 10:38:36 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 26
 Feb 2020 10:38:36 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 26 Feb 2020 10:38:36 -0600
Received: from [128.247.58.153] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01QGcaUt102323;
        Wed, 26 Feb 2020 10:38:36 -0600
Subject: Re: [PATCH 01/12] dt-bindings: bus: ti-sysc: Add support for PRUSS
 SYSC type
To:     Roger Quadros <rogerq@ti.com>, Tony Lindgren <tony@atomide.com>
CC:     Tero Kristo <t-kristo@ti.com>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
References: <20200225204649.28220-1-s-anna@ti.com>
 <20200225204649.28220-2-s-anna@ti.com>
 <96ec493b-3615-e84d-ba30-cabbf750c874@ti.com>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <b35e278d-c3dd-3356-93c3-0511d3164d7a@ti.com>
Date:   Wed, 26 Feb 2020 10:38:36 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <96ec493b-3615-e84d-ba30-cabbf750c874@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Roger,

On 2/26/20 2:42 AM, Roger Quadros wrote:
> Hi Suman,
> 
> On 25/02/2020 22:46, Suman Anna wrote:
>> From: Roger Quadros <rogerq@ti.com>
>>
>> The PRUSS module has a SYSCFG which is unique. The SYSCFG
>> has two additional unique fields called STANDBY_INIT and
>> SUB_MWAIT in addition to regular IDLE_MODE and STANDBY_MODE
>> fields. Add the bindings for this new sysc type.
>>
>> Signed-off-by: Roger Quadros <rogerq@ti.com>
>> Signed-off-by: Suman Anna <s-anna@ti.com>
>> ---
>>   Documentation/devicetree/bindings/bus/ti-sysc.txt | 1 +
>>   include/dt-bindings/bus/ti-sysc.h                 | 4 ++++
>>   2 files changed, 5 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/bus/ti-sysc.txt
>> b/Documentation/devicetree/bindings/bus/ti-sysc.txt
>> index 233eb8294204..c984143d08d2 100644
>> --- a/Documentation/devicetree/bindings/bus/ti-sysc.txt
>> +++ b/Documentation/devicetree/bindings/bus/ti-sysc.txt
>> @@ -38,6 +38,7 @@ Required standard properties:
>>           "ti,sysc-dra7-mcasp"
>>           "ti,sysc-usb-host-fs"
>>           "ti,sysc-dra7-mcan"
>> +        "ti,sysc-pruss"
>>     - reg        shall have register areas implemented for the
>> interconnect
>>           target module in question such as revision, sysc and syss
>> diff --git a/include/dt-bindings/bus/ti-sysc.h
>> b/include/dt-bindings/bus/ti-sysc.h
> 
> Did you intentionally leave this here? It should be part of 2nd patch?

No, not really, include/bindings are also considered part of bindings.
This patch alone should be enough for you to add the DT nodes.

regards
Suman

> 
>> index babd08a1d226..76b07826ed05 100644
>> --- a/include/dt-bindings/bus/ti-sysc.h
>> +++ b/include/dt-bindings/bus/ti-sysc.h
>> @@ -18,6 +18,10 @@
>>     #define SYSC_DRA7_MCAN_ENAWAKEUP    (1 << 4)
>>   +/* PRUSS sysc found on AM33xx/AM43xx/AM57xx */
>> +#define SYSC_PRUSS_SUB_MWAIT        (1 << 5)
>> +#define SYSC_PRUSS_STANDBY_INIT        (1 << 4)
>> +
>>   /* SYSCONFIG STANDBYMODE/MIDLEMODE/SIDLEMODE supported by hardware */
>>   #define SYSC_IDLE_FORCE            0
>>   #define SYSC_IDLE_NO            1
>>
> 

