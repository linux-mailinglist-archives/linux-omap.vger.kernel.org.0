Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8DBBD11B70
	for <lists+linux-omap@lfdr.de>; Thu,  2 May 2019 16:30:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726297AbfEBOac (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 2 May 2019 10:30:32 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:45184 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726282AbfEBOac (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 2 May 2019 10:30:32 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x42EUKOo064994;
        Thu, 2 May 2019 09:30:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1556807420;
        bh=FJIj/BoQ7RJOLW73Y4u8uBWdtHI8Oi5sBlOJ1Q0rzMA=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=hnOQUAPWScvNqNC8MxaDVCtohyrzJ7UuV38CBtSKnhA2iNkjDNqGipLMwzV4W9JW3
         Er4w4BkhlO/TbpCtfTTaX2VAuOGdnAqFr4+lsNXg30PHE94CAXOS92rmCC2ov2t2at
         8Lm208sxjKyH7Zj6Yapzv2S8yg3H8dg9R4yjB958=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x42EUKvH082701
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 2 May 2019 09:30:20 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 2 May
 2019 09:30:19 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 2 May 2019 09:30:19 -0500
Received: from [10.250.139.87] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x42EUFHb024717;
        Thu, 2 May 2019 09:30:16 -0500
Subject: Re: [PATCH] ARM: dts: am57xx-idk: Remove support for voltage
 switching for SD card
To:     Tony Lindgren <tony@atomide.com>, Faiz Abbas <faiz_abbas@ti.com>
CC:     <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-omap@vger.kernel.org>, <mark.rutland@arm.com>,
        <robh+dt@kernel.org>, <bcousson@baylibre.com>,
        <ulf.hansson@linaro.org>, <adrian.hunter@intel.com>
References: <20190502084748.22518-1-faiz_abbas@ti.com>
 <20190502142016.GO8007@atomide.com>
From:   Faiz Abbas <a0230074@ti.com>
Message-ID: <50559611-a501-4331-c88b-5d05f6e756e9@ti.com>
Date:   Thu, 2 May 2019 20:00:14 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190502142016.GO8007@atomide.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony,

On 02/05/19 7:50 PM, Tony Lindgren wrote:
> * Faiz Abbas <faiz_abbas@ti.com> [190502 01:48]:
>> If UHS speed modes are enabled, a compatible SD card switches down to
>> 1.8V during enumeration. If after this a software reboot/crash takes
>> place and on-chip ROM tries to enumerate the SD card, the difference in
>> IO voltages (host @ 3.3V and card @ 1.8V) may end up damaging the card.
>>
>> The fix for this is to have support for power cycling the card in
>> hardware (with a PORz/soft-reset line causing a power cycle of the
>> card). Since am571x-, am572x- and am574x-idk don't have this
>> capability, disable voltage switching for these boards.
>>
>> The major effect of this is that the maximum supported speed
>> mode is now high speed(50 MHz) down from SDR104(200 MHz).
> 
> This sounds a bit urgent, does it also need a stable tag or is
> it safe to apply against any earlier kernels?
> 

This should be good to apply on any previous releases.

Thanks,
Faiz
