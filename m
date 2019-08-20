Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A523C958FB
	for <lists+linux-omap@lfdr.de>; Tue, 20 Aug 2019 09:54:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727006AbfHTHyj (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 20 Aug 2019 03:54:39 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:48206 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726049AbfHTHyj (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 20 Aug 2019 03:54:39 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7K7sWTY010494;
        Tue, 20 Aug 2019 02:54:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1566287672;
        bh=LLKSwXu5VhPkmzRL+pt5vGy/EZsLOlV9BLQ3mc2dnBM=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=jLsin4fD+U2kmE3VebIddL9F6b9L30cHVJ/XsEvHmAc0GlzviDhLNamCntD6XZh+I
         5N5pnYOvoXGSKmdLmvydLUmroFErWj8u84dch1Jk5iYZTxypfNui/qSK63sVO53+YE
         qLijh3qa3aBaM40lS5Ja42DSIV685s8pdTpwJLH8=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7K7sWta073072
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 20 Aug 2019 02:54:32 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 20
 Aug 2019 02:54:31 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 20 Aug 2019 02:54:31 -0500
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7K7sTff005351;
        Tue, 20 Aug 2019 02:54:30 -0500
Subject: Re: [PATCH 0/8] soc: ti: Add OMAP PRM driver
To:     Suman Anna <s-anna@ti.com>, <ssantosh@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-omap@vger.kernel.org>, <robh+dt@kernel.org>
CC:     <tony@atomide.com>, <devicetree@vger.kernel.org>
References: <1565164139-21886-1-git-send-email-t-kristo@ti.com>
 <432a70fc-2683-42ca-3ac7-9775efa3ca41@ti.com>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <b991f374-9e2a-5f1d-d48d-5f50a3c41756@ti.com>
Date:   Tue, 20 Aug 2019 10:54:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <432a70fc-2683-42ca-3ac7-9775efa3ca41@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 20.8.2019 2.20, Suman Anna wrote:
> Hi Tero,
> 
> On 8/7/19 2:48 AM, Tero Kristo wrote:
>> Hi,
>>
>> This series adds OMAP PRM driver which initially supports only reset
>> handling. Later on, power domain support can be added to this to get
>> rid of the current OMAP power domain handling code which resides
>> under the mach-omap2 platform directory. Initially, reset data is
>> added for AM3, OMAP4 and DRA7 SoCs.
> 
> Wakeup M3 remoteproc driver is fully upstream, so we should be able to
> test that driver as well if you can add the AM4 data. That will also
> unblock my PRUSS.
> 
> If you can add the data to others as well, it will help in easier
> migration of the individual drivers, otherwise the ti-sysc interconnect,
> hwmod, and hwmod reset data combinations will all have to be supported
> in code.

Ok, so you are saying you would need the PRM data for am4 in addition? I 
can generate that one also.

-Tero

> 
> regards
> Suman
> 
>>
>> I've been testing the reset handling logic with OMAP remoteproc
>> driver which has been converted to use generic reset framework. This
>> part is a work in progress, so will be posting patches from that part
>> later on.
>>
>> -Tero
>>
>> --
>>
> 

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
