Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ABABA184A30
	for <lists+linux-omap@lfdr.de>; Fri, 13 Mar 2020 16:06:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726477AbgCMPGB (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 13 Mar 2020 11:06:01 -0400
Received: from foss.arm.com ([217.140.110.172]:56818 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726216AbgCMPGA (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 13 Mar 2020 11:06:00 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 47ECF31B;
        Fri, 13 Mar 2020 08:06:00 -0700 (PDT)
Received: from [192.168.1.123] (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8BA3D3F67D;
        Fri, 13 Mar 2020 08:05:58 -0700 (PDT)
Subject: Re: [PATCH v2] ARM: dts: dra7: Add bus_dma_limit for L3 bus
To:     Roger Quadros <rogerq@ti.com>, tony@atomide.com
Cc:     hch@lst.de, robh+dt@kernel.org, nm@ti.com, t-kristo@ti.com,
        nsekhar@ti.com, linux-omap@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@kernel.org
References: <20200313094717.6671-1-rogerq@ti.com>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <fb916d06-1521-25a5-2eae-94244a3f9d06@arm.com>
Date:   Fri, 13 Mar 2020 15:05:33 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200313094717.6671-1-rogerq@ti.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 2020-03-13 9:47 am, Roger Quadros wrote:
> The L3 interconnect's memory map is from 0x0 to
> 0xffffffff. Out of this, System memory (SDRAM) can be
> accessed from 0x80000000 to 0xffffffff (2GB)
> 
> DRA7 does support 4GB of SDRAM but upper 2GB can only be
> accessed by the MPU subsystem.
> 
> Add the dma-ranges property to reflect the physical address limit
> of the L3 bus.
> 
> Issues ere observed only with SATA on DRA7-EVM with 4GB RAM
> and CONFIG_ARM_LPAE enabled. This is because the controller
> supports 64-bit DMA and its driver sets the dma_mask to 64-bit
> thus resulting in DMA accesses beyond L3 limit of 2G.
> 
> Setting the correct bus_dma_limit fixes the issue.

Neat! In principle you should no longer need the specific dma-ranges on 
the PCIe nodes, since AIUI those really only represent a subset of this 
general limitation, but given the other inheritance issue you saw it's 
probably safer to leave them as-is for now.

FWIW,

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

> Signed-off-by: Roger Quadros <rogerq@ti.com>
> Cc: stable@kernel.org
> ---
> 
> Changelog:
> v2:
> - Revised patch with minimal intrusion. i.e. don't change #size-cells
>    of device node.
> 
>   arch/arm/boot/dts/dra7.dtsi | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/boot/dts/dra7.dtsi b/arch/arm/boot/dts/dra7.dtsi
> index d78b684e7fca..058b8cbb8ef3 100644
> --- a/arch/arm/boot/dts/dra7.dtsi
> +++ b/arch/arm/boot/dts/dra7.dtsi
> @@ -148,6 +148,7 @@
>   		#address-cells = <1>;
>   		#size-cells = <1>;
>   		ranges = <0x0 0x0 0x0 0xc0000000>;
> +		dma-ranges = <0x80000000 0x0 0x80000000 0x80000000>;
>   		ti,hwmods = "l3_main_1", "l3_main_2";
>   		reg = <0x0 0x44000000 0x0 0x1000000>,
>   		      <0x0 0x45000000 0x0 0x1000>;
> 
