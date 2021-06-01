Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BCD03973D2
	for <lists+linux-omap@lfdr.de>; Tue,  1 Jun 2021 15:07:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233823AbhFANJS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 1 Jun 2021 09:09:18 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:59084 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233797AbhFANJP (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 1 Jun 2021 09:09:15 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 151D7RWK107099;
        Tue, 1 Jun 2021 08:07:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1622552847;
        bh=G1GBFlawSCs8NhhQOygknnnaSWdi834GdYWCh/fUFD4=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=KPcdcLw9LeS4KeM51DKmZDycG14l/lmAYWASB28GNH7sTDNM5yHWU/ykEluP3mi0U
         p5GMK+4+Z2alwMXzyYaLUiytO87GugEUVOtFbAmONV1HYWei2vgG75diOaaivmcajq
         zyOA6lCpu6exsC3kw6WRK6hnxt9YH/HQRUC14sC0=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 151D7QvT129632
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 1 Jun 2021 08:07:26 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 1 Jun
 2021 08:07:26 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 1 Jun 2021 08:07:27 -0500
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 151D7Ouu124213;
        Tue, 1 Jun 2021 08:07:24 -0500
Subject: Re: [PATCH 3/3] ARM: dts: am33xx: Drop interrupt property from ecap
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
 <20210601092457.5039-4-lokeshvutla@ti.com>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <9ed2579f-593a-a9db-dd87-967a4f352fcf@ti.com>
Date:   Tue, 1 Jun 2021 16:07:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210601092457.5039-4-lokeshvutla@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 01/06/2021 12:24, Lokesh Vutla wrote:
> Interrupts were never supported by ecap driver and the bindings
> were never documented.Therefore drop the entries in preparation
> to moving bindings to YAML schema.
> 
> Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
> ---
>   arch/arm/boot/dts/am33xx-l4.dtsi | 6 ------
>   1 file changed, 6 deletions(-)
> 

Reviewed-by: Grygorii Strashko <grygorii.strashko@ti.com>

-- 
Best regards,
grygorii
