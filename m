Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BABA7172A20
	for <lists+linux-omap@lfdr.de>; Thu, 27 Feb 2020 22:29:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729907AbgB0V2y (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 27 Feb 2020 16:28:54 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:52888 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726460AbgB0V2x (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 27 Feb 2020 16:28:53 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01RLSoFZ065308;
        Thu, 27 Feb 2020 15:28:50 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1582838930;
        bh=nPQq3L7Fs1cwFTI6ZvMes6py+WF+yLyk55XfqWxBlNU=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=BIhxXBGXxkMK5H7F2jvvEPSEsKZZSnkEkR2pUneTpp0c9wK86zpreFRwfASIoETDQ
         f4eR+4MhttrDRO/Z+TgpFjMLK5iDSOnGgQUhGsjyGdIayNRclyjQ1W+1DwUJXV6blq
         GQ6dYqSQui07LQ/XOB720vpIkNbq2K9CKp9QUB7o=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01RLSo9a126498
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 27 Feb 2020 15:28:50 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 27
 Feb 2020 15:28:50 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 27 Feb 2020 15:28:50 -0600
Received: from [128.247.58.153] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01RLSoqD011631;
        Thu, 27 Feb 2020 15:28:50 -0600
Subject: Re: [PATCH 06/12] ARM: dts: am335x-bone-common: Enable PRU-ICSS
 interconnect node
To:     Tony Lindgren <tony@atomide.com>
CC:     Roger Quadros <rogerq@ti.com>, Tero Kristo <t-kristo@ti.com>,
        <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20200225204649.28220-1-s-anna@ti.com>
 <20200225204649.28220-7-s-anna@ti.com> <20200226182924.GU37466@atomide.com>
 <af3965db-54b2-3e4f-414f-d27ca4b5ced1@ti.com>
 <20200226223745.GA37466@atomide.com> <20200226223921.GB37466@atomide.com>
 <b1fe18b5-f779-aea5-8c66-41c0de66c39f@ti.com>
 <20200227020713.GE37466@atomide.com>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <28724629-2872-545a-309f-5a3208221b33@ti.com>
Date:   Thu, 27 Feb 2020 15:28:50 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20200227020713.GE37466@atomide.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 2/26/20 8:07 PM, Tony Lindgren wrote:
> * Suman Anna <s-anna@ti.com> [200227 00:59]:
>> Hi Tony,
>>
>> On 2/26/20 4:39 PM, Tony Lindgren wrote:
>>> * Tony Lindgren <tony@atomide.com> [200226 22:38]:
>>>> * Suman Anna <s-anna@ti.com> [200226 20:35]:
>>>>> On 2/26/20 12:29 PM, Tony Lindgren wrote:
>>>>>> * Suman Anna <s-anna@ti.com> [200225 20:47]:
>>>>>>> The PRU-ICSS target module node was left in disabled state in the base
>>>>>>> am33xx-l4.dtsi file. Enable this node on all the AM335x beaglebone
>>>>>>> boards as they mostly use a AM3358 or a AM3359 SoC which do contain
>>>>>>> the PRU-ICSS IP.
>>>>>>
>>>>>> Just get rid of the top level status = "disabled". The default
>>>>>> is enabled, and the device is there for sure inside the SoC.
>>>>>> And then there's no need for pointless status = "okay" tinkering
>>>>>> in the board specific dts files so no need for this patch.
>>>>>
>>>>> The IP is not available on all SoCs, and there are about 40 different
>>>>> board files atm across AM33xx and AM437x, and am not sure what SoCs they
>>>>> are actually using.
>>>>
>>>> Oh that issue again.. Maybe take a look at patch "[PATCH 2/3] bus: ti-sysc:
>>>> Detect display subsystem related devices" if you can add runtime
>>>> detection for the accelerators there similar to what I hadded for omap3.
>>>> acclerators.
>>>
>>> Sorry I meant instead patch "[PATCH 6/7] bus: ti-sysc: Implement SoC
>>> revision handling".
>>
>> OK, looked down that path a bit more and looking through mach-omap2/id.c
>>  and soc.h, I see some of the part number infrastructure build on top of
>> DEV_FEATURE bits for some SoCs. The DEVICE_ID registers only have the
>> generic family and the Silicon Revision number for AM33xx and AM437x and
>> we currently do not have any infrastructure around exact SoC
>> identification for AM33xx and AM437x atleast.
>>
>> Do you have the bit-field split for the DEV_FEATURE bits somewhere,
>> because I couldn't find any in either the DM or the TRM. On AM437x,
>> there is no difference between AM4372 and AM4376 DEV_FEATURE value even
>> though the former doesn't have the PRUSS. On AM335x, may be bit 0
>> signifies the presence of PRUSS??
> 
> OK not sure how that could be detected. Maybe check the efuses on
> the newer SoCs?

OK, latest datasheeet has fixed these values up, and they are no longer
identical. In anycase, none of the current AM437x board dts files in the
kernel use AM4372, so atleast for AM4372, I can drop the status=disabled
even without adding any SoC name support.

regards
Suman
