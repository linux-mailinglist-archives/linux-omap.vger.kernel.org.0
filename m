Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 907464508AB
	for <lists+linux-omap@lfdr.de>; Mon, 15 Nov 2021 16:37:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232405AbhKOPk0 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 15 Nov 2021 10:40:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231562AbhKOPkY (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 15 Nov 2021 10:40:24 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01FEDC061570;
        Mon, 15 Nov 2021 07:37:24 -0800 (PST)
Received: from [192.168.1.111] (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 66EF99CA;
        Mon, 15 Nov 2021 16:37:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1636990641;
        bh=DPad4biKzxKVIDz8bhWa1hPppaVsoGOOUC76Zbo6q+4=;
        h=To:Cc:References:From:Subject:Date:In-Reply-To:From;
        b=r1FSRTYJYG07mBNVobPaL5yOQPAR+5xbHcFxjz4OTwwgG8W7+CL6cRRelVI0VnruL
         2S1kM9I6ZYnhiEdDDMfXsymWDZ0W48UnmZs5NS9MaBHiXCdRzpahK5rhaLoFjGykgN
         tcdXL2uIv1ozGCXqDfEjyx4/xTXSAp99sfKPyjyA=
To:     Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Cc:     matthijsvanduin@gmail.com, airlied@linux.ie, daniel@ffwll.ch,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <1636796417-5997-1-git-send-email-ivo.g.dimitrov.75@gmail.com>
 <1636797239-6384-1-git-send-email-ivo.g.dimitrov.75@gmail.com>
 <36598203-eced-131d-85ef-f4940872e751@ideasonboard.com>
 <16a38e8e-071c-7275-8a33-487f7c3c8f2a@gmail.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v2] drm: omapdrm: Export correct scatterlist for TILER
 backed BOs
Message-ID: <ee42102b-c584-6e20-e710-711f79467fa3@ideasonboard.com>
Date:   Mon, 15 Nov 2021 17:37:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <16a38e8e-071c-7275-8a33-487f7c3c8f2a@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 15/11/2021 15:55, Ivaylo Dimitrov wrote:
> Hi Tomi,
> 
> On 15.11.21 г. 10:42 ч., Tomi Valkeinen wrote:
>> Hi,
>>
>> On 13/11/2021 11:53, Ivaylo Dimitrov wrote:
>>> Memory of BOs backed by TILER is not contiguous, but 
>>> omap_gem_map_dma_buf()
>>> exports it like it is. This leads to (possibly) invalid memory 
>>> accesses if
>>> another device imports such a BO.
>>
>> This is one reason why TILER hasn't been officially supported. But the 
>> above is not exactly right, or at least not the whole truth.
>>
> 
> Definitely, not only these BOs lie about their memory layout, they lie 
> about size and alignment as well. I have 2 more patches here (one is to 
> align TILER memory on page, as proposed by Matthijs in the other mail, 
> the other to set the correct size when exporting TILER BO), but I wanted 
> to hear from you first, like, what is the general trend :) .

My thoughts here are that the current code doesn't work in practice, so 
if you get it fixed, it's great =).

> Also, I have another patch in mind, that will enable exporting of 
> buffers that are not TILER backed, but are not CMA backed either. SGX 
> for example does not need CMA memory to render to.

What do you mean with this? DSS needs contiguous memory, so the memory 
has to be 1) physically contiguous, 2) mapped with DMM or 3) mapped with 
TILER. There's no reason for the driver to export non-contiguous memory.

>> A BO's memory via the TILER memory is contiguous, although with 
>> consistent gaps of memory that should not be accessed. 
> 
> I think this more or less contradicts to the definition of contiguous, 
> no?  :)

Depends on the definition ;). The buffers can be handled with DMA that 
only supports contiguous memory, so...

>> That point is important, as the IPs that might use TILER backed BOs 
>> only support contiguous memory.
>>
> 
> Well, every IP with MMU should be capable to use such BOs. SGX has one 
> for sure, IIRC IVA and ISP on omap3 has MMUs too.

True, we have those. But none of the DRA7 capture IPs have MMU.

