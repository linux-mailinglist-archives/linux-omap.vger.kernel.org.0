Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBC4C3B70FA
	for <lists+linux-omap@lfdr.de>; Tue, 29 Jun 2021 12:51:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232937AbhF2Kx0 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 29 Jun 2021 06:53:26 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:30244 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231956AbhF2KxY (ORCPT
        <rfc822;linux-omap@vger.kernel.org>);
        Tue, 29 Jun 2021 06:53:24 -0400
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15TAWvFt141358;
        Tue, 29 Jun 2021 06:50:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : content-type : in-reply-to :
 mime-version; s=pp1; bh=SQfXTniabRx7JvrPtUkKA0VCpbGXJvaVPkvvggAk3Vc=;
 b=JE9iWQsn4vjyTs1TBvZV4Y0DbIMEXmViMNRJxWdV0oL2Iw8yeoZbzzZBsBCLa/3ZHbuv
 qqO3jg/toSPX+orD3O9TG0wyXNcmlQlDkkuK+lbjvPcccFvlKYslsGUBMWqld8RGvU8k
 9Ekts/ORb85I9jxwX1VQQo/JveEJaILgJ161c6Z+GwtVt+7Bo1A4TEE5tAkbLjfEJqnD
 /opQnIuec6HLxGV7C49HR0fogDlH2NhQm8ELAKviziIPUpzAmcWmuM9TIxeKpFPglU2k
 oXIozUxzKD3SnRdOU/Dowe6CAll2Y6eSQtedvUaYFvN/QM17+G0hl3HwaUPKYyNpB2PI 6A== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
        by mx0a-001b2d01.pphosted.com with ESMTP id 39fyxhbs2k-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 29 Jun 2021 06:50:43 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
        by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15TAgqaU011202;
        Tue, 29 Jun 2021 10:50:40 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
        by ppma04ams.nl.ibm.com with ESMTP id 39duv8h7qk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 29 Jun 2021 10:50:40 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
        by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 15TAn2X036569494
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 29 Jun 2021 10:49:02 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 7435952051;
        Tue, 29 Jun 2021 10:50:38 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.145.56.105])
        by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id 60A5152052;
        Tue, 29 Jun 2021 10:50:37 +0000 (GMT)
Date:   Tue, 29 Jun 2021 13:50:35 +0300
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
Message-ID: <YNr6+wOiR7/Yx9M1@linux.ibm.com>
References: <20210519141436.11961-1-rppt@kernel.org>
 <20210519141436.11961-4-rppt@kernel.org>
 <YNmiW6CYzy9lG8ks@atomide.com>
 <YNnLxFM4ZeQ5epX3@linux.ibm.com>
 <YNnqIv3PApHFZMgp@atomide.com>
 <YNqwl8EPVYZJV0EF@linux.ibm.com>
 <YNrfqtBpKsNj033w@atomide.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YNrfqtBpKsNj033w@atomide.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: qkx0DHBvkomsnZfbaZrMAmj29AlaLN37
X-Proofpoint-ORIG-GUID: qkx0DHBvkomsnZfbaZrMAmj29AlaLN37
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-06-29_05:2021-06-28,2021-06-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 spamscore=0 malwarescore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 mlxscore=0 adultscore=0
 clxscore=1015 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104190000 definitions=main-2106290072
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

On Tue, Jun 29, 2021 at 11:54:02AM +0300, Tony Lindgren wrote:
> Hi,
> 
> * Mike Rapoport <rppt@linux.ibm.com> [210629 05:33]:
> > On Mon, Jun 28, 2021 at 06:26:26PM +0300, Tony Lindgren wrote:
> > > * Mike Rapoport <rppt@linux.ibm.com> [210628 14:07]:
> > > > Can you please send log with 'memblock=debug' added to the command line?
> > > 
> > > Sure, log now available at:
> > > 
> > > http://muru.com/beagle-x15.txt
> > 
> > Hmm, no clues yet :(
> > 
> > Do you have CONFIG_DEBUG_VM, CONFIG_DEBUG_VM_PGFLAGS and
> > CONFIG_PAGE_POISONING enabled in your config?
> > If not, can you please enable them and see if any of VM_BUG_* triggers?
> 
> OK enabled, and no errors or warnings are triggered.
> 
> > Do you use FLATMEM or SPARSEMEM in your config?
> 
> Looks like make omap2plus_defconfig enables FLATMEM:
> 
> $ grep -e SPARSEMEM -e FLATMEM .config
> CONFIG_ARCH_FLATMEM_ENABLE=y
> CONFIG_ARCH_SPARSEMEM_ENABLE=y
> CONFIG_FLATMEM_MANUAL=y
> # CONFIG_SPARSEMEM_MANUAL is not set
> CONFIG_FLATMEM=y
> 
> > Let's try seeing what PFNs get false results from pfn_valid, maybe this
> > will give a better lead.
> 
> With your patch below, system boots with lots of the following:
> 
> [   13.058654] Freeing unused kernel image (initmem) memory: 1024K
> ...
> [   13.129211] pfn_valid(__sync_icache_dcache+0x2c/0x138): pfn: fffb6: is_map: 1 overlaps: 0
> [   13.137481] pfn_valid(__sync_icache_dcache+0x2c/0x138): pfn: fffb7: is_map: 1 overlaps: 0

...

> Then changing console loglevel to 0 boots system to login prompt. But I'm
> seeing some init processes segfaulting during start-up.

As it seems, the new version of pfn_valid() decides that last pages are not
valid because of the overflow in memblock_overlaps_region(). As the result,
__sync_icache_dcache() skips flushing these pages.

The patch below should fix this. I've left the prints for now, hopefully
they will not appear anymore. 

diff --git a/arch/arm/mm/init.c b/arch/arm/mm/init.c
index 6162a070a410..7ba22d23eca4 100644
--- a/arch/arm/mm/init.c
+++ b/arch/arm/mm/init.c
@@ -126,10 +126,16 @@ int pfn_valid(unsigned long pfn)
 {
 	phys_addr_t addr = __pfn_to_phys(pfn);
 	unsigned long pageblock_size = PAGE_SIZE * pageblock_nr_pages;
+	bool overlaps = memblock_overlaps_region(&memblock.memory,
+				     ALIGN_DOWN(addr, pageblock_size),
+				     pageblock_size - 1);
 
 	if (__phys_to_pfn(addr) != pfn)
 		return 0;
 
+	if (memblock_is_map_memory(addr) != overlaps)
+		pr_info("%s(%pS): pfn: %lx: is_map: %d overlaps: %d\n", __func__, (void *)_RET_IP_, pfn, memblock_is_map_memory(addr), overlaps);
+
 	/*
 	 * If address less than pageblock_size bytes away from a present
 	 * memory chunk there still will be a memory map entry for it
@@ -137,7 +143,7 @@ int pfn_valid(unsigned long pfn)
 	 */
 	if (memblock_overlaps_region(&memblock.memory,
 				     ALIGN_DOWN(addr, pageblock_size),
-				     pageblock_size))
+				     pageblock_size - 1))
 		return 1;
 
 	return 0;
 
-- 
Sincerely yours,
Mike.
