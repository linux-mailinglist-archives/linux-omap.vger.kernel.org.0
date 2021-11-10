Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5CB044BE10
	for <lists+linux-omap@lfdr.de>; Wed, 10 Nov 2021 10:50:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230419AbhKJJx1 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 10 Nov 2021 04:53:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229653AbhKJJx0 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 10 Nov 2021 04:53:26 -0500
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81B9DC061764
        for <linux-omap@vger.kernel.org>; Wed, 10 Nov 2021 01:50:39 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id m14so8409286edd.0
        for <linux-omap@vger.kernel.org>; Wed, 10 Nov 2021 01:50:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=VZaZz3Aeqpu2chpMjvULcYMLsoVJlCoCfdik60QK9po=;
        b=FqytibrECGTL7r6lxdjuxJB5R53t648Ck2lPZqblVnfkim4W5vigYElTPDJwB1g/JU
         vmyKcQk9zXWRA11OWswcxa5TKq1cNeg/cajEWS7u4KixofFgh6xdJLGiSBMQCEjmkLPl
         5mI3omwmdzVsuFeOWP07KaNzVKm2A/MFWAb6fYJfcNQ7iJB/Edz5b5CAuz+n4jZNmfgF
         wsU+v/nCYhfPL3OJpq0akseKfatlGYGvDOg1DXZxcwBv3/zAWDOOxJe9yIoE+9U/CNsY
         8xSCQFLz/C87pgRXKlC/DiwzwcWcUSZ6cEV7Xcc3GN3+pC2fraBEsu7JXmveULLGL0kl
         JsnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=VZaZz3Aeqpu2chpMjvULcYMLsoVJlCoCfdik60QK9po=;
        b=HwcmpBn9HYLC8u9HP2OI9Bq1ZjUjBn9qAM3e6PSZ3sSX/hND1Wxaf74NTAohX/Hekp
         3GEdVu8o8UzGAPl/YGCviiCaVwaB11i/CQxI3broV6vniOeWLVnebH+T7ZIw+AIbAAlz
         7USbWp5Uk73GlU4YoTXLcVzuxmZcOyOZEyuZYlGPNxFFN7pTkqit+WIZh26O7Si2i0zg
         QssjJACQOOtDUD3LHRhBi7oH1MGCHfjx/nMNufqWRLF4p+8SRQ+SbBmZNp8N+07PLlZ6
         KKiBTokXKY7DapOPxp53gMO6lFsezF8FnVn5me/cafVbfL361sUcWWBtz44IHPNillub
         V3TQ==
X-Gm-Message-State: AOAM530L4fcIB6fAOcFATpi0lvuBFq3MHZsxOUkyAU87eZTweLg25iDe
        ek3tuVjG6JZecVQW9ZZANiBIDWMWxtw=
X-Google-Smtp-Source: ABdhPJyIdfg+nir9eevqGmfFqNLfL+SMA0POgqW4wH8jte2NwmU/l4gI93FViCStaENJyFjR4+/KIw==
X-Received: by 2002:aa7:d8d5:: with SMTP id k21mr19724344eds.209.1636537837897;
        Wed, 10 Nov 2021 01:50:37 -0800 (PST)
Received: from [192.168.1.10] ([46.249.74.23])
        by smtp.googlemail.com with ESMTPSA id mc3sm7804793ejb.24.2021.11.10.01.50.36
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 10 Nov 2021 01:50:37 -0800 (PST)
Subject: Re: omapdrm VRFB rotation
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tony Lindgren <tony@atomide.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
        Carl Philipp Klemm <philipp@uvos.xyz>
References: <92fd80eb-6591-fb45-8885-309c79c2d4c0@gmail.com>
 <689ba705-c7fc-428c-3288-0c4adb3cc63f@gmail.com>
 <40c102c3-207b-e8ae-f292-aeff6b1515ce@ideasonboard.com>
 <7a25d8c7-7d39-f102-36ff-35cf594de9ce@gmail.com>
 <1cc9bb77-6a73-829e-1478-6c828f10564d@ideasonboard.com>
From:   Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Message-ID: <08107fc8-240d-90d7-524d-792fe325de80@gmail.com>
Date:   Wed, 10 Nov 2021 11:50:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Firefox/60.0 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1cc9bb77-6a73-829e-1478-6c828f10564d@ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 10.11.21 г. 11:01 ч., Tomi Valkeinen wrote:
> On 10/11/2021 10:29, Ivaylo Dimitrov wrote:
>> Hi,
>>
>> On 9.11.21 г. 11:22 ч., Tomi Valkeinen wrote:
>>> Hi,
>>>
>>> On 08/11/2021 19:43, Ivaylo Dimitrov wrote:
>>>> Sorry, mail was sent to the old Tomi's address.
>>>>
>>>> On 8.11.21 г. 19:05 ч., Ivaylo Dimitrov wrote:
>>>>> Hi,
>>>>>
>>>>> Currently omapdrm supports TILER rotation only, which excludes 
>>>>> omap3 and earlier SoCs. I have the hardware (N900/N950), time and 
>>>>> will to implement VRFB rotation support in omapdrm driver, however, 
>>>>> I'll appreciate some hints. Or, if there is already something 
>>>>> ready, please point me to it so I can take it from where it is.
>>>>>
>>>>> Besides partially reverting 
>>>>> 517a8a9564c0dea98e6d4e2c7f0fe4cbb9b8c9ba and copying VRFB code from 
>>>>> omapfb, is there anything else I shall take in consideration? Or, 
>>>>> VRFB driver should not be a part of omapdrm, but a standalone one?
>>>
>>> We already have DMM driver in the omapdrm module, and I think VRFB 
>>> fits along just fine. I don't think there ever has been any other 
>>> users for VRFB than DSS, and as it's such an old IP, I don't think 
>>> there ever will.
>>>
>>
>> Ok, I guess if a need appears, it can always be moved out of omapdrm. 
>> The same applies to DMM/TILER code I guess.
> 
> Yes.
> 
>>> I don't have any particular hints in mind.
>>>
>>> Do you have omap4/5 so you can test that DMM still works after your 
>>> changes?
>>>
> 
> So, first, a few clarifications about DMM/TILER. There are two somewhat 
> separate things. I'm not sure what are the exactly correct words for 
> these, but these are the terms I've used:
> 
> - DMM (sometimes called wrongly TILER 1D), which acts as a basic iommu. 
> It doesn't do rotation, just mapping scattered pages to a contiguous 
> memory view.
> 
> - TILER (or TILER 2D) which on top of the above, adds support for rotation.
> 

