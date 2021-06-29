Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D40E3B719C
	for <lists+linux-omap@lfdr.de>; Tue, 29 Jun 2021 13:52:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232935AbhF2LzM (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 29 Jun 2021 07:55:12 -0400
Received: from muru.com ([72.249.23.125]:58522 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232556AbhF2LzL (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 29 Jun 2021 07:55:11 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 9808580FC;
        Tue, 29 Jun 2021 11:52:54 +0000 (UTC)
Date:   Tue, 29 Jun 2021 14:52:39 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Mike Rapoport <rppt@linux.ibm.com>
Cc:     Mike Rapoport <rppt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Kefeng Wang <wangkefeng.wang@huawei.com>,
        Russell King <linux@armlinux.org.uk>,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-omap@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: [PATCH v2 3/3] arm: extend pfn_valid to take into accound freed
 memory map alignment
Message-ID: <YNsJh7trg4up5l26@atomide.com>
References: <20210519141436.11961-1-rppt@kernel.org>
 <20210519141436.11961-4-rppt@kernel.org>
 <YNmiW6CYzy9lG8ks@atomide.com>
 <YNnLxFM4ZeQ5epX3@linux.ibm.com>
 <YNnqIv3PApHFZMgp@atomide.com>
 <YNqwl8EPVYZJV0EF@linux.ibm.com>
 <YNrfqtBpKsNj033w@atomide.com>
 <YNr6+wOiR7/Yx9M1@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YNr6+wOiR7/Yx9M1@linux.ibm.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Mike Rapoport <rppt@linux.ibm.com> [210629 10:51]:
> As it seems, the new version of pfn_valid() decides that last pages are not
> valid because of the overflow in memblock_overlaps_region(). As the result,
> __sync_icache_dcache() skips flushing these pages.
> 
> The patch below should fix this. I've left the prints for now, hopefully
> they will not appear anymore. 

Yes this allows the system to boot for me :)

I'm still seeing these three prints though:

...
smp: Brought up 1 node, 2 CPUs
SMP: Total of 2 processors activated (3994.41 BogoMIPS).
CPU: All CPU(s) started in SVC mode.
pfn_valid(__pageblock_pfn_to_page+0x14/0xa8): pfn: afe00: is_map: 0 overlaps: 1
pfn_valid(__pageblock_pfn_to_page+0x28/0xa8): pfn: affff: is_map: 0 overlaps: 1
pfn_valid(__pageblock_pfn_to_page+0x38/0xa8): pfn: afe00: is_map: 0 overlaps: 1
devtmpfs: initialized
...

Regards,

Tony


> diff --git a/arch/arm/mm/init.c b/arch/arm/mm/init.c
> index 6162a070a410..7ba22d23eca4 100644
> --- a/arch/arm/mm/init.c
> +++ b/arch/arm/mm/init.c
> @@ -126,10 +126,16 @@ int pfn_valid(unsigned long pfn)
>  {
>  	phys_addr_t addr = __pfn_to_phys(pfn);
>  	unsigned long pageblock_size = PAGE_SIZE * pageblock_nr_pages;
> +	bool overlaps = memblock_overlaps_region(&memblock.memory,
> +				     ALIGN_DOWN(addr, pageblock_size),
> +				     pageblock_size - 1);
>  
>  	if (__phys_to_pfn(addr) != pfn)
>  		return 0;
>  
> +	if (memblock_is_map_memory(addr) != overlaps)
> +		pr_info("%s(%pS): pfn: %lx: is_map: %d overlaps: %d\n", __func__, (void *)_RET_IP_, pfn, memblock_is_map_memory(addr), overlaps);
> +
>  	/*
>  	 * If address less than pageblock_size bytes away from a present
>  	 * memory chunk there still will be a memory map entry for it
> @@ -137,7 +143,7 @@ int pfn_valid(unsigned long pfn)
>  	 */
>  	if (memblock_overlaps_region(&memblock.memory,
>  				     ALIGN_DOWN(addr, pageblock_size),
> -				     pageblock_size))
> +				     pageblock_size - 1))
>  		return 1;
>  
>  	return 0;
>  
> -- 
> Sincerely yours,
> Mike.
