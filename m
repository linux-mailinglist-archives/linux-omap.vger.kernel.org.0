Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1EBA1802F7
	for <lists+linux-omap@lfdr.de>; Tue, 10 Mar 2020 17:16:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727007AbgCJQQT (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 10 Mar 2020 12:16:19 -0400
Received: from foss.arm.com ([217.140.110.172]:39112 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726395AbgCJQQS (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 10 Mar 2020 12:16:18 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5FF9F1FB;
        Tue, 10 Mar 2020 09:16:18 -0700 (PDT)
Received: from [10.1.196.37] (e121345-lin.cambridge.arm.com [10.1.196.37])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C81913F67D;
        Tue, 10 Mar 2020 09:16:16 -0700 (PDT)
Subject: Re: [PATCH] ARM: dts: dra7: Add bus_dma_limit for L3 bus
To:     Tony Lindgren <tony@atomide.com>, Tero Kristo <t-kristo@ti.com>
Cc:     Roger Quadros <rogerq@ti.com>, hch@lst.de, robh+dt@kernel.org,
        nm@ti.com, nsekhar@ti.com, linux-omap@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200310115309.31354-1-rogerq@ti.com>
 <e7df4db7-6fe1-cfa4-841b-ddd395864bb8@ti.com>
 <20200310154829.GS37466@atomide.com>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <b405ca5e-4abd-7ddc-ff76-560b6c7abf86@arm.com>
Date:   Tue, 10 Mar 2020 16:16:14 +0000
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200310154829.GS37466@atomide.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 10/03/2020 3:48 pm, Tony Lindgren wrote:
> * Tero Kristo <t-kristo@ti.com> [200310 14:46]:
>> On 10/03/2020 13:53, Roger Quadros wrote:
>>> The L3 interconnect can access only 32-bits of address.
>>> Add the dma-ranges property to reflect this limit.
>>>
>>> This will ensure that no device under L3 is
>>> given > 32-bit address for DMA.
>>>
>>> Issue was observed only with SATA on DRA7-EVM with 4GB RAM
>>> and CONFIG_ARM_LPAE enabled. This is because the controller
>>> can perform 64-bit DMA and was setting the dma_mask to 64-bit.
>>>
>>> Setting the correct bus_dma_limit fixes the issue.
>>
>> This seems kind of messy to modify almost every DT node because of this....
>> Are you sure this is the only way to get it done? No way to modify the sata
>> node only which is impacted somehow?
>>
>> Also, what if you just pass 0xffffffff to the dma-ranges property? That
>> would avoid modifying every node I guess.
> 
> Also, I think these interconnects are not limited to 32-bit access.
> So yeah I too would prefer a top level dma-ranges property assuming
> that works.
> 
> I guess there dma-ranges should not be 0xffffffff though if
> limited to 2GB :)

It should work fine to just describe the Q3 and Q4 DDR regions as the 
DMA range, i.e.:

	ocp {
		...
		dma-ranges = <0x80000000 0 0x80000000 0x80000000>;
		...
	};

That would certainly be far less invasive :)

Robin.