Thanks for the clarification, I'll try to stick to those.

>> Yes, I have motorola droid4 (4430/sgx540) to test with. Which brings 
>> another issue on the table - I was not able to find a way to allocate 
>> a TILER dma_buf. The only way seems to be by using omap_bo_xxx 
>> functions, which is a 'vendor' API. Do I miss something or omapdrm is 
>> lacks 
> 
> Yes, omap_bo_xxx is omap specific API. But I don't understand your 
> question about omapdrm. omap_bo functions use omapdrm's API. The 
> userspace can skip libdrm and just call the ioctls directly if they so 
> want.
> 

omap_bo functions/ioctls do, but if we try to use GBM dma_buf API 
(gbm_bo_create() and friends), we cannot allocate anything but CMA 
memory which omapdrm refuses to rotate, IIUC. Well at least I was not 
able to  make framebuffer rotate with GBM allocated BO.

The terms I use:
dma_buf - BO that is allocated using GBM API and seems to end up here: 
https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/omapdrm/omap_gem.c#L1300. 
Seems it cannot go through the TILER.

omap_bo: BO that is allocated using omap_bo functions. IIUC this is 
basically a dumb buffer, but it can be allocated to be accesses through 
TILER by passing the appropriate flags to omap_bo_new().

>> functionality? Also, is there any particular reason why TILER is not 
>> enabled by default for dma_buf BOs? Is it a limited resource (like, 
>> there is a finite number of BOs that can use TILER) or there is some 
> 
> Yes, TILER is a limited resource, there's a maximum size for the 
> currently mapped memory. Going through TILER is also slower, and while 
> for 0 degree rotation the diff probably isn't much, it's still there.
> 

Yeah, so we should go through TILER only when needed. The same as VRFB.

> Also TILER is not really quite supported, as I never got it working with 
> all the YUV modes, and also because there's a HW issue, which may cause 
> the device to lock up in some rare cases. And last, TILER creates such a 
> memory layout that it's not possible to share it safely with dmabuf, as 
> dmabuf lacks the features to properly describe the layout.
> 
> All that said, I think TILER should mostly work in upstream.
> 

But, only from omap_bo BOs

> However, DMM is supported, and used by default. If you allocate a dumb 
> buffer, it uses DMM by default.
> 

not for dma_buf BOs though. Not really an issue as on omap3 there is no 
DMM so we must use CMA either ways.

>> other reason. Also, is it possible to 'migrate' non-TILER BO to a 
>> TILER one? The same issue will arise with VRFB (with its 12 contexts 
>> on omap3) as well.
> 
> No, not possible to migrate.
> 
>> So, in short:
>> - omap3: VRFB driver to be added to omapdrm.
>> - omap3/omap4/omap5: dma_buf lacks TILER/VRFB support
> 
> Can you elaborate on what's missing?
> 

GBM BOs (which I call dma_buf BOs) lack TILER support

>> Adding VRFB should be trivial, but I am more concerned about how to 
>> rotate dma_buf buffers. I imagine something like - on setting the 
>> plane "rotate" property, migrate physical address from 'normal' CMA 
>> memory to a TILER/VRFB one. Is that possible? What if we already have 
>> that bo mmap-ed? What if SGX MMU is already set up to access the 
>> memory? Or, is it possible to use TILER for read access, the same way 
>> VRFB can be set-up, so instead of writing through TILER/VRFB, DSS to 
>> be set-up to read FB memory through TILER/VRFB thus avoiding the need 
>> to migrate SG and/or page tables?
> 
> I have to say I don't quite remember how VRFB works.

it has 12 'contexts' that can represent up to that number of 'images' in 
memory with rotated views

> But for TILER, we 
> have to specifically allocate a TILER buffer. And then everyone else 
> uses TILER 0 degree view, but DSS can use 0/90/180/270 view when showing 
> it on the display.
> 

oh, so in theory omapdrm should be able to show dma_buf BOs rotated? We 
only lack a way to allocate TILER GBM BO, right?

I ported xf86-video-omap to use GBM API instead of omap_bo API and it 
works fine in native orientation. However, when it tries to set 
'rotated' property to framebuffer, it receives an error. Should I trace 
to see why it fails in the kernel or this is not supported?

> But I think the case is the same for VRFB too: if you want to use VRFB, 
> all access has to go through VRFB, as the pixels are written to memory 
> in a special way.
> 

Yes, I think you are right.

Sorry for asking so much questions but I want to have a clear picture on 
what is supposed to work and what is missing.

Thanks,
Ivo
