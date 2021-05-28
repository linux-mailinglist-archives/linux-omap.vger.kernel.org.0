Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF0D73944BE
	for <lists+linux-omap@lfdr.de>; Fri, 28 May 2021 17:00:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236384AbhE1PBw (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 28 May 2021 11:01:52 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:32988 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235676AbhE1PBv (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 28 May 2021 11:01:51 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14SF09JH055113;
        Fri, 28 May 2021 10:00:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1622214009;
        bh=Fza/1XXCrVuN7CCyZ7DzxFrK6EUnA55LYMWtkF1z0tI=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=TcKE2cTPwTG8Odi5Z5aR0/04OmALOJW2UHI9ubO+grZcbXEiE/qvdAz6gG3SZxc8I
         PkuGltP2SwXEdISE4prYtNW+9kNWy97HWEUv3R/lsoL8pLu4MKzRHRpujekSdOHXbJ
         JUdNW62fViStsFL+aD2RS4c41Jgg3mb12TzZbvLc=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14SF08YV010502
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 28 May 2021 10:00:09 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 28
 May 2021 10:00:08 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 28 May 2021 10:00:08 -0500
Received: from [10.250.35.153] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14SF08WX009318;
        Fri, 28 May 2021 10:00:08 -0500
Subject: Re: [PATCH v2] dt-bindings: mailbox: Convert omap-mailbox.txt binding
 to YAML
To:     Rob Herring <robh+dt@kernel.org>,
        Jassi Brar <jaswinder.singh@linaro.org>
CC:     Tony Lindgren <tony@atomide.com>, Nishanth Menon <nm@ti.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        <devicetree@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20210520234348.4479-1-s-anna@ti.com>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <574767de-9a05-f8c1-9673-1df63f626a47@ti.com>
Date:   Fri, 28 May 2021 10:00:03 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210520234348.4479-1-s-anna@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Rob,

On 5/20/21 6:43 PM, Suman Anna wrote:
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
> v2: Address Rob's comments
>  - Replace definitions with $defs
>  - Dropping the trailing | character after all description keywords
>  - Marked ti,hwmods as deprecated
>  - Updated #mbox-cells description
> v1: 
> http://patchwork.ozlabs.org/project/devicetree-bindings/patch/20210518172022.10562-1-s-anna@ti.com/
> 
> Note that this would continue to generate the checkpatch warning
> "DT binding docs and includes should be a separate patch" for the
> deleted text file. The fixes for dtbs_check warnings on mailbox nodes
> with this yaml file are posted as well, please see v1 patch for links.
> 

Just following up on this, the mailbox nodes dtbs_check warning fixes are now
staged for v5.14, and are present in next as of next-20210528.

> regards
> Suman
> 
>  .../bindings/mailbox/omap-mailbox.txt         | 184 -----------
>  .../bindings/mailbox/ti,omap-mailbox.yaml     | 308 ++++++++++++++++++
>  2 files changed, 308 insertions(+), 184 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mailbox/omap-mailbox.txt
>  create mode 100644 Documentation/devicetree/bindings/mailbox/ti,omap-mailbox.yaml
> 

[snip]

regards
Suman
