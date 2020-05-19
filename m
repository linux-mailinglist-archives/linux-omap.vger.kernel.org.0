Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92E521D91F8
	for <lists+linux-omap@lfdr.de>; Tue, 19 May 2020 10:22:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726494AbgESIWb (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 19 May 2020 04:22:31 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:47128 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726329AbgESIWb (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 19 May 2020 04:22:31 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04J8MRrE114448;
        Tue, 19 May 2020 03:22:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1589876547;
        bh=0IW1CINnzDCPy46zXwT1kRP9nRJw5/Ixb4bt+1ipkao=;
        h=Subject:From:To:CC:References:Date:In-Reply-To;
        b=BcjxOhbuYDUwXr+E3p1KnVpYrSP6OydIIt42my7tZad2+EhCISYIMbQFT4PWkguvK
         vJRcay/eq7wtbj5au0hohRIplZVveFQuKJLz6dtM64/hFbx4CikRkK0FXaZoDBOtOn
         Ht+bw8DuMzj4MtSSvd0cArWQgkAQTNuowtjDKM/k=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04J8MRXq047160
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 19 May 2020 03:22:27 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 19
 May 2020 03:22:27 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 19 May 2020 03:22:27 -0500
Received: from [10.250.232.87] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04J8MOEG021758;
        Tue, 19 May 2020 03:22:25 -0500
Subject: Re: [PATCH v2] arm: dts: Move am33xx and am43xx mmc nodes to
 sdhci-omap driver
From:   Faiz Abbas <faiz_abbas@ti.com>
To:     Tony Lindgren <tony@atomide.com>, Keerthy <j-keerthy@ti.com>
CC:     <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-omap@vger.kernel.org>, <robh+dt@kernel.org>,
        <bcousson@baylibre.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>
References: <20200512203804.9340-1-faiz_abbas@ti.com>
 <20200513162327.GM37466@atomide.com>
 <94025425-95e2-e53d-cfac-a1e73e6c011a@ti.com>
Message-ID: <53c815db-dd7d-e6e1-f81a-cf05ef340c71@ti.com>
Date:   Tue, 19 May 2020 13:52:23 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <94025425-95e2-e53d-cfac-a1e73e6c011a@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Tony,

On 15/05/20 3:04 pm, Faiz Abbas wrote:
> Hi Tony,
> 
> On 13/05/20 9:53 pm, Tony Lindgren wrote:
>> * Faiz Abbas <faiz_abbas@ti.com> [200512 13:39]:
>>> Move mmc nodes to be compatible with the sdhci-omap driver. The following
>>> modifications are required for omap_hsmmc specific properties:
>>>
>>> ti,non-removable: convert to the generic mmc non-removable
>>> ti,needs-special-reset:  co-opted into the sdhci-omap driver
>>> ti,dual-volt: removed. Legacy property not used in am335x or am43xx
>>> ti,needs-special-hs-handling: removed. Legacy property not used in am335x
>>> or am43xx
>>>
>>> Also since the sdhci-omap driver does not support runtime PM, explicitly
>>> disable the mmc3 instance in the dtsi.
>>>
>>> Signed-off-by: Faiz Abbas <faiz_abbas@ti.com>
>>> ---
>>>
>>> v2: Rebased to latest mainline where all kernel dependancies have been merged.
>>>
>>> Suspend/Resume is now supported in the sdhci-omap driver.
>>
>> Great, thanks for updating it.
>>
>> Keerthy, care to test for am3 and am4?
>>
> 
> Suspend/resume on am43xx-gpevm is broken right now in mainline and the regression looks
> like it is caused by the display subsystem. I have reported this to Tomi and
> its being investigated.
> 
> Meanwhile I have tested this patch with display configs disabled and Keerthy's
> suspend/resume tests pass on both am3 and am4.
> 

Can this patch be picked up? I would really like this to be merged by v5.8

Thanks,
Faiz
