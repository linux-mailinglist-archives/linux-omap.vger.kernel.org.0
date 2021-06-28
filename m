Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD8003B5F9B
	for <lists+linux-omap@lfdr.de>; Mon, 28 Jun 2021 16:07:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231981AbhF1OJ6 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 28 Jun 2021 10:09:58 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:56628 "EHLO
        mx0b-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230033AbhF1OJ5 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>);
        Mon, 28 Jun 2021 10:09:57 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15SE3bfq079278;
        Mon, 28 Jun 2021 10:06:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=+OjqP9lTUFKRGETiPXOkY+VW5clHnZh3kZAAumFRsrA=;
 b=hNRzKnNYGP3qktmy6syvl3WwQSoHRQF+Ck/iS948ntw2FPeuvbr0E+uP1o4/cvifdy7Z
 Fm4C7w5Yx3A6KWxhNtdEbySUbmwTwHiV27MISuCc3rUyPTeNP8C6Y61G36BXUBkGU8OV
 muio0zYcjoGOi50PaCjVnPjUPhuP7/qafrP8o2AnkX441YkV0BoFu4qcxqV6IG/yHFB6
 oqSAhR958PyoHhgAmjbT9j0Du3TO/GYlkOmrtHF7u37hXZWRVx62Pp2+lyGY1/R1/hPX
 7mB801qHvwGqR6U56h02yngInnEnUDHCNC73xZCcYeOZmrYe9Y2aystNxjDQUBrO1+dn wA== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
        by mx0a-001b2d01.pphosted.com with ESMTP id 39fef3b48u-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 28 Jun 2021 10:06:59 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
        by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15SDwc0T029762;
        Mon, 28 Jun 2021 14:06:57 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
        by ppma06ams.nl.ibm.com with ESMTP id 39dughgu8e-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 28 Jun 2021 14:06:57 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
        by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 15SE6tXD33292712
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 28 Jun 2021 14:06:55 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 2102211DB45;
        Mon, 28 Jun 2021 13:16:55 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 129A811DA8B;
        Mon, 28 Jun 2021 13:16:54 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.145.176.236])
        by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Mon, 28 Jun 2021 13:16:53 +0000 (GMT)
Date:   Mon, 28 Jun 2021 16:16:52 +0300
From:   Mike Rapoport <rppt@linux.ibm.com>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Mike Rapoport <rppt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Kefeng Wang <wangkefeng.wang@huawei.com>,
        Russell King <linux@armlinux.org.uk>,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-omap@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: [PATCH v2 3/3] arm: extend pfn_valid to take into accound freed
 memory map alignment
Message-ID: <YNnLxFM4ZeQ5epX3@linux.ibm.com>
References: <20210519141436.11961-1-rppt@kernel.org>
 <20210519141436.11961-4-rppt@kernel.org>
 <YNmiW6CYzy9lG8ks@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YNmiW6CYzy9lG8ks@atomide.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Yc4o-zWp0zVodHKrmFsx5HxbzDkuhw23
X-Proofpoint-GUID: Yc4o-zWp0zVodHKrmFsx5HxbzDkuhw23
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-06-28_11:2021-06-25,2021-06-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 impostorscore=0 mlxscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 adultscore=0 spamscore=0 clxscore=1011 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106280098
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony,

