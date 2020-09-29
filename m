Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AD1F27D58C
	for <lists+linux-omap@lfdr.de>; Tue, 29 Sep 2020 20:13:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728006AbgI2SNB (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 29 Sep 2020 14:13:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:47796 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725320AbgI2SNA (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 29 Sep 2020 14:13:00 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 61130208B8;
        Tue, 29 Sep 2020 18:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601403179;
        bh=KbbIptFu2by3ZEgiSoxO0ItV258aPMBQ8QGyKLlZVN4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=RJjs+GRAdQMy1SObha2G7D1UaBcQCAAyaTf8WgvCvreuOJYCdRhPfgljfewCRMqNa
         fgTvFA+0dGumXNIblpNRfptGGEAht5GxmMN852H1TK4YPcCUSphboNBwtzPzAVnGzS
         +GpbuSl9ZZMwew3iyJxm0lXQg8HDC9Hx7S1EK6Fw=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1kNK7V-00FxpD-8M; Tue, 29 Sep 2020 19:12:57 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Tue, 29 Sep 2020 19:12:57 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Jisheng Zhang <Jisheng.Zhang@synaptics.com>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        linux-pci@vger.kernel.org,
        Binghui Wang <wangbinghui@hisilicon.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-arm-kernel@axis.com, Vidya Sagar <vidyas@nvidia.com>,
        Fabio Estevam <festevam@gmail.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Jesper Nilsson <jesper.nilsson@axis.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Pratyush Anand <pratyush.anand@gmail.com>,
        linux-tegra@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Kukjin Kim <kgene@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Xiaowei Song <songxiaowei@hisilicon.com>,
        Richard Zhu <hongxing.zhu@nxp.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-arm-msm@vger.kernel.org,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Yue Wang <yue.wang@amlogic.com>,
        linux-samsung-soc@vger.kernel.org,
        Bjorn Helgaas <bhelgaas@google.com>,
        linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Jingoo Han <jingoohan1@gmail.com>,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH v2 0/5] PCI: dwc: improve msi handling
In-Reply-To: <6ead62a5-6ad5-bde8-a5df-93c0f8029f65@nvidia.com>
References: <20200924190421.549cb8fc@xhacker.debian>
 <de4d9294-4f6d-c7d1-efc7-c8ef6570bd64@nvidia.com>
 <20200929184851.22682ff1@xhacker.debian>
 <8e06a370-a37a-5f33-b43b-2830adb31b3e@nvidia.com>
 <d4a6eea3c5e33a3a4056885419df95a7@kernel.org>
 <6ead62a5-6ad5-bde8-a5df-93c0f8029f65@nvidia.com>
User-Agent: Roundcube Webmail/1.4.8
Message-ID: <5f4947b18bf381615a37aa81c2242477@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: jonathanh@nvidia.com, Jisheng.Zhang@synaptics.com, hayashi.kunihiko@socionext.com, narmstrong@baylibre.com, linux-pci@vger.kernel.org, wangbinghui@hisilicon.com, bjorn.andersson@linaro.org, yamada.masahiro@socionext.com, thierry.reding@gmail.com, linux-arm-kernel@axis.com, vidyas@nvidia.com, festevam@gmail.com, jbrunet@baylibre.com, robh@kernel.org, jesper.nilsson@axis.com, lorenzo.pieralisi@arm.com, khilman@baylibre.com, pratyush.anand@gmail.com, linux-tegra@vger.kernel.org, krzk@kernel.org, kishon@ti.com, kgene@kernel.org, linux-imx@nxp.com, songxiaowei@hisilicon.com, hongxing.zhu@nxp.com, martin.blumenstingl@googlemail.com, linux-arm-msm@vger.kernel.org, s.hauer@pengutronix.de, yue.wang@amlogic.com, linux-samsung-soc@vger.kernel.org, bhelgaas@google.com, linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, jingoohan1@gmail.com, agross@kernel.org, linux-kernel@vger.kernel.org, svarbanov@mm-sol.com, kernel@pengutroni
 x.de, gustavo.pimentel@synopsys.com, shawnguo@kernel.org, l.stach@pengutronix.de
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 2020-09-29 19:02, Jon Hunter wrote:
> On 29/09/2020 18:25, Marc Zyngier wrote:
>> On 2020-09-29 14:22, Jon Hunter wrote:
>>> Hi Jisheng,
>>> 
>>> On 29/09/2020 11:48, Jisheng Zhang wrote:
>>>> Hi Jon,
>>>> 
>>>> On Fri, 25 Sep 2020 09:53:45 +0100 Jon Hunter wrote:
>>>> 
>>>>> 
>>>>> On 24/09/2020 12:05, Jisheng Zhang wrote:
>>>>>> Improve the msi code:
>>>>>> 1. Add proper error handling.
>>>>>> 2. Move dw_pcie_msi_init() from each users to designware host to 
>>>>>> solve
>>>>>> msi page leakage in resume path.
>>>>> 
>>>>> Apologies if this is slightly off topic, but I have been meaning to 
>>>>> ask
>>>>> about MSIs and PCI. On Tegra194 which uses the DWC PCI driver,
>>>>> whenever we
>>>>> hotplug CPUs we see the following warnings ...
>>>>> 
>>>>>  [      79.068351] WARNING KERN IRQ70: set affinity failed(-22).
>>>>>  [      79.068362] WARNING KERN IRQ71: set affinity failed(-22).
>>>>> 
>>>> 
>>>> I tried to reproduce this issue on Synaptics SoC, but can't 
>>>> reproduce
>>>> it.
>>>> Per my understanding of the code in kernel/irq/cpuhotplug.c, this
>>>> warning
>>>> happened when we migrate irqs away from the offline cpu, this 
>>>> implicitly
>>>> implies that before this point the irq has bind to the offline cpu,
>>>> but how
>>>> could this happen given current dw_pci_msi_set_affinity() 
>>>> implementation
>>>> always return -EINVAL
>>> 
>>> By default the smp_affinity should be set so that all CPUs can be
>>> interrupted ...
>>> 
>>> $ cat /proc/irq/70/smp_affinity
>>> 0xff
>>> 
>>> In my case there are 8 CPUs and so 0xff implies that the interrupt 
>>> can
>>> be triggered on any of the 8 CPUs.
>>> 
>>> Do you see the set_affinity callback being called for the DWC irqchip 
>>> in
>>> migrate_one_irq()?
>> 
>> The problem is common to all MSI implementations that end up muxing
>> all the end-point MSIs into a single interrupt. With these systems,
>> you cannot set the affinity of individual MSIs (they don't target a
>> CPU, they target another interrupt... braindead). Only the mux
>> interrupt can have its affinity changed.
>> 
>> So returning -EINVAL is the right thing to do.
> 
> Right, so if that is the case, then surely there should be some way to
> avoid these warnings because they are not relevant?

I don't think there is a way to do this, because the core code
doesn't (and cannot) know the exact interrupt topology.

The only alternative would be to change the affinity of the mux
interrupt when a MSI affinity changes, but that tends to break
userspace (irqbalance, for example).

         M.
-- 
Jazz is not dead. It just smells funny...
