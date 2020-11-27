Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8D0A2C6676
	for <lists+linux-omap@lfdr.de>; Fri, 27 Nov 2020 14:13:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729971AbgK0NMW (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 27 Nov 2020 08:12:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729746AbgK0NMW (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 27 Nov 2020 08:12:22 -0500
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9660C0613D1;
        Fri, 27 Nov 2020 05:12:21 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id p22so5090228wmg.3;
        Fri, 27 Nov 2020 05:12:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=rrtkGYOSLzR+T0+VO0vIc/zBIcxRJN0r5JpmICMLphw=;
        b=FDsHUe7i/4e/jxh4782Dqv7sPxbspu00OSmK6tMXL1Sbl75HzuN0tjbxrjgQgvR24d
         N5BM9sOCEPWDChEIo4Kh3XOJGjF4JnYJXxUnDWY5N0KzAcBEP5r8mjM7VIvi1pTegCOy
         sOomVz2H2G5N5ABfpL8uCPdEtaNAQUCUOm4FUYslZmuaGvRSEY42I/rV+qK/iJRKa/57
         eWZDP+jCbTOkKhAAdGfmiQD1ILH3lW1tomcO7hFJgNw+0Z/4rJeCRBL44jdKD04Z4Zq7
         uK8dEfFD3tCkh3pEp6eOHXOJX6CkA9a9U820cTrDnb6j1laoWyL0vzI1KnELEFzvYqbt
         9ZJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rrtkGYOSLzR+T0+VO0vIc/zBIcxRJN0r5JpmICMLphw=;
        b=ZTy0C3vJ+hoIBPnVL6Rh9t6JgQJaJVXFNOzBD9uZeBIQspSrd3YE/SEzBAl8yn4ODK
         2tcZhXMaRPPpR6SGMvYwOe66czff9A0fwxFtXvyH/bZIPaSjttdbDngnNMmYP3pIR0sf
         dM7zBmpf3QcfWrAZt9nqW2heC6QN0961dhpeabDWO0X4OhNnsKVAEwDtwharC7E46RA9
         UeNkW/ZgaOPKfjIefv8dtVL8L354Zai3KGAgZwkuA+r8u3vfMDX3eB4/Ei4s8S74uOIY
         Mfv3xN8Q8L1ogm60SeOefxB92QtuubVy4yEzdeLpfrfcDuUUzQJxDuWWQecTT6qRrOUL
         iBFA==
X-Gm-Message-State: AOAM532LSgJCKptGq0xErZxuXJNS2t2m7KTjV4wATaoiXGPj3UVVUrQ+
        TPmgs3shLXTARo4m5UmFjjPwujgrRBQ=
X-Google-Smtp-Source: ABdhPJxRD3+6sGn7nB3ojyYoRG+XCb50zjvwetcPIQmkvVh7VF+hVxRrOEuUiW5edZkFy+yi9P3u7A==
X-Received: by 2002:a1c:ba56:: with SMTP id k83mr2376844wmf.128.1606482740515;
        Fri, 27 Nov 2020 05:12:20 -0800 (PST)
Received: from [192.168.1.10] ([46.249.74.23])
        by smtp.googlemail.com with ESMTPSA id x4sm14694700wrv.81.2020.11.27.05.12.19
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 27 Nov 2020 05:12:19 -0800 (PST)
Subject: Re: [REGRESSION] omapdrm/N900 display broken
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        ML dri-devel <dri-devel@lists.freedesktop.org>
Cc:     Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200728181412.GA49617@darkstar.musicnaut.iki.fi>
 <660b2fe1-343d-b83e-11d2-5a5eb530b83f@ti.com>
 <448c1441-2cac-44ef-95ef-bb28b512297b@ti.com>
 <20200823162625.GC4313@darkstar.musicnaut.iki.fi>
 <ac42f7f9-2ac2-246e-69c1-3d56cea7e59b@ti.com>
 <5072a25d-e885-cdd2-978d-70942406c272@gmail.com>
 <09044fd2-2926-c7b3-826b-52b742e84ff5@ti.com>
 <79ad8816-815c-14d3-ebe1-3c5007c81dd1@gmail.com>
 <1fe9fed7-f619-eb6a-6e31-b9eadbf09bad@ti.com>
From:   Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Message-ID: <8010e452-745a-ac12-bc02-5537305c70ed@gmail.com>
Date:   Fri, 27 Nov 2020 15:10:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Firefox/60.0 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1fe9fed7-f619-eb6a-6e31-b9eadbf09bad@ti.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 27.11.20 г. 13:45 ч., Tomi Valkeinen wrote:
> On 27/11/2020 01:17, Ivaylo Dimitrov wrote:
>> Hi Tomi,
>>
>> On 26.11.20 г. 16:11 ч., Tomi Valkeinen wrote:
>>> Hi Aaro, Ivaylo,
>>>
>>> On 24/11/2020 23:03, Ivaylo Dimitrov wrote:
>>>
>>>> Is there any progress on the issue? I tried 5.9.1 and still nothing displayed.
>>>
>>> Can you test the attached patch?
>>>
>>
>> With this patch I don't see oops that Aaro reported, so:
>>
>> Tested-by: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
>>
>> Seems to fix the particular issue, however, now we get another oops. As this is not upstream kernel
>> but one with PVR related patches, I will try again with vanilla 5.9.
>>
>> Just in case oops rings any bells (the line in question is
>> https://github.com/maemo-leste/droid4-linux/blob/maemo-5.9/drivers/gpu/drm/omapdrm/omap_gem.c#L801)
> 
> Do the PVR patches touch omapdrm? The call stack looks like normal boot time probing stuff, not
> something happening later (possibly from PVR).
> 

pvr driver is not even enabled in that particular config, however, I see 
"HACK: drm/omap: Add omapdrm plugin API" patch in the tree that touches 
omap-gem.c, I don't really want to just create some noise for problems 
that are created by out-of-tree patches. And yeah, it looks like a 
normal boot time probing stuff. As soon as I have some spare time 
(hopefully later today) I will try vanilla 5.9.x with 
omap2plus_defconfig and will report.

Ivo
