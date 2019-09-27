Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC640C0695
	for <lists+linux-omap@lfdr.de>; Fri, 27 Sep 2019 15:46:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727128AbfI0NqF (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 27 Sep 2019 09:46:05 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:54898 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726163AbfI0NqF (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 27 Sep 2019 09:46:05 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8RDjrwT020874;
        Fri, 27 Sep 2019 08:45:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1569591953;
        bh=uXxOovK5HPFmiue7bR6DICecQ2YMBpOhKnizA5lTgnc=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=X5/4Ru1T2/NEkh5PUWOWKNO6OlJvckotvr/kBP5ilqN8Gf10qT4Q1UoHytdCOU27F
         CdGE1rLk4LHQ57IxJPrBEhsLmt0Wz45AZljXC2mZYCOb5vKZZYlucadgP8RBzEhNQN
         k8q5jrTxWuN5FqyIEgv39MfdIen0aQTc910lViUw=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8RDjrgc002726;
        Fri, 27 Sep 2019 08:45:53 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 27
 Sep 2019 08:45:44 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 27 Sep 2019 08:45:44 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8RDjnCv008443;
        Fri, 27 Sep 2019 08:45:50 -0500
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
        dri-devel <dri-devel@lists.freedesktop.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20190510194229.20628-1-aford173@gmail.com>
 <af325707-3e42-493d-e858-77878ef06138@ti.com>
 <CAHCN7xLzoCNW6q5yDCsqMHeNvdNegkGhd0N+q9+Gd8JUGbG=_g@mail.gmail.com>
 <7ada0752-6f65-2906-cb29-a47c9490fd57@ti.com>
 <CAHCN7xJexJvh71vyb31ETgo=n_y_CupHH-AZwVK9mZe3GzJfEQ@mail.gmail.com>
 <845055e2-8182-de74-2077-629fdf50ac6c@ti.com>
 <CAHCN7xJFrTLOnbqrnH2W_T2whR8Xji0EMNR_cy8GYkDV-JDodQ@mail.gmail.com>
 <f6012b3a-7b96-6020-d09d-c458fa8742d8@ti.com>
 <CAHCN7x+ysOEXFCE5DXvoPh6sQBdnHRE8t-KJfcijWesJRx9iXg@mail.gmail.com>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <a14fc01a-42b5-b639-f9a6-1739e7e774cd@ti.com>
Date:   Fri, 27 Sep 2019 16:45:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAHCN7x+ysOEXFCE5DXvoPh6sQBdnHRE8t-KJfcijWesJRx9iXg@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 27/09/2019 15:13, Adam Ford wrote:
> On Fri, Sep 27, 2019 at 1:22 AM Tomi Valkeinen <tomi.valkeinen@ti.com> wrote:
>>
>> On 26/09/2019 17:12, Adam Ford wrote:
>>
>>>> And what is the hdmi5_configure there? I don't see anything in the
>>>> driver that would print hdmi5_configure. And, of course, there's no
>>>> hdmi5 on that platform. Hmm, ok... it's from component.c, using "%ps".
>>>> Somehow that goes wrong. Which is a bit alarming, but perhaps a totally
>>>> different issue.
>>>
>>> I'll try to take a look later.  For Logic PD distributions, we create
>>> a custom defconfig with all those drivers removed, so I'm not worked
>>> up about it, but it would be nice to not call drivers that don't
>>> exist.
>>
>> So you have CONFIG_OMAP5_DSS_HDMI=n? Then it's even more disturbing, as
>> there's no way the string "hdmi5_configure" can be in the kernel image...
> 
> For the logs and problems I am showing in this thread, I am using a
> stock omap2plus_defconfig which has it enabled.  I was only trying to
> state that I am not worried about the omap5 hdmi stuff, because when I
> do a custom distribution for Logic PD, I remove those config options
> to make the issue go away.
>>
>> Maybe it's nothing, but... It's just so odd.
> 
> I don't think we need to worry about it now.  Ideally, it would be
> nice to have the drivers recognize they are not needed and or setup
> the Kconfig options to make these drivers dependent on the platforms
> that support it so unselecting OMAP5 could make the omap5 options
> disappear.

My point is that something is bugging there. It should not print 
hdmi5_configure, regardless of setup or platform. If I'm not mistaken, 
it should print "dispc_component_ops". But somehow it gets a wrong 
symbol string.

But yes, I'm 99.9% sure it's not related, so let's ignore it here =).

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
