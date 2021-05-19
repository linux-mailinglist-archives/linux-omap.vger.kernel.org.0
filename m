Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7ED8389257
	for <lists+linux-omap@lfdr.de>; Wed, 19 May 2021 17:14:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240858AbhESPPp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 19 May 2021 11:15:45 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:53550 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233577AbhESPPo (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 19 May 2021 11:15:44 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14JFEEhZ107727;
        Wed, 19 May 2021 10:14:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1621437254;
        bh=JLprp5Wyndl+zIrf2Vm1yh2awJx90eNQiNKEDp5mqt0=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=rUotHyVawT2S/Vg0zGFaqNEt1igJm0hiHu0q8V6HGufhFMBaTGwTQUx/4SC8LiCuV
         dUs05FVcE0qzdsJfeQLp7Xuy0PKXqDeUPd+omHAWeDgAxMd9vMOaBvnon3w3E7P/jy
         PiCCMkLnxpVP7lpAy6/dQ+KbZ1ZIkYj6n+jgoKMU=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14JFEE7q030202
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 19 May 2021 10:14:14 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 19
 May 2021 10:14:14 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Wed, 19 May 2021 10:14:14 -0500
Received: from [10.250.32.40] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14JFEEBI018990;
        Wed, 19 May 2021 10:14:14 -0500
Subject: Re: [PATCH] dt-bindings: mailbox: Convert omap-mailbox.txt binding to
 YAML
To:     Rob Herring <robh+dt@kernel.org>,
        Jassi Brar <jaswinder.singh@linaro.org>
CC:     Tony Lindgren <tony@atomide.com>, Nishanth Menon <nm@ti.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        <devicetree@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20210518172022.10562-1-s-anna@ti.com>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <c666919f-cc10-3ca5-a1e3-5062c260e827@ti.com>
Date:   Wed, 19 May 2021 10:14:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210518172022.10562-1-s-anna@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 5/18/21 12:20 PM, Suman Anna wrote:
> Convert the current OMAP Mailbox binding from text format to YAML
> format/DT schema, and delete the legacy text binding file.
> 
> The new YAML binding conversion is an updated version compared to
> the original. The descriptions for certain properties have been
> improved to provide more clarity. Constraints are added to the
> properties 'ti,mbox-num-users', 'ti,mbox-num-fifos' and 'interrupts'.
> The 'ti,hwmods' is a legacy property and is retained only to reflect
> the existing usage on some older OMAP2 and OMAP3 platforms.
> 
> All the existing examples have also been updated to reflect the
> latest dts nodes (ti,hwmods removed from OMAP4 and AM33xx examples,
> and interrupts value updated for AM65x SoCs).
> 
> Signed-off-by: Suman Anna <s-anna@ti.com>
> ---
> Hi,
> 
> This patch does fix a number of dtbs_check warnings seen around OMAP Mailbox
> nodes with the latest kernel. There are few left-over warnings when just
> this patch is used on v5.13-rc1 or next-20210518. I have posted a separate
> fix for a warning on TI K3 SoCs [1], and will be posting a separate cleanup
> series for OMAP2+ SoCs. The dts patches can be picked up independently
> of this patch.

FYI, All the dtbs_check warnings will be gone with [1] and the OMAP2+ cleanup
series [2].

> 
> regards
> Suman
> 
> [1] https://patchwork.kernel.org/project/linux-arm-kernel/patch/20210514212016.3153-1-s-anna@ti.com/

[2] https://patchwork.kernel.org/project/linux-omap/list/?series=484489

[snip]

regards
Suman
