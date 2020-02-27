Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED94D170D8E
	for <lists+linux-omap@lfdr.de>; Thu, 27 Feb 2020 01:58:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727973AbgB0A6s (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 26 Feb 2020 19:58:48 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:47034 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727967AbgB0A6s (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 26 Feb 2020 19:58:48 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01R0wjm8048772;
        Wed, 26 Feb 2020 18:58:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1582765125;
        bh=u1rXOvIC3GPIMqY9jvYvgjAjNqT5aBjPiGZUX6d07dE=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=MgqjvqniF19IPGUJXSED/2TMJA8Ptl42WvQn2/JQJOgbccAOt7b0ha8dFIkP3l0VX
         EYfCY5BXeoHlsVaa1/UM0eE8UcnCO2lLBXUW+/c//O0cgicBOyxxpa1ER/FlMM7G0Z
         kqQ024e7fblbQ2dQfX9VlEoSFqnbTeDwI51wt1E0=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01R0wjJL019321
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 26 Feb 2020 18:58:45 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 26
 Feb 2020 18:58:44 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 26 Feb 2020 18:58:44 -0600
Received: from [128.247.58.153] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01R0witd077641;
        Wed, 26 Feb 2020 18:58:44 -0600
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
From:   Suman Anna <s-anna@ti.com>
Message-ID: <b1fe18b5-f779-aea5-8c66-41c0de66c39f@ti.com>
Date:   Wed, 26 Feb 2020 18:58:44 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20200226223921.GB37466@atomide.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony,

On 2/26/20 4:39 PM, Tony Lindgren wrote:
> * Tony Lindgren <tony@atomide.com> [200226 22:38]:
>> * Suman Anna <s-anna@ti.com> [200226 20:35]:
>>> On 2/26/20 12:29 PM, Tony Lindgren wrote:
>>>> * Suman Anna <s-anna@ti.com> [200225 20:47]:
>>>>> The PRU-ICSS target module node was left in disabled state in the base
>>>>> am33xx-l4.dtsi file. Enable this node on all the AM335x beaglebone
>>>>> boards as they mostly use a AM3358 or a AM3359 SoC which do contain
>>>>> the PRU-ICSS IP.
>>>>
>>>> Just get rid of the top level status = "disabled". The default
>>>> is enabled, and the device is there for sure inside the SoC.
>>>> And then there's no need for pointless status = "okay" tinkering
>>>> in the board specific dts files so no need for this patch.
>>>
>>> The IP is not available on all SoCs, and there are about 40 different
>>> board files atm across AM33xx and AM437x, and am not sure what SoCs they
>>> are actually using.
>>
>> Oh that issue again.. Maybe take a look at patch "[PATCH 2/3] bus: ti-sysc:
>> Detect display subsystem related devices" if you can add runtime
>> detection for the accelerators there similar to what I hadded for omap3.
>> acclerators.
> 
> Sorry I meant instead patch "[PATCH 6/7] bus: ti-sysc: Implement SoC
> revision handling".

OK, looked down that path a bit more and looking through mach-omap2/id.c
 and soc.h, I see some of the part number infrastructure build on top of
DEV_FEATURE bits for some SoCs. The DEVICE_ID registers only have the
generic family and the Silicon Revision number for AM33xx and AM437x and
we currently do not have any infrastructure around exact SoC
identification for AM33xx and AM437x atleast.

Do you have the bit-field split for the DEV_FEATURE bits somewhere,
because I couldn't find any in either the DM or the TRM. On AM437x,
there is no difference between AM4372 and AM4376 DEV_FEATURE value even
though the former doesn't have the PRUSS. On AM335x, may be bit 0
signifies the presence of PRUSS??

regards
Suman
