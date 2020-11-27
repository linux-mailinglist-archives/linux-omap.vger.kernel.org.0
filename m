Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83B472C68D5
	for <lists+linux-omap@lfdr.de>; Fri, 27 Nov 2020 16:39:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730862AbgK0PjK (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 27 Nov 2020 10:39:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729872AbgK0PjJ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 27 Nov 2020 10:39:09 -0500
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22C83C0613D1;
        Fri, 27 Nov 2020 07:39:09 -0800 (PST)
Received: by mail-wm1-x342.google.com with SMTP id f190so3895544wme.1;
        Fri, 27 Nov 2020 07:39:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=FsnGhbDOsrgIOmzFSfYV4vVHq+3Bz4YqegpXixc4Azw=;
        b=G3b/6fcLZgJUdfZPIy+tu6n5FXd68wlnr1GtXmOX4YwGFUgy16fXD3h7Tx4IUfXl6G
         wCOyB7jCs71psHAgATJyUfSLL9o5f2RD5FBpvo08vBMUmR06luiQuQ4IWnh/XMELwa63
         CuRg6rki++TZk8C6RtnztTZPIAfpV2kn7KgC5jccWZtv/lblugAyRz6mmoTTnSHt9A+z
         BSZKAAtO7K1BJuoGGbuhQSDPJfG866Jy58oyUFRCl7RXfQ8kUfhtJlL8wkuRx1DNdswp
         T2vMVTedZouVhAVBwQ3gLDRunsFYKvVgVX4ExiJkzrYoQYB8UfF5bpMAlxBzx3ECMo3V
         XnFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=FsnGhbDOsrgIOmzFSfYV4vVHq+3Bz4YqegpXixc4Azw=;
        b=Ar+NLuBim5hztAv+t+jETotzmc4y2Z3MjorsQAnp3GSmKMrYEg/uAbwAjvnVP5erLT
         mUkUpDZW4SDUe+0MXXPLjGvfqWTZUgiE1PHynhmH7RT7/llKwLd8TsiookT+GrlxRNn9
         m1t3r8apkApT2hLwGRoYjO/DdEVQfewrPlo4zqYNUk8h0g8QF/feeHJMVDQ/OBxa+QZW
         5tzYOivMGsnPf69a4InXVpT2XubM6F/knfTb6ifT4jchDj0QBhwHqse+W+A92Re9Ep8g
         2qknIuxdJExVcca7peCUSdVz6WVZ4vA3MKb1vzsC/BTHSl40QZxOg2iVOJhRYgQGqvIp
         w2XQ==
X-Gm-Message-State: AOAM533BzfhC6Q3ZDStwWC7mvQgslNdYc9RDG8FVRgIpIHjQRBSppola
        +WMO4TNNdRzARYlgCxhTWxEarL7XRk4=
X-Google-Smtp-Source: ABdhPJw6b18Uhcgp0Lz3ZlNQ6q1kkB25AbegoY+whNhYRovhNlwtJsjZtiW8KFvgiqa/PACEVy95UA==
X-Received: by 2002:a1c:a706:: with SMTP id q6mr9879379wme.2.1606491547631;
        Fri, 27 Nov 2020 07:39:07 -0800 (PST)
Received: from [192.168.1.10] ([46.249.74.23])
        by smtp.googlemail.com with ESMTPSA id w5sm9993017wrm.29.2020.11.27.07.39.06
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 27 Nov 2020 07:39:07 -0800 (PST)
Subject: Re: [REGRESSION] omapdrm/N900 display broken
From:   Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Aaro Koskinen <aaro.koskinen@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        ML dri-devel <dri-devel@lists.freedesktop.org>,
        Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
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
 <8010e452-745a-ac12-bc02-5537305c70ed@gmail.com>
Message-ID: <4948a40d-c887-5617-f5bc-1e0aff824ad7@gmail.com>
Date:   Fri, 27 Nov 2020 17:37:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Firefox/60.0 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <8010e452-745a-ac12-bc02-5537305c70ed@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

On 27.11.20 г. 15:10 ч., Ivaylo Dimitrov wrote:
> 
> 
> On 27.11.20 г. 13:45 ч., Tomi Valkeinen wrote:
>> On 27/11/2020 01:17, Ivaylo Dimitrov wrote:
>>> Hi Tomi,
>>>
>>> On 26.11.20 г. 16:11 ч., Tomi Valkeinen wrote:
>>>> Hi Aaro, Ivaylo,
>>>>
>>>> On 24/11/2020 23:03, Ivaylo Dimitrov wrote:
>>>>
>>>>> Is there any progress on the issue? I tried 5.9.1 and still nothing 
>>>>> displayed.
>>>>
>>>> Can you test the attached patch?
>>>>
>>>
>>> With this patch I don't see oops that Aaro reported, so:
>>>
>>> Tested-by: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
>>>
>>> Seems to fix the particular issue, however, now we get another oops. 
>>> As this is not upstream kernel
>>> but one with PVR related patches, I will try again with vanilla 5.9.
>>>
>>> Just in case oops rings any bells (the line in question is
>>> https://github.com/maemo-leste/droid4-linux/blob/maemo-5.9/drivers/gpu/drm/omapdrm/omap_gem.c#L801) 
>>>
>>
>> Do the PVR patches touch omapdrm? The call stack looks like normal 
>> boot time probing stuff, not
>> something happening later (possibly from PVR).
>>
> 
> pvr driver is not even enabled in that particular config, however, I see 
> "HACK: drm/omap: Add omapdrm plugin API" patch in the tree that touches 
> omap-gem.c, I don't really want to just create some noise for problems 
> that are created by out-of-tree patches. And yeah, it looks like a 
> normal boot time probing stuff. As soon as I have some spare time 
> (hopefully later today) I will try vanilla 5.9.x with 
> omap2plus_defconfig and will report.
> 

With 5.9.11 and the patch on top, n900 boots fine, albeit display 
remains blank, could be related to brightness, we're still investigating.

Thanks and regards,
Ivo
