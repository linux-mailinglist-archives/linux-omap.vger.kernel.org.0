Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93A091D49B1
	for <lists+linux-omap@lfdr.de>; Fri, 15 May 2020 11:34:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727898AbgEOJeZ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 15 May 2020 05:34:25 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:45424 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727803AbgEOJeZ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 15 May 2020 05:34:25 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04F9YL2A002540;
        Fri, 15 May 2020 04:34:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1589535261;
        bh=eoqwD1iY8I9uQckZWcPuP5jTSPV/Lliz8amDTTfZ87w=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=AlW9FY5X9gMIyy3p7ak4u9jg9wI1vCfsL6IgjfBVIXDaUaeFled9DxsrsjyxOwgmd
         RMESuK5NFXNcxqmXZ0458GHPDMvhXX08gT4Yvei42IT0qMcFAr/TDxSxYQhlHfWIVf
         Zxs+2U8UMeYyDQEBgRx27FGKjhmHFLT/oPBZ/TDM=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04F9YLcb057666
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 15 May 2020 04:34:21 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 15
 May 2020 04:34:20 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 15 May 2020 04:34:21 -0500
Received: from [10.250.151.179] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04F9YGRB117213;
        Fri, 15 May 2020 04:34:17 -0500
Subject: Re: [PATCH v2] arm: dts: Move am33xx and am43xx mmc nodes to
 sdhci-omap driver
To:     Tony Lindgren <tony@atomide.com>, Keerthy <j-keerthy@ti.com>
CC:     <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-omap@vger.kernel.org>, <robh+dt@kernel.org>,
        <bcousson@baylibre.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>
References: <20200512203804.9340-1-faiz_abbas@ti.com>
 <20200513162327.GM37466@atomide.com>
From:   Faiz Abbas <faiz_abbas@ti.com>
Message-ID: <94025425-95e2-e53d-cfac-a1e73e6c011a@ti.com>
Date:   Fri, 15 May 2020 15:04:15 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200513162327.GM37466@atomide.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony,

On 13/05/20 9:53 pm, Tony Lindgren wrote:
> * Faiz Abbas <faiz_abbas@ti.com> [200512 13:39]:
>> Move mmc nodes to be compatible with the sdhci-omap driver. The following
>> modifications are required for omap_hsmmc specific properties:
>>
>> ti,non-removable: convert to the generic mmc non-removable
>> ti,needs-special-reset:  co-opted into the sdhci-omap driver
>> ti,dual-volt: removed. Legacy property not used in am335x or am43xx
>> ti,needs-special-hs-handling: removed. Legacy property not used in am335x
>> or am43xx
>>
>> Also since the sdhci-omap driver does not support runtime PM, explicitly
>> disable the mmc3 instance in the dtsi.
>>
>> Signed-off-by: Faiz Abbas <faiz_abbas@ti.com>
>> ---
>>
>> v2: Rebased to latest mainline where all kernel dependancies have been merged.
>>
>> Suspend/Resume is now supported in the sdhci-omap driver.
> 
> Great, thanks for updating it.
> 
> Keerthy, care to test for am3 and am4?
> 

Suspend/resume on am43xx-gpevm is broken right now in mainline and the regression looks
like it is caused by the display subsystem. I have reported this to Tomi and
its being investigated.

Meanwhile I have tested this patch with display configs disabled and Keerthy's
suspend/resume tests pass on both am3 and am4.

Thanks,
Faiz
