Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D18E644BCE0
	for <lists+linux-omap@lfdr.de>; Wed, 10 Nov 2021 09:29:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229781AbhKJIcn (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 10 Nov 2021 03:32:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229653AbhKJIcn (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 10 Nov 2021 03:32:43 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1DAAC061764
        for <linux-omap@vger.kernel.org>; Wed, 10 Nov 2021 00:29:55 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id j21so7258952edt.11
        for <linux-omap@vger.kernel.org>; Wed, 10 Nov 2021 00:29:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=zAuPCf4AC6P6hJZiHOvdgu1c3LWI2hypiA/8bzgjfzA=;
        b=XmwcEF3mkce27EDDUYERjkkMUDU78nkG64kcDI/ZVafscF2x66osPbaKN2zicmX/sg
         sXOalBsUAxoEb6BLKTrmoGZ2cBNTcaI8up7YTYks8D7UC8ob2HFOt6zxQDPkCtcb+02V
         eRZ5p0BYe3ztL/TV0q2sy5PHsS+08GU6s9Z1J5DGzj8nFeWY1EjLdJFL/lZgmb8OwTRE
         qYJM6U1cNkz7a7GOeq4eLiWgylxu2GMVNZI3KFRRtPZ7mpf5J07rqGiBIKS6qJRUYXAl
         Tkxg9ScSXsS7y0gzJiOAoRpgwb4n/biVM7skfsfFv5lpDrPubQwYKQ0ap066nclBqrGG
         ICxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zAuPCf4AC6P6hJZiHOvdgu1c3LWI2hypiA/8bzgjfzA=;
        b=HbgOMyUvdtzSoMIRw3Uwa7pdGMqvXMpnASdJcDQvPWpuyRabD5bRLcgoonFtv0Q6Qv
         UVccHi6NP2SAcdTxi3kuhdd/lnbu592kYwI9hFELrFfgHxBvRdmVrHw+B6ddGQTouUad
         XJI97wCr8CXjgAjhaPXisG334mWxjqAfalsjlRKgbKdcShNqNNV/6Zin64j3h6k/ug2y
         rB52d2tczOTw9KoNgJreJEavUt6h8/6B2fga5jpkrDpWuBTUmV4iTro+2g7Qzrc0/ksL
         M41fco+WGL68p/fY2AI+JsgMWgrVpGr5EfZrqFnHwjYKDh93BVeUlLSf3z5MUOpe5tmU
         gxkA==
X-Gm-Message-State: AOAM532N/pZfGC7AAkgUNLfzGQhQ1Xc7RO5ChAH6w+50fpxuawSuZ8kn
        KJ1nVal3DjYmqqP4hMjHGXsXXUPOZuU=
X-Google-Smtp-Source: ABdhPJwwmW9yqP9pfNK2OxG/tkL84GelWOo0V690g6lhTi2C+cLdjG+c+wmD1yjXKCrDohCKQRSh1g==
X-Received: by 2002:a17:906:3d32:: with SMTP id l18mr18645192ejf.393.1636532994437;
        Wed, 10 Nov 2021 00:29:54 -0800 (PST)
Received: from [192.168.1.10] ([46.249.74.23])
        by smtp.googlemail.com with ESMTPSA id gs17sm5923662ejc.28.2021.11.10.00.29.53
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 10 Nov 2021 00:29:54 -0800 (PST)
Subject: Re: omapdrm VRFB rotation
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tony Lindgren <tony@atomide.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
References: <92fd80eb-6591-fb45-8885-309c79c2d4c0@gmail.com>
 <689ba705-c7fc-428c-3288-0c4adb3cc63f@gmail.com>
 <40c102c3-207b-e8ae-f292-aeff6b1515ce@ideasonboard.com>
From:   Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Message-ID: <7a25d8c7-7d39-f102-36ff-35cf594de9ce@gmail.com>
Date:   Wed, 10 Nov 2021 10:29:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Firefox/60.0 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <40c102c3-207b-e8ae-f292-aeff6b1515ce@ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

On 9.11.21 г. 11:22 ч., Tomi Valkeinen wrote:
> Hi,
> 
> On 08/11/2021 19:43, Ivaylo Dimitrov wrote:
>> Sorry, mail was sent to the old Tomi's address.
>>
>> On 8.11.21 г. 19:05 ч., Ivaylo Dimitrov wrote:
>>> Hi,
>>>
>>> Currently omapdrm supports TILER rotation only, which excludes omap3 
>>> and earlier SoCs. I have the hardware (N900/N950), time and will to 
>>> implement VRFB rotation support in omapdrm driver, however, I'll 
>>> appreciate some hints. Or, if there is already something ready, 
>>> please point me to it so I can take it from where it is.
>>>
>>> Besides partially reverting 517a8a9564c0dea98e6d4e2c7f0fe4cbb9b8c9ba 
>>> and copying VRFB code from omapfb, is there anything else I shall 
>>> take in consideration? Or, VRFB driver should not be a part of 
>>> omapdrm, but a standalone one?
> 
> We already have DMM driver in the omapdrm module, and I think VRFB fits 
> along just fine. I don't think there ever has been any other users for 
> VRFB than DSS, and as it's such an old IP, I don't think there ever will.
> 

Ok, I guess if a need appears, it can always be moved out of omapdrm. 
The same applies to DMM/TILER code I guess.

> I don't have any particular hints in mind.
> 
> Do you have omap4/5 so you can test that DMM still works after your 
> changes?
> 

Yes, I have motorola droid4 (4430/sgx540) to test with. Which brings 
another issue on the table - I was not able to find a way to allocate a 
TILER dma_buf. The only way seems to be by using omap_bo_xxx functions, 
which is a 'vendor' API. Do I miss something or omapdrm is lacks 
functionality? Also, is there any particular reason why TILER is not 
enabled by default for dma_buf BOs? Is it a limited resource (like, 
there is a finite number of BOs that can use TILER) or there is some 
other reason. Also, is it possible to 'migrate' non-TILER BO to a TILER 
one? The same issue will arise with VRFB (with its 12 contexts on omap3) 
as well.

So, in short:
- omap3: VRFB driver to be added to omapdrm.
- omap3/omap4/omap5: dma_buf lacks TILER/VRFB support

Adding VRFB should be trivial, but I am more concerned about how to 
rotate dma_buf buffers. I imagine something like - on setting the plane 
"rotate" property, migrate physical address from 'normal' CMA memory to 
a TILER/VRFB one. Is that possible? What if we already have that bo 
mmap-ed? What if SGX MMU is already set up to access the memory? Or, is 
it possible to use TILER for read access, the same way VRFB can be 
set-up, so instead of writing through TILER/VRFB, DSS to be set-up to 
read FB memory through TILER/VRFB thus avoiding the need to migrate SG 
and/or page tables?

Thanks and regards,
Ivo
