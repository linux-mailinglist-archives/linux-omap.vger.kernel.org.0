Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 699A33973CB
	for <lists+linux-omap@lfdr.de>; Tue,  1 Jun 2021 15:06:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233698AbhFANHr (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 1 Jun 2021 09:07:47 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:57238 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233064AbhFANHr (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 1 Jun 2021 09:07:47 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 151D601w025274;
        Tue, 1 Jun 2021 08:06:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1622552760;
        bh=jucrEPJ8cc5fVjptr7rFILVTxMWTf70ZrxWefRvMaP8=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=PKjCABkHoOfUyf2QrsJzR8TEN3AY4nswydj6Ih574glxQqfCwsEfN1b92SoDcM+fH
         EBBkYbaLfxlINLShRnvGj+/al+EPDOt1d6hd1xNiekLu/3LLC8lP2jw07EbQnHVgXL
         +5WqcLnAr/+hg11XDPp6KTc78c9FqIz+YLYMI6Rc=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 151D60XI074091
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 1 Jun 2021 08:06:00 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 1 Jun
 2021 08:06:00 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 1 Jun 2021 08:06:00 -0500
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 151D5vBI080237;
        Tue, 1 Jun 2021 08:05:58 -0500
Subject: Re: [PATCH 1/3] ARM: dts: ti: Drop usage of ti,am33xx-ecap from DT
 nodes
To:     Lokesh Vutla <lokeshvutla@ti.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>
CC:     Sekhar Nori <nsekhar@ti.com>, Vignesh R <vigneshr@ti.com>,
        Nishanth Menon <nm@ti.com>,
        Linux OMAP Mailing List <linux-omap@vger.kernel.org>,
        Device Tree Mailing List <devicetree@vger.kernel.org>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>
References: <20210601092457.5039-1-lokeshvutla@ti.com>
 <20210601092457.5039-2-lokeshvutla@ti.com>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <a65e0704-9650-a29b-6809-cb63a087ea37@ti.com>
Date:   Tue, 1 Jun 2021 16:05:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210601092457.5039-2-lokeshvutla@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 01/06/2021 12:24, Lokesh Vutla wrote:
> ti,am33xx-ecap is used to represent device nodes using ti,hwmod data.
> Now that hwmod entries are entirely removed, drop usage of
> ti,am33xx-ecap compatible from all DT nodes.
> 
> Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
> ---
>   arch/arm/boot/dts/am33xx-l4.dtsi | 9 +++------
>   arch/arm/boot/dts/am437x-l4.dtsi | 9 +++------
>   arch/arm/boot/dts/da850.dtsi     | 9 +++------
>   3 files changed, 9 insertions(+), 18 deletions(-)
> 
Reviewed-by: Grygorii Strashko <grygorii.strashko@ti.com>
-- 
Best regards,
grygorii
