Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DBFFF4F768C
	for <lists+linux-omap@lfdr.de>; Thu,  7 Apr 2022 08:46:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241328AbiDGGsS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 7 Apr 2022 02:48:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241352AbiDGGsO (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 7 Apr 2022 02:48:14 -0400
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [81.169.146.166])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22198214044
        for <linux-omap@vger.kernel.org>; Wed,  6 Apr 2022 23:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1649313836;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=H7+9xv89JRCjOioZu+oNk24ZKTOcaRFzOuoirztpIDI=;
    b=VH6VEmwzugb8k2cwHtpWrQIq5pSGRR88jWGOtMu10YOPF4ZgwCH/VYvsXCr5jt21qF
    au9sRD9ReVr1s2wmH9MJTXbW5GSxdmm2abE946vxsFhfXP7R0fHrFN8Wa5huEXFkD/7z
    Tj96+h8yu/WDqH1aU5mJRTjA1Ka/JvpoSq+HG5uXInQSwoMRGbY8bQ+vd/fILHSCFiJC
    WVpE/BiiPxZUYalpfay/LAovg/5QVsqiwzKS0SrL4vjt2tTQJUfbJXT4fuM/PyzU/FTv
    bs2pxCf77FOHlZEy9TJiTZoto1J5ASRxcqDN69QNYAnqE4q0jynW2skx1XAW+jw462Tf
    UJ2g==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7gpw91N5y2S3i8MRqg=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
    by smtp.strato.de (RZmta 47.42.2 DYNA|AUTH)
    with ESMTPSA id k708cfy376htiMC
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
    Thu, 7 Apr 2022 08:43:55 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [PATCH] iommu/omap: Fix regression in probe for NULL pointer
 dereference
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <Yk54+S0iaMueWN63@atomide.com>
Date:   Thu, 7 Apr 2022 08:43:54 +0200
Cc:     Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Drew Fustini <dfustini@baylibre.com>,
        Suman Anna <s-anna@ti.com>, iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Jason Gunthorpe <jgg@ziepe.ca>
Content-Transfer-Encoding: 7bit
Message-Id: <F4D607DA-EA0E-4044-B700-546CF764CD4D@goldelico.com>
References: <20220331062301.24269-1-tony@atomide.com>
 <Yk54+S0iaMueWN63@atomide.com>
To:     Tony Lindgren <tony@atomide.com>
X-Mailer: Apple Mail (2.3445.104.21)
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

> Am 07.04.2022 um 07:39 schrieb Tony Lindgren <tony@atomide.com>:
> 
> Hi,
> 
> * Tony Lindgren <tony@atomide.com> [220331 09:21]:
>> Commit 3f6634d997db ("iommu: Use right way to retrieve iommu_ops") started
>> triggering a NULL pointer dereference for some omap variants:
>> 
>> __iommu_probe_device from probe_iommu_group+0x2c/0x38
>> probe_iommu_group from bus_for_each_dev+0x74/0xbc
>> bus_for_each_dev from bus_iommu_probe+0x34/0x2e8
>> bus_iommu_probe from bus_set_iommu+0x80/0xc8
>> bus_set_iommu from omap_iommu_init+0x88/0xcc
>> omap_iommu_init from do_one_initcall+0x44/0x24
>> 
>> This is caused by omap iommu probe returning 0 instead of ERR_PTR(-ENODEV)
>> as noted by Jason Gunthorpe <jgg@ziepe.ca>.
>> 
>> Looks like the regression already happened with an earlier commit
>> 6785eb9105e3 ("iommu/omap: Convert to probe/release_device() call-backs")
>> that changed the function return type and missed converting one place.
> 
> Can you guys please get this fix into the -rc series? Or ack it so
> I can pick it up into my fixes branch?
> 
> Without this fix booting is failing for a bunch of devices.

Yes, I can confirm that v5.18-rc1 does not even boot the GTA04 (omap3)
and OMAP5UEVM to any activity without this patch.

Seems to be an urgent fix.

BR and thanks,
Nikolaus
