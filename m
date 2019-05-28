Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4DFBA2C52F
	for <lists+linux-omap@lfdr.de>; Tue, 28 May 2019 13:12:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726400AbfE1LMG (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 28 May 2019 07:12:06 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:53486 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726313AbfE1LMG (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 28 May 2019 07:12:06 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4SBBrF8071878;
        Tue, 28 May 2019 06:11:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1559041913;
        bh=XbgikyC9otiR4YuTt/uxocCuXVecKc1fGa0PD78NL7o=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=VPQcS2VMgEKOda7JpQv+0emh77HzV9Whuj3flfgsA+DAQrZa01jON9U3tCmf2khOg
         fuw5K1DoHnhNWdOzur4PZNOJX0q0cdLT/bK5zsw6KnctJ5aFcCtwqMPk6Qb1AC39zI
         lI9LCTS6Hi/6C3uZNTUIZsvumuuOlaTDghM/tqgQ=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4SBBr2P112080
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 28 May 2019 06:11:53 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 28
 May 2019 06:11:52 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 28 May 2019 06:11:52 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4SBBoLo088964;
        Tue, 28 May 2019 06:11:50 -0500
Subject: Re: [PATCH] drm/omap: Migrate minimum FCK/PCK ratio from Kconfig to
 dts
To:     Adam Ford <aford173@gmail.com>, <linux-omap@vger.kernel.org>
CC:     <adam.ford@logicpd.com>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20190510194229.20628-1-aford173@gmail.com>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <af325707-3e42-493d-e858-77878ef06138@ti.com>
Date:   Tue, 28 May 2019 14:11:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190510194229.20628-1-aford173@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

On 10/05/2019 22:42, Adam Ford wrote:
> Currently the source code is compiled using hard-coded values
> from CONFIG_OMAP2_DSS_MIN_FCK_PER_PCK.  This patch allows this
> clock divider value to be moved to the device tree and be changed
> without having to recompile the kernel.
> 
> Signed-off-by: Adam Ford <aford173@gmail.com>

I understand why you want to do this, but I'm not sure it's a good idea. 
It's really something the driver should figure out, and if we add it to 
the DT, it effectively becomes an ABI.

That said... I'm not sure how good of a job the driver could ever do, as 
it can't know the future scaling needs of the userspace at the time it 
is configuring the clock. And so, I'm not nacking this patch, but I 
don't feel very good about this patch...

The setting also affects all outputs (exluding venc), which may not be 
what the user wants. Then again, I think this setting is really only 
needed on OMAP2 & 3, which have only a single output. But that's the 
same with the current kconfig option, of course.

So, the current CONFIG_OMAP2_DSS_MIN_FCK_PER_PCK is an ugly hack, in my 
opinion, and moving it to DT makes it a worse hack =). But I don't have 
any good suggestions either.

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
