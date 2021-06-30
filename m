Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F1D43B7DF3
	for <lists+linux-omap@lfdr.de>; Wed, 30 Jun 2021 09:20:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232806AbhF3HXW (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 30 Jun 2021 03:23:22 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:4744 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S232785AbhF3HXW (ORCPT
        <rfc822;linux-omap@vger.kernel.org>);
        Wed, 30 Jun 2021 03:23:22 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15U72h5B048508;
        Wed, 30 Jun 2021 03:20:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=973EgiF50mXgJhpr6evy6DSCnIvYAM1+Him4gsa37N0=;
 b=DYHls9J7VDS4TuDrPst0cZROzjEDEmQlt3LyuBLnAjWFbtzsPxmjP5RFyhsnpnKltizH
 HVShX7HG6dzrBOOn0TzACr+etLXVmda5PWLPr7VPfd+0hl70d6lYIg5XdsIrWYdCDmWS
 Pfd8moMG5YTwu8sjyfR8hAgwO7ggsY3YcfNLFR67vXH2Ii7mNvaV2tV0ehnWhVVuwaTM
 it0yOvrQ26jFGJmlAzUJYes7u8dXAJ8gQsvD+OuEanYoQ+1gLXiGZkOm1AC1gGrxhji1
 +Jr1owPew/GdB+rQZzguLWtQg/GBM7FlEZ3/2IHVnlvkTD70qkZhTaHzfHMNrJFzZF8R gQ== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
        by mx0b-001b2d01.pphosted.com with ESMTP id 39gk5d1jup-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 30 Jun 2021 03:20:30 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
        by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15U7Cd5D024447;
        Wed, 30 Jun 2021 07:20:28 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
        by ppma04ams.nl.ibm.com with ESMTP id 39duv8hmm3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 30 Jun 2021 07:20:28 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
        by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 15U7KQg420775172
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 30 Jun 2021 07:20:26 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 00AA5A4092;
        Wed, 30 Jun 2021 07:20:25 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id E2F7FA40A1;
        Wed, 30 Jun 2021 07:20:23 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.145.56.105])
        by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Wed, 30 Jun 2021 07:20:23 +0000 (GMT)
Date:   Wed, 30 Jun 2021 10:20:21 +0300
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
Message-ID: <YNwbNX7oyosZAuEJ@linux.ibm.com>
References: <20210519141436.11961-1-rppt@kernel.org>
 <20210519141436.11961-4-rppt@kernel.org>
 <YNmiW6CYzy9lG8ks@atomide.com>
 <YNnLxFM4ZeQ5epX3@linux.ibm.com>
 <YNnqIv3PApHFZMgp@atomide.com>
 <YNqwl8EPVYZJV0EF@linux.ibm.com>
 <YNrfqtBpKsNj033w@atomide.com>
 <YNr6+wOiR7/Yx9M1@linux.ibm.com>
 <YNsJh7trg4up5l26@atomide.com>
 <YNsXDEgreCpshZxb@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YNsXDEgreCpshZxb@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: rvs5R5nyoEt68OsbalfVyq0zwKsMmEvN
X-Proofpoint-GUID: rvs5R5nyoEt68OsbalfVyq0zwKsMmEvN
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-06-30_01:2021-06-29,2021-06-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 bulkscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0 mlxlogscore=487
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106300045
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, Jun 29, 2021 at 03:50:23PM +0300, Mike Rapoport wrote:
> On Tue, Jun 29, 2021 at 02:52:39PM +0300, Tony Lindgren wrote:
> > * Mike Rapoport <rppt@linux.ibm.com> [210629 10:51]:
> > > As it seems, the new version of pfn_valid() decides that last pages are not
> > > valid because of the overflow in memblock_overlaps_region(). As the result,
> > > __sync_icache_dcache() skips flushing these pages.
> > > 
> > > The patch below should fix this. I've left the prints for now, hopefully
> > > they will not appear anymore. 
> > 
> > Yes this allows the system to boot for me :)
> > 
> > I'm still seeing these three prints though:
> > 
> > ...
> > smp: Brought up 1 node, 2 CPUs
> > SMP: Total of 2 processors activated (3994.41 BogoMIPS).
> > CPU: All CPU(s) started in SVC mode.
> > pfn_valid(__pageblock_pfn_to_page+0x14/0xa8): pfn: afe00: is_map: 0 overlaps: 1
> > pfn_valid(__pageblock_pfn_to_page+0x28/0xa8): pfn: affff: is_map: 0 overlaps: 1
> > pfn_valid(__pageblock_pfn_to_page+0x38/0xa8): pfn: afe00: is_map: 0 overlaps: 1
> 
> These pfns do have memory map despite they are stolen in
> arm_memblock_steal():
> 
> memblock_free: [0xaff00000-0xafffffff] arm_memblock_steal+0x50/0x70
> memblock_remove: [0xaff00000-0xafffffff] arm_memblock_steal+0x5c/0x70
> ...
> memblock_free: [0xafe00000-0xafefffff] arm_memblock_steal+0x50/0x70
> memblock_remove: [0xafe00000-0xafefffff] arm_memblock_steal+0x5c/0x70
> 
> But the struct pages there are never initialized.

Actually, with FLATMEM these struct pages will be always set to 0 because
we don't do memory map poisoning with FLATMEM.

I could not find a case where zeroed struct page would cause real trouble,
so I'd say it is more theoretical issue and it can be addressed unrelated
to these changes.

-- 
Sincerely yours,
Mike.
