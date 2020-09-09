Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 062382636CB
	for <lists+linux-omap@lfdr.de>; Wed,  9 Sep 2020 21:47:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726408AbgIITrY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 9 Sep 2020 15:47:24 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:52314 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726184AbgIITrW (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 9 Sep 2020 15:47:22 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 089JlEk6043812;
        Wed, 9 Sep 2020 14:47:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1599680834;
        bh=hyeMXjel84UV7AF54SUwa8AymegmYGcJAwI92mILVZ8=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=m/C/r4R4krbBRVuNz47YCnpmQttF4XBgtFafuP/yP+Omw/B8axuFhyxeyajG7rsS4
         aSDq9mgAfA8290/s4+t3OSbDiJXmH7mRhRUMo5PrBZ2Rc5YtLN643o/WGD/6vAH8+T
         CmUKwpGcHaNKtGseokSFr0dV/8YizjbPosrZ5HiE=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 089JlEd2055518
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 9 Sep 2020 14:47:14 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 9 Sep
 2020 14:47:13 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 9 Sep 2020 14:47:13 -0500
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 089JlACC025704;
        Wed, 9 Sep 2020 14:47:12 -0500
Subject: Re: omap1 and __arch_pfn_to_dma
To:     Tony Lindgren <tony@atomide.com>, Christoph Hellwig <hch@lst.de>
CC:     Aaro Koskinen <aaro.koskinen@iki.fi>, <linux-omap@vger.kernel.org>
References: <20200908092831.GA20123@lst.de>
 <20200909055552.GA2747@atomide.com>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <065869e4-7528-f41c-26f2-5fd5e5f64959@ti.com>
Date:   Wed, 9 Sep 2020 22:47:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200909055552.GA2747@atomide.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 09/09/2020 08:55, Tony Lindgren wrote:
> Hi,
> 
> * Christoph Hellwig <hch@lst.de> [200908 09:28]:
>> Hi Aaro and Tony,
>>
>> omap1 is the last arm platform implementing __arch_pfn_to_dma and
>> __arch_dma_to_pfn.  Any chance you could help converting them to
>> use the dma pfn offset in struct device [1] instead?
> 
> Sounds like a plan, however I don't have currently access to my omap1
> devices and won't for about a month. Aaro care to look at this?
> 

FYI.
Seems arch/arm/mach-keystone/keystone.c can be used as reference.

> 
>> p1] which we are also reworking to support multiple ranges, but I
>> can help with fixing that up easily

-- 
Best regards,
grygorii
