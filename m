Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E3001478E9
	for <lists+linux-omap@lfdr.de>; Fri, 24 Jan 2020 08:22:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730612AbgAXHWE (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 24 Jan 2020 02:22:04 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:52876 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725817AbgAXHWE (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 24 Jan 2020 02:22:04 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00O7M0Ei114290;
        Fri, 24 Jan 2020 01:22:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1579850520;
        bh=/+wlp8NWszHu9hwI5xbto1zIaBFloKdl6UogH/4mwhU=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=QiwhuVMUi/aTOpIug3SzDNZSwMB3gfgLc7V4ovistaSez/3RKNNue9MTbvUpxXJhY
         jjhJAoqfiDELievWnkBOlJy+Jbjcx3jP2j5ANoPvVmIykvOW5M/qoXGYhMqPSey+Lx
         qnD+K31pH9JqmMkEUyG1Hn2SlOwE9ZA7CEHVEXpE=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00O7LxS9129366
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 24 Jan 2020 01:21:59 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 24
 Jan 2020 01:21:59 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 24 Jan 2020 01:21:59 -0600
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00O7Lu22064904;
        Fri, 24 Jan 2020 01:21:57 -0600
Subject: Re: [Patch v4 00/10] ARM: dts: dra7: add cal nodes
To:     Tony Lindgren <tony@atomide.com>, Benoit Parrot <bparrot@ti.com>
CC:     <linux-omap@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20191211140558.10407-1-bparrot@ti.com>
 <20200123171737.GB5885@atomide.com> <20200123172624.GE5885@atomide.com>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <668be3a7-d9be-6a2e-71ba-5631bf99dfae@ti.com>
Date:   Fri, 24 Jan 2020 09:21:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200123172624.GE5885@atomide.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 23/01/2020 19:26, Tony Lindgren wrote:
> * Tony Lindgren <tony@atomide.com> [200123 17:18]:
>> * Benoit Parrot <bparrot@ti.com> [191211 06:03]:
>>> This patch series adds the needed clkctrl and ty-sysc nodes for CAL module.
>>> It also adds support for the module in related dtsi and dts for DRA72,
>>> DRA76 and AM654 SoC.
>>
>> Applying these into omap-for-v5.6/ti-sysc-dt-cam on top of Tero's
>> for-5.6-ti-clk branch. It might be too later for v5.6, but we'll
>> see.
> 
> Actually I'll leave out the k3-am65 dts changes as I don't see
> acks for those. Tero can pick up those later.
> 
> Regards,
> 
> Tony
> 

Right, I think I also missed the cal clkctrl patch in this series. This 
series is imho applying against too many different trees (three if I am 
not mistaken) and should be split up to avoid confusion / not to get 
lost in mailboxes.

-Tero
--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