On Mon, Jun 28, 2021 at 01:20:11PM +0300, Tony Lindgren wrote:
> Hi,
> 
> Looks like this patch causes a boot regression at least for Cortex-A15.
> That's commit 990e6d0e1de8 ("arm: extend pfn_valid to take into accound
> freed memory map alignment") in Linux next.
> 
> Most of the time I see the following on beagle-x15 right after init starts:
> 
> Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
> CPU0: stopping
> CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.13.0-rc7-next-20210625 #100
> Hardware name: Generic DRA74X (Flattened Device Tree)
> [<c0110c54>] (unwind_backtrace) from [<c010b408>] (show_stack+0x10/0x14)
> [<c010b408>] (show_stack) from [<c09fae04>] (dump_stack_lvl+0x40/0x4c)
> [<c09fae04>] (dump_stack_lvl) from [<c010e768>] (do_handle_IPI+0x2c8/0x334)
> [<c010e768>] (do_handle_IPI) from [<c010e7e8>] (ipi_handler+0x14/0x20)
> [<c010e7e8>] (ipi_handler) from [<c01a5f14>] (handle_percpu_devid_irq+0xa8/0x22c)
> [<c01a5f14>] (handle_percpu_devid_irq) from [<c019fc78>] (handle_domain_irq+0x64/0xa4)
> [<c019fc78>] (handle_domain_irq) from [<c05b9bdc>] (gic_handle_irq+0x88/0xb0)
> [<c05b9bdc>] (gic_handle_irq) from [<c0100b6c>] (__irq_svc+0x6c/0x90)
> Exception stack(0xc0f01f08 to 0xc0f01f50)
> 1f00:                   00000f38 00000f37 00000000 fe600000 c0ff90c0 00000000
> 1f20: c0f0520c c0f05260 00000000 c0f00000 00000000 c0e788f0 00000000 c0f01f58
> 1f40: c0126aa0 c0107dc4 60000013 ffffffff
> [<c0100b6c>] (__irq_svc) from [<c0107dc4>] (arch_cpu_idle+0x1c/0x3c)
> [<c0107dc4>] (arch_cpu_idle) from [<c0a098d8>] (default_idle_call+0x38/0xe0)
> [<c0a098d8>] (default_idle_call) from [<c0172860>] (do_idle+0x214/0x2cc)
> [<c0172860>] (do_idle) from [<c0172c0c>] (cpu_startup_entry+0x18/0x1c)
> [<c0172c0c>] (cpu_startup_entry) from [<c0e00ef8>] (start_kernel+0x5cc/0x6c4)
> 
> Sometimes the system boots to console, but maybe only about 20% of the
> time. Reverting 990e6d0e1de8 makes Linux next boot again for me.

Can you please send log with 'memblock=debug' added to the command line?
 
> Regards,
> 
> Tony
> 
> #regzb introduced: 990e6d0e1de8 ("arm: extend pfn_valid to take into accound freed memory map alignment")
> 
> 
> * Mike Rapoport <rppt@kernel.org> [700101 02:00]:
> > From: Mike Rapoport <rppt@linux.ibm.com>
> > 
> > When unused memory map is freed the preserved part of the memory map is
> > extended to match pageblock boundaries because lots of core mm
> > functionality relies on homogeneity of the memory map within pageblock
> > boundaries.
> > 
> > Since pfn_valid() is used to check whether there is a valid memory map
> > entry for a PFN, make it return true also for PFNs that have memory map
> > entries even if there is no actual memory populated there.
> > 
> > Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> > ---
> >  arch/arm/mm/init.c | 13 ++++++++++++-
> >  1 file changed, 12 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm/mm/init.c b/arch/arm/mm/init.c
> > index 9d4744a632c6..6162a070a410 100644
> > --- a/arch/arm/mm/init.c
> > +++ b/arch/arm/mm/init.c
> > @@ -125,11 +125,22 @@ static void __init zone_sizes_init(unsigned long min, unsigned long max_low,
> >  int pfn_valid(unsigned long pfn)
> >  {
> >  	phys_addr_t addr = __pfn_to_phys(pfn);
> > +	unsigned long pageblock_size = PAGE_SIZE * pageblock_nr_pages;
> >  
> >  	if (__phys_to_pfn(addr) != pfn)
> >  		return 0;
> >  
> > -	return memblock_is_map_memory(addr);
> > +	/*
> > +	 * If address less than pageblock_size bytes away from a present
> > +	 * memory chunk there still will be a memory map entry for it
> > +	 * because we round freed memory map to the pageblock boundaries.
> > +	 */
> > +	if (memblock_overlaps_region(&memblock.memory,
> > +				     ALIGN_DOWN(addr, pageblock_size),
> > +				     pageblock_size))
> > +		return 1;
> > +
> > +	return 0;
> >  }
> >  EXPORT_SYMBOL(pfn_valid);
> >  #endif
> > -- 
> > 2.28.0
> > 

-- 
Sincerely yours,
Mike.
