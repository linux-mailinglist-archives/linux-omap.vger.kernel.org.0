Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D7D7244EE0
	for <lists+linux-omap@lfdr.de>; Fri, 14 Aug 2020 21:33:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728373AbgHNTdk (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 14 Aug 2020 15:33:40 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:54368 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728243AbgHNTdj (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 14 Aug 2020 15:33:39 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07EJXVdZ077400;
        Fri, 14 Aug 2020 14:33:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1597433611;
        bh=p212y5+bOF57KAqtSiuMDV5uuIRq0cHH7cYSMccia9E=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=yKmUAt6X6+hqPKFx+tgmqEmNv54creI2khbtJVP4hOXgoxurnO5W1K65pWnYGJWwA
         stOI5UEJPvvR0xohUkLB34mT2C/ruyBf/eOGFMZ103QfcmCRZv3cOlaMxLK3wCAcbw
         WPOTUHM5JpM1fgWdzRcgrdAYdVz45qub6VBEFbAc=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07EJXVB8057247;
        Fri, 14 Aug 2020 14:33:31 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 14
 Aug 2020 14:33:31 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 14 Aug 2020 14:33:30 -0500
Received: from [10.250.32.36] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07EJXUbn056309;
        Fri, 14 Aug 2020 14:33:30 -0500
Subject: Re: [PATCH 06/13] ARM: dts: omap4-panda-common: Add CMA pools and
 enable IPU & DSP
To:     Guillaume Tucker <guillaume.tucker@collabora.com>,
        Tony Lindgren <tony@atomide.com>
CC:     Tero Kristo <t-kristo@ti.com>, <devicetree@vger.kernel.org>,
        <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <kernelci-results@groups.io>
References: <20200709231954.1973-1-s-anna@ti.com>
 <20200709231954.1973-7-s-anna@ti.com>
 <3e44fc46-07ac-6103-5c4d-8c7389453b87@collabora.com>
 <f6ec1fd3-f42b-9284-44dc-e754e02ee86e@collabora.com>
 <ee6e41e6-cfc6-145c-97a7-3aa53fc8df39@ti.com>
 <94dbd2ee-bbac-2374-93bc-15ed67ba0e01@collabora.com>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <563c6edb-d55a-8f91-c8ff-06c5ee04b52e@ti.com>
Date:   Fri, 14 Aug 2020 14:33:25 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <94dbd2ee-bbac-2374-93bc-15ed67ba0e01@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Guillaume,

On 8/14/20 11:33 AM, Guillaume Tucker wrote:
> On 14/08/2020 16:26, Suman Anna wrote:
>> On 8/14/20 9:32 AM, Guillaume Tucker wrote:
>>> On 12/08/2020 06:31, Guillaume Tucker wrote:
>>>> On 10/07/2020 00:19, Suman Anna wrote:
>>>>> The CMA reserved memory nodes have been added for the IPU and DSP
>>>>> remoteproc devices on all the OMAP4-based Panda boards. These nodes
>>>>> are assigned to the respective rproc device nodes, and both the
>>>>> IPU and DSP remote processors are enabled for all these boards.
>>>>>
>>>>> The current CMA pools and sizes are defined statically for each device.
>>>>> The starting addresses are fixed to meet current dependencies on the
>>>>> remote processor firmwares, and will go away when the remote-side
>>>>> code has been improved to gather this information runtime during
>>>>> its initialization.
>>>>>
>>>>> An associated pair of the rproc node and its CMA node can be disabled
>>>>> later on if there is no use-case defined to use that remote processor.
>>>>>
>>>>> Signed-off-by: Suman Anna <s-anna@ti.com>
>>>>> ---
>>>>>  arch/arm/boot/dts/omap4-panda-common.dtsi | 30 +++++++++++++++++++++++
>>>>>  1 file changed, 30 insertions(+)
>>>>>
>>>>> diff --git a/arch/arm/boot/dts/omap4-panda-common.dtsi b/arch/arm/boot/dts/omap4-panda-common.dtsi
>>>>> index 55ea8b6189af..ef79028fc95f 100644
>>>>> --- a/arch/arm/boot/dts/omap4-panda-common.dtsi
>>>>> +++ b/arch/arm/boot/dts/omap4-panda-common.dtsi
>>>>> @@ -12,6 +12,26 @@ memory@80000000 {
>>>>>  		reg = <0x80000000 0x40000000>; /* 1 GB */
>>>>>  	};
>>>>>  
>>>>> +	reserved-memory {
>>>>> +		#address-cells = <1>;
>>>>> +		#size-cells = <1>;
>>>>> +		ranges;
>>>>> +
>>>>> +		dsp_memory_region: dsp-memory@98000000 {
>>>>> +			compatible = "shared-dma-pool";
>>>>> +			reg = <0x98000000 0x800000>;
>>>>> +			reusable;
>>>>> +			status = "okay";
>>>>> +		};
>>>>> +
>>>>> +		ipu_memory_region: ipu-memory@98800000 {
>>>>> +			compatible = "shared-dma-pool";
>>>>> +			reg = <0x98800000 0x7000000>;
>>>>> +			reusable;
>>>>> +			status = "okay";
>>>>> +		};
>>>>> +	};
>>>>> +
>>>>>  	chosen {
>>>>>  		stdout-path = &uart3;
>>>>>  	};
>>>>> @@ -571,3 +591,13 @@ hdmi_out: endpoint {
>>>>>  		};
>>>>>  	};
>>>>>  };
>>>>> +
>>>>> +&dsp {
>>>>> +	status = "okay";
>>>>> +	memory-region = <&dsp_memory_region>;
>>>>> +};
>>>>> +
>>>>> +&ipu {
>>>>> +	status = "okay";
>>>>> +	memory-region = <&ipu_memory_region>;
>>>>> +};
>>>>>
>>>>
>>>> This appears to be causing some BUG alert messages:
>>>>
>>>>   BUG: Bad page state in process swapper/0  pfn:9c801
>>>>
>>>> as reported on kernelci.org:
>>>>
>>>>   https://kernelci.org/test/case/id/5f326c6661360154c452c1c9/
>>>>
>>>> I've run a bisection and it landed on this commit.  If you fix it
>>>> with another patch, please add:
>>>>
>>>>   Reported-by: "kernelci.org bot" <bot@kernelci.org>
>>>
>>>
>>> This was bisected again automatically on mainline, see the report
>>> below.  Is anyone available to take a look, or could the patch be
>>> reverted?
>>
>> Thanks Guillaume for the report. I will take a look at this today. It is strange
>> that the bisect is pointing to this commit as reserving a CMA pool and assigning
>> it to a device should be fairly normal usage. Is the issue seen only on OMAP4
>> Pandaboard and not any of the other OMAP5 uEVM or DRA7xx/AM57xx EVMS?
> 
> Thanks for taking a look.
> 
> In the extended OMAP family, aside from the Panda only the
> BeagleBone Black and BeagleBoard xM are being tested on
> kernelci.org and they don't show this problem:

