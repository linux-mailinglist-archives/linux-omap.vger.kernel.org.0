Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0031244B3E
	for <lists+linux-omap@lfdr.de>; Fri, 14 Aug 2020 16:32:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728767AbgHNOca (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 14 Aug 2020 10:32:30 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:44202 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728066AbgHNOca (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 14 Aug 2020 10:32:30 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: gtucker)
        with ESMTPSA id 3F35029AA79
Subject: Re: [PATCH 06/13] ARM: dts: omap4-panda-common: Add CMA pools and
 enable IPU & DSP
From:   Guillaume Tucker <guillaume.tucker@collabora.com>
To:     Suman Anna <s-anna@ti.com>, Tony Lindgren <tony@atomide.com>
Cc:     Tero Kristo <t-kristo@ti.com>, devicetree@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernelci-results@groups.io
References: <20200709231954.1973-1-s-anna@ti.com>
 <20200709231954.1973-7-s-anna@ti.com>
 <3e44fc46-07ac-6103-5c4d-8c7389453b87@collabora.com>
Message-ID: <f6ec1fd3-f42b-9284-44dc-e754e02ee86e@collabora.com>
Date:   Fri, 14 Aug 2020 15:32:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <3e44fc46-07ac-6103-5c4d-8c7389453b87@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 12/08/2020 06:31, Guillaume Tucker wrote:
> On 10/07/2020 00:19, Suman Anna wrote:
>> The CMA reserved memory nodes have been added for the IPU and DSP
>> remoteproc devices on all the OMAP4-based Panda boards. These nodes
>> are assigned to the respective rproc device nodes, and both the
>> IPU and DSP remote processors are enabled for all these boards.
>>
>> The current CMA pools and sizes are defined statically for each device.
>> The starting addresses are fixed to meet current dependencies on the
>> remote processor firmwares, and will go away when the remote-side
>> code has been improved to gather this information runtime during
>> its initialization.
>>
>> An associated pair of the rproc node and its CMA node can be disabled
>> later on if there is no use-case defined to use that remote processor.
>>
>> Signed-off-by: Suman Anna <s-anna@ti.com>
>> ---
>>  arch/arm/boot/dts/omap4-panda-common.dtsi | 30 +++++++++++++++++++++++
>>  1 file changed, 30 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/omap4-panda-common.dtsi b/arch/arm/boot/dts/omap4-panda-common.dtsi
>> index 55ea8b6189af..ef79028fc95f 100644
>> --- a/arch/arm/boot/dts/omap4-panda-common.dtsi
>> +++ b/arch/arm/boot/dts/omap4-panda-common.dtsi
>> @@ -12,6 +12,26 @@ memory@80000000 {
>>  		reg = <0x80000000 0x40000000>; /* 1 GB */
>>  	};
>>  
>> +	reserved-memory {
>> +		#address-cells = <1>;
>> +		#size-cells = <1>;
>> +		ranges;
>> +
>> +		dsp_memory_region: dsp-memory@98000000 {
>> +			compatible = "shared-dma-pool";
>> +			reg = <0x98000000 0x800000>;
>> +			reusable;
>> +			status = "okay";
>> +		};
>> +
>> +		ipu_memory_region: ipu-memory@98800000 {
>> +			compatible = "shared-dma-pool";
>> +			reg = <0x98800000 0x7000000>;
>> +			reusable;
>> +			status = "okay";
>> +		};
>> +	};
>> +
>>  	chosen {
>>  		stdout-path = &uart3;
>>  	};
>> @@ -571,3 +591,13 @@ hdmi_out: endpoint {
>>  		};
>>  	};
>>  };
>> +
>> +&dsp {
>> +	status = "okay";
>> +	memory-region = <&dsp_memory_region>;
>> +};
>> +
>> +&ipu {
>> +	status = "okay";
>> +	memory-region = <&ipu_memory_region>;
>> +};
>>
> 
> This appears to be causing some BUG alert messages:
> 
>   BUG: Bad page state in process swapper/0  pfn:9c801
> 
> as reported on kernelci.org:
> 
>   https://kernelci.org/test/case/id/5f326c6661360154c452c1c9/
> 
> I've run a bisection and it landed on this commit.  If you fix it
> with another patch, please add:
> 
>   Reported-by: "kernelci.org bot" <bot@kernelci.org>


