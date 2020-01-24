Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9DF671478F4
	for <lists+linux-omap@lfdr.de>; Fri, 24 Jan 2020 08:25:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727228AbgAXHZa (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 24 Jan 2020 02:25:30 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:35384 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725817AbgAXHZa (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 24 Jan 2020 02:25:30 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00O7PPtv035938;
        Fri, 24 Jan 2020 01:25:25 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1579850725;
        bh=aLKZcPtLNbLT7eCPXz16+bbLYos68avohZ2UHw2V4J8=;
        h=Subject:From:To:CC:References:Date:In-Reply-To;
        b=Kmj75LThcu/JVrwWStAt7z/VAW5eFfd9BT+NJjhXLgHSc/e/F/5sfny4hGFzogON5
         3DkIDku8nscWAb5IHQoolmQUN8M5KO9dMLIpGdW/nnOXb2eRwendguJ0/fL10kDseL
         ojEaGSx6vNw+dNf/zG0akC0W9ZqzXcbb2WBOwXJo=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00O7PP6f029771
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 24 Jan 2020 01:25:25 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 24
 Jan 2020 01:25:24 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 24 Jan 2020 01:25:25 -0600
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00O7PMei089371;
        Fri, 24 Jan 2020 01:25:23 -0600
Subject: Re: [Patch v4 00/10] ARM: dts: dra7: add cal nodes
From:   Tero Kristo <t-kristo@ti.com>
To:     Tony Lindgren <tony@atomide.com>, Benoit Parrot <bparrot@ti.com>
CC:     <linux-omap@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20191211140558.10407-1-bparrot@ti.com>
 <20200123171737.GB5885@atomide.com> <20200123172624.GE5885@atomide.com>
 <668be3a7-d9be-6a2e-71ba-5631bf99dfae@ti.com>
Message-ID: <fde9ef6c-e214-7436-10c5-7996f19b5cfe@ti.com>
Date:   Fri, 24 Jan 2020 09:25:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <668be3a7-d9be-6a2e-71ba-5631bf99dfae@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 24/01/2020 09:21, Tero Kristo wrote:
> On 23/01/2020 19:26, Tony Lindgren wrote:
>> * Tony Lindgren <tony@atomide.com> [200123 17:18]:
>>> * Benoit Parrot <bparrot@ti.com> [191211 06:03]:
>>>> This patch series adds the needed clkctrl and ty-sysc nodes for CAL 
>>>> module.
>>>> It also adds support for the module in related dtsi and dts for DRA72,
>>>> DRA76 and AM654 SoC.
>>>
>>> Applying these into omap-for-v5.6/ti-sysc-dt-cam on top of Tero's
>>> for-5.6-ti-clk branch. It might be too later for v5.6, but we'll
>>> see.
>>
>> Actually I'll leave out the k3-am65 dts changes as I don't see
>> acks for those. Tero can pick up those later.
>>
>> Regards,
>>
>> Tony
>>
> 
> Right, I think I also missed the cal clkctrl patch in this series. This 
> series is imho applying against too many different trees (three if I am 
> not mistaken) and should be split up to avoid confusion / not to get 
> lost in mailboxes.

Not cal clkctrl but the cal k3 patches. I just assumed all dts patches 
in this series were against omaps.

Anyways, I am planning to send k3 dts pull v2 today due to dma patches 
from Peter, so I think I can sneak these also in with that...

-Tero
--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
