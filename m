Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 494B4BE711
	for <lists+linux-omap@lfdr.de>; Wed, 25 Sep 2019 23:26:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726253AbfIYV0n (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 25 Sep 2019 17:26:43 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:57310 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726139AbfIYV0n (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 25 Sep 2019 17:26:43 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8PLQTJJ089587;
        Wed, 25 Sep 2019 16:26:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1569446789;
        bh=L31cUsQNSVbjLWHHKpLMzPbfxz4gfU8gEYEWZo7VRD4=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=p2r1071HZ9y8EGc8xiGpOsXeJy2yAEfOjLCL17cM0ykGWc8amevRRcsEDHaD7tfOI
         oU33SWp5+ZQOxSUIiJD3iBh2zdw1XS5il1t2emezEn4wE+FuZS7E7VR5IjnQbT6+7L
         L3VWeUcY49QtSuA7Qe3S7H6av7k/UR5+rG+P/TxQ=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8PLQTGV030025;
        Wed, 25 Sep 2019 16:26:29 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 25
 Sep 2019 16:26:29 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 25 Sep 2019 16:26:22 -0500
Received: from [10.250.197.29] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8PLQRXj125159;
        Wed, 25 Sep 2019 16:26:28 -0500
Subject: Re: [PATCH] drm/omap: Migrate minimum FCK/PCK ratio from Kconfig to
 dts
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Adam Ford <aford173@gmail.com>, <linux-omap@vger.kernel.org>
CC:     Mark Rutland <mark.rutland@arm.com>, <devicetree@vger.kernel.org>,
        David Airlie <airlied@linux.ie>,
        <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>,
        =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>,
        <adam.ford@logicpd.com>
References: <20190510194229.20628-1-aford173@gmail.com>
 <af325707-3e42-493d-e858-77878ef06138@ti.com>
From:   "Andrew F. Davis" <afd@ti.com>
Message-ID: <93c141c6-6519-4855-2424-f7b348b5df25@ti.com>
Date:   Wed, 25 Sep 2019 14:26:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <af325707-3e42-493d-e858-77878ef06138@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 5/28/19 4:11 AM, Tomi Valkeinen wrote:
> Hi,
> 
> On 10/05/2019 22:42, Adam Ford wrote:
>> Currently the source code is compiled using hard-coded values
>> from CONFIG_OMAP2_DSS_MIN_FCK_PER_PCK.  This patch allows this
>> clock divider value to be moved to the device tree and be changed
>> without having to recompile the kernel.
>>
>> Signed-off-by: Adam Ford <aford173@gmail.com>
> 
> I understand why you want to do this, but I'm not sure it's a good idea.
> It's really something the driver should figure out, and if we add it to
> the DT, it effectively becomes an ABI.
> 
> That said... I'm not sure how good of a job the driver could ever do, as
> it can't know the future scaling needs of the userspace at the time it
> is configuring the clock. And so, I'm not nacking this patch, but I
> don't feel very good about this patch...
> 
> The setting also affects all outputs (exluding venc), which may not be
> what the user wants. Then again, I think this setting is really only
> needed on OMAP2 & 3, which have only a single output. But that's the
> same with the current kconfig option, of course.
> 
> So, the current CONFIG_OMAP2_DSS_MIN_FCK_PER_PCK is an ugly hack, in my
> opinion, and moving it to DT makes it a worse hack =). But I don't have
> any good suggestions either.
> 


Module param?

Andrew


>  Tomi
> 
