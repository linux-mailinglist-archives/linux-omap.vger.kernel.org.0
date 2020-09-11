Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56A83265D0F
	for <lists+linux-omap@lfdr.de>; Fri, 11 Sep 2020 11:55:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725777AbgIKJzl (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 11 Sep 2020 05:55:41 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:46380 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725710AbgIKJzj (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 11 Sep 2020 05:55:39 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08B9taOF078280;
        Fri, 11 Sep 2020 04:55:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1599818136;
        bh=EL/ugUURzoqjPlTdtI85LUJCZ1gCXjj2E4KpF58WNMQ=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=iGvEp914lBXMTuuLMvZ3c25Q4zypC6hJCm+SZERu/iSt4bjSkFH5VJ6pyHQtRM1c2
         9AFEoRRBUWlJtOgH1CjJ/l12s04lYzZqetiVaWeQfwqmYiw3S5NIc7Vh0Ww9GEcTMo
         MVoiHCCC2KZbBSNP1idOyvp55VIkBhssUFK+wcK4=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08B9ta1Z024865
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 11 Sep 2020 04:55:36 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 11
 Sep 2020 04:55:35 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 11 Sep 2020 04:55:35 -0500
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08B9tXbp111244;
        Fri, 11 Sep 2020 04:55:34 -0500
Subject: Re: [PATCH next 0/3] ARM: dts: am437x: switch to new cpsw switch drv
To:     Tony Lindgren <tony@atomide.com>
CC:     <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Sekhar Nori <nsekhar@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Murali Karicheri <m-karicheri2@ti.com>
References: <20200910222508.32417-1-grygorii.strashko@ti.com>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <c0417a06-4e81-b795-b7c0-9b4bfc046e6d@ti.com>
Date:   Fri, 11 Sep 2020 12:55:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200910222508.32417-1-grygorii.strashko@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 11/09/2020 01:25, Grygorii Strashko wrote:
> Hi Tony,
> 
> Since Kernel v5.5 commits:
>   111cf1ab4da3 ("net: ethernet: ti: introduce cpsw switchdev based driver part 2 - switch")
>   ed3525eda4c4 ("net: ethernet: ti: introduce cpsw switchdev based driver part 1 - dual-emac")
> the new CPSW driver with switchdev support has been introduced and one
> am571x-idk board was converted to use it. And since that time (Nov 2019) no
> significant issues were reported for the new CPSW driver.
> 
> Therefore it's time to switch all am437x boards to use new cpsw switch
> driver. Those boards have 1 or 2 Ext. ports wired and configured in dual_mac mode
> by default. The dual_mac mode has been preserved the same way between
> legacy and new driver, and one port devices works the same as 1 dual_mac port,
> so it's safe to switch drivers.
> 
> Grygorii Strashko (3):
>    ARM: dts: am437x-l4: add dt node for new cpsw switchdev driver
>    ARM: dts: am437x: switch to new cpsw switch drv
>    ARM: dts: am437x-l4: drop legacy cpsw dt node
> 
>   arch/arm/boot/dts/am4372.dtsi        |  4 +-
>   arch/arm/boot/dts/am437x-cm-t43.dts  | 14 +++--
>   arch/arm/boot/dts/am437x-gp-evm.dts  | 13 +++--
>   arch/arm/boot/dts/am437x-idk-evm.dts | 13 +++--
>   arch/arm/boot/dts/am437x-l4.dtsi     | 77 +++++++++++++++-------------
>   arch/arm/boot/dts/am437x-sk-evm.dts  | 14 +++--
>   arch/arm/boot/dts/am43x-epos-evm.dts | 13 +++--
>   7 files changed, 78 insertions(+), 70 deletions(-)
> 

Pls, ignore this mail - double send.

-- 
Best regards,
grygorii
