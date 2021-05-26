Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B89EE39147E
	for <lists+linux-omap@lfdr.de>; Wed, 26 May 2021 12:08:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233772AbhEZKKJ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 26 May 2021 06:10:09 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:35882 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233796AbhEZKKI (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 26 May 2021 06:10:08 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14QA8Zid083338;
        Wed, 26 May 2021 05:08:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1622023715;
        bh=vOxNhx0MBpAqy1Whz/RPrlaU5mjj6E5AS511hjl1sHk=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=lHs4wUHTKY+n8bVET+ZClyIS/bQP06oRu8IJQdMcSS+nixyG2enZdFBwifhejvfjf
         zAufL2wWsTRc4PMHRMFDJiQ+dh3VfslxDyI4TWpuU1SGQqd+kSNwjSqy4kGjiDiZbV
         A5EOS+ET05HyfIPzXuhWSppq/7LtoSW75yFlvxFI=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14QA8ZIP078628
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 26 May 2021 05:08:35 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 26
 May 2021 05:08:35 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Wed, 26 May 2021 05:08:35 -0500
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14QA8XAv046400;
        Wed, 26 May 2021 05:08:34 -0500
Subject: Re: [PATCH] ARM: dts: omap2/3: Drop dmas property from I2C node
To:     Vignesh Raghavendra <vigneshr@ti.com>,
        Tony Lindgren <tony@atomide.com>
CC:     Rob Herring <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-omap@vger.kernel.org>
References: <20210526094424.27234-1-vigneshr@ti.com>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <db266433-e97d-9786-bb1d-07d474ebcab4@ti.com>
Date:   Wed, 26 May 2021 13:08:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210526094424.27234-1-vigneshr@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 26/05/2021 12:44, Vignesh Raghavendra wrote:
> DMA was never supported by i2c-omap driver and the bindings were never
> documented. Therefore drop the entries in preparation to moving
> bindings to YAML schema.
> 
> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
> ---
>   arch/arm/boot/dts/dm816x.dtsi | 4 ----
>   arch/arm/boot/dts/omap2.dtsi  | 4 ----
>   arch/arm/boot/dts/omap3.dtsi  | 6 ------
>   3 files changed, 14 deletions(-)

Thank you.
Reviewed-by: Grygorii Strashko <grygorii.strashko@ti.com>

-- 
Best regards,
grygorii
