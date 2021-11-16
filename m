Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA874452CC1
	for <lists+linux-omap@lfdr.de>; Tue, 16 Nov 2021 09:27:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231888AbhKPIay (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 16 Nov 2021 03:30:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232131AbhKPIae (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 16 Nov 2021 03:30:34 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D990C061767;
        Tue, 16 Nov 2021 00:27:37 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id g14so20490426edb.8;
        Tue, 16 Nov 2021 00:27:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=MaEpJezmqRAJS3ZxdAKbRnf97Ov+8PUjqidAfasEhi8=;
        b=NgaHifP5IFLHW9K8v/+0QdNt5ethswurMB2bYAAjoS0CMpB7FM/GpSo0SjZA4WmjM/
         i1oAi+5D5UpqVG8mmjgeK3NdedsGGPs+RB9uDIUXb2A3Xw9GV0nLNFlgnTlcB7o09vKg
         Czdmda/H9rhsuFZRDV11KSdPxQYXkc+eEP+ltPag6Qp90m2UeW6T7ozwP9A3kI3FJbtm
         wSxyrDhmSeqmG5hhOI3o8WceJISgLONF5oGbXKZwtBYEbJXIfyxm0cxRWZXahg33YMIo
         wP8LzJrywu4KcvPPYs8W9hwpn5EpTxz/NwNcD72TB7cI3hbS87I9n0NavymFnuTF/V8s
         kB1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MaEpJezmqRAJS3ZxdAKbRnf97Ov+8PUjqidAfasEhi8=;
        b=iOdMsks1dfsuWKB1WDuRmg8T54VAEYtf+93EWIyp1Qe7cTEFK/KNLp1HsGzXMVbh/3
         FO/G4m8zzgbITEBbqSC+nSUQY9e5S3PhCS4HijwkjF7KM0DyftAiNg9t+bj+of/2qqYd
         VaZJasjN9L2f7kzwjivyAFGkSKkCR9E6DJK3ni580faNYuKog11TfBM3A3UwKslKLjqT
         RWl/A/yy7THjs+IHJe6oLDGtnc5YxZWpaubCvM+okgLCTz/KsFtNab2kjTPv5o6rc9Po
         VEky9FnkDv8y4bJ+/RdQYXZwL7qIoa8XcoiaF7I7PqBTZmu8s46jMkvq6teAth5sBM4u
         ySpQ==
X-Gm-Message-State: AOAM530w/9uxl2+rVy8bacDQzuB92UDxaeIu2ZZnC8kGZM1rcDpoNKug
        OqWr+ycIuY+LgKvdEnUKi/k=
X-Google-Smtp-Source: ABdhPJxHMxWug+CBXE03GvTh81MI6cvxPsX5FAEwiykddBBXzMyis/j/mxm82FDsMoi6VltGjelbzg==
X-Received: by 2002:a05:6402:4248:: with SMTP id g8mr2574181edb.182.1637051255547;
        Tue, 16 Nov 2021 00:27:35 -0800 (PST)
Received: from [192.168.1.10] ([46.249.74.23])
        by smtp.googlemail.com with ESMTPSA id c7sm7897274ejd.91.2021.11.16.00.27.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 16 Nov 2021 00:27:34 -0800 (PST)
Subject: Re: [PATCH v2] drm: omapdrm: Export correct scatterlist for TILER
 backed BOs
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     matthijsvanduin@gmail.com, airlied@linux.ie, daniel@ffwll.ch,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <1636796417-5997-1-git-send-email-ivo.g.dimitrov.75@gmail.com>
 <1636797239-6384-1-git-send-email-ivo.g.dimitrov.75@gmail.com>
 <36598203-eced-131d-85ef-f4940872e751@ideasonboard.com>
 <16a38e8e-071c-7275-8a33-487f7c3c8f2a@gmail.com>
 <ee42102b-c584-6e20-e710-711f79467fa3@ideasonboard.com>
 <e24ba773-298c-c703-9719-abba3527f8dd@gmail.com>
 <16724dbf-ff40-4d18-cde4-b3716583289f@ideasonboard.com>
From:   Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Message-ID: <52829986-ee80-6965-beb3-411f3728e2aa@gmail.com>
Date:   Tue, 16 Nov 2021 10:27:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Firefox/60.0 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <16724dbf-ff40-4d18-cde4-b3716583289f@ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

On 16.11.21 г. 8:42 ч., Tomi Valkeinen wrote:
> On 15/11/2021 19:15, Ivaylo Dimitrov wrote:
>> Hi,
>>
>> On 15.11.21 г. 17:37 ч., Tomi Valkeinen wrote:
>>> On 15/11/2021 15:55, Ivaylo Dimitrov wrote:
>>>> Hi Tomi,
>>>>
>>>> On 15.11.21 г. 10:42 ч., Tomi Valkeinen wrote:
>>>>> Hi,
>>>>>
>>>>> On 13/11/2021 11:53, Ivaylo Dimitrov wrote:
>>>>>> Memory of BOs backed by TILER is not contiguous, but 
>>>>>> omap_gem_map_dma_buf()
>>>>>> exports it like it is. This leads to (possibly) invalid memory 
>>>>>> accesses if
>>>>>> another device imports such a BO.
>>>>>
>>>>> This is one reason why TILER hasn't been officially supported. But 
>>>>> the above is not exactly right, or at least not the whole truth.
>>>>>
>>>>
>>>> Definitely, not only these BOs lie about their memory layout, they 
>>>> lie about size and alignment as well. I have 2 more patches here 
>>>> (one is to align TILER memory on page, as proposed by Matthijs in 
>>>> the other mail, the other to set the correct size when exporting 
>>>> TILER BO), but I wanted to hear from you first, like, what is the 
>>>> general trend :) .
>>>
>>> My thoughts here are that the current code doesn't work in practice, 
>>> so if you get it fixed, it's great =).
>>>
>>>> Also, I have another patch in mind, that will enable exporting of 
>>>> buffers that are not TILER backed, but are not CMA backed either. 
>>>> SGX for example does not need CMA memory to render to.
>>>
>>> What do you mean with this? DSS needs contiguous memory, so the 
>>> memory has to be 1) physically contiguous, 2) mapped with DMM or 3) 
>>> mapped with TILER. There's no reason for the driver to export 
>>> non-contiguous memory.
>>>
>>
>> DSS yes, but, omapdrm is used to allocate non-scanout buffers as well, 
>> which do not need to be (and in practice are not) contiguous. GPU (or 
>> anyone with MMU) can render on them (DRI buffers for example) and 
>> later on those buffers can be copied (blit) to the framebuffer. Yes, 
>> not zero-copy, but if you're doing compositing, there is no option 
>> anyway.
>>
>> Exactly this is done by omap-video driver for example. GBM BOs are 
>> allocated through omapdrm as well.
> 
> That is not correct and shouldn't be done. omapdrm is not a generic 
> memory allocator. We have real generic allocators, so those should be 
> used. Or, if the buffer is only used for a single device, the buffer 
> should be allocated from that device's driver.
> 

