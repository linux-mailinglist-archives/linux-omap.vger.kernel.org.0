Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2083B1B7594
	for <lists+linux-omap@lfdr.de>; Fri, 24 Apr 2020 14:40:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727101AbgDXMkw (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 24 Apr 2020 08:40:52 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:48526 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726667AbgDXMkv (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 24 Apr 2020 08:40:51 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03OCeSwJ130179;
        Fri, 24 Apr 2020 07:40:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1587732028;
        bh=OqOZLXd6jVvlszCib9onXl4SS/9K0iruKK4fRcv8uIo=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=ha46ki2bVuhYHKmUkAjivI0+mpfT7WpIwnDlT14eb2DC9lTigC25z6CcIBzOrVumB
         A2XwWgWHoOz4DuYBnO7J5iUE78ku6r1j52O4oUAXepntKDk65Ly7uPiFuIYvERXfoa
         GEzSBhFyo3FISMa/7Vdkr2wpMR/rzcNrm3L1E9oA=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 03OCeSpK001066
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 24 Apr 2020 07:40:28 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 24
 Apr 2020 07:40:28 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 24 Apr 2020 07:40:28 -0500
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03OCeOSv072911;
        Fri, 24 Apr 2020 07:40:25 -0500
Subject: Re: OF: ERROR: Bad of_node_put() on
 /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/l4per-cm@1700/l4per-clkctrl@28
To:     Tony Lindgren <tony@atomide.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>
CC:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        <linux-omap@vger.kernel.org>, <lkft-triage@lists.linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Benoit Cousson <bcousson@baylibre.com>,
        Carlos Hernandez <ceh@ti.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Olof Johansson <olof@lixom.net>, <tomi.valkeinen@ti.com>,
        Anders Roxell <anders.roxell@linaro.org>
References: <CA+G9fYv5NxK+F5DX_q1c_wvnhjT_WTZBFJQXLWFeqMXsEcASZg@mail.gmail.com>
 <CA+G9fYu-qYP2wJw4p1p_C6_ttwK0fvw+qUnsN9mDuKOv3zGEBw@mail.gmail.com>
 <20200417152903.GO37466@atomide.com>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <6366d76c-b9dc-6fa5-afad-0b2f471f8ec5@ti.com>
Date:   Fri, 24 Apr 2020 15:40:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200417152903.GO37466@atomide.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 17/04/2020 18:29, Tony Lindgren wrote:
> * Naresh Kamboju <naresh.kamboju@linaro.org> [200327 16:44]:
>> The reported problem still happening on arm beagle board x15 device
>> running Linux next kernel 20200327.
> ...
> 
>> [    0.000000] OF: ERROR: Bad of_node_put() on
>> /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/l4per-cm@1700/l4per-clkctrl@28
>> [    0.000000] CPU: 0 PID: 0 Comm: swapper/0 Tainted: G        W
>>    5.6.0-rc7-next-20200327 #1
>> [    0.000000] Hardware name: Generic DRA74X (Flattened Device Tree)
>> [    0.000000] [<c0311810>] (unwind_backtrace) from [<c030ba14>]
>> (show_stack+0x10/0x14)
>> [    0.000000] [<c030ba14>] (show_stack) from [<c0fb6604>]
>> (dump_stack+0xbc/0xd0)
>> [    0.000000] [<c0fb6604>] (dump_stack) from [<c0fbb07c>]
>> (kobject_put+0xc0/0x104)
>> [    0.000000] [<c0fbb07c>] (kobject_put) from [<c1639e4c>]
>> (of_clk_init+0x18c/0x228)
>> [    0.000000] [<c1639e4c>] (of_clk_init) from [<c1611544>]
>> (omap_clk_init+0x3c/0x58)
>> [    0.000000] [<c1611544>] (omap_clk_init) from [<c1611ea8>]
>> (omap4_sync32k_timer_init+0x8/0x2c)
>> [    0.000000] [<c1611ea8>] (omap4_sync32k_timer_init) from
>> [<c161213c>] (omap5_realtime_timer_init+0x8/0x234)
>> [    0.000000] [<c161213c>] (omap5_realtime_timer_init) from
>> [<c1600c88>] (start_kernel+0x330/0x4b8)
> 
> Just FYI, Tero is looking at the clock issues that seem to be
> causing these warnings.

Haven't seen this before, but easily reproducible with 
multi_v7_defconfig. I have a simple fix for it now, will post to lists soon.

-Tero
--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
