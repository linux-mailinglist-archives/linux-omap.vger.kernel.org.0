Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B469450C17
	for <lists+linux-omap@lfdr.de>; Mon, 15 Nov 2021 18:32:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238358AbhKORer (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 15 Nov 2021 12:34:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238219AbhKORdn (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 15 Nov 2021 12:33:43 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2C8FC06122D;
        Mon, 15 Nov 2021 09:19:12 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id e3so38785025edu.4;
        Mon, 15 Nov 2021 09:19:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ANsu7lUqibnTwzODFQvMseCmIS2iir38u6Ocu5jiCjo=;
        b=l9SDD074551Rku8omHZibfcO/8mCeocW7goRkJY23augLdGFy4Ez/KquNLazM1TK06
         k5DVBwO/yamixY39X+9jRzwUa8KM+lV+fRA9FyXZRiYLr4zXi3Gx+PU1Z/VRp/yjzf9R
         x33uK/gCVkNFc1EGKMO3WJ0njgVjSed7a3qZNdJieCqYUTAYavSSm92GJXOQuBiNUD47
         iZk3LcY2ENSYiHbutll5g1XVddstEH6KTaLAQvySB6p2I/2boe89DHE83OfV1RhVR0Ga
         Zu+31yqOUXD48hzeqh1eECnd1wXKPbtCbAnu5jzCyZvdoiAExt5za7FoLc644B2fNwKh
         W2hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ANsu7lUqibnTwzODFQvMseCmIS2iir38u6Ocu5jiCjo=;
        b=Y5S2OJbcrNw39Rr3uz9bZl1gozsgxT/+XEmhYWlHQ0MawYIjet6fVRzOdY90uf0Rng
         z4LoptNB1qAaaUgritIpn5qaQ2q7XeZxhrLOGGQk1J2RAXvzhHrTSfO0fjHsgsFR+isZ
         aik0D2fVTYAJ+Mve7OSNUpa+t2vbBIiz02yNVGWOksSgy4Yu6r+ijyzFEI0IZAE7Z2tj
         EX6knId7ffK8QObnA/x2mTU5EAdyE/tDpe+8g9ftM1aSTjLnZEMRdMo8Ejtbvw+AC0h5
         wuBdpKwpFwVN/uBhZZhYfnf1YzJe+QfpkBTmgyss/8wO58qPRC5XqcQF2Q4E81zqO2NZ
         wBcQ==
X-Gm-Message-State: AOAM532XGuUqg1BEaJhKwI9TlI+LqyDNchwya4WLGo7G/IKbumslJdr0
        TdaCLzSaXq/2G3n6EkorS+dUJvYdsE8=
X-Google-Smtp-Source: ABdhPJzjG9hFf+NAVN9URSDTFmjx+hsvTzic3kx+ZtecgqVART80tFfBg/BdEpobhEZQS6MB31t1+A==
X-Received: by 2002:a17:906:9144:: with SMTP id y4mr795217ejw.98.1636996751146;
        Mon, 15 Nov 2021 09:19:11 -0800 (PST)
Received: from [192.168.1.10] ([46.249.74.23])
        by smtp.googlemail.com with ESMTPSA id hq37sm6873197ejc.116.2021.11.15.09.19.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 15 Nov 2021 09:19:10 -0800 (PST)
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
From:   Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Message-ID: <e24ba773-298c-c703-9719-abba3527f8dd@gmail.com>
Date:   Mon, 15 Nov 2021 19:15:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Firefox/60.0 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <ee42102b-c584-6e20-e710-711f79467fa3@ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

On 15.11.21 г. 17:37 ч., Tomi Valkeinen wrote:
> On 15/11/2021 15:55, Ivaylo Dimitrov wrote:
>> Hi Tomi,
>>
>> On 15.11.21 г. 10:42 ч., Tomi Valkeinen wrote:
>>> Hi,
>>>
>>> On 13/11/2021 11:53, Ivaylo Dimitrov wrote:
>>>> Memory of BOs backed by TILER is not contiguous, but 
>>>> omap_gem_map_dma_buf()
>>>> exports it like it is. This leads to (possibly) invalid memory 
>>>> accesses if
>>>> another device imports such a BO.
>>>
>>> This is one reason why TILER hasn't been officially supported. But 
>>> the above is not exactly right, or at least not the whole truth.
>>>
>>
>> Definitely, not only these BOs lie about their memory layout, they lie 
>> about size and alignment as well. I have 2 more patches here (one is 
>> to align TILER memory on page, as proposed by Matthijs in the other 
>> mail, the other to set the correct size when exporting TILER BO), but 
>> I wanted to hear from you first, like, what is the general trend :) .
> 
> My thoughts here are that the current code doesn't work in practice, so 
> if you get it fixed, it's great =).
> 
>> Also, I have another patch in mind, that will enable exporting of 
>> buffers that are not TILER backed, but are not CMA backed either. SGX 
>> for example does not need CMA memory to render to.
> 
> What do you mean with this? DSS needs contiguous memory, so the memory 
> has to be 1) physically contiguous, 2) mapped with DMM or 3) mapped with 
> TILER. There's no reason for the driver to export non-contiguous memory.
> 