OK, neither of these boards have these IPU remote processors, and so they do not
define any reserved-memory pools.

Anyway, the issue started popping up because of the mem arguments used in the
bootargs on these kernelci setups, and the current CMA pools using addresses
from this region, resulting in the kernel panic traces.

Kernel command line: console=ttyO2,115200n8 root=/dev/ram0 fixrtc nocompcache
vram=48M omapfb.vram=0:24M mem=456M@0x80000000 mem=512M@0xA0000000 rootdelay=5
console_msg_format=syslog ip=dhcp

The bootargs leave out a hole in the available memory for kernel, and this way
of specifying was coming from really very old downstream TI kernel usage (pre-DT
days). This carveout hole was used to define the memory used by remoteprocs.
This has come through a long evolution of using memblock functions in code, to
finally using the reserved-memory nodes in dts since then.

The issue should be fixed once the bootargs are fixed up to remove using these
mem args, and let the memory for the board be defined by the regular dts memory
node.

I have checked the next git history and these patches were first added from
next-20200714 onwards, and that matches the kernelci failure log history.

regards
Suman

> 
>   https://kernelci.org/soc/omap2/job/next/kernel/next-20200814/plan/baseline/
> 
> Thanks,
> Guillaume
> 
>>> On 14/08/2020 15:22, KernelCI bot wrote:
>>>> * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
>>>> * This automated bisection report was sent to you on the basis  *
>>>> * that you may be involved with the breaking commit it has      *
>>>> * found.  No manual investigation has been done to verify it,   *
>>>> * and the root cause of the problem may be somewhere else.      *
>>>> *                                                               *
>>>> * If you do send a fix, please include this trailer:            *
>>>> *   Reported-by: "kernelci.org bot" <bot@kernelci.org>          *
>>>> *                                                               *
>>>> * Hope this helps!                                              *
>>>> * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
>>>>
>>>> mainline/master bisection: baseline.dmesg.alert on panda
>>>>
>>>> Summary:
>>>>   Start:      a1d21081a60d Merge git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net
>>>>   Plain log:  https://storage.kernelci.org/mainline/master/v5.8-13249-ga1d21081a60d/arm/multi_v7_defconfig+CONFIG_SMP=n/gcc-8/lab-collabora/baseline-omap4-panda.txt
>>>>   HTML log:   https://storage.kernelci.org/mainline/master/v5.8-13249-ga1d21081a60d/arm/multi_v7_defconfig+CONFIG_SMP=n/gcc-8/lab-collabora/baseline-omap4-panda.html
>>>>   Result:     b4778e787fe9 ARM: dts: omap4-panda-common: Add CMA pools and enable IPU & DSP
>>>>
>>>> Checks:
>>>>   revert:     PASS
>>>>   verify:     PASS
>>>>
>>>> Parameters:
>>>>   Tree:       mainline
>>>>   URL:        https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>>>>   Branch:     master
>>>>   Target:     panda
>>>>   CPU arch:   arm
>>>>   Lab:        lab-collabora
>>>>   Compiler:   gcc-8
>>>>   Config:     multi_v7_defconfig+CONFIG_SMP=n
>>>>   Test case:  baseline.dmesg.alert
>>>>
>>>> Breaking commit found:
>>>>
>>>> -------------------------------------------------------------------------------
>>>> commit b4778e787fe9e82dcbff8150ebfbe6fea0b6c4e1
>>>> Author: Suman Anna <s-anna@ti.com>
>>>> Date:   Thu Jul 9 18:19:47 2020 -0500
>>>>
>>>>     ARM: dts: omap4-panda-common: Add CMA pools and enable IPU & DSP
>>>>     
>>>>     The CMA reserved memory nodes have been added for the IPU and DSP
>>>>     remoteproc devices on all the OMAP4-based Panda boards. These nodes
>>>>     are assigned to the respective rproc device nodes, and both the
>>>>     IPU and DSP remote processors are enabled for all these boards.
>>>>     
>>>>     The current CMA pools and sizes are defined statically for each device.
>>>>     The starting addresses are fixed to meet current dependencies on the
>>>>     remote processor firmwares, and will go away when the remote-side
>>>>     code has been improved to gather this information runtime during
>>>>     its initialization.
>>>>     
>>>>     An associated pair of the rproc node and its CMA node can be disabled
>>>>     later on if there is no use-case defined to use that remote processor.
>>>>     
>>>>     Signed-off-by: Suman Anna <s-anna@ti.com>
>>>>     Signed-off-by: Tony Lindgren <tony@atomide.com>
>>>>
>>>> diff --git a/arch/arm/boot/dts/omap4-panda-common.dtsi b/arch/arm/boot/dts/omap4-panda-common.dtsi
>>>> index 55ea8b6189af..ef79028fc95f 100644
>>>> --- a/arch/arm/boot/dts/omap4-panda-common.dtsi
>>>> +++ b/arch/arm/boot/dts/omap4-panda-common.dtsi
>>>> @@ -12,6 +12,26 @@
>>>>  		reg = <0x80000000 0x40000000>; /* 1 GB */
>>>>  	};
>>>>  
>>>> +	reserved-memory {
>>>> +		#address-cells = <1>;
>>>> +		#size-cells = <1>;
>>>> +		ranges;
>>>> +
>>>> +		dsp_memory_region: dsp-memory@98000000 {
>>>> +			compatible = "shared-dma-pool";
>>>> +			reg = <0x98000000 0x800000>;
>>>> +			reusable;
>>>> +			status = "okay";
>>>> +		};
>>>> +
>>>> +		ipu_memory_region: ipu-memory@98800000 {
>>>> +			compatible = "shared-dma-pool";
>>>> +			reg = <0x98800000 0x7000000>;
>>>> +			reusable;
>>>> +			status = "okay";
>>>> +		};
>>>> +	};
>>>> +
>>>>  	chosen {
>>>>  		stdout-path = &uart3;
>>>>  	};
>>>> @@ -571,3 +591,13 @@
>>>>  		};
>>>>  	};
>>>>  };
>>>> +
>>>> +&dsp {
>>>> +	status = "okay";
>>>> +	memory-region = <&dsp_memory_region>;
>>>> +};
>>>> +
>>>> +&ipu {
>>>> +	status = "okay";
>>>> +	memory-region = <&ipu_memory_region>;
>>>> +};
>>>> -------------------------------------------------------------------------------
>>>>
>>>>
>>>> Git bisection log:
>>>>
>>>> -------------------------------------------------------------------------------
>>>> git bisect start
>>>> # good: [e4cbce4d131753eca271d9d67f58c6377f27ad21] Merge tag 'sched-core-2020-08-03' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
>>>> git bisect good e4cbce4d131753eca271d9d67f58c6377f27ad21
>>>> # bad: [a1d21081a60dfb7fddf4a38b66d9cef603b317a9] Merge git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net
>>>> git bisect bad a1d21081a60dfb7fddf4a38b66d9cef603b317a9
>>>> # bad: [47ec5303d73ea344e84f46660fff693c57641386] Merge git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next
>>>> git bisect bad 47ec5303d73ea344e84f46660fff693c57641386
>>>> # bad: [e4a7b2dc35d9582c253cf5e6d6c3605aabc7284d] Merge tag 'leds-5.9-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds
>>>> git bisect bad e4a7b2dc35d9582c253cf5e6d6c3605aabc7284d
>>>> # bad: [74858abbb1032222f922487fd1a24513bbed80f9] Merge tag 'cap-checkpoint-restore-v5.9' of git://git.kernel.org/pub/scm/linux/kernel/git/brauner/linux
>>>> git bisect bad 74858abbb1032222f922487fd1a24513bbed80f9
>>>> # bad: [2f3fbfdaf77f3ac417d0511fac221f76af79f6fc] Merge tag 'arm-dt-5.9' of git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc
>>>> git bisect bad 2f3fbfdaf77f3ac417d0511fac221f76af79f6fc
>>>> # bad: [c6e2e454baef6080ef89c2b6488e708d5fa0f052] Merge tag 'qcom-arm64-for-5.9' of git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into arm/dt
>>>> git bisect bad c6e2e454baef6080ef89c2b6488e708d5fa0f052
>>>> # bad: [3502e079c6bcff95f5c34eecb5c1d9ad1379ae0d] Merge tag 'tegra-for-5.9-arm-dt' of git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux into arm/dt
>>>> git bisect bad 3502e079c6bcff95f5c34eecb5c1d9ad1379ae0d
>>>> # bad: [39a85f6d91a1a827985ce44a346a99f68167d0ee] Merge tag 'v5.8-next-dts64' of git://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux into arm/dt
>>>> git bisect bad 39a85f6d91a1a827985ce44a346a99f68167d0ee
>>>> # good: [dfe2a4cf8e2f4c1f53877aa6cb38eda102a14681] Merge tag 'uniphier-dt64-v5.9' of git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-uniphier into arm/dt
>>>> git bisect good dfe2a4cf8e2f4c1f53877aa6cb38eda102a14681
>>>> # bad: [75f66813e081d2bd718d931ee50334c12a9e4492] Replace HTTP links with HTTPS ones: OMAP DEVICE TREE SUPPORT
>>>> git bisect bad 75f66813e081d2bd718d931ee50334c12a9e4492
>>>> # good: [9ae60ac13fc847d7175587290a1a9aa2aac091b0] ARM: dts: omap4: Update the DSP node
>>>> git bisect good 9ae60ac13fc847d7175587290a1a9aa2aac091b0
>>>> # bad: [3026ce47498dfdc92966d8d66f10afabf7190c46] ARM: dts: omap5: Add DSP and IPU nodes
>>>> git bisect bad 3026ce47498dfdc92966d8d66f10afabf7190c46
>>>> # good: [691eb1805fcfc1a2ede06aec6a4d85d312961146] ARM: dts: omap4: Add aliases for rproc nodes
>>>> git bisect good 691eb1805fcfc1a2ede06aec6a4d85d312961146
>>>> # bad: [7f7d771c00bf65d18a3e30e983b4061a418efbf4] ARM: dts: omap4-panda-common:: Add system timers to DSP and IPU
>>>> git bisect bad 7f7d771c00bf65d18a3e30e983b4061a418efbf4
>>>> # bad: [b4778e787fe9e82dcbff8150ebfbe6fea0b6c4e1] ARM: dts: omap4-panda-common: Add CMA pools and enable IPU & DSP
>>>> git bisect bad b4778e787fe9e82dcbff8150ebfbe6fea0b6c4e1
>>>> # first bad commit: [b4778e787fe9e82dcbff8150ebfbe6fea0b6c4e1] ARM: dts: omap4-panda-common: Add CMA pools and enable IPU & DSP
>>>> -------------------------------------------------------------------------------
>>>
>>>
>>
> 

