Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AF8F21BF18
	for <lists+linux-omap@lfdr.de>; Fri, 10 Jul 2020 23:14:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726287AbgGJVOt (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 10 Jul 2020 17:14:49 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:59024 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726275AbgGJVOs (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 10 Jul 2020 17:14:48 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 06ALDx9N112187;
        Fri, 10 Jul 2020 16:13:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1594415639;
        bh=q1pnMYCq9dsed/gdYAEjNLBVNb25WLckeWzTyxQdg+0=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=UXIO9akGzFSjh1182Sj19Pe95TBE6s/S5AuaU0zNJRiHeWMniq5+5r42XicMQY6V9
         a3rIrMIqiHI+FerNiWpjnaqhpZllqht4kFLNB4ToNBg7Lwe03h074vBz9FLWLy3ZV1
         3+xjQzQkOFuWZHCToSEacoXZFa8pHipKwPNwxErg=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06ALDxF0127631;
        Fri, 10 Jul 2020 16:13:59 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 10
 Jul 2020 16:13:58 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 10 Jul 2020 16:13:58 -0500
Received: from [10.250.34.57] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06ALDwLm026850;
        Fri, 10 Jul 2020 16:13:58 -0500
Subject: Re: [PATCHv3 5/6] irqchip/irq-pruss-intc: Add support for ICSSG INTC
 on K3 SoCs
To:     Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>,
        Marc Zyngier <maz@kernel.org>
CC:     <tglx@linutronix.de>, <jason@lakedaemon.net>, <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <david@lechnology.com>,
        "Mills, William" <wmills@ti.com>
References: <1593699479-1445-1-git-send-email-grzegorz.jaszczyk@linaro.org>
 <1593699479-1445-6-git-send-email-grzegorz.jaszczyk@linaro.org>
 <d1b232c6f33a629117a2ecbd440622d0@kernel.org>
 <CAMxfBF5p3kh-E-vUxo60a+QTuqQXbsSVYSTc_qYvN8ZckLPKzA@mail.gmail.com>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <8de2316f-733e-25d3-7512-f7725ac4e9eb@ti.com>
Date:   Fri, 10 Jul 2020 16:13:58 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAMxfBF5p3kh-E-vUxo60a+QTuqQXbsSVYSTc_qYvN8ZckLPKzA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Marc,

On 7/3/20 12:05 PM, Grzegorz Jaszczyk wrote:
> On Thu, 2 Jul 2020 at 19:59, Marc Zyngier <maz@kernel.org> wrote:
>>
>> On 2020-07-02 15:17, Grzegorz Jaszczyk wrote:
>>> From: Suman Anna <s-anna@ti.com>
>>>
>>> The K3 AM65x and J721E SoCs have the next generation of the PRU-ICSS
>>> IP,
>>> commonly called ICSSG. The PRUSS INTC present within the ICSSG supports
>>> more System Events (160 vs 64), more Interrupt Channels and Host
>>> Interrupts
>>> (20 vs 10) compared to the previous generation PRUSS INTC instances.
>>> The
>>> first 2 and the last 10 of these host interrupt lines are used by the
>>> PRU and other auxiliary cores and sub-modules within the ICSSG, with 8
>>> host interrupts connected to MPU. The host interrupts 5, 6, 7 are also
>>> connected to the other ICSSG instances within the SoC and can be
>>> partitioned as per system integration through the board dts files.
>>>
>>> Enhance the PRUSS INTC driver to add support for this ICSSG INTC
>>> instance. This support is added using specific compatible and match
>>> data and updating the code to use this data instead of the current
>>> hard-coded macros. The INTC config structure is updated to use the
>>> higher events and channels on all SoCs, while limiting the actual
>>> processing to only the relevant number of events/channels/interrupts.
>>>
>>> Signed-off-by: Suman Anna <s-anna@ti.com>
>>> Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
>>> ---
>>> v2->v3:
>>> - Change patch order: use it directly after "irqchip/irq-pruss-intc:
>>>    Implement irq_{get,set}_irqchip_state ops" and before new
>>>    "irqchip/irq-pruss-intc: Add event mapping support" in order to
>>> reduce
>>>    diff.
>>
>> The diff would be even smaller if you introduced a variable number of
>> inputs the first place, i.e. in patch #2. Most if this patch just
>> retrofits it. Please squash these changes into that initial patch,
>> and only add the platform stuff here.

Yeah, all the variables were introduced in this patch based on patch 
history. Until this new IP came, we haven't had a need to use variables 
in the original driver code. That's also the reason for this being a 
separate patch rather than squashed into the original patch.

regards
Suman

>
> Sure I will do that.
> 
> Thank you,
> Grzegorz
> 

