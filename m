Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A05023B6FC1
	for <lists+linux-omap@lfdr.de>; Tue, 29 Jun 2021 10:54:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232499AbhF2I4g (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 29 Jun 2021 04:56:36 -0400
Received: from muru.com ([72.249.23.125]:58398 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232491AbhF2I4e (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 29 Jun 2021 04:56:34 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id E864880FC;
        Tue, 29 Jun 2021 08:54:17 +0000 (UTC)
Date:   Tue, 29 Jun 2021 11:54:02 +0300
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
Message-ID: <YNrfqtBpKsNj033w@atomide.com>
References: <20210519141436.11961-1-rppt@kernel.org>
 <20210519141436.11961-4-rppt@kernel.org>
 <YNmiW6CYzy9lG8ks@atomide.com>
 <YNnLxFM4ZeQ5epX3@linux.ibm.com>
 <YNnqIv3PApHFZMgp@atomide.com>
 <YNqwl8EPVYZJV0EF@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YNqwl8EPVYZJV0EF@linux.ibm.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* Mike Rapoport <rppt@linux.ibm.com> [210629 05:33]:
> On Mon, Jun 28, 2021 at 06:26:26PM +0300, Tony Lindgren wrote:
> > * Mike Rapoport <rppt@linux.ibm.com> [210628 14:07]:
> > > Can you please send log with 'memblock=debug' added to the command line?
> > 
> > Sure, log now available at:
> > 
> > http://muru.com/beagle-x15.txt
> 
> Hmm, no clues yet :(
> 
> Do you have CONFIG_DEBUG_VM, CONFIG_DEBUG_VM_PGFLAGS and
> CONFIG_PAGE_POISONING enabled in your config?
> If not, can you please enable them and see if any of VM_BUG_* triggers?

OK enabled, and no errors or warnings are triggered.

> Do you use FLATMEM or SPARSEMEM in your config?

Looks like make omap2plus_defconfig enables FLATMEM:

$ grep -e SPARSEMEM -e FLATMEM .config
CONFIG_ARCH_FLATMEM_ENABLE=y
CONFIG_ARCH_SPARSEMEM_ENABLE=y
CONFIG_FLATMEM_MANUAL=y
# CONFIG_SPARSEMEM_MANUAL is not set
CONFIG_FLATMEM=y

> Let's try seeing what PFNs get false results from pfn_valid, maybe this
> will give a better lead.

With your patch below, system boots with lots of the following:

[   13.058654] Freeing unused kernel image (initmem) memory: 1024K
...
[   13.129211] pfn_valid(__sync_icache_dcache+0x2c/0x138): pfn: fffb6: is_map: 1 overlaps: 0
[   13.137481] pfn_valid(__sync_icache_dcache+0x2c/0x138): pfn: fffb7: is_map: 1 overlaps: 0
[   13.145751] pfn_valid(__sync_icache_dcache+0x2c/0x138): pfn: fffb8: is_map: 1 overlaps: 0
[   13.153991] pfn_valid(__sync_icache_dcache+0x2c/0x138): pfn: fffb9: is_map: 1 overlaps: 0
[   13.162200] pfn_valid(__sync_icache_dcache+0x2c/0x138): pfn: fffba: is_map: 1 overlaps: 0
[   13.170440] pfn_valid(__sync_icache_dcache+0x2c/0x138): pfn: fffbb: is_map: 1 overlaps: 0
[   13.178680] pfn_valid(__sync_icache_dcache+0x2c/0x138): pfn: fffbc: is_map: 1 overlaps: 0
[   13.186920] pfn_valid(__sync_icache_dcache+0x2c/0x138): pfn: fffbd: is_map: 1 overlaps: 0
[   13.195159] pfn_valid(__sync_icache_dcache+0x2c/0x138): pfn: fffbe: is_map: 1 overlaps: 0
[   13.203399] pfn_valid(__sync_icache_dcache+0x2c/0x138): pfn: fffbf: is_map: 1 overlaps: 0
[   13.211639] pfn_valid(__sync_icache_dcache+0x2c/0x138): pfn: fff00: is_map: 1 overlaps: 0
...

Then changing console loglevel to 0 boots system to login prompt. But I'm
seeing some init processes segfaulting during start-up.

Regards,

Tony


> diff --git a/arch/arm/mm/init.c b/arch/arm/mm/init.c
> index 6162a070a410..66985fc3e730 100644
> --- a/arch/arm/mm/init.c
> +++ b/arch/arm/mm/init.c
> @@ -126,10 +126,16 @@ int pfn_valid(unsigned long pfn)
>  {
>  	phys_addr_t addr = __pfn_to_phys(pfn);
>  	unsigned long pageblock_size = PAGE_SIZE * pageblock_nr_pages;
> +	bool overlaps = memblock_overlaps_region(&memblock.memory,
> +				     ALIGN_DOWN(addr, pageblock_size),
> +				     pageblock_size);
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
> 
> -- 
> Sincerely yours,
> Mike.
