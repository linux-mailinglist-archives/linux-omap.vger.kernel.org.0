Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3A9F62093
	for <lists+linux-omap@lfdr.de>; Mon,  8 Jul 2019 16:35:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729912AbfGHOfX (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 8 Jul 2019 10:35:23 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:58084 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728725AbfGHOfX (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 8 Jul 2019 10:35:23 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x68EY6Rp102598;
        Mon, 8 Jul 2019 09:34:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1562596446;
        bh=hXfxFp1QXezw+NYZdrZlfzveNpTBArYCTN7fGcltScQ=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=Tnv5OR8RgxVpa931ZBMUNiMeBBQ17JAoeVng8k56BuAuO7P3DplN8kePTRCRILrcc
         J88tQqCI3WWWDokNlmPPFbC8X7IqefGBo0kQSng7nfLSkUViUKJTHia0B9s4ghiPCg
         45SiEITPpxI5T1anGYDGpWhHl8hQ6i/ZviEw0Kkk=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x68EY6QZ003693
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 8 Jul 2019 09:34:06 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 8 Jul
 2019 09:34:06 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 8 Jul 2019 09:34:06 -0500
Received: from [10.250.81.153] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x68EY5hT101564;
        Mon, 8 Jul 2019 09:34:05 -0500
Subject: Re: [PATCH 1/6] dt-bindings: irqchip: Add PRUSS interrupt controller
 bindings
To:     Suman Anna <s-anna@ti.com>, Marc Zyngier <marc.zyngier@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>
CC:     Tony Lindgren <tony@atomide.com>, Roger Quadros <rogerq@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Sekhar Nori <nsekhar@ti.com>,
        David Lechner <david@lechnology.com>,
        Murali Karicheri <m-karicheri2@ti.com>,
        <devicetree@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
References: <20190708035243.12170-1-s-anna@ti.com>
 <20190708035243.12170-2-s-anna@ti.com>
From:   "Andrew F. Davis" <afd@ti.com>
Message-ID: <b67e8ce6-a291-ce4c-9972-b7fc7cd08bb4@ti.com>
Date:   Mon, 8 Jul 2019 10:34:05 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190708035243.12170-2-s-anna@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 7/7/19 11:52 PM, Suman Anna wrote:
> The Programmable Real-Time Unit Subsystem (PRUSS) contains an interrupt
> controller (INTC) that can handle various system input events and post
> interrupts back to the device-level initiators. The INTC can support
> upto 64 input events on most SoCs with individual control configuration
> and hardware prioritization. These events are mapped onto 10 interrupt
> lines through two levels of many-to-one mapping support. Different
> interrupt lines are routed to the individual PRU cores or to the
> host CPU or to other PRUSS instances.
> 
> The K3 AM65x and J721E SoCs have the next generation of the PRU-ICSS IP,
> commonly called ICSSG. The ICSSG interrupt controller on K3 SoCs provide
> a higher number of host interrupts (20 vs 10) and can handle an increased
> number of input events (160 vs 64) from various SoC interrupt sources.
> 
> Add the bindings document for these interrupt controllers on all the
> applicable SoCs. It covers the OMAP architecture SoCs - AM33xx, AM437x
> and AM57xx; the Keystone 2 architecture based 66AK2G SoC; the Davinci
> architecture based OMAPL138 SoCs, and the K3 architecture based AM65x
> and J721E SoCs.
> 
> Signed-off-by: Suman Anna <s-anna@ti.com>
> Signed-off-by: Andrew F. Davis <afd@ti.com>
> Signed-off-by: Roger Quadros <rogerq@ti.com>
> ---
> Prior version: https://patchwork.kernel.org/patch/10795771/
> 
>  .../interrupt-controller/ti,pruss-intc.txt    | 92 +++++++++++++++++++
>  1 file changed, 92 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/ti,pruss-intc.txt
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/ti,pruss-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/ti,pruss-intc.txt
> new file mode 100644
> index 000000000000..020073c07a92
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/ti,pruss-intc.txt
> @@ -0,0 +1,92 @@
> +PRU ICSS INTC on TI SoCs
> +========================
> +
> +Each PRUSS has a single interrupt controller instance that is common to both
> +the PRU cores. Most interrupt controllers can route 64 input events which are
> +then mapped to 10 possible output interrupts through two levels of mapping.
> +The input events can be triggered by either the PRUs and/or various other
> +PRUSS internal and external peripherals. The first 2 output interrupts are
> +fed exclusively to the internal PRU cores, with the remaining 8 (2 through 9)
> +connected to external interrupt controllers including the MPU and/or other
> +PRUSS instances, DSPs or devices.
> +
> +The K3 family of SoCs can handle 160 input events that can be mapped to 20
> +different possible output interrupts. The additional output interrupts (10
> +through 19) are connected to new sub-modules within the ICSSG instances.
> +
> +This interrupt-controller node should be defined as a child node of the
> +corresponding PRUSS node. The node should be named "interrupt-controller".
> +Please see the overall PRUSS bindings document for additional details
> +including a complete example,
> +    Documentation/devicetree/bindings/soc/ti/ti,pruss.txt
> +
> +Required Properties:
> +--------------------
> +- compatible           : should be one of the following,
> +                             "ti,pruss-intc" for OMAP-L13x/AM18x/DA850 SoCs,
> +                                                 AM335x family of SoCs,
> +                                                 AM437x family of SoCs,
> +                                                 AM57xx family of SoCs
> +                                                 66AK2G family of SoCs
> +                             "ti,icssg-intc" for K3 AM65x & J721E family of SoCs
> +- reg                  : base address and size for the PRUSS INTC sub-module
> +- interrupts           : all the interrupts generated towards the main host
> +                         processor in the SoC. The format depends on the
> +                         interrupt specifier for the particular SoC's ARM GIC
> +                         parent interrupt controller. A shared interrupt can
> +                         be skipped if the desired destination and usage is by
> +                         a different processor/device.
> +- interrupt-names      : should use one of the following names for each valid
> +                         interrupt connected to ARM GIC, the name should match
> +                         the corresponding host interrupt number,
> +                             "host0", "host1", "host2", "host3", "host4",
> +                             "host5", "host6" or "host7"
> +- interrupt-controller : mark this node as an interrupt controller
> +- #interrupt-cells     : should be 1. Client users shall use the PRU System
> +                         event number (the interrupt source that the client
> +                         is interested in) as the value of the interrupts
> +                         property in their node
> +
> +Optional Properties:
> +--------------------
> +The following properties are _required_ only for some SoCs. If none of the below
> +properties are defined, it implies that all the host interrupts 2 through 9 are
> +connected exclusively to the ARM GIC.
> +
> +- ti,irqs-reserved     : an array of 8-bit elements of host interrupts between
> +                         0 and 7 (corresponding to PRUSS INTC output interrupts
> +                         2 through 9) that are not connected to the ARM GIC.

The reason for 0-7 mapping to 2-9 is not instantly clear to someone
reading this. If you respin this could you note that reason is
interrupts 0 and 1 are always routed back into the PRUSS. Thinking more
on that, the same is true for interrupt 7 ("host5") on AM437x/66AK2G yet
we don't skip that in the naming.. now that we have the reserved IRQ
mechanism above, why not leave the one-to-one interrupt to name mapping,
but always have at least the first two marked as reserved for all the
current devices:

ti,irqs-reserved = /bits/ 8 <0 1>;

Then any "hostx" listed as reserved need not be present in the host
interrupts property array. To me that would solve the "managing
interrupts not targeting the Linux running core" problem and keep the
names consistent, e.g.:

/* AM437x PRU-ICSS */
pruss_intc: interrupt-controller@20000 {
	compatible = "ti,pruss-intc";
	reg = <0x20000 0x2000>;
	interrupts = <                       20       21       22
	                   23       24                25       26>;
	interrupt-names =                   "host2", "host3", "host4",
	                  "host5", "host6",          "host8", "host9";
	interrupt-controller;
	#interrupt-cells = <1>;
	ti,irqs-reserved = /bits/ 8 <0 1 7>;
};

Instantly clear which are missing and which "hostx" maps to which host
interrupt number.

Andrew

> +                           Eg: AM437x and 66AK2G SoCs do not have "host5"
> +                               interrupt connected to MPU
> +- ti,irqs-shared       : an array of 8-bit elements of host interrupts between
> +                         0 and 7 (corresponding to PRUSS INTC output interrupts
> +                         2 through 9) that are also connected to other devices
> +                         or processors in the SoC.
> +                           Eg: AM65x and J721E SoCs have "host5", "host6" and
> +                               "host7" interrupts connected to MPU, and other
> +                               ICSSG instances
> +
> +
> +Example:
> +--------
> +
> +1.	/* AM33xx PRU-ICSS */
> +	pruss: pruss@0 {
> +		compatible = "ti,am3356-pruss";
> +		reg = <0x0 0x80000>;
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		...
> +
> +		pruss_intc: interrupt-controller@20000 {
> +			compatible = "ti,pruss-intc";
> +			reg = <0x20000 0x2000>;
> +			interrupts = <20 21 22 23 24 25 26 27>;
> +			interrupt-names = "host0", "host1", "host2",
> +					  "host3", "host4", "host5",
> +					  "host6", "host7";
> +			interrupt-controller;
> +			#interrupt-cells = <1>;
> +			ti,irqs-shared = /bits/ 8 <0 6 7>;
> +		};
> +	};
> 
