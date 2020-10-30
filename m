Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE4892A0187
	for <lists+linux-omap@lfdr.de>; Fri, 30 Oct 2020 10:36:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726028AbgJ3Jgj (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 30 Oct 2020 05:36:39 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:42486 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725808AbgJ3Jgj (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 30 Oct 2020 05:36:39 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09U9aNtH011493;
        Fri, 30 Oct 2020 04:36:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1604050583;
        bh=plbRCPunQhuoqC8RieptDvFiVzdwprZYDvYCIEZB/dg=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=lPUGuKiO0JhRuZYhGTyRHyexUQc0c3hnjUXZ9lMQTItomQQDUD5SX3zJLnc77O0GA
         KDn9sGTIznuVpKzpO6Vb2aPih1dmPk9Am+c06QGmztv4GFt4CTBuF19/ZHQd0gfqUH
         ZxUgdK12jHfp5i/qJ/fZLb+mh6RQyNxrU2USY8aQ=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09U9aNER122177
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 30 Oct 2020 04:36:23 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 30
 Oct 2020 04:36:23 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 30 Oct 2020 04:36:23 -0500
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09U9aIv8019998;
        Fri, 30 Oct 2020 04:36:19 -0500
Subject: Re: [PATCH] ARM: multi_v7_defconfig: ti: Enable networking options
 for nfs boot
To:     Arnd Bergmann <arnd@kernel.org>
CC:     Nishanth Menon <nm@ti.com>, Tony Lindgren <tony@atomide.com>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        linux-omap <linux-omap@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Sekhar Nori <nsekhar@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Russell King <linux@armlinux.org.uk>
References: <20201001202725.16034-1-grygorii.strashko@ti.com>
 <20201002125000.5b5kho4e5de7jjrj@akan>
 <bb6e0bd9-a8fe-f63b-14fd-92a1f8cea0bb@ti.com>
 <CAK8P3a1-CCcKmEkdw+NNr4Yo7z+BEzX0g7uU_SnXOB+VEZm8HA@mail.gmail.com>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <497f744e-68be-7a87-6a18-824249ddcac8@ti.com>
Date:   Fri, 30 Oct 2020 11:36:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a1-CCcKmEkdw+NNr4Yo7z+BEzX0g7uU_SnXOB+VEZm8HA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Arnd,

On 29/10/2020 22:06, Arnd Bergmann wrote:
> On Thu, Oct 29, 2020 at 8:15 PM Grygorii Strashko
> <grygorii.strashko@ti.com> wrote:
>> On 02/10/2020 15:50, Nishanth Menon wrote:
>>> On 23:27-20201001, Grygorii Strashko wrote:
>>>> Enable networking options required for NFS boot on TI platforms, which is
>>>> widely for automated test systems.
>>>> - enable new TI CPSW switch driver and related NET_SWITCHDEV config
>>>> - enable TI DP83867 phy
>>>> - explicitly enable PTP clock support to ensure dependent networking
>>>> drivers will stay built-in
>>>>
>>>> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
>>>> ---
>>>>    arch/arm/configs/multi_v7_defconfig | 5 +++++
>>>>    1 file changed, 5 insertions(+)
>>>>
>>>
>>> [...]
>>>
>>> Reviewed-by: Nishanth Menon <nm@ti.com>
>>>
>>
>> Are there any actions need to be done to have this patch merged?
> 
> I would prefer if a platform maintainer (I assume Tony in this case)
> picks it up and forwards it to soc@kernel.org together with other
> related changes. Olof and I tend to ignore patches sent directly
> to us, so we don't get in the way of platform maintainers that
> may have already merged similar patches or have comments.
> 
> I suspect Tony didn't pick it up either because from the patch
> subject and the description, it is not clear that he is the one
> to act on it. It helps to be more specific and ask the maintainer
> by addressing them in person below the '---' line, as well as
> only putting one person in 'To:' and the rest in 'Cc:'.

Thanks for your comments and sorry that I disturbed you.

But, honestly, I'm confused (and probably I'm not the first one) as multi_v7 is common
for all ARM platforms while change is TI OMAP specific,
and neither Documentation neither get_maintainer.pl provide any reliable information
on how to proceed :( and who should be responsible for merging multi_x patches.

I'd really have tried to do some checking while preparing patch and TO/CC list - some patches applied by
platform maintainers, but some by top ARM maintainers.

> 
> One comment on the contents of the patch: IIRC this is a fairly
> large driver. To ensure we don't burden other users too much,
> can you include the size of the vmlinux file before and after
> this patch?

before:
    text	   data	    bss	    dec	    hex	filename
14703736	8024602	 444976	23173314	16198c2	./omap-arm/vmlinux

after:
    text	   data	    bss	    dec	    hex	filename
14727271	8029150	 444528	23200949	16204b5	./omap-arm/vmlinux

diff: 27635 (dec)

-- 
Best regards,
grygorii
