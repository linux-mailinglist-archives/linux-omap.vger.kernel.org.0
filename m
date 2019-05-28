Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 295C02CAB8
	for <lists+linux-omap@lfdr.de>; Tue, 28 May 2019 17:53:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726512AbfE1Pxd (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 28 May 2019 11:53:33 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:47812 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726313AbfE1Pxd (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 28 May 2019 11:53:33 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4SFrG9C033264;
        Tue, 28 May 2019 10:53:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1559058796;
        bh=dbyhM/5u8MgwcqC/5H5+1C0pbVLxubC8LxcCgplQU3s=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=BkLP17KBtfHl8j4s3xLOfNc7vfI0pyEY0m3ajgyj69SgO5Um3JejD0pWLW+66wr4T
         /u0Soykj5nSiQ1xxpCJsdQ93psmexkmIndoATW1CDbHV5O/d38F8L1w4C/hcn/eam3
         w7uzCOUGgpMC9L0e3fVLsXE6sQFDYHt3lwv4MASA=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4SFrGK2128483
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 28 May 2019 10:53:16 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 28
 May 2019 10:53:14 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 28 May 2019 10:53:14 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4SFrBCb060219;
        Tue, 28 May 2019 10:53:12 -0500
Subject: Re: [PATCH] drm/omap: Migrate minimum FCK/PCK ratio from Kconfig to
 dts
To:     Adam Ford <aford173@gmail.com>
CC:     Linux-OMAP <linux-omap@vger.kernel.org>,
        Adam Ford <adam.ford@logicpd.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        <dri-devel@lists.freedesktop.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20190510194229.20628-1-aford173@gmail.com>
 <af325707-3e42-493d-e858-77878ef06138@ti.com>
 <CAHCN7xLzoCNW6q5yDCsqMHeNvdNegkGhd0N+q9+Gd8JUGbG=_g@mail.gmail.com>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <7ada0752-6f65-2906-cb29-a47c9490fd57@ti.com>
Date:   Tue, 28 May 2019 18:53:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAHCN7xLzoCNW6q5yDCsqMHeNvdNegkGhd0N+q9+Gd8JUGbG=_g@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

On 28/05/2019 18:09, Adam Ford wrote:
> On Tue, May 28, 2019 at 4:11 AM Tomi Valkeinen <tomi.valkeinen@ti.com> wrote:
>>
>> Hi,
>>
>> On 10/05/2019 22:42, Adam Ford wrote:
>>> Currently the source code is compiled using hard-coded values
>>> from CONFIG_OMAP2_DSS_MIN_FCK_PER_PCK.  This patch allows this
>>> clock divider value to be moved to the device tree and be changed
>>> without having to recompile the kernel.
>>>
>>> Signed-off-by: Adam Ford <aford173@gmail.com>
>>
>> I understand why you want to do this, but I'm not sure it's a good idea.
>> It's really something the driver should figure out, and if we add it to
>> the DT, it effectively becomes an ABI.
>>
>> That said... I'm not sure how good of a job the driver could ever do, as
>> it can't know the future scaling needs of the userspace at the time it
>> is configuring the clock. And so, I'm not nacking this patch, but I
>> don't feel very good about this patch...
>>
>> The setting also affects all outputs (exluding venc), which may not be
>> what the user wants. Then again, I think this setting is really only
>> needed on OMAP2 & 3, which have only a single output. But that's the
>> same with the current kconfig option, of course.
>>
>> So, the current CONFIG_OMAP2_DSS_MIN_FCK_PER_PCK is an ugly hack, in my
>> opinion, and moving it to DT makes it a worse hack =). But I don't have
>> any good suggestions either.
> 
> As it stands the Logic PD OMAP35 and AM37/DM37 boards (SOM-LV and
> Torpedo) require this to be hard coded to 4 or it hangs during start.
> This is the case for all versions 4.2+.  I haven't tested it with
> older stuff.  Tony has a DM3730 Torpedo kit and reported the hanging
> issue to me. I told him to set that value to 4 to make it not hang.
> He asked that I move it to the DT to avoid custom kernels.  I agree
> it's a hack, but if it's create a customized defconfig file for 4
> boards or modify the device tree, it seems like the device tree
> approach is less intrusive.

Ok, well, I think that's a separate thing from its intended use. The 
point of the kconfig option is to ensure that the fclk/pclk ratio stays 
under a certain number to allow enough scaling range. It should never 
affect a basic non-scaling use case, unless you set it to a too high 
value, which prevents finding any pclk.

Has anyone debugged why the hang is happening?

If we can't fix the bug itself, rather than adding a DT option, we could 
change add a min_fck_per_pck field (as you do), keep the kconfig option, 
and set the min_fck_per_pck based on the kconfig option, _or_ in case of 
those affected SoCs, set the min_fck_per_pck even without the kconfig 
option.

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