Yes, I saw the comment in kernel headers that dumb buffers should not be 
used for rendering 
(https://elixir.bootlin.com/linux/latest/source/include/drm/drm_drv.h#L361). 
This makes no sense to me at all, but maybe I am missing the point.

Also, it could be that the implementation of omap-video and/or PVR 
userspace blobs is against the specs, but I see omap-video calling 
DRM_IOCTL_OMAP_GEM_NEW for DRI buffers without OMAP_BO_SCANOUT and 
libdbm.so calling DRM_IOCTL_MODE_CREATE_DUMB to create buffers then used 
for rendering.

This is not an issue on omap4 an later, because when export of that 
buffer is requested, omapdrm uses DMM and exports a single scatterlist 
entry, IIUC.

But, on omap3, given there is no DMM, export is simply refused. I don't 
see that as a consistent behaviour - we shall either a) export 
non-scanout buffers (scattered ones) using whatever is supported (DMM 
and single scatterlist entry on omap4 (and later), multiple-entry 
scatterlist on omap3) or b) always require OMAP_BO_SCANOUT for BOs to be 
exported and refuse to export if no such flag is set. I would say b) is 
not a good option which leaves a) only.

BTW, I think DMM is not really needed unless userspace requests mmap(), 
in theory we can provide userspace with view through DMM but give device 
drivers multiple entry scatterlist, potentially saving DMM space.

