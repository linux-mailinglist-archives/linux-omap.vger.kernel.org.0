Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B11E450654
	for <lists+linux-omap@lfdr.de>; Mon, 15 Nov 2021 15:09:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232079AbhKOOMm (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 15 Nov 2021 09:12:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232220AbhKOOMJ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 15 Nov 2021 09:12:09 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5948BC061767;
        Mon, 15 Nov 2021 06:09:13 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id w1so72647935edd.10;
        Mon, 15 Nov 2021 06:09:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=zld90iZn+a7xROzRHHOcYE11YsX/KuO+rgQqYB755kU=;
        b=hTflx2fg7HljW5nG23FGCW9b1HRaFygjpvSgAOZJ++nWUSYFvrHJ3xVWLkFFW4FH04
         9Ep8zH4wiHkuxMNKrwaQ4rUgQpsjn6RQNEiDHb0yemE742im/iTPOUQYsYT4VveVW/0E
         mREjQzJ2AgNxGCGX5Kr8NqRJwNwZdEfRzQ3c9RxeKjooBQWVUcXadcd5e1FnbPBWDna3
         gy06NQumwMMatltqyTjHXRsPtN5iCGiWlrQFDCEIyatIwXDGH9v9D1Y5MPQ2DYGFxECn
         +bnyg+0Td7Y1Y7g2HArbB6/4kTUZE5KyeENPDRrpjzBSzaNkuEF4KADP5GsPW7yIXHad
         URDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zld90iZn+a7xROzRHHOcYE11YsX/KuO+rgQqYB755kU=;
        b=NQRoK74P2QZhgBC0aUeYyuBMwFZPZJ83EkEgQT4yZO3DEtjtItA1z8ABp975PqazsW
         ii/hB14f92vTX3INtK0BPVMfVURkhVgiQ6Sncni7jCO6W3XqZ+1uZFszm8YYxIItaq2K
         BZvoDdLZTX2aViG/8AmCnK2rXNw0EbXDiwKi0Lukl7lesKwxTobkY7Y09v2Jl+Qcx+cq
         WiqOmdXUNZ4CEc9jIVsnhHyzxp/sCh9l2LaasvSiaLIZ5/gzN3+mgFxUv+4XVcFx+Ew1
         J86QAQ6fGmZeN3w9OalIP0jjByD2i1yV9HdcL3BZmhn97S7H00HtpUd3fH3J3psvYAhe
         6exg==
X-Gm-Message-State: AOAM530v0xMZ9fdVuzxAthP1aa5kqJIt8UvYHLPEBVOKaP04gx+3pUGX
        NgpIcrM9K9V/Gkf1OCogt/UqqGqB1EE=
X-Google-Smtp-Source: ABdhPJy1s50qatzUYOhUFalRX6C6/Tl6pBOxZhD32R4ug9+iwawi3GRD/IN3H1VlZpK0X4fNC/TNEw==
X-Received: by 2002:a17:907:3f96:: with SMTP id hr22mr49732682ejc.492.1636985351647;
        Mon, 15 Nov 2021 06:09:11 -0800 (PST)
Received: from [192.168.1.10] ([46.249.74.23])
        by smtp.googlemail.com with ESMTPSA id sa17sm6771705ejc.123.2021.11.15.06.09.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 15 Nov 2021 06:09:11 -0800 (PST)
Subject: Re: [PATCH v2] drm: omapdrm: Export correct scatterlist for TILER
 backed BOs
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Matthijs van Duin <matthijsvanduin@gmail.com>
Cc:     airlied@linux.ie, daniel@ffwll.ch, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Carl Philipp Klemm <philipp@uvos.xyz>
References: <1636796417-5997-1-git-send-email-ivo.g.dimitrov.75@gmail.com>
 <1636797239-6384-1-git-send-email-ivo.g.dimitrov.75@gmail.com>
 <36598203-eced-131d-85ef-f4940872e751@ideasonboard.com>
 <YZIm/GiRWv0nPN5b@chinchilla>
 <e39cc7c8-6504-f5ae-5693-7eb5b5d00cd1@ideasonboard.com>
From:   Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Message-ID: <b63aa9a4-4687-3473-bef5-363c132c2247@gmail.com>
Date:   Mon, 15 Nov 2021 16:05:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Firefox/60.0 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <e39cc7c8-6504-f5ae-5693-7eb5b5d00cd1@ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


Hi,

On 15.11.21 г. 12:37 ч., Tomi Valkeinen wrote:
> On 15/11/2021 11:23, Matthijs van Duin wrote:
>> On Mon, Nov 15, 2021 at 10:42:41AM +0200, Tomi Valkeinen wrote:
>>> A BO's memory via the TILER memory is
>>> contiguous, although with consistent gaps of
>>> memory that should not be accessed.
>>
>> But pretending that these "gaps" are part of the buffer is a security
>> vulnerability, since that memory which "should not be accessed" may
>> belong to different security contexts, and exporting the entire
>> contiguous region covering the buffer allows untrusted contexts (e.g.
>> userspace) to access this memory.
> 
> Yes, I fully agree. I wasn't criticizing the patch, just wanted to 
> highlight the unmentioned aspects.
> 
>>> IPs that might use TILER
>>> backed BOs only support contiguous memory.
>>>
>>> This means that the drivers for such IPs cannot
>>> use the BOs exported like you do in this patch.
>>> I believe the drivers could be improved by
>>> writing a helper function which studies the
>>> sg_table and concludes that it's actually
>>> contiguous.
>>
>> That indeed sounds like the proper solution for such importers, rather
>> than making the exporter lie about the buffer bounds to work around
>> limitations of these importers.
> 
> The annoying thing with this solution is that we need to add extra code 
> to all the drivers that want to import TILER buffers, even if the 
> drivers shouldn't know anything about TILER.
> 
> Then again, the code is not really TILER or OMAP specific, and any IP on 
> any platform that only supports contiguous buffers, but supports stride, 
> could import such buffers. Which hints that maybe the code should be 
> somewhere in the framework, not in the driver. In practice it may be 
> better to just swallow the annoyance, add the code to the drivers and be 
> done with it =).
> 
>>> Did you look at the userspace mmap of TILER
>>> buffers? I wonder if that goes correctly or not.
>>> Isn't memory to userspace mapped per page, and
>>> lengths of the TILER lines are not page aligned?
>>
>> Mapping to userspace uses an ugly hack whereby small slabs of the
>> buffer (4096x64 (8bpp), 2048x32 (16bpp), or 1024x32 (32bpp) pixels) are
>> dynamically mapped to dedicated page-aligned regions of the TILER
>> virtual space.  For each of the three bitdepths only two such slabs can
>> be mapped into userspace at any given time (on the entire system), so
>> using this mechanism to render graphics from userspace can easily cause
>> hundreds if not thousands of page faults per second.
> 
> Ah, right, yes, now I remember. The userspace mmap of TILER buffers 
> isn't very usable.
> 
>> The alternative (used e.g. in the pyra kernel) is to force all TILER
>> buffers to be page-aligned, at the cost of wasting some TILER space.
>> This will presumably also be necessary to allow SGX to import these
>> buffers since its MMU can obviously also not map data which is not
>> page-aligned, same for any other importer which uses an MMU to enforce
>> memory security (rather than being trusted to simply refrain from
>> accessing data outside the declared bounds).
>>
>> Ideally such page-alignment should only be applied to buffers which are
>> intended to be consumed by importers which require this, though it's not
>> clear how that might be accomplished.
> 
> Do you mean that each TILER _line_ should be page aligned and the length 
> should be page divisible? Doesn't that cause quite a lot of wasted 
> space? Although that, of course, depends on the use. If the primary use 
> case is allocating a few full screen display buffers, perhaps the waste 
> is negligible.
> 

Yes, I think this is the idea, otherwise no MMU can be set correctly.

> In any case, I'm fine with that change, too, as it helps making TILER 
> usable.
> 

That's great, will send a patch ASAP.

> And while speaking about usable, if I recall right, the 
> omap_bo_new_tiled() is pretty annoying to use. You need to give the 
> width and OMAP_BO_TILED_x flag as a parameter, and if I recall right, 
> it's all but obvious how those need to be set for, e.g. NV12. But it 
> works so perhaps better to keep it as it is...
> 

To me the whole omap_bo_xxx stuff should go away and be replaced by 
gbm_bo_xxx stuff. The only issue there is with TILER BOs, but I think 
we'll be able to get away with that with a little abuse of GBM_BO_XXX 
flags (see the other mail)

> There was also some particular YUV format with some rotations that I 
> never got working, even after discussing with TI DSS HW guys.
> 
>   Tomi

Thanks,
Ivo
