Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6EC98A6102
	for <lists+linux-omap@lfdr.de>; Tue,  3 Sep 2019 08:04:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725919AbfICGEA (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 3 Sep 2019 02:04:00 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:33926 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725895AbfICGEA (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 3 Sep 2019 02:04:00 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8363vaE077934;
        Tue, 3 Sep 2019 01:03:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1567490637;
        bh=MqNNkLJ29RNbusnI4xqOxq1HjcgOPiKk8kWkouSNQVA=;
        h=Subject:From:To:CC:References:Date:In-Reply-To;
        b=PUm5Pjzl+52gg6JgW3MvZnoJYtT3wSALZcnyrxh7WpBEh9Rgc7dLkI/KspLpYqGJJ
         pADWImj+1awe80tOptrXsp/TWTVdlVRvFNezDx49kcZp9Uk/SK1QMxzfWFj4VAUZTV
         ARklA9CXMhGEigujzeeXCTWMXSqGlKjviSc8QldA=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8363vQP071439
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 3 Sep 2019 01:03:57 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 3 Sep
 2019 01:03:57 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 3 Sep 2019 01:03:57 -0500
Received: from [172.24.191.45] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8363s3P128959;
        Tue, 3 Sep 2019 01:03:55 -0500
Subject: Re: Linux-next: File system over NFS broken on DRA7/AM5 platforms
From:   Keerthy <j-keerthy@ti.com>
To:     Tony Lindgren <tony@atomide.com>, "Kristo, Tero" <t-kristo@ti.com>
CC:     <linux-omap@vger.kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>
References: <b5f54d5f-4790-7be1-cb65-847a98d2e8dd@ti.com>
Message-ID: <c32b9e04-b230-7634-051b-202868597ec1@ti.com>
Date:   Tue, 3 Sep 2019 11:34:31 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <b5f54d5f-4790-7be1-cb65-847a98d2e8dd@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 31/08/19 7:21 AM, keerthy wrote:
> Hi Tony,
> 
> https://pastebin.ubuntu.com/p/pt7b3JPgRn/
> 
> NFS boot seems to be broken. Works well with 5.3-rc6.
> 
> I couldn't do the bisect yet.

Vignesh,

Thanks for the clue.

Tony,

[    2.457707] gmac-clkctrl:0000:0: failed to enable
[    2.462570] cpsw: probe of 48484000.ethernet failed with error -16

seems like gmac clkctrl failing to enable.

commit 1faa415c9c6e41a5350d3067307e7985b546ac3a
Author: Tony Lindgren <tony@atomide.com>
Date:   Mon Aug 26 08:41:14 2019 -0700

ARM: dts: Add fck for cpsw mdio for omap variants

The above commit seems to be causing that. I tried experimenting
with removing the patch changes for dra7-dt alone.

The above errors seem to go away but then i see a crash:

https://pastebin.ubuntu.com/p/zBqGX959J2/

Could you please take a look at the above patch?

Regards,
Keerthy

> 
> - Keerthy
> 
