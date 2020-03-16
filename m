Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 54C7218669B
	for <lists+linux-omap@lfdr.de>; Mon, 16 Mar 2020 09:35:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730098AbgCPIf0 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 16 Mar 2020 04:35:26 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:54196 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730093AbgCPIfZ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 16 Mar 2020 04:35:25 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02G8ZCHV119533;
        Mon, 16 Mar 2020 03:35:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1584347712;
        bh=MgFuGjQkGz/Sjek2G2qQ48zyNfLj9re2PMkPGckXc7w=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=CynyFhO1hkQp7jl9YKphqrbx49ET66H2l/rxgn1ekIjMTYFEn0ixnE9sIAlFcWgG2
         /PQVbOqWf7qdI+kQoBkukpFrTr/vNwmFJUWuKExyGHhBFAX1aS6/p8zoZs0Fecev9J
         AUwNy3QHILQNanieFejhORdlWeG+eKmUfrljKxqE=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02G8ZC6P033845;
        Mon, 16 Mar 2020 03:35:12 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 16
 Mar 2020 03:35:10 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 16 Mar 2020 03:35:10 -0500
Received: from [192.168.2.14] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02G8Z6OO023529;
        Mon, 16 Mar 2020 03:35:07 -0500
Subject: Re: [PATCH v2] ARM: dts: dra7: Add bus_dma_limit for L3 bus
To:     Tony Lindgren <tony@atomide.com>,
        Robin Murphy <robin.murphy@arm.com>
CC:     <hch@lst.de>, <robh+dt@kernel.org>, <nm@ti.com>, <t-kristo@ti.com>,
        <nsekhar@ti.com>, <linux-omap@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <stable@kernel.org>
References: <20200313094717.6671-1-rogerq@ti.com>
 <fb916d06-1521-25a5-2eae-94244a3f9d06@arm.com>
 <20200313151516.GB37466@atomide.com>
From:   Roger Quadros <rogerq@ti.com>
Message-ID: <44e2fff3-f95a-dc75-06f7-3a44ea8b7461@ti.com>
Date:   Mon, 16 Mar 2020 10:35:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200313151516.GB37466@atomide.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 13/03/2020 17:15, Tony Lindgren wrote:
> * Robin Murphy <robin.murphy@arm.com> [200313 15:06]:
>> On 2020-03-13 9:47 am, Roger Quadros wrote:
>>> The L3 interconnect's memory map is from 0x0 to
>>> 0xffffffff. Out of this, System memory (SDRAM) can be
>>> accessed from 0x80000000 to 0xffffffff (2GB)
>>>
>>> DRA7 does support 4GB of SDRAM but upper 2GB can only be
>>> accessed by the MPU subsystem.
>>>
>>> Add the dma-ranges property to reflect the physical address limit
>>> of the L3 bus.
>>>
>>> Issues ere observed only with SATA on DRA7-EVM with 4GB RAM
>>> and CONFIG_ARM_LPAE enabled. This is because the controller
>>> supports 64-bit DMA and its driver sets the dma_mask to 64-bit
>>> thus resulting in DMA accesses beyond L3 limit of 2G.
>>>
>>> Setting the correct bus_dma_limit fixes the issue.
>>
>> Neat! In principle you should no longer need the specific dma-ranges on the
>> PCIe nodes, since AIUI those really only represent a subset of this general
>> limitation, but given the other inheritance issue you saw it's probably
>> safer to leave them as-is for now.
> 
> Also, Roger, I think omap5 needs a similar patch too, right?
> At least pyra has omap5 with 4GB and SATA connector.

Yes Tony, I'll send a patch for omap5 as well.

> 
>> FWIW,
>>
>> Reviewed-by: Robin Murphy <robin.murphy@arm.com>
> 
> Sorry missed that as I just pushed out the fix.
> 
> Regards,
> 
> Tony
> 

-- 
cheers,
-roger
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
