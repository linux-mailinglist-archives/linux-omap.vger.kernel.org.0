Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 573073B5C6C
	for <lists+linux-omap@lfdr.de>; Mon, 28 Jun 2021 12:20:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232605AbhF1KWm (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 28 Jun 2021 06:22:42 -0400
Received: from muru.com ([72.249.23.125]:57516 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232426AbhF1KWl (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 28 Jun 2021 06:22:41 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id EFAE68047;
        Mon, 28 Jun 2021 10:20:25 +0000 (UTC)
Date:   Mon, 28 Jun 2021 13:20:11 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Mike Rapoport <rppt@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Kefeng Wang <wangkefeng.wang@huawei.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Russell King <linux@armlinux.org.uk>,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-omap@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: [PATCH v2 3/3] arm: extend pfn_valid to take into accound freed
 memory map alignment
Message-ID: <YNmiW6CYzy9lG8ks@atomide.com>
References: <20210519141436.11961-1-rppt@kernel.org>
 <20210519141436.11961-4-rppt@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210519141436.11961-4-rppt@kernel.org>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

Looks like this patch causes a boot regression at least for Cortex-A15.
That's commit 990e6d0e1de8 ("arm: extend pfn_valid to take into accound
freed memory map alignment") in Linux next.

Most of the time I see the following on beagle-x15 right after init starts:

Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
CPU0: stopping
CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.13.0-rc7-next-20210625 #100
Hardware name: Generic DRA74X (Flattened Device Tree)
[<c0110c54>] (unwind_backtrace) from [<c010b408>] (show_stack+0x10/0x14)
[<c010b408>] (show_stack) from [<c09fae04>] (dump_stack_lvl+0x40/0x4c)
[<c09fae04>] (dump_stack_lvl) from [<c010e768>] (do_handle_IPI+0x2c8/0x334)
[<c010e768>] (do_handle_IPI) from [<c010e7e8>] (ipi_handler+0x14/0x20)
[<c010e7e8>] (ipi_handler) from [<c01a5f14>] (handle_percpu_devid_irq+0xa8/0x22c)
[<c01a5f14>] (handle_percpu_devid_irq) from [<c019fc78>] (handle_domain_irq+0x64/0xa4)
[<c019fc78>] (handle_domain_irq) from [<c05b9bdc>] (gic_handle_irq+0x88/0xb0)
[<c05b9bdc>] (gic_handle_irq) from [<c0100b6c>] (__irq_svc+0x6c/0x90)
Exception stack(0xc0f01f08 to 0xc0f01f50)
1f00:                   00000f38 00000f37 00000000 fe600000 c0ff90c0 00000000
1f20: c0f0520c c0f05260 00000000 c0f00000 00000000 c0e788f0 00000000 c0f01f58
1f40: c0126aa0 c0107dc4 60000013 ffffffff
[<c0100b6c>] (__irq_svc) from [<c0107dc4>] (arch_cpu_idle+0x1c/0x3c)
[<c0107dc4>] (arch_cpu_idle) from [<c0a098d8>] (default_idle_call+0x38/0xe0)
[<c0a098d8>] (default_idle_call) from [<c0172860>] (do_idle+0x214/0x2cc)
[<c0172860>] (do_idle) from [<c0172c0c>] (cpu_startup_entry+0x18/0x1c)
[<c0172c0c>] (cpu_startup_entry) from [<c0e00ef8>] (start_kernel+0x5cc/0x6c4)

Sometimes the system boots to console, but maybe only about 20% of the
time. Reverting 990e6d0e1de8 makes Linux next boot again for me.

Regards,

Tony

#regzb introduced: 990e6d0e1de8 ("arm: extend pfn_valid to take into accound freed memory map alignment")


* Mike Rapoport <rppt@kernel.org> [700101 02:00]:
> From: Mike Rapoport <rppt@linux.ibm.com>
> 
> When unused memory map is freed the preserved part of the memory map is
> extended to match pageblock boundaries because lots of core mm
> functionality relies on homogeneity of the memory map within pageblock
> boundaries.
> 
> Since pfn_valid() is used to check whether there is a valid memory map
> entry for a PFN, make it return true also for PFNs that have memory map
> entries even if there is no actual memory populated there.
> 
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> ---
>  arch/arm/mm/init.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mm/init.c b/arch/arm/mm/init.c
> index 9d4744a632c6..6162a070a410 100644
> --- a/arch/arm/mm/init.c
> +++ b/arch/arm/mm/init.c
> @@ -125,11 +125,22 @@ static void __init zone_sizes_init(unsigned long min, unsigned long max_low,
>  int pfn_valid(unsigned long pfn)
>  {
>  	phys_addr_t addr = __pfn_to_phys(pfn);
> +	unsigned long pageblock_size = PAGE_SIZE * pageblock_nr_pages;
>  
>  	if (__phys_to_pfn(addr) != pfn)
>  		return 0;
>  
> -	return memblock_is_map_memory(addr);
> +	/*
> +	 * If address less than pageblock_size bytes away from a present
> +	 * memory chunk there still will be a memory map entry for it
> +	 * because we round freed memory map to the pageblock boundaries.
> +	 */
> +	if (memblock_overlaps_region(&memblock.memory,
> +				     ALIGN_DOWN(addr, pageblock_size),
> +				     pageblock_size))
> +		return 1;
> +
> +	return 0;
>  }
>  EXPORT_SYMBOL(pfn_valid);
>  #endif
> -- 
> 2.28.0
> 
