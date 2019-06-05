Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9BD6B355B0
	for <lists+linux-omap@lfdr.de>; Wed,  5 Jun 2019 06:02:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725446AbfFEECC (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 5 Jun 2019 00:02:02 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:39390 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725268AbfFEECC (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 5 Jun 2019 00:02:02 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5541xjK109273;
        Tue, 4 Jun 2019 23:02:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1559707320;
        bh=qIjtFSRYqk/kHli2jPH1jiGXS5EoqeFq8ENhzkSl1tY=;
        h=Subject:From:To:CC:References:Date:In-Reply-To;
        b=VxM1yuIvmFn1F4yu9UYA/ybPBx+p0oNtS7TSTce6n9gKj3i9df/0dVMT2L47YrUiC
         qdEWFYYHQdtCWtx7YIZi98r69UsJhw2IkUK07QsEBuqAU/i4igHHS57b1vMv3JNGv7
         F2RjcZVOkDnNpmpRkSaFLiuGzBkVtwz3LHkq/LXQ=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5541xZf026276
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 4 Jun 2019 23:01:59 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 4 Jun
 2019 23:01:59 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 4 Jun 2019 23:01:59 -0500
Received: from [172.24.191.45] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5541vYZ033997;
        Tue, 4 Jun 2019 23:01:58 -0500
Subject: Re: Kernel boot crash on latest next dated june 3
From:   Keerthy <j-keerthy@ti.com>
To:     Tony Lindgren <tony@atomide.com>, "Kristo, Tero" <t-kristo@ti.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>
CC:     Vignesh Raghavendra <vigneshr@ti.com>
References: <aa22befb-227c-85fe-4eb9-c3775ee87c45@ti.com>
Message-ID: <d11c433e-9b2b-9fe8-0b76-e78184e1af21@ti.com>
Date:   Wed, 5 Jun 2019 09:32:40 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <aa22befb-227c-85fe-4eb9-c3775ee87c45@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 04/06/19 11:08 AM, Keerthy wrote:
> Hi Tony,
> 
> DRA7/71/76, AM4/3 are not able to boot with latest next branch.
> The crash behavior is pretty similar on all the platforms.
> Example log on DRA7-EVM:
> 
> https://pastebin.ubuntu.com/p/tNPZrpHZzV/

Seems like this is fixed on today's next so please ignore this.

> 
> Regards,
> Keerthy
