Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 559C1F163B
	for <lists+linux-omap@lfdr.de>; Wed,  6 Nov 2019 13:44:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729286AbfKFMoc (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 6 Nov 2019 07:44:32 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:42156 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727652AbfKFMob (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 6 Nov 2019 07:44:31 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA6CiSpG058829;
        Wed, 6 Nov 2019 06:44:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1573044268;
        bh=XWVHieXyvqTkLk196SYUlUYctsSQgy1G9D4/WMpYVIY=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=lcOc/J2frFZrgrAIVWwvRVE2W7L8IXpzmVHU1kGST6Wb91WczxATl7Wag1XpJwL5v
         jvGrz29fFn/ZVBEj+GmHwe+feocnc3tpg5Q6zyV1XJKvmlfG+NvgafBC1cO7YNtuhZ
         Yfm+dSUh3lHSRX4BGD3SBbdICnSOAWYYR5i0A8s8=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xA6CiS2f063000
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 6 Nov 2019 06:44:28 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 6 Nov
 2019 06:44:12 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 6 Nov 2019 06:44:11 -0600
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA6CiNqo006624;
        Wed, 6 Nov 2019 06:44:24 -0600
Subject: Re: [PATCH 01/17] dt-bindings: remoteproc: Add OMAP remoteproc
 bindings
To:     Rob Herring <robh@kernel.org>
CC:     <bjorn.andersson@linaro.org>, <ohad@wizery.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-omap@vger.kernel.org>, <s-anna@ti.com>,
        <devicetree@vger.kernel.org>
References: <20191028124238.19224-1-t-kristo@ti.com>
 <20191028124238.19224-2-t-kristo@ti.com> <20191106032727.GA21162@bogus>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <25d55648-1fad-7de2-0937-5efeee8672eb@ti.com>
Date:   Wed, 6 Nov 2019 14:44:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191106032727.GA21162@bogus>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 06/11/2019 05:27, Rob Herring wrote:
> On Mon, Oct 28, 2019 at 02:42:22PM +0200, Tero Kristo wrote:
>> From: Suman Anna <s-anna@ti.com>
>>
>> Add the device tree bindings document for the IPU and DSP
>> remote processor devices on OMAP4+ SoCs.
>>
>> Cc: Rob Herring <robh@kernel.org>
>> Cc: devicetree@vger.kernel.org
>> Signed-off-by: Suman Anna <s-anna@ti.com>
>> Signed-off-by: Tero Kristo <t-kristo@ti.com>
>> ---
>>   .../remoteproc/ti,omap-remoteproc.txt         | 205 ++++++++++++++++++
>>   1 file changed, 205 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/remoteproc/ti,omap-remoteproc.txt
>>
> 
> Looks to be in pretty good shape, but how about doing a schema.

iommu / mailbox is not in schema format, can I just convert this one to 
schema without considering those? If yes, I can go ahead and do it.

> 
>> diff --git a/Documentation/devicetree/bindings/remoteproc/ti,omap-remoteproc.txt b/Documentation/devicetree/bindings/remoteproc/ti,omap-remoteproc.txt
>> new file mode 100644
>> index 000000000000..e2bcfcab21c1
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/remoteproc/ti,omap-remoteproc.txt
>> @@ -0,0 +1,205 @@
>> +OMAP4+ Remoteproc Devices
>> +=========================
>> +
>> +The OMAP family of SoCs usually have one or more slave processor sub-systems
>> +that are used to offload some of the processor-intensive tasks, or to manage
>> +other hardware accelerators, for achieving various system level goals.
>> +
>> +The processor cores in the sub-system are usually behind an IOMMU, and may
>> +contain additional sub-modules like Internal RAM and/or ROMs, L1 and/or L2
>> +caches, an Interrupt Controller, a Cache Controller etc.
>> +
>> +The OMAP SoCs usually have a DSP processor sub-system and/or an IPU processor
>> +sub-system. The DSP processor sub-system can contain any of the TI's C64x,
>> +C66x or C67x family of DSP cores as the main execution unit. The IPU processor
>> +sub-system usually contains either a Dual-Core Cortex-M3 or Dual-Core Cortex-M4
>> +processors.
>> +
>> +Remote Processor Node:
>> +======================
>> +Each remote processor sub-system is represented as a single DT node. Each node
>> +has a number of required or optional properties that enable the OS running on
>> +the host processor (MPU) to perform the device management of the remote
>> +processor and to communicate with the remote processor. The various properties
>> +can be classified as constant or variable. The constant properties are dictated
>> +by the SoC and does not change from one board to another having the same SoC.
>> +Examples of constant properties include 'iommus', 'reg'. The variable properties
>> +are dictated by the system integration aspects such as memory on the board, or
>> +configuration used within the corresponding firmware image. Examples of variable
>> +properties include 'mboxes', 'memory-region', 'timers', 'watchdog-timers' etc.
>> +
>> +Required properties:
>> +--------------------
>> +The following are the mandatory properties:
>> +
>> +- compatible:	Should be one of the following,
>> +		    "ti,omap4-dsp" for DSPs on OMAP4 SoCs
>> +		    "ti,omap5-dsp" for DSPs on OMAP5 SoCs
>> +		    "ti,dra7-dsp" for DSPs on DRA7xx/AM57xx SoCs
>> +		    "ti,omap4-ipu" for IPUs on OMAP4 SoCs
>> +		    "ti,omap5-ipu" for IPUs on OMAP5 SoCs
>> +		    "ti,dra7-ipu" for IPUs on DRA7xx/AM57xx SoCs
>> +
>> +- iommus:	phandles to OMAP IOMMU nodes, that need to be programmed
>> +		for this remote processor to access any external RAM memory or
>> +		other peripheral device address spaces. This property usually
>> +		has only a single phandle. Multiple phandles are used only in
>> +		cases where the sub-system has different ports for different
>> +		sub-modules within the processor sub-system (eg: DRA7 DSPs),
>> +		and need the same programming in both the MMUs.

^ the target of this is not in schema.

>> +
>> +- mboxes:	OMAP Mailbox specifier denoting the sub-mailbox, to be used for
>> +		communication with the remote processor. The specifier format is
>> +		as per the bindings,
>> +		Documentation/devicetree/bindings/mailbox/omap-mailbox.txt
>> +		This property should match with the sub-mailbox node used in
>> +		the firmware image.

^ Neither this one.

>> +
>> +Optional properties:
>> +--------------------
>> +Some of these properties are mandatory on some SoCs, and some are optional
>> +depending on the configuration of the firmware image to be executed on the
>> +remote processor. The conditions are mentioned for each property.
>> +
>> +The following are the optional properties:
>> +- reg:			Address space for any remoteproc memories present on
>> +			the SoC. Should contain an entry for each value in
>> +			'reg-names'. These are mandatory for all DSP and IPU
>> +			processors that have them (OMAP4/OMAP5 DSPs do not have
>> +			any RAMs)
>> +
>> +- reg-names:		Required names for each of the address spaces defined in
>> +			the 'reg' property. Should contain a string from among
>> +			the following names, each representing the corresponding
>> +			internal RAM memory region,
>> +			   "l2ram" for L2 RAM,
>> +			   "l1pram" for L1 Program RAM Memory/Cache,
>> +			   "l1dram" for L1 Data RAM Memory/Cache,
>> +
>> +			All devices may not have all the above memories.
>> +
>> +- syscon-bootreg:	Should be a pair of the phandle to the System Control
> 
> ti,bootreg

This one I can fix.

> 
>> +			Configuration region that contains the boot address
>> +			register, and the register offset of the boot address
>> +			register within the System Control module. This property
>> +			is required for all the DSP instances on OMAP4, OMAP5
>> +			and DRA7xx SoCs.
>> +
>> +- memory-region:	phandle to the reserved memory node to be associated
>> +			with the remoteproc device. The reserved memory node
>> +			can be a CMA memory node, and should be defined as
>> +			per the bindings,
>> +			Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
>> +
>> +- mbox-names:		Optional names for the OMAP mailbox specifiers mentioned
>> +			in the 'mboxes' property, one per specifier value
> 
>  From the mboxes description, seemed like only one entry?
> 
> Need to define the values here.

I think I can just ditch this. The current driver doesn't care about the 
name at all. It is not used in any of the examples / current DT data either.

> 
>> +
>> +- timers:		One or more phandles to OMAP DMTimer nodes, that serve
>> +			as System/Tick timers for the OS running on the remote
>> +			processors. This will usually be a single timer if the
>> +			processor sub-system is running in SMP mode, or one per
>> +			core in the processor sub-system. This can also be used
>> +			to reserve specific timers to be dedicated to the
>> +			remote processors.
>> +
>> +			This property is mandatory on remote processors requiring
>> +			external tick wakeup, and to support Power Management
>> +			features. The timers to be used should match with the
>> +			timers used in the firmware image.
>> +
>> +- watchdog-timers:	One or more phandles to OMAP DMTimer nodes, used to
>> +			serve as Watchdog timers for the processor cores. This
>> +			will usually be one per executing processor core, even
>> +			if the processor sub-system is running a SMP OS.
>> +
>> +			The timers to be used should match with the watchdog
>> +			timers used in the firmware image.
> 
> These 2 are not standard names. Either need 'ti,' prefix or we should
> standardize them. There's been some discussion of an input capture
> binding and I was wondering if it should be more general to any
> timer function.

I'll convert these to ti,xyz for now.

-Tero

> 
>> +
>> +Example:
>> +--------
>> +
>> +1. OMAP4 DSP
>> +	/* DSP Reserved Memory node */
>> +	reserved-memory {
>> +		#address-cells = <1>;
>> +		#size-cells = <1>;
>> +		ranges;
>> +
>> +		dsp_memory_region: dsp-memory@98000000 {
>> +			compatible = "shared-dma-pool";
>> +			reg = <0x98000000 0x800000>;
>> +			reusable;
>> +		};
>> +	};
>> +
>> +	/* DSP node */
>> +	ocp {
>> +		dsp: dsp {
>> +			compatible = "ti,omap4-dsp";
>> +			syscon-bootreg = <&scm_conf 0x304>;
>> +			iommus = <&mmu_dsp>;
>> +			mboxes = <&mailbox &mbox_dsp>;
>> +			memory-region = <&dsp_memory_region>;
>> +			timers = <&timer5>;
>> +			watchdog-timers = <&timer6>;
>> +		};
>> +	};
>> +
>> +2. OMAP5 IPU
>> +	/* IPU Reserved Memory node */
>> +	reserved-memory {
>> +		#address-cells = <2>;
>> +		#size-cells = <2>;
>> +		ranges;
>> +
>> +		ipu_memory_region: ipu-memory@95800000 {
>> +			compatible = "shared-dma-pool";
>> +			reg = <0 0x95800000 0 0x3800000>;
>> +			reusable;
>> +		};
>> +	};
>> +
>> +	/* IPU node */
>> +	ocp {
>> +		ipu: ipu@55020000 {
>> +			compatible = "ti,omap5-ipu";
>> +			reg = <0x55020000 0x10000>;
>> +			reg-names = "l2ram";
>> +			iommus = <&mmu_ipu>;
>> +			mboxes = <&mailbox &mbox_ipu>;
>> +			memory-region = <&ipu_memory_region>;
>> +			timers = <&timer3>, <&timer4>;
>> +			watchdog-timers = <&timer9>, <&timer11>;
>> +		};
>> +	};
>> +
>> +3. DRA7xx/AM57xx DSP
>> +	/* DSP1 Reserved Memory node */
>> +	reserved-memory {
>> +		#address-cells = <2>;
>> +		#size-cells = <2>;
>> +		ranges;
>> +
>> +		dsp1_memory_region: dsp1-memory@99000000 {
>> +			compatible = "shared-dma-pool";
>> +			reg = <0x0 0x99000000 0x0 0x4000000>;
>> +			reusable;
>> +		};
>> +	};
>> +
>> +	/* DSP1 node */
>> +	ocp {
>> +		dsp1: dsp@40800000 {
>> +			compatible = "ti,dra7-dsp";
>> +			reg = <0x40800000 0x48000>,
>> +			      <0x40e00000 0x8000>,
>> +			      <0x40f00000 0x8000>;
>> +			reg-names = "l2ram", "l1pram", "l1dram";
>> +			syscon-bootreg = <&scm_conf 0x55c>;
>> +			iommus = <&mmu0_dsp1>, <&mmu1_dsp1>;
>> +			mboxes = <&mailbox5 &mbox_dsp1_ipc3x>;
>> +			memory-region = <&dsp1_memory_region>;
>> +			timers = <&timer5>;
>> +			watchdog-timers = <&timer10>;
>> +		};
>> +	};
>> -- 
>> 2.17.1
>>
>> --

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
