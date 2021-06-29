Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6DA33B6DF5
	for <lists+linux-omap@lfdr.de>; Tue, 29 Jun 2021 07:33:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230216AbhF2FgS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 29 Jun 2021 01:36:18 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:20620 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229969AbhF2FgR (ORCPT
        <rfc822;linux-omap@vger.kernel.org>);
        Tue, 29 Jun 2021 01:36:17 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15T5Wbwm075810;
        Tue, 29 Jun 2021 01:33:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : content-type : in-reply-to :
 mime-version; s=pp1; bh=c+QcLwyzuhHTf5I8zGgSlFAcCqO425eu5Ou5RyI6z1w=;
 b=JBrvUJg1VpDTOuj0bfgaxb5Sqd/lPATTflP6EMviKcZ8FPrpuo5JgCqUqRk2hd57wvFf
 BA/UojvnqTSFRkbesQZF0xdIRvsIa5ikG6cVxkqxKm47CplC4r3UV8WPnMkhl4hIlqP9
 EZQBEFiJtXcr0eNTgCNCn+IRjc+oLyq0eCQZLxqDAqb0Y9ki/142gxhrzzJDOvyfayBA
 blR0YUAWgBKMelO9IKRkmt2DYwh+VTIMJhAb3L4WweBzSK9Bklhr3ptJCsY6WyegivLy
 SAHPQshbZv4lLzsy1Jm5N0eK7RoXB0OS9L51J1dEVz9R0z1g1NWwJFxNah122AFus8kl Eg== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
        by mx0a-001b2d01.pphosted.com with ESMTP id 39fu6etpvq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 29 Jun 2021 01:33:20 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
        by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15T5XGJb018042;
        Tue, 29 Jun 2021 05:33:17 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
        by ppma04fra.de.ibm.com with ESMTP id 39duv8gjk6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 29 Jun 2021 05:33:17 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
        by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 15T5XEhI18874718
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 29 Jun 2021 05:33:14 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 8EAA3A4057;
        Tue, 29 Jun 2021 05:33:14 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 2E886A4055;
        Tue, 29 Jun 2021 05:33:13 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.145.176.236])
        by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Tue, 29 Jun 2021 05:33:13 +0000 (GMT)
Date:   Tue, 29 Jun 2021 08:33:11 +0300
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
Message-ID: <YNqwl8EPVYZJV0EF@linux.ibm.com>
References: <20210519141436.11961-1-rppt@kernel.org>
 <20210519141436.11961-4-rppt@kernel.org>
 <YNmiW6CYzy9lG8ks@atomide.com>
 <YNnLxFM4ZeQ5epX3@linux.ibm.com>
 <YNnqIv3PApHFZMgp@atomide.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YNnqIv3PApHFZMgp@atomide.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: kaGobwy-r0q0GzCYD3kf90Twx11wiU93
X-Proofpoint-ORIG-GUID: kaGobwy-r0q0GzCYD3kf90Twx11wiU93
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-06-29_01:2021-06-25,2021-06-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 spamscore=0 priorityscore=1501 mlxlogscore=999 suspectscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106290039
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, Jun 28, 2021 at 06:26:26PM +0300, Tony Lindgren wrote:
> * Mike Rapoport <rppt@linux.ibm.com> [210628 14:07]:
> > Can you please send log with 'memblock=debug' added to the command line?
> 
> Sure, log now available at:
> 
> http://muru.com/beagle-x15.txt

Hmm, no clues yet :(

Do you have CONFIG_DEBUG_VM, CONFIG_DEBUG_VM_PGFLAGS and
CONFIG_PAGE_POISONING enabled in your config?
If not, can you please enable them and see if any of VM_BUG_* triggers?

Do you use FLATMEM or SPARSEMEM in your config?

Let's try seeing what PFNs get false results from pfn_valid, maybe this
will give a better lead.

diff --git a/arch/arm/mm/init.c b/arch/arm/mm/init.c
index 6162a070a410..66985fc3e730 100644
--- a/arch/arm/mm/init.c
+++ b/arch/arm/mm/init.c
@@ -126,10 +126,16 @@ int pfn_valid(unsigned long pfn)
 {
 	phys_addr_t addr = __pfn_to_phys(pfn);
 	unsigned long pageblock_size = PAGE_SIZE * pageblock_nr_pages;
+	bool overlaps = memblock_overlaps_region(&memblock.memory,
+				     ALIGN_DOWN(addr, pageblock_size),
+				     pageblock_size);
 
 	if (__phys_to_pfn(addr) != pfn)
 		return 0;
 
+	if (memblock_is_map_memory(addr) != overlaps)
+		pr_info("%s(%pS): pfn: %lx: is_map: %d overlaps: %d\n", __func__, (void *)_RET_IP_, pfn, memblock_is_map_memory(addr), overlaps);
+
 	/*
 	 * If address less than pageblock_size bytes away from a present
 	 * memory chunk there still will be a memory map entry for it

-- 
Sincerely yours,
Mike.
