Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C4FC2768A4
	for <lists+linux-omap@lfdr.de>; Thu, 24 Sep 2020 08:05:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726811AbgIXGFC (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 24 Sep 2020 02:05:02 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:36992 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726683AbgIXGFC (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 24 Sep 2020 02:05:02 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08O64wV0127705;
        Thu, 24 Sep 2020 01:04:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1600927498;
        bh=BnyYIWykUxWihb4Hoa81NFhMki+jtaD7P7WXej+bp/8=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=i4I5Ur0AO7PirRAOY5n5V7dpZ5+2nuqnmpdKsabciquPXdz45IfN8BdeK7Y+TPyU9
         21nJhpPoV5GA0p5DDEIhAnhA6IpRwvXtYXjg3m3G5qX7CJlfQZfjZ1o2LkXkw5cgyp
         krFlhPs1XMICLeXXVM42+qQJEThqXt1Nf+FaOG20=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08O64v5F012226
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 24 Sep 2020 01:04:57 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 24
 Sep 2020 01:04:57 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 24 Sep 2020 01:04:57 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08O64ulZ051014;
        Thu, 24 Sep 2020 01:04:56 -0500
Subject: Re: Slow booting on x15
To:     Tony Lindgren <tony@atomide.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     Linux-OMAP <linux-omap@vger.kernel.org>
References: <ea02f57e-871d-cd16-4418-c1da4bbc4696@ti.com>
 <20200918155844.GH28436@pendragon.ideasonboard.com>
 <20200923070758.GT7101@atomide.com>
 <20200923111346.GA3980@pendragon.ideasonboard.com>
 <20200924054220.GA9471@atomide.com> <20200924055313.GC9471@atomide.com>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <fe0a4fa8-53fc-d316-261f-52f631f12469@ti.com>
Date:   Thu, 24 Sep 2020 09:04:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200924055313.GC9471@atomide.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 24/09/2020 08:53, Tony Lindgren wrote:
>>>>> On Fri, Sep 18, 2020 at 06:25:02PM +0300, Tomi Valkeinen wrote:
>>>>>> v5.9-rc5
>>>>>> [    0.706165] cpuidle: using governor menu
>>>>>> [    6.761812] No ATAGs?
>>>>>>
>>>>>> [   19.522536] Run /sbin/init as init process
> 
> Hmm v5.9-rc1 here with NFSroot shows this for me:
> 
> [   11.704511] Run /sbin/init as init process
> 
> And v5.9-rc6 shows:
> 
> [   13.120913] Run /sbin/init as init process
> 
> With at least two seconds spent on waiting for Ethernet PHY to
> negotiate the speed. This is with omap2plus_defconfig.

I'm also using nfsroot, so I didn't put too much weight on the "Run /sbin/init as init process"
line, as it could also be caused the network or the nfs server. But the "No ATAGs" lines already
show an increase from 0.8s to 6.7s from v5.7 to v5.9-rc5.

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