DSS yes, but, omapdrm is used to allocate non-scanout buffers as well, 
which do not need to be (and in practice are not) contiguous. GPU (or 
anyone with MMU) can render on them (DRI buffers for example) and later 
on those buffers can be copied (blit) to the framebuffer. Yes, not 
zero-copy, but if you're doing compositing, there is no option anyway.

Exactly this is done by omap-video driver for example. GBM BOs are 
allocated through omapdrm as well.

>>> A BO's memory via the TILER memory is contiguous, although with 
>>> consistent gaps of memory that should not be accessed. 
>>
>> I think this more or less contradicts to the definition of contiguous, 
>> no?  :)
> 
> Depends on the definition ;). The buffers can be handled with DMA that 
> only supports contiguous memory, so...
> 
>>> That point is important, as the IPs that might use TILER backed BOs 
>>> only support contiguous memory.
>>>
>>
>> Well, every IP with MMU should be capable to use such BOs. SGX has one 
>> for sure, IIRC IVA and ISP on omap3 has MMUs too.
> 
> True, we have those. But none of the DRA7 capture IPs have MMU.
> 
>>> This means that the drivers for such IPs cannot use the BOs exported 
>>
>> Neither they can use them without the patch.
>>
>>> like you do in this patch. I believe the drivers could be improved by 
>>> writing a helper function which studies the sg_table and concludes 
>>> that it's actually contiguous. I think we should have at least one 
>>> such driver fixed along with this patch so that we can be more 
>>> confident that this actually works.
>>>
>>
>> Yes, I we have such driver, but unfortunately it is not upstream (PVR 
>> driver that is). Right now I have droid4 in front of me with SGX 
>> rendering hildon-desktop in landscape using TILER BO.
>>
>> Sure I had 2 more patches applied and also had to teach PVR driver to 
>> know how to use that scatterlist, but that was a trivial change (an 
>> old version of the patch 
>> https://github.com/tmlind/linux_openpvrsgx/commit/90f16ed906c8c6eb4893d3ff647ca7d921972495). 
>>
>>
>> See glmark-es2 results (with a little help of a simple PVR EXA):
>>
>> user@devuan-droid4:/root$ uname -a
>> Linux devuan-droid4 5.15.2-01783-g6ba3430a6fad-dirty #28 SMP PREEMPT 
>> Mon Nov 15 08:48:21 EET 2021 armv7l GNU/Linux
>> user@devuan-droid4:/root$ xrandr -o 3
>> user@devuan-droid4:/root$ glmark2-es2 --fullscreen
>> =======================================================
>>      glmark2 2020.04
>> =======================================================
>>      OpenGL Information
>>      GL_VENDOR:     Imagination Technologies
>>      GL_RENDERER:   PowerVR SGX 540
>>      GL_VERSION:    OpenGL ES 2.0 build 1.17@4948957
>> =======================================================
>> [build] use-vbo=false: FPS: 107 FrameTime: 9.346 ms
>> [build] use-vbo=true: FPS: 136 FrameTime: 7.353 ms
>> [texture] texture-filter=nearest: FPS: 156 FrameTime: 6.410 ms
>> [texture] texture-filter=linear: FPS: 153 FrameTime: 6.536 ms
>> [texture] texture-filter=mipmap: FPS: 152 FrameTime: 6.579 ms
>> [shading] shading=gouraud: FPS: 111 FrameTime: 9.009 ms
>> [shading] shading=blinn-phong-inf: FPS: 116 FrameTime: 8.621 ms
>> [shading] shading=phong: FPS: 104 FrameTime: 9.615 ms
>> [shading] shading=cel: FPS: 96 FrameTime: 10.417 ms
>> [bump] bump-render=high-poly: FPS: 67 FrameTime: 14.925 ms
>> [bump] bump-render=normals: FPS: 140 FrameTime: 7.143 ms
>> [bump] bump-render=height: FPS: 131 FrameTime: 7.634 ms
>> [effect2d] kernel=0,1,0;1,-4,1;0,1,0;: FPS: 49 FrameTime: 20.408 ms
>> [effect2d] kernel=1,1,1,1,1;1,1,1,1,1;1,1,1,1,1;: FPS: 17 FrameTime: 
>> 58.824 ms
>> [pulsar] light=false:quads=5:texture=false: FPS: 152 FrameTime: 6.579 ms
>> [desktop] blur-radius=5:effect=blur:passes=1:separable=true:windows=4: 
>> FPS: 23 FrameTime: 43.478 ms
>> [desktop] effect=shadow:windows=4: FPS: 64 FrameTime: 15.625 ms
>> [buffer] 
>> columns=200:interleave=false:update-dispersion=0.9:update-fraction=0.5:update-method=map: 
>> FPS: 33 FrameTime: 30.303 ms
>> [buffer] 
>> columns=200:interleave=false:update-dispersion=0.9:update-fraction=0.5:update-method=subdata: 
>> FPS: 33 FrameTime: 30.303 ms
>> [buffer] 
>> columns=200:interleave=true:update-dispersion=0.9:update-fraction=0.5:update-method=map: 
>> FPS: 60 FrameTime: 16.667 ms
>> [ideas] speed=duration: FPS: 115 FrameTime: 8.696 ms
>> [jellyfish] <default>: FPS: 48 FrameTime: 20.833 ms
>> [terrain] <default>:PVR:(Error): SGXKickTA: TA went out of Mem and SPM 
>> occurred during last TA kick [0, ]
>> PVR:(Error): SGXKickTA: TA went out of Mem and SPM occurred during 
>> last TA kick [0, ]
>> PVR:(Error): SGXKickTA: TA went out of Mem and SPM occurred during 
>> last TA kick [0, ]
>>   FPS: 1 FrameTime: 1000.000 ms
>> [shadow] <default>: FPS: 31 FrameTime: 32.258 ms
>> [refract] <default>: FPS: 13 FrameTime: 76.923 ms
>> [conditionals] fragment-steps=0:vertex-steps=0: FPS: 156 FrameTime: 
>> 6.410 ms
>> [conditionals] fragment-steps=5:vertex-steps=0: FPS: 100 FrameTime: 
>> 10.000 ms
>> [conditionals] fragment-steps=0:vertex-steps=5: FPS: 156 FrameTime: 
>> 6.410 ms
>> [function] fragment-complexity=low:fragment-steps=5: FPS: 128 
>> FrameTime: 7.812 ms
>> [function] fragment-complexity=medium:fragment-steps=5: FPS: 83 
>> FrameTime: 12.048 ms
>> [loop] fragment-loop=false:fragment-steps=5:vertex-steps=5: FPS: 127 
>> FrameTime: 7.874 ms
>> [loop] fragment-steps=5:fragment-uniform=false:vertex-steps=5: FPS: 
>> 104 FrameTime: 9.615 ms
>> [loop] fragment-steps=5:fragment-uniform=true:vertex-steps=5: FPS: 77 
>> FrameTime: 12.987 ms
>> =======================================================
>>                                    glmark2 Score: 92
>> =======================================================
>>
>> Impressive, ain't it ;)
>>
>>> But I'm not sure what that driver would be on droid4. I have DRA7 
>>> boards which have VIP, CAL and VPE that I can use here. Perhaps it 
>>> wouldn't be too much effort for me to extend my tests a bit to 
>>> include CAL, and try to fix the driver. I just fear the driver 
>>> changes won't be trivial.
>>>
>>
>> At least PVR change was really trivial.
>>
>>> Did you test this somehow?
>>>
>>
>> Yes, on droid4, works with no issue, see above.
>>
>>> Did you look at the userspace mmap of TILER buffers? I wonder if that 
>>> goes correctly or not. Isn't memory to userspace mapped per page, and 
>>> lengths of the TILER lines are not page aligned?
>>>
>>
>> I really can't explain it any better than Matthijs, see the other mail.
>>
>> So, what I think shall be done to have TILER BOs (and not only) in a 
>> shape that's usable for anything else but a simple test-cases, if you 
>> accept the $subject patch:
>>
>> 1. Make TILER BOs page-aligned (simple patch, I already have it). That 
>> should fix possible invalid memory accesses for both mmap()-ed memory 
>> and kernel drivers.
> 
> Sounds good.
> 
>> 2. Set exp_info.size = omap_gem_mmap_size(obj); when exporting a BO. 
>> That way importer knows the real BO memory size (including alignment 
>> etc) so he will be able to calculate the number of pages he needs to 
>> map the scatterlist.
> 
> Can you elaborate what this means?
> 

When we align to page, we shall report the size including the alignment, 
no? Or, it is the importer that shall take care to calculate BO size( 
including the alignment) based on scatterlist if he needs to?

>> 3. Do not refuse to export non-TILER non-contiguous buffers (we can 
>> use them for rendering, for example)
> 
> omapdrm should only allow allocation of buffers that are used for 
> display. Pure render buffers should be allocated from SGX.
> 

In practice everyone around uses omapdrm to allocate all kinds of 
buffers, which kind of makes sense to me - that way you keep only one 
DRM fd around. Take omap-video for example, it uses omap_bo_new() (or 
omap_bo_tiled()) to allocate DRI buffers. GBM does the same 
(gbm_bo_create() uses omapdrm, because that's the DRM fd you create gbm 
with), IIUC. But those buffers should not be necessarily scanout capable.

The problem with contiguous buffers as I see it, is that CMA is limited, 
so lets not waste it if we can use DMA memory and scatterlist.

To support that, we just need to simply create a scatterlist, in similar 
way we do for TILER BOs in the $subject patch, so it should be few lines 
of code only.

>> 4. make VRFB functional and implement the same/similar logic as for 
>> TILER BOs.
> 
> Sounds good.
> 
>> 5. Teach omapdrm to know about different GBM allocator flags (like 
>> allocate TILER/VRFB backed BO if GBM_BO_USE_LINEAR is not specified, 
>> but GBM_BO_USE_SCANOUT is or something like that). I still don't have 
>> all the details, but the ultimate goal is to get rid of omap_bo_xxx 
>> stuff and to use GBM BOs. That will eventually allow modesetting to be 
>> fixed to not do SW rotation. But that's too far in the future I guess.
> 
> What does this mean? New omapdrm ioctls, called from libgbm? Isn't 
> libgbm normally just using libdrm, which includes omap_bo_xxx stuff?
> 

I need to dig into this a bit more, lets not discuss it now.

Regards,
Ivo
