Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D2DE39F3C9
	for <lists+linux-omap@lfdr.de>; Tue,  8 Jun 2021 12:40:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231461AbhFHKmk (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 8 Jun 2021 06:42:40 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:57390 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230351AbhFHKmk (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 8 Jun 2021 06:42:40 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 158Aec9H057922;
        Tue, 8 Jun 2021 05:40:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1623148838;
        bh=2ZYkUmeiSOpEfONQLdfJT2cDK8XOXDxo6jo/QLfcX2Q=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=M37LXsb5L7dVPpEKewndJG0AX6PngaEfupZStvmSZ+5Uk7Vhh36A0ArYlTMDXo2gn
         FFP3lZpWjST8HL18NtUXlR9Am9l1NWBk/rs8KWzfyN7BgT9ZUIfvIa22WFmUwqZOlg
         xDzgthDEBGZ6W9GmmH+KDcKUP7igjMMqMVe9A9N0=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 158Aecg7098397
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 8 Jun 2021 05:40:38 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 8 Jun
 2021 05:40:38 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 8 Jun 2021 05:40:37 -0500
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 158AeZhJ080746;
        Tue, 8 Jun 2021 05:40:35 -0500
Subject: Re: [PATCH v4] ARM: dts: dra7: Fix duplicate USB4 target module node
To:     Gowtham Tammana <g-tammana@ti.com>, Suman Anna <s-anna@ti.com>,
        <tony@atomide.com>, <bcousson@baylibre.com>
CC:     <robh+dt@kernel.org>, <linux-omap@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, Nisanth Menon <nm@ti.com>
References: <20210602220458.9728-1-g-tammana@ti.com>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <c140f39c-9fe1-f7e1-3da5-fc5fff604714@ti.com>
Date:   Tue, 8 Jun 2021 13:40:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210602220458.9728-1-g-tammana@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 03/06/2021 01:04, Gowtham Tammana wrote:
> With [1] USB4 target-module node got defined in dra74x.dtsi file.
> However, the earlier definition in [2] was not removed, and this
> duplication of the target module is causing boot failure on dra74
> variant boards - dra7-evm, dra76-evm.
> 
> USB4 is only present in DRA74x variants, so keeping the entry in
> dra74x.dtsi and removing it from the top level interconnect hierarchy
> dra7-l4.dtsi file. This change makes the USB4 target module no longer
> visible to AM5718, DRA71x and DRA72x so removing references to it in
> their respective dts files.
> 
> [1]: commit c7b72abca61ec ("ARM: OMAP2+: Drop legacy platform data for
> dra7 dwc3")
> [2]: commit 549fce068a311 ("ARM: dts: dra7: Add l4 interconnect
> hierarchy and ti-sysc data")
> 
> Fixes: c7b72abca61ec ("ARM: OMAP2+: Drop legacy platform data for dra7 dwc3")
> Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
> ---
> v4:
>    - moved the node under l4_per3 instead of ocp as per Tony and
>      Grygorii suggestion
> v3:
>    - https://lore.kernel.org/linux-arm-kernel/20210526213035.15448-1-g-tammana@ti.com/
>    - fixed error in references to the commits
>    - mentioned the boards that failed
> v2:
>    - https://lore.kernel.org/linux-arm-kernel/20210526172038.17542-1-g-tammana@ti.com/
>    - changed reference to commit sha instead of line numbers
>    - added Fixes: tag
>    - moved the defintion to dra74.dtsi as per Suman and Tony review comments
> v1:
>    - https://lore.kernel.org/linux-arm-kernel/20210521211851.14674-1-g-tammana@ti.com/
> 
> 
>   arch/arm/boot/dts/am5718.dtsi  |  6 +--
>   arch/arm/boot/dts/dra7-l4.dtsi | 22 --------
>   arch/arm/boot/dts/dra71x.dtsi  |  4 --
>   arch/arm/boot/dts/dra72x.dtsi  |  4 --
>   arch/arm/boot/dts/dra74x.dtsi  | 92 ++++++++++++++++++----------------
>   5 files changed, 50 insertions(+), 78 deletions(-)
> 

Thank you.
Reviewed-by: Grygorii Strashko <grygorii.strashko@ti.com>

-- 
Best regards,
grygorii
