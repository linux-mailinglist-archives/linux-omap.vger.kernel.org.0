Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2E2E3B7263
	for <lists+linux-omap@lfdr.de>; Tue, 29 Jun 2021 14:50:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233839AbhF2MxY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 29 Jun 2021 08:53:24 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:22062 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S233798AbhF2MxW (ORCPT
        <rfc822;linux-omap@vger.kernel.org>);
        Tue, 29 Jun 2021 08:53:22 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15TCXShT141620;
        Tue, 29 Jun 2021 08:50:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=CnbDDy1qBRTR6I8xPAryzlZwyz6haJ4TUbW322uchuY=;
 b=BT3HZMmm2+n8amin9lx3oRJCDnWvZnB4DEwGs8vkeNStDIOrEBcghhWkwIm0Yg+nRnEX
 gvKRL1Yd5Z+bOrCMChODJVewQzMGBGphBhGETFbcpTIyBGr8CbOl02O8TRKzVuSO49sy
 Ij0ZnGtdKxnuFgb2bsvAN8fQiQzd7VvKn+ZPeGQ7WGB39feM61rxMY9hyz4GSIIYFOb9
 DsEycz/GqGaIHSNBEvv3+0k8wR9+B9IgyDOyV4QJZ6yA2h54QsE789dN3CQoTSIaNXvO
 rwj3/WP7CJx+U/T8xIda/agautIckqX2uZwlvxZuyYzzjO9yJFKhYgubekpX28Ortcse oA== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
        by mx0b-001b2d01.pphosted.com with ESMTP id 39g2ng26qh-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 29 Jun 2021 08:50:32 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
        by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15TCllAA013222;
        Tue, 29 Jun 2021 12:50:30 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
        by ppma04ams.nl.ibm.com with ESMTP id 39duv8h9q5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 29 Jun 2021 12:50:30 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
        by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 15TCoRqA32244068
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 29 Jun 2021 12:50:27 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id AEB8EA409A;
        Tue, 29 Jun 2021 12:50:23 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id A130DA4094;
        Tue, 29 Jun 2021 12:50:22 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.145.56.105])
        by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Tue, 29 Jun 2021 12:50:22 +0000 (GMT)
Date:   Tue, 29 Jun 2021 15:50:20 +0300
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
Message-ID: <YNsXDEgreCpshZxb@linux.ibm.com>
References: <20210519141436.11961-1-rppt@kernel.org>
 <20210519141436.11961-4-rppt@kernel.org>
 <YNmiW6CYzy9lG8ks@atomide.com>
 <YNnLxFM4ZeQ5epX3@linux.ibm.com>
 <YNnqIv3PApHFZMgp@atomide.com>
 <YNqwl8EPVYZJV0EF@linux.ibm.com>
 <YNrfqtBpKsNj033w@atomide.com>
 <YNr6+wOiR7/Yx9M1@linux.ibm.com>
 <YNsJh7trg4up5l26@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YNsJh7trg4up5l26@atomide.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: v7hCJL7vrjg3_7YU6HWRhdA8vxTcIx80
X-Proofpoint-GUID: v7hCJL7vrjg3_7YU6HWRhdA8vxTcIx80
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-06-29_06:2021-06-28,2021-06-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 mlxlogscore=815
 spamscore=0 priorityscore=1501 bulkscore=0 mlxscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106290085
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, Jun 29, 2021 at 02:52:39PM +0300, Tony Lindgren wrote:
> * Mike Rapoport <rppt@linux.ibm.com> [210629 10:51]:
> > As it seems, the new version of pfn_valid() decides that last pages are not
> > valid because of the overflow in memblock_overlaps_region(). As the result,
> > __sync_icache_dcache() skips flushing these pages.
> > 
> > The patch below should fix this. I've left the prints for now, hopefully
> > they will not appear anymore. 
> 
> Yes this allows the system to boot for me :)
> 
> I'm still seeing these three prints though:
> 
> ...
> smp: Brought up 1 node, 2 CPUs
> SMP: Total of 2 processors activated (3994.41 BogoMIPS).
> CPU: All CPU(s) started in SVC mode.
> pfn_valid(__pageblock_pfn_to_page+0x14/0xa8): pfn: afe00: is_map: 0 overlaps: 1
> pfn_valid(__pageblock_pfn_to_page+0x28/0xa8): pfn: affff: is_map: 0 overlaps: 1
> pfn_valid(__pageblock_pfn_to_page+0x38/0xa8): pfn: afe00: is_map: 0 overlaps: 1

These pfns do have memory map despite they are stolen in
arm_memblock_steal():

memblock_free: [0xaff00000-0xafffffff] arm_memblock_steal+0x50/0x70
memblock_remove: [0xaff00000-0xafffffff] arm_memblock_steal+0x5c/0x70
...
memblock_free: [0xafe00000-0xafefffff] arm_memblock_steal+0x50/0x70
memblock_remove: [0xafe00000-0xafefffff] arm_memblock_steal+0x5c/0x70

But the struct pages there are never initialized.

I'll resend v3 of the entire set with an addition patch to take care of
that as well.

> devtmpfs: initialized
> ...
> 
> Regards,
> 
> Tony
> 
> 
> > diff --git a/arch/arm/mm/init.c b/arch/arm/mm/init.c
> > index 6162a070a410..7ba22d23eca4 100644
> > --- a/arch/arm/mm/init.c
> > +++ b/arch/arm/mm/init.c
> > @@ -126,10 +126,16 @@ int pfn_valid(unsigned long pfn)
> >  {
> >  	phys_addr_t addr = __pfn_to_phys(pfn);
> >  	unsigned long pageblock_size = PAGE_SIZE * pageblock_nr_pages;
> > +	bool overlaps = memblock_overlaps_region(&memblock.memory,
> > +				     ALIGN_DOWN(addr, pageblock_size),
> > +				     pageblock_size - 1);
> >  
> >  	if (__phys_to_pfn(addr) != pfn)
> >  		return 0;
> >  
> > +	if (memblock_is_map_memory(addr) != overlaps)
> > +		pr_info("%s(%pS): pfn: %lx: is_map: %d overlaps: %d\n", __func__, (void *)_RET_IP_, pfn, memblock_is_map_memory(addr), overlaps);
> > +
> >  	/*
> >  	 * If address less than pageblock_size bytes away from a present
> >  	 * memory chunk there still will be a memory map entry for it
> > @@ -137,7 +143,7 @@ int pfn_valid(unsigned long pfn)
> >  	 */
> >  	if (memblock_overlaps_region(&memblock.memory,
> >  				     ALIGN_DOWN(addr, pageblock_size),
> > -				     pageblock_size))
> > +				     pageblock_size - 1))
> >  		return 1;
> >  
> >  	return 0;
> >  
> > -- 
> > Sincerely yours,
> > Mike.

-- 
Sincerely yours,
Mike.
