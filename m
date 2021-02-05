Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 446F8310EB2
	for <lists+linux-omap@lfdr.de>; Fri,  5 Feb 2021 18:31:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233231AbhBEPqh (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 5 Feb 2021 10:46:37 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:41646 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233343AbhBEPoW (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 5 Feb 2021 10:44:22 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 115F49g7009021;
        Fri, 5 Feb 2021 09:04:09 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1612537449;
        bh=tgXH0jDlzSuMvnwwTfnKlyIjhADidsODFnKRxzXzEik=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=LBeps3WPW3s/+y9bQeHBU93RH0dev6IU4YhvQrfO9y3Snopf3nm89bFwVpNZ7ImFO
         7f+exNeDR+Ytmm+k/wSz91gPC2rNXhs3KWnImq108y1VBp1I9KxAkFgd6aFDqe9oLx
         pxTwy/9TAbynWF3+P6LdVjG9de5IqcHz7z87kGTE=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 115F49Lh044774
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 5 Feb 2021 09:04:09 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 5 Feb
 2021 09:04:09 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 5 Feb 2021 09:04:09 -0600
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 115F479B085244;
        Fri, 5 Feb 2021 09:04:07 -0600
Subject: Re: [PATCH 2/2] ARM: omap2plus_defconfig: Update for dropped options.
To:     Tony Lindgren <tony@atomide.com>
CC:     "Ivan J." <parazyd@dyne.org>, <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20210203113426.18964-1-parazyd@dyne.org>
 <20210203113426.18964-2-parazyd@dyne.org> <YBuankYwwMsG4MN9@atomide.com>
 <4b32f566-92ad-3c49-0453-b44df23f1384@ti.com>
 <20210205131736.3jivrc5lln4t2onr@fq> <YB1Ib41trny2JFDv@atomide.com>
 <8ab86ccf-7568-c173-75f6-0d572fd43fec@ti.com> <YB1aS4Tn76hKM5NC@atomide.com>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <8daa6fce-bfad-ea28-e8dd-f3083bf43b01@ti.com>
Date:   Fri, 5 Feb 2021 17:04:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YB1aS4Tn76hKM5NC@atomide.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 05/02/2021 16:46, Tony Lindgren wrote:
> * Grygorii Strashko <grygorii.strashko@ti.com> [210205 14:25]:
>> On 05/02/2021 15:30, Tony Lindgren wrote:
>>> Grgorii, maybe send a patch selecting MICREL_PHY in the Kconfig
>>> for the other cases that do not use KS8851?
>>
>> The KS8851 config was added like 10years ago and is used on some omap4 platforms,
>> it does select MICREL_PHY.
>>
>>  From other side, *some* am57x, am437 platforms uses MICREL PHYs with no dependency from KS8851.
>>
>> The omap2plus_defconfig is also used as base for custom configs and first thing people are doing -
>> remove not needed options. As result, removal of KS8851 plus this patch will immediately
>> cause MICREL_PHY=n and so breakage on existing and custom platforms.
>>
>> I do not see how it can be resolved by using Kconfig changes within much-omap2.
>>
>> So, sry, but NACK for this patch as it is.
> 
> We can wait on this patch no problem while we figure this out.
> But certainly we need to fix things so make savedefconfig
> produces valid configs that don't need to be manually edited.
> 
>> if some Kconfig dependencies need to be sorted out - probably the best way might be
>> to get rid of select MICREL_PHY in KS8851/KS8851_MLL.
> 
> That will potentially break things too as the configs now expect
> it to be selected :) Looks like that got changed with commit
> f0791b92d2b6 ("net: ks8851: Select PHYLIB and MICREL_PHY in
> Kconfig").

Yah. It's really has to be "depends on".

> 
> So why can't we do similar patches to select MICREL_PHY for
> the other non-ks8851 configurations in drivers/net/ethernet
> Kconfig files as needed?

because there is no dependency between Ethernet controller (CPSW) and
Ethernet PHY - any MII capable PHY can be used with CPSW.

-- 
Best regards,
grygorii