This was bisected again automatically on mainline, see the report
below.  Is anyone available to take a look, or could the patch be
reverted?

Thanks,
Guillaume

On 14/08/2020 15:22, KernelCI bot wrote:
> * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
> * This automated bisection report was sent to you on the basis  *
> * that you may be involved with the breaking commit it has      *
> * found.  No manual investigation has been done to verify it,   *
> * and the root cause of the problem may be somewhere else.      *
> *                                                               *
> * If you do send a fix, please include this trailer:            *
> *   Reported-by: "kernelci.org bot" <bot@kernelci.org>          *
> *                                                               *
> * Hope this helps!                                              *
> * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
> 
> mainline/master bisection: baseline.dmesg.alert on panda
> 
> Summary:
>   Start:      a1d21081a60d Merge git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net
>   Plain log:  https://storage.kernelci.org/mainline/master/v5.8-13249-ga1d21081a60d/arm/multi_v7_defconfig+CONFIG_SMP=n/gcc-8/lab-collabora/baseline-omap4-panda.txt
>   HTML log:   https://storage.kernelci.org/mainline/master/v5.8-13249-ga1d21081a60d/arm/multi_v7_defconfig+CONFIG_SMP=n/gcc-8/lab-collabora/baseline-omap4-panda.html
>   Result:     b4778e787fe9 ARM: dts: omap4-panda-common: Add CMA pools and enable IPU & DSP
> 
> Checks:
>   revert:     PASS
>   verify:     PASS
> 
> Parameters:
>   Tree:       mainline
>   URL:        https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>   Branch:     master
>   Target:     panda
>   CPU arch:   arm
>   Lab:        lab-collabora
>   Compiler:   gcc-8
>   Config:     multi_v7_defconfig+CONFIG_SMP=n
>   Test case:  baseline.dmesg.alert
> 
> Breaking commit found:
> 
> -------------------------------------------------------------------------------
> commit b4778e787fe9e82dcbff8150ebfbe6fea0b6c4e1
> Author: Suman Anna <s-anna@ti.com>
> Date:   Thu Jul 9 18:19:47 2020 -0500
> 
>     ARM: dts: omap4-panda-common: Add CMA pools and enable IPU & DSP
>     
>     The CMA reserved memory nodes have been added for the IPU and DSP
>     remoteproc devices on all the OMAP4-based Panda boards. These nodes
>     are assigned to the respective rproc device nodes, and both the
>     IPU and DSP remote processors are enabled for all these boards.
>     
>     The current CMA pools and sizes are defined statically for each device.
>     The starting addresses are fixed to meet current dependencies on the
>     remote processor firmwares, and will go away when the remote-side
>     code has been improved to gather this information runtime during
>     its initialization.
>     
>     An associated pair of the rproc node and its CMA node can be disabled
>     later on if there is no use-case defined to use that remote processor.
>     
>     Signed-off-by: Suman Anna <s-anna@ti.com>
>     Signed-off-by: Tony Lindgren <tony@atomide.com>
> 
> diff --git a/arch/arm/boot/dts/omap4-panda-common.dtsi b/arch/arm/boot/dts/omap4-panda-common.dtsi
> index 55ea8b6189af..ef79028fc95f 100644
> --- a/arch/arm/boot/dts/omap4-panda-common.dtsi
> +++ b/arch/arm/boot/dts/omap4-panda-common.dtsi
> @@ -12,6 +12,26 @@
>  		reg = <0x80000000 0x40000000>; /* 1 GB */
>  	};
>  
> +	reserved-memory {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		dsp_memory_region: dsp-memory@98000000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x98000000 0x800000>;
> +			reusable;
> +			status = "okay";
> +		};
> +
> +		ipu_memory_region: ipu-memory@98800000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x98800000 0x7000000>;
> +			reusable;
> +			status = "okay";
> +		};
> +	};
> +
>  	chosen {
>  		stdout-path = &uart3;
>  	};
> @@ -571,3 +591,13 @@
>  		};
>  	};
>  };
> +
> +&dsp {
> +	status = "okay";
> +	memory-region = <&dsp_memory_region>;
> +};
> +
> +&ipu {
> +	status = "okay";
> +	memory-region = <&ipu_memory_region>;
> +};
> -------------------------------------------------------------------------------
> 
> 
> Git bisection log:
> 
> -------------------------------------------------------------------------------
> git bisect start
> # good: [e4cbce4d131753eca271d9d67f58c6377f27ad21] Merge tag 'sched-core-2020-08-03' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
> git bisect good e4cbce4d131753eca271d9d67f58c6377f27ad21
> # bad: [a1d21081a60dfb7fddf4a38b66d9cef603b317a9] Merge git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net
> git bisect bad a1d21081a60dfb7fddf4a38b66d9cef603b317a9
> # bad: [47ec5303d73ea344e84f46660fff693c57641386] Merge git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next
> git bisect bad 47ec5303d73ea344e84f46660fff693c57641386
> # bad: [e4a7b2dc35d9582c253cf5e6d6c3605aabc7284d] Merge tag 'leds-5.9-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds
> git bisect bad e4a7b2dc35d9582c253cf5e6d6c3605aabc7284d
> # bad: [74858abbb1032222f922487fd1a24513bbed80f9] Merge tag 'cap-checkpoint-restore-v5.9' of git://git.kernel.org/pub/scm/linux/kernel/git/brauner/linux
> git bisect bad 74858abbb1032222f922487fd1a24513bbed80f9
> # bad: [2f3fbfdaf77f3ac417d0511fac221f76af79f6fc] Merge tag 'arm-dt-5.9' of git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc
> git bisect bad 2f3fbfdaf77f3ac417d0511fac221f76af79f6fc
> # bad: [c6e2e454baef6080ef89c2b6488e708d5fa0f052] Merge tag 'qcom-arm64-for-5.9' of git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into arm/dt
> git bisect bad c6e2e454baef6080ef89c2b6488e708d5fa0f052
> # bad: [3502e079c6bcff95f5c34eecb5c1d9ad1379ae0d] Merge tag 'tegra-for-5.9-arm-dt' of git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux into arm/dt
> git bisect bad 3502e079c6bcff95f5c34eecb5c1d9ad1379ae0d
> # bad: [39a85f6d91a1a827985ce44a346a99f68167d0ee] Merge tag 'v5.8-next-dts64' of git://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux into arm/dt
> git bisect bad 39a85f6d91a1a827985ce44a346a99f68167d0ee
> # good: [dfe2a4cf8e2f4c1f53877aa6cb38eda102a14681] Merge tag 'uniphier-dt64-v5.9' of git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-uniphier into arm/dt
> git bisect good dfe2a4cf8e2f4c1f53877aa6cb38eda102a14681
> # bad: [75f66813e081d2bd718d931ee50334c12a9e4492] Replace HTTP links with HTTPS ones: OMAP DEVICE TREE SUPPORT
> git bisect bad 75f66813e081d2bd718d931ee50334c12a9e4492
> # good: [9ae60ac13fc847d7175587290a1a9aa2aac091b0] ARM: dts: omap4: Update the DSP node
> git bisect good 9ae60ac13fc847d7175587290a1a9aa2aac091b0
> # bad: [3026ce47498dfdc92966d8d66f10afabf7190c46] ARM: dts: omap5: Add DSP and IPU nodes
> git bisect bad 3026ce47498dfdc92966d8d66f10afabf7190c46
> # good: [691eb1805fcfc1a2ede06aec6a4d85d312961146] ARM: dts: omap4: Add aliases for rproc nodes
> git bisect good 691eb1805fcfc1a2ede06aec6a4d85d312961146
> # bad: [7f7d771c00bf65d18a3e30e983b4061a418efbf4] ARM: dts: omap4-panda-common:: Add system timers to DSP and IPU
> git bisect bad 7f7d771c00bf65d18a3e30e983b4061a418efbf4
> # bad: [b4778e787fe9e82dcbff8150ebfbe6fea0b6c4e1] ARM: dts: omap4-panda-common: Add CMA pools and enable IPU & DSP
> git bisect bad b4778e787fe9e82dcbff8150ebfbe6fea0b6c4e1
> # first bad commit: [b4778e787fe9e82dcbff8150ebfbe6fea0b6c4e1] ARM: dts: omap4-panda-common: Add CMA pools and enable IPU & DSP
> -------------------------------------------------------------------------------