>> This means that the drivers for such IPs cannot use the BOs exported 
> 
> Neither they can use them without the patch.
> 
>> like you do in this patch. I believe the drivers could be improved by 
>> writing a helper function which studies the sg_table and concludes 
>> that it's actually contiguous. I think we should have at least one 
>> such driver fixed along with this patch so that we can be more 
>> confident that this actually works.
>>
> 
> Yes, I we have such driver, but unfortunately it is not upstream (PVR 
> driver that is). Right now I have droid4 in front of me with SGX 
> rendering hildon-desktop in landscape using TILER BO.
> 
> Sure I had 2 more patches applied and also had to teach PVR driver to 
> know how to use that scatterlist, but that was a trivial change (an old 
> version of the patch 
> https://github.com/tmlind/linux_openpvrsgx/commit/90f16ed906c8c6eb4893d3ff647ca7d921972495). 
> 
> 
> See glmark-es2 results (with a little help of a simple PVR EXA):
> 
> user@devuan-droid4:/root$ uname -a
> Linux devuan-droid4 5.15.2-01783-g6ba3430a6fad-dirty #28 SMP PREEMPT Mon 
> Nov 15 08:48:21 EET 2021 armv7l GNU/Linux
> user@devuan-droid4:/root$ xrandr -o 3
> user@devuan-droid4:/root$ glmark2-es2 --fullscreen
> =======================================================
>      glmark2 2020.04
> =======================================================
>      OpenGL Information
>      GL_VENDOR:     Imagination Technologies
>      GL_RENDERER:   PowerVR SGX 540
>      GL_VERSION:    OpenGL ES 2.0 build 1.17@4948957
> =======================================================
> [build] use-vbo=false: FPS: 107 FrameTime: 9.346 ms
> [build] use-vbo=true: FPS: 136 FrameTime: 7.353 ms
> [texture] texture-filter=nearest: FPS: 156 FrameTime: 6.410 ms
> [texture] texture-filter=linear: FPS: 153 FrameTime: 6.536 ms
> [texture] texture-filter=mipmap: FPS: 152 FrameTime: 6.579 ms
> [shading] shading=gouraud: FPS: 111 FrameTime: 9.009 ms
> [shading] shading=blinn-phong-inf: FPS: 116 FrameTime: 8.621 ms
> [shading] shading=phong: FPS: 104 FrameTime: 9.615 ms
> [shading] shading=cel: FPS: 96 FrameTime: 10.417 ms
> [bump] bump-render=high-poly: FPS: 67 FrameTime: 14.925 ms
> [bump] bump-render=normals: FPS: 140 FrameTime: 7.143 ms
> [bump] bump-render=height: FPS: 131 FrameTime: 7.634 ms
> [effect2d] kernel=0,1,0;1,-4,1;0,1,0;: FPS: 49 FrameTime: 20.408 ms
> [effect2d] kernel=1,1,1,1,1;1,1,1,1,1;1,1,1,1,1;: FPS: 17 FrameTime: 
> 58.824 ms
> [pulsar] light=false:quads=5:texture=false: FPS: 152 FrameTime: 6.579 ms
> [desktop] blur-radius=5:effect=blur:passes=1:separable=true:windows=4: 
> FPS: 23 FrameTime: 43.478 ms
> [desktop] effect=shadow:windows=4: FPS: 64 FrameTime: 15.625 ms
> [buffer] 
> columns=200:interleave=false:update-dispersion=0.9:update-fraction=0.5:update-method=map: 
> FPS: 33 FrameTime: 30.303 ms
> [buffer] 
> columns=200:interleave=false:update-dispersion=0.9:update-fraction=0.5:update-method=subdata: 
> FPS: 33 FrameTime: 30.303 ms
> [buffer] 
> columns=200:interleave=true:update-dispersion=0.9:update-fraction=0.5:update-method=map: 
> FPS: 60 FrameTime: 16.667 ms
> [ideas] speed=duration: FPS: 115 FrameTime: 8.696 ms
> [jellyfish] <default>: FPS: 48 FrameTime: 20.833 ms
> [terrain] <default>:PVR:(Error): SGXKickTA: TA went out of Mem and SPM 
> occurred during last TA kick [0, ]
> PVR:(Error): SGXKickTA: TA went out of Mem and SPM occurred during last 
> TA kick [0, ]
> PVR:(Error): SGXKickTA: TA went out of Mem and SPM occurred during last 
> TA kick [0, ]
>   FPS: 1 FrameTime: 1000.000 ms
> [shadow] <default>: FPS: 31 FrameTime: 32.258 ms
> [refract] <default>: FPS: 13 FrameTime: 76.923 ms
> [conditionals] fragment-steps=0:vertex-steps=0: FPS: 156 FrameTime: 
> 6.410 ms
> [conditionals] fragment-steps=5:vertex-steps=0: FPS: 100 FrameTime: 
> 10.000 ms
> [conditionals] fragment-steps=0:vertex-steps=5: FPS: 156 FrameTime: 
> 6.410 ms
> [function] fragment-complexity=low:fragment-steps=5: FPS: 128 FrameTime: 
> 7.812 ms
> [function] fragment-complexity=medium:fragment-steps=5: FPS: 83 
> FrameTime: 12.048 ms
> [loop] fragment-loop=false:fragment-steps=5:vertex-steps=5: FPS: 127 
> FrameTime: 7.874 ms
> [loop] fragment-steps=5:fragment-uniform=false:vertex-steps=5: FPS: 104 
> FrameTime: 9.615 ms
> [loop] fragment-steps=5:fragment-uniform=true:vertex-steps=5: FPS: 77 
> FrameTime: 12.987 ms
> =======================================================
>                                    glmark2 Score: 92
> =======================================================
> 
> Impressive, ain't it ;)
> 
>> But I'm not sure what that driver would be on droid4. I have DRA7 
>> boards which have VIP, CAL and VPE that I can use here. Perhaps it 
>> wouldn't be too much effort for me to extend my tests a bit to include 
>> CAL, and try to fix the driver. I just fear the driver changes won't 
>> be trivial.
>>
> 
> At least PVR change was really trivial.
> 
>> Did you test this somehow?
>>
> 
> Yes, on droid4, works with no issue, see above.
> 
>> Did you look at the userspace mmap of TILER buffers? I wonder if that 
>> goes correctly or not. Isn't memory to userspace mapped per page, and 
>> lengths of the TILER lines are not page aligned?
>>
> 
> I really can't explain it any better than Matthijs, see the other mail.
> 
> So, what I think shall be done to have TILER BOs (and not only) in a 
> shape that's usable for anything else but a simple test-cases, if you 
> accept the $subject patch:
> 
> 1. Make TILER BOs page-aligned (simple patch, I already have it). That 
> should fix possible invalid memory accesses for both mmap()-ed memory 
> and kernel drivers.

Sounds good.

> 2. Set exp_info.size = omap_gem_mmap_size(obj); when exporting a BO. 
> That way importer knows the real BO memory size (including alignment 
> etc) so he will be able to calculate the number of pages he needs to map 
> the scatterlist.

Can you elaborate what this means?

> 3. Do not refuse to export non-TILER non-contiguous buffers (we can use 
> them for rendering, for example)

omapdrm should only allow allocation of buffers that are used for 
display. Pure render buffers should be allocated from SGX.

> 4. make VRFB functional and implement the same/similar logic as for 
> TILER BOs.

Sounds good.

> 5. Teach omapdrm to know about different GBM allocator flags (like 
> allocate TILER/VRFB backed BO if GBM_BO_USE_LINEAR is not specified, but 
> GBM_BO_USE_SCANOUT is or something like that). I still don't have all 
> the details, but the ultimate goal is to get rid of omap_bo_xxx stuff 
> and to use GBM BOs. That will eventually allow modesetting to be fixed 
> to not do SW rotation. But that's too far in the future I guess.

What does this mean? New omapdrm ioctls, called from libgbm? Isn't 
libgbm normally just using libdrm, which includes omap_bo_xxx stuff?

  Tomi
