Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E16F2135AC3
	for <lists+linux-omap@lfdr.de>; Thu,  9 Jan 2020 14:57:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730157AbgAIN5I (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 9 Jan 2020 08:57:08 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:56172 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725791AbgAIN5I (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 9 Jan 2020 08:57:08 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 009Dv07b034023;
        Thu, 9 Jan 2020 07:57:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1578578220;
        bh=1TMtTjCmCOQvk0/KYtiyqoakyNuPU5JopEa33VjdmNo=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=rG0mAqjUXNic9c38dJv5JnTvoFWWjMt1L99eOncZbTmHK9DiG6xDWuY5P3iMv69V7
         C8WRRAzNzyNhnQJzTln3YK/fjpTrhx69x/ILebB8XkOxqmXnLEQwuyTtEOK8O3PStZ
         Exc/geNURmUbkdE4ay/zq/dChFvtJ9f8oy1Ifapo=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 009Dv07F123940
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 9 Jan 2020 07:57:00 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 9 Jan
 2020 07:56:59 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 9 Jan 2020 07:56:59 -0600
Received: from [172.24.190.4] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 009DuuFt014859;
        Thu, 9 Jan 2020 07:56:57 -0600
Subject: Re: [PATCH] arm: dts: Move am33xx and am43xx mmc nodes to sdhci-omap
 driver
To:     <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-omap@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
        "tony@atomide.com >> Tony Lindgren" <tony@atomide.com>
CC:     <mark.rutland@arm.com>, <robh+dt@kernel.org>,
        <bcousson@baylibre.com>, <kishon@ti.com>
References: <20200106111517.15158-1-faiz_abbas@ti.com>
From:   Faiz Abbas <faiz_abbas@ti.com>
Message-ID: <ab908007-fd7d-9dd5-c822-f4058c793d7d@ti.com>
Date:   Thu, 9 Jan 2020 19:28:29 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200106111517.15158-1-faiz_abbas@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

On 06/01/20 4:45 pm, Faiz Abbas wrote:
> Move mmc nodes to be compatible with the sdhci-omap driver. The following
> modifications are required for omap_hsmmc specific properties:
> 
> ti,non-removable: convert to the generic mmc non-removable
> ti,needs-special-reset:  co-opted into the sdhci-omap driver
> ti,dual-volt: removed. Legacy property not used in am335x or am43xx
> ti,needs-special-hs-handling: removed. Legacy property not used in am335x or am43xx
> 
> Also since the sdhci-omap driver does not support runtime PM, explicitly
> disable the mmc3 instance in the dtsi.
> 
> Signed-off-by: Faiz Abbas <faiz_abbas@ti.com>
> ---
> 
> Driver modifications have been posted separately:
> https://patchwork.kernel.org/project/linux-mmc/list/?series=224053
> 
> Tested on: am335x-evm, am335x-boneblack, am335x-sk, am335x-bone, am437x-idk,
> am43xx-gp-evm, am43xx-epos-evm.
> 
> I need some help with testing all other am335x variants and SDIO cards.
> 
> Here's a branch for testing: https://github.com/faizinator/linux/tree/sdhci-omap_v4_2
> 

Tony, can you help test some of these boards?

Thanks,
Faiz