I hope I made it clearer now why I think this feature shall be implemented.

>>>>> A BO's memory via the TILER memory is contiguous, although with 
>>>>> consistent gaps of memory that should not be accessed. 
>>>>
>>>> I think this more or less contradicts to the definition of 
>>>> contiguous, no?  :)
>>>
>>> Depends on the definition ;). The buffers can be handled with DMA 
>>> that only supports contiguous memory, so...
>>>
>>>>> That point is important, as the IPs that might use TILER backed BOs 
>>>>> only support contiguous memory.
>>>>>
>>>>
>>>> Well, every IP with MMU should be capable to use such BOs. SGX has 
>>>> one for sure, IIRC IVA and ISP on omap3 has MMUs too.
>>>
>>> True, we have those. But none of the DRA7 capture IPs have MMU.
>>>
>>>>> This means that the drivers for such IPs cannot use the BOs exported 
>>>>
>>>> Neither they can use them without the patch.
>>>>
>>>>> like you do in this patch. I believe the drivers could be improved 
>>>>> by writing a helper function which studies the sg_table and 
>>>>> concludes that it's actually contiguous. I think we should have at 
>>>>> least one such driver fixed along with this patch so that we can be 
>>>>> more confident that this actually works.
>>>>>
>>>>
>>>> Yes, I we have such driver, but unfortunately it is not upstream 
>>>> (PVR driver that is). Right now I have droid4 in front of me with 
>>>> SGX rendering hildon-desktop in landscape using TILER BO.
>>>>
>>>> Sure I had 2 more patches applied and also had to teach PVR driver 
>>>> to know how to use that scatterlist, but that was a trivial change 
>>>> (an old version of the patch 
>>>> https://github.com/tmlind/linux_openpvrsgx/commit/90f16ed906c8c6eb4893d3ff647ca7d921972495). 
>>>>
>>>>
>>>> See glmark-es2 results (with a little help of a simple PVR EXA):
>>>>
>>>> user@devuan-droid4:/root$ uname -a
>>>> Linux devuan-droid4 5.15.2-01783-g6ba3430a6fad-dirty #28 SMP PREEMPT 
>>>> Mon Nov 15 08:48:21 EET 2021 armv7l GNU/Linux
>>>> user@devuan-droid4:/root$ xrandr -o 3
>>>> user@devuan-droid4:/root$ glmark2-es2 --fullscreen
>>>> =======================================================
>>>>      glmark2 2020.04
>>>> =======================================================
>>>>      OpenGL Information
>>>>      GL_VENDOR:     Imagination Technologies
>>>>      GL_RENDERER:   PowerVR SGX 540
>>>>      GL_VERSION:    OpenGL ES 2.0 build 1.17@4948957
>>>> =======================================================
>>>> [build] use-vbo=false: FPS: 107 FrameTime: 9.346 ms
>>>> [build] use-vbo=true: FPS: 136 FrameTime: 7.353 ms
>>>> [texture] texture-filter=nearest: FPS: 156 FrameTime: 6.410 ms
>>>> [texture] texture-filter=linear: FPS: 153 FrameTime: 6.536 ms
>>>> [texture] texture-filter=mipmap: FPS: 152 FrameTime: 6.579 ms
>>>> [shading] shading=gouraud: FPS: 111 FrameTime: 9.009 ms
>>>> [shading] shading=blinn-phong-inf: FPS: 116 FrameTime: 8.621 ms
>>>> [shading] shading=phong: FPS: 104 FrameTime: 9.615 ms
>>>> [shading] shading=cel: FPS: 96 FrameTime: 10.417 ms
>>>> [bump] bump-render=high-poly: FPS: 67 FrameTime: 14.925 ms
>>>> [bump] bump-render=normals: FPS: 140 FrameTime: 7.143 ms
>>>> [bump] bump-render=height: FPS: 131 FrameTime: 7.634 ms
>>>> [effect2d] kernel=0,1,0;1,-4,1;0,1,0;: FPS: 49 FrameTime: 20.408 ms
>>>> [effect2d] kernel=1,1,1,1,1;1,1,1,1,1;1,1,1,1,1;: FPS: 17 FrameTime: 
>>>> 58.824 ms
>>>> [pulsar] light=false:quads=5:texture=false: FPS: 152 FrameTime: 
>>>> 6.579 ms
>>>> [desktop] 
>>>> blur-radius=5:effect=blur:passes=1:separable=true:windows=4: FPS: 23 
>>>> FrameTime: 43.478 ms
>>>> [desktop] effect=shadow:windows=4: FPS: 64 FrameTime: 15.625 ms
>>>> [buffer] 
>>>> columns=200:interleave=false:update-dispersion=0.9:update-fraction=0.5:update-method=map: 
>>>> FPS: 33 FrameTime: 30.303 ms
>>>> [buffer] 
>>>> columns=200:interleave=false:update-dispersion=0.9:update-fraction=0.5:update-method=subdata: 
>>>> FPS: 33 FrameTime: 30.303 ms
>>>> [buffer] 
>>>> columns=200:interleave=true:update-dispersion=0.9:update-fraction=0.5:update-method=map: 
>>>> FPS: 60 FrameTime: 16.667 ms
>>>> [ideas] speed=duration: FPS: 115 FrameTime: 8.696 ms
>>>> [jellyfish] <default>: FPS: 48 FrameTime: 20.833 ms
>>>> [terrain] <default>:PVR:(Error): SGXKickTA: TA went out of Mem and 
>>>> SPM occurred during last TA kick [0, ]
>>>> PVR:(Error): SGXKickTA: TA went out of Mem and SPM occurred during 
>>>> last TA kick [0, ]
>>>> PVR:(Error): SGXKickTA: TA went out of Mem and SPM occurred during 
>>>> last TA kick [0, ]
>>>>   FPS: 1 FrameTime: 1000.000 ms
>>>> [shadow] <default>: FPS: 31 FrameTime: 32.258 ms
>>>> [refract] <default>: FPS: 13 FrameTime: 76.923 ms
>>>> [conditionals] fragment-steps=0:vertex-steps=0: FPS: 156 FrameTime: 
>>>> 6.410 ms
>>>> [conditionals] fragment-steps=5:vertex-steps=0: FPS: 100 FrameTime: 
>>>> 10.000 ms
>>>> [conditionals] fragment-steps=0:vertex-steps=5: FPS: 156 FrameTime: 
>>>> 6.410 ms
>>>> [function] fragment-complexity=low:fragment-steps=5: FPS: 128 
>>>> FrameTime: 7.812 ms
>>>> [function] fragment-complexity=medium:fragment-steps=5: FPS: 83 
>>>> FrameTime: 12.048 ms
>>>> [loop] fragment-loop=false:fragment-steps=5:vertex-steps=5: FPS: 127 
>>>> FrameTime: 7.874 ms
>>>> [loop] fragment-steps=5:fragment-uniform=false:vertex-steps=5: FPS: 
>>>> 104 FrameTime: 9.615 ms
>>>> [loop] fragment-steps=5:fragment-uniform=true:vertex-steps=5: FPS: 
>>>> 77 FrameTime: 12.987 ms
>>>> =======================================================
>>>>                                    glmark2 Score: 92
>>>> =======================================================
>>>>
>>>> Impressive, ain't it ;)
>>>>
>>>>> But I'm not sure what that driver would be on droid4. I have DRA7 
>>>>> boards which have VIP, CAL and VPE that I can use here. Perhaps it 
>>>>> wouldn't be too much effort for me to extend my tests a bit to 
>>>>> include CAL, and try to fix the driver. I just fear the driver 
>>>>> changes won't be trivial.
>>>>>
>>>>
>>>> At least PVR change was really trivial.
>>>>
>>>>> Did you test this somehow?
>>>>>
>>>>
>>>> Yes, on droid4, works with no issue, see above.
>>>>
>>>>> Did you look at the userspace mmap of TILER buffers? I wonder if 
>>>>> that goes correctly or not. Isn't memory to userspace mapped per 
>>>>> page, and lengths of the TILER lines are not page aligned?
>>>>>
>>>>
>>>> I really can't explain it any better than Matthijs, see the other mail.
>>>>
>>>> So, what I think shall be done to have TILER BOs (and not only) in a 
>>>> shape that's usable for anything else but a simple test-cases, if 
>>>> you accept the $subject patch:
>>>>
>>>> 1. Make TILER BOs page-aligned (simple patch, I already have it). 
>>>> That should fix possible invalid memory accesses for both mmap()-ed 
>>>> memory and kernel drivers.
>>>
>>> Sounds good.
>>>
>>>> 2. Set exp_info.size = omap_gem_mmap_size(obj); when exporting a BO. 
>>>> That way importer knows the real BO memory size (including alignment 
>>>> etc) so he will be able to calculate the number of pages he needs to 
>>>> map the scatterlist.
>>>
>>> Can you elaborate what this means?
>>>
>>
>> When we align to page, we shall report the size including the 
>> alignment, no? Or, it is the importer that shall take care to 
>> calculate BO size( including the alignment) based on scatterlist if he 
>> needs to?
> 
> I'm not sure... But I guess the export size should include the alignment.
> 

My understanding as well. Will sent that change as a part of page 
alignment patch.

> Hmm... I haven't had enough coffee yet, but how does this go... Let's 
> say we have a tiled fb, and the width gets expanded to a page. What 
> happens to reads/writes that happen outside the fb, but still within the 
> page? Those should cause an error or do nothing, but is it possible that 
> they go through TILER and get mapped to some real memory location?
> 

I lack the details here, but reading through TRM leaves me with the 
impression that TILER smallest unit is a tile, and every tile is backed 
by a real memory page (4KiB), so outside read-writes will end up in 
memory that's there but unused and will do nothing.

omap_gem_new() calls tiler_align(), which in turn seems to return 
page-aligned size, so I think there is no issue here.

>>>> 3. Do not refuse to export non-TILER non-contiguous buffers (we can 
>>>> use them for rendering, for example)
>>>
>>> omapdrm should only allow allocation of buffers that are used for 
>>> display. Pure render buffers should be allocated from SGX.
>>>
>>
>> In practice everyone around uses omapdrm to allocate all kinds of 
>> buffers, which kind of makes sense to me - that way you keep only one 
>> DRM fd around. Take omap-video for example, it uses omap_bo_new() (or 
>> omap_bo_tiled()) to allocate DRI buffers. GBM does the same 
>> (gbm_bo_create() uses omapdrm, because that's the DRM fd you create 
>> gbm with), IIUC. But those buffers should not be necessarily scanout 
>> capable.
>>
>> The problem with contiguous buffers as I see it, is that CMA is 
>> limited, so lets not waste it if we can use DMA memory and scatterlist.
>>
>> To support that, we just need to simply create a scatterlist, in 
>> similar way we do for TILER BOs in the $subject patch, so it should be 
>> few lines of code only.
> 
> Yep. Well, as I mentioned above, I disagree with this. We have proper 
> generic memory allocators.
> 

Maybe you could reconsider in the light of my latest explanations :)

Thanks and regards,
Ivo
