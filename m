Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9F3B38B48D
	for <lists+linux-omap@lfdr.de>; Thu, 20 May 2021 18:45:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234905AbhETQrD (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 20 May 2021 12:47:03 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:53156 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234736AbhETQrD (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 20 May 2021 12:47:03 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14KGjTb3116863;
        Thu, 20 May 2021 11:45:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1621529129;
        bh=ar+iPQ1/8NxPUYY4fTBEgCHV1SMvzpJowN5ylUJ6nJg=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=GNWPm9QUN26UMRYau81WjRPWqtjgrUKtkwJ8JREEg131wlDsg5C4Ism/5Fmg9hujV
         fQ7J9E3UWpHakRFGNSpWix5iYzR5fbPviOJGb+p52ZcR/z8dvnKyklc9UdmcaGE+ha
         iRXyXHaV2Vz8+JjWYUpWjo6VCSvqnum3Ha9aXukY=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14KGjTfM108843
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 20 May 2021 11:45:29 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 20
 May 2021 11:45:28 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 20 May 2021 11:45:28 -0500
Received: from [10.250.32.40] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14KGjS2T031441;
        Thu, 20 May 2021 11:45:28 -0500
Subject: Re: [PATCH] dt-bindings: mailbox: Convert omap-mailbox.txt binding to
 YAML
To:     Rob Herring <robh@kernel.org>
CC:     Jassi Brar <jaswinder.singh@linaro.org>,
        Tony Lindgren <tony@atomide.com>, Nishanth Menon <nm@ti.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        <devicetree@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20210518172022.10562-1-s-anna@ti.com>
 <c666919f-cc10-3ca5-a1e3-5062c260e827@ti.com>
 <20210520000831.GA3927464@robh.at.kernel.org>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <f60764c8-9100-0c8d-96d6-76689ed8acc6@ti.com>
Date:   Thu, 20 May 2021 11:45:28 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210520000831.GA3927464@robh.at.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 5/19/21 7:08 PM, Rob Herring wrote:
> On Wed, May 19, 2021 at 10:14:14AM -0500, Suman Anna wrote:
>> On 5/18/21 12:20 PM, Suman Anna wrote:
>>> Convert the current OMAP Mailbox binding from text format to YAML
>>> format/DT schema, and delete the legacy text binding file.
>>>
>>> The new YAML binding conversion is an updated version compared to
>>> the original. The descriptions for certain properties have been
>>> improved to provide more clarity. Constraints are added to the
>>> properties 'ti,mbox-num-users', 'ti,mbox-num-fifos' and 'interrupts'.
>>> The 'ti,hwmods' is a legacy property and is retained only to reflect
>>> the existing usage on some older OMAP2 and OMAP3 platforms.
>>>
>>> All the existing examples have also been updated to reflect the
>>> latest dts nodes (ti,hwmods removed from OMAP4 and AM33xx examples,
>>> and interrupts value updated for AM65x SoCs).
>>>
>>> Signed-off-by: Suman Anna <s-anna@ti.com>
>>> ---
>>> Hi,
>>>
>>> This patch does fix a number of dtbs_check warnings seen around OMAP Mailbox
>>> nodes with the latest kernel. There are few left-over warnings when just
>>> this patch is used on v5.13-rc1 or next-20210518. I have posted a separate
>>> fix for a warning on TI K3 SoCs [1], and will be posting a separate cleanup
>>> series for OMAP2+ SoCs. The dts patches can be picked up independently
>>> of this patch.
>>
>> FYI, All the dtbs_check warnings will be gone with [1] and the OMAP2+ cleanup
>> series [2].
> 
> Nice, though it is a moving target. :) Is that still true with the 
> undocumented compatible checks that's been added? 

[1] is acked, so will definitely get picked up for the next merge window. Should
hit next sometime in the next couple of days.

I didn't exactly understand your second comment, but no new compatibles were
added. The existing nodes are already in compliance with the constraints I added
(so that's strictly binding enforcements). These constraints are almost all on
legacy SoCs, so these do not pose any issues.

Most of the generated warnings stem from me adding a pattern for the child nodes
in the binding, and [2] is mostly just renaming these node names.

Tony,
Do you have/foresee any concerns with the patches in [2]?

regards
Suman

[1]
https://patchwork.kernel.org/project/linux-arm-kernel/patch/20210514212016.3153-1-s-anna@ti.com/
[2] https://patchwork.kernel.org/project/linux-omap/list/?series=484489

