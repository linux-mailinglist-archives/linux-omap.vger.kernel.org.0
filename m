Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C7ED45062D
	for <lists+linux-omap@lfdr.de>; Mon, 15 Nov 2021 15:00:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231491AbhKOOCs (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 15 Nov 2021 09:02:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232021AbhKOOCY (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 15 Nov 2021 09:02:24 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEA37C061570;
        Mon, 15 Nov 2021 05:59:27 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id z10so45868540edc.11;
        Mon, 15 Nov 2021 05:59:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=h2j5mcMWqoUhoJffLOgiFualTeQxYNQDIxJSaOUBcXI=;
        b=PGZJfrb/pvrDuavBU6UaEnVHEOx/gjuGsoW3bPZiniJe5gq/UC7KlIWN1VC/NvNfj5
         Bv10jGTP5D3xUM3V8riJxfaRDjmjLw+zRh9+eSONDSwrAVwaPXTZ3cJ2op8fk+UeOuT+
         mI9uOjrLYLELeV34ctrBYhrIB0HXddENcx4vUe0Jx2dmMNqx1fno9KItpn6jz249KGFr
         rWciRMsTPjuK8xcinYFuGlFsCs6+dCmuWicsJPatAQEhnQP+KqNo55kxUFVvGHxyfv85
         ChFQirHGLpMC+2buGvBd/92tSk0///XcRcoPkjDQtBVJMz2wqrvNt5wQL9W5kpkyC7xa
         K3EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=h2j5mcMWqoUhoJffLOgiFualTeQxYNQDIxJSaOUBcXI=;
        b=y3XfdhmSil6AxbO5PmRAcobWZ9aJWrarW+Dk9EzJZWx/sPjsexHGdWS5LTGuKXIIsF
         wdk2BL3tWjmbyuVREOLkHe0/wZEA7m6QDCbVulDoRd0Hl4a6POlv6gOHY1Xdw4qRVYwF
         wqyQDhpORTpD/6v4Z5jdKm8MNfShsIdgi2VHAN+gY+YMk3QyqyjiBikqNP4c5Z9eBO55
         PT+wmT0FJ3FYs8Bw1EpZj8IQ+9MkTqC2vB8mqWI1f/PzFLNqYuIpqseWvTKIqXW1kVu2
         nHcXJaLcxAxCvOBF7z/s1tug61T2ZSyjNhdgjmscDLnktfkOYh83L8iQe4ULPHl6I5fq
         2JXw==
X-Gm-Message-State: AOAM533ChNKycgsllkTHE1V2qxZ7CAIxAraS2MM/J0ef1P/wUtcQIggr
        pvkYabH3/5QyVi+v1ZdgTyY=
X-Google-Smtp-Source: ABdhPJwjYEqszlR5l7/Zp7cMIAClo6RCMnTX5gP5E7KPeN4SpjGMRnKVOYXyqmKjhqZ/JRU/U8WbwQ==
X-Received: by 2002:a17:907:97d4:: with SMTP id js20mr50754518ejc.416.1636984766346;
        Mon, 15 Nov 2021 05:59:26 -0800 (PST)
Received: from [192.168.1.10] ([46.249.74.23])
        by smtp.googlemail.com with ESMTPSA id f17sm2646908edq.39.2021.11.15.05.59.25
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 15 Nov 2021 05:59:25 -0800 (PST)
Subject: Re: [PATCH v2] drm: omapdrm: Export correct scatterlist for TILER
 backed BOs
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     matthijsvanduin@gmail.com, airlied@linux.ie, daniel@ffwll.ch,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <1636796417-5997-1-git-send-email-ivo.g.dimitrov.75@gmail.com>
 <1636797239-6384-1-git-send-email-ivo.g.dimitrov.75@gmail.com>
 <36598203-eced-131d-85ef-f4940872e751@ideasonboard.com>
From:   Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Message-ID: <16a38e8e-071c-7275-8a33-487f7c3c8f2a@gmail.com>
Date:   Mon, 15 Nov 2021 15:55:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Firefox/60.0 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <36598203-eced-131d-85ef-f4940872e751@ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tomi,

On 15.11.21 г. 10:42 ч., Tomi Valkeinen wrote:
> Hi,
> 
> On 13/11/2021 11:53, Ivaylo Dimitrov wrote:
>> Memory of BOs backed by TILER is not contiguous, but 
>> omap_gem_map_dma_buf()
>> exports it like it is. This leads to (possibly) invalid memory 
>> accesses if
>> another device imports such a BO.
> 
> This is one reason why TILER hasn't been officially supported. But the 
> above is not exactly right, or at least not the whole truth.
> 

Definitely, not only these BOs lie about their memory layout, they lie 
about size and alignment as well. I have 2 more patches here (one is to 
align TILER memory on page, as proposed by Matthijs in the other mail, 
the other to set the correct size when exporting TILER BO), but I wanted 
to hear from you first, like, what is the general trend :) .

Also, I have another patch in mind, that will enable exporting of 
buffers that are not TILER backed, but are not CMA backed either. SGX 
for example does not need CMA memory to render to.

> A BO's memory via the TILER memory is contiguous, although with 
> consistent gaps of memory that should not be accessed. 

I think this more or less contradicts to the definition of contiguous, 
no?  :)

> That point is 
> important, as the IPs that might use TILER backed BOs only support 
> contiguous memory.
> 

Well, every IP with MMU should be capable to use such BOs. SGX has one 
for sure, IIRC IVA and ISP on omap3 has MMUs too.

> This means that the drivers for such IPs cannot use the BOs exported 

Neither they can use them without the patch.

> like you do in this patch. I believe the drivers could be improved by 
> writing a helper function which studies the sg_table and concludes that 
> it's actually contiguous. I think we should have at least one such 
> driver fixed along with this patch so that we can be more confident that 
> this actually works.
> 

Yes, I we have such driver, but unfortunately it is not upstream (PVR 
driver that is). Right now I have droid4 in front of me with SGX 
rendering hildon-desktop in landscape using TILER BO.

Sure I had 2 more patches applied and also had to teach PVR driver to 
know how to use that scatterlist, but that was a trivial change (an old 
version of the patch 
https://github.com/tmlind/linux_openpvrsgx/commit/90f16ed906c8c6eb4893d3ff647ca7d921972495).

See glmark-es2 results (with a little help of a simple PVR EXA):

user@devuan-droid4:/root$ uname -a
Linux devuan-droid4 5.15.2-01783-g6ba3430a6fad-dirty #28 SMP PREEMPT Mon 
Nov 15 08:48:21 EET 2021 armv7l GNU/Linux
user@devuan-droid4:/root$ xrandr -o 3
user@devuan-droid4:/root$ glmark2-es2 --fullscreen
=======================================================
     glmark2 2020.04
=======================================================
     OpenGL Information
     GL_VENDOR:     Imagination Technologies
     GL_RENDERER:   PowerVR SGX 540
     GL_VERSION:    OpenGL ES 2.0 build 1.17@4948957
=======================================================
[build] use-vbo=false: FPS: 107 FrameTime: 9.346 ms
[build] use-vbo=true: FPS: 136 FrameTime: 7.353 ms
[texture] texture-filter=nearest: FPS: 156 FrameTime: 6.410 ms
[texture] texture-filter=linear: FPS: 153 FrameTime: 6.536 ms
[texture] texture-filter=mipmap: FPS: 152 FrameTime: 6.579 ms
[shading] shading=gouraud: FPS: 111 FrameTime: 9.009 ms
[shading] shading=blinn-phong-inf: FPS: 116 FrameTime: 8.621 ms
[shading] shading=phong: FPS: 104 FrameTime: 9.615 ms
[shading] shading=cel: FPS: 96 FrameTime: 10.417 ms
[bump] bump-render=high-poly: FPS: 67 FrameTime: 14.925 ms
[bump] bump-render=normals: FPS: 140 FrameTime: 7.143 ms
[bump] bump-render=height: FPS: 131 FrameTime: 7.634 ms
[effect2d] kernel=0,1,0;1,-4,1;0,1,0;: FPS: 49 FrameTime: 20.408 ms
[effect2d] kernel=1,1,1,1,1;1,1,1,1,1;1,1,1,1,1;: FPS: 17 FrameTime: 
58.824 ms
[pulsar] light=false:quads=5:texture=false: FPS: 152 FrameTime: 6.579 ms
[desktop] blur-radius=5:effect=blur:passes=1:separable=true:windows=4: 
FPS: 23 FrameTime: 43.478 ms
[desktop] effect=shadow:windows=4: FPS: 64 FrameTime: 15.625 ms
[buffer] 
columns=200:interleave=false:update-dispersion=0.9:update-fraction=0.5:update-method=map: 
FPS: 33 FrameTime: 30.303 ms
[buffer] 
columns=200:interleave=false:update-dispersion=0.9:update-fraction=0.5:update-method=subdata: 
FPS: 33 FrameTime: 30.303 ms
[buffer] 
columns=200:interleave=true:update-dispersion=0.9:update-fraction=0.5:update-method=map: 
FPS: 60 FrameTime: 16.667 ms
[ideas] speed=duration: FPS: 115 FrameTime: 8.696 ms
[jellyfish] <default>: FPS: 48 FrameTime: 20.833 ms
[terrain] <default>:PVR:(Error): SGXKickTA: TA went out of Mem and SPM 
occurred during last TA kick [0, ]
PVR:(Error): SGXKickTA: TA went out of Mem and SPM occurred during last 
TA kick [0, ]
PVR:(Error): SGXKickTA: TA went out of Mem and SPM occurred during last 
TA kick [0, ]
  FPS: 1 FrameTime: 1000.000 ms
[shadow] <default>: FPS: 31 FrameTime: 32.258 ms
[refract] <default>: FPS: 13 FrameTime: 76.923 ms
[conditionals] fragment-steps=0:vertex-steps=0: FPS: 156 FrameTime: 6.410 ms
[conditionals] fragment-steps=5:vertex-steps=0: FPS: 100 FrameTime: 
10.000 ms
[conditionals] fragment-steps=0:vertex-steps=5: FPS: 156 FrameTime: 6.410 ms
[function] fragment-complexity=low:fragment-steps=5: FPS: 128 FrameTime: 
7.812 ms
[function] fragment-complexity=medium:fragment-steps=5: FPS: 83 
FrameTime: 12.048 ms
[loop] fragment-loop=false:fragment-steps=5:vertex-steps=5: FPS: 127 
FrameTime: 7.874 ms
[loop] fragment-steps=5:fragment-uniform=false:vertex-steps=5: FPS: 104 
FrameTime: 9.615 ms
[loop] fragment-steps=5:fragment-uniform=true:vertex-steps=5: FPS: 77 
FrameTime: 12.987 ms
=======================================================
                                   glmark2 Score: 92
=======================================================

Impressive, ain't it ;)

> But I'm not sure what that driver would be on droid4. I have DRA7 boards 
> which have VIP, CAL and VPE that I can use here. Perhaps it wouldn't be 
> too much effort for me to extend my tests a bit to include CAL, and try 
> to fix the driver. I just fear the driver changes won't be trivial.
> 

At least PVR change was really trivial.

> Did you test this somehow?
> 

Yes, on droid4, works with no issue, see above.

> Did you look at the userspace mmap of TILER buffers? I wonder if that 
> goes correctly or not. Isn't memory to userspace mapped per page, and 
> lengths of the TILER lines are not page aligned?
> 

I really can't explain it any better than Matthijs, see the other mail.

So, what I think shall be done to have TILER BOs (and not only) in a 
shape that's usable for anything else but a simple test-cases, if you 
accept the $subject patch:

1. Make TILER BOs page-aligned (simple patch, I already have it). That 
should fix possible invalid memory accesses for both mmap()-ed memory 
and kernel drivers.

2. Set exp_info.size = omap_gem_mmap_size(obj); when exporting a BO. 
That way importer knows the real BO memory size (including alignment 
etc) so he will be able to calculate the number of pages he needs to map 
the scatterlist.

3. Do not refuse to export non-TILER non-contiguous buffers (we can use 
them for rendering, for example)

4. make VRFB functional and implement the same/similar logic as for 
TILER BOs.

5. Teach omapdrm to know about different GBM allocator flags (like 
allocate TILER/VRFB backed BO if GBM_BO_USE_LINEAR is not specified, but 
GBM_BO_USE_SCANOUT is or something like that). I still don't have all 
the details, but the ultimate goal is to get rid of omap_bo_xxx stuff 
and to use GBM BOs. That will eventually allow modesetting to be fixed 
to not do SW rotation. But that's too far in the future I guess.

Sounds like a plan, yeah :) ?

But, for now will send a v3 patch with the requested fixes, see below.

>> Fix that by providing a scatterlist that correctly describes TILER memory
>> layout.
>>
>> Suggested-by: Matthijs van Duin <matthijsvanduin@gmail.com>
>> Signed-off-by: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
>> ---
>>   drivers/gpu/drm/omapdrm/omap_gem.c        | 76 
>> +++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/omapdrm/omap_gem.h        |  3 +-
>>   drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c | 32 ++-----------
>>   3 files changed, 82 insertions(+), 29 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/omapdrm/omap_gem.c 
>> b/drivers/gpu/drm/omapdrm/omap_gem.c
>> index 97e5fe6..2ffcc37 100644
>> --- a/drivers/gpu/drm/omapdrm/omap_gem.c
>> +++ b/drivers/gpu/drm/omapdrm/omap_gem.c
>> @@ -862,6 +862,11 @@ static void omap_gem_unpin_locked(struct 
>> drm_gem_object *obj)
>>           return;
>>       if (refcount_dec_and_test(&omap_obj->dma_addr_cnt)) {
>> +        if (omap_obj->sgt) {
>> +            sg_free_table(omap_obj->sgt);
>> +            kfree(omap_obj->sgt);
>> +            omap_obj->sgt = NULL;
>> +        }
> 
> This behavior is different than before, isn't it? The commit desc only 
> mentions changing the construction of the sg-list, not how they're 
> allocated and freed.
> 

Will fix the commit description.

>>           ret = tiler_unpin(omap_obj->block);
>>           if (ret) {
>>               dev_err(obj->dev->dev,
>> @@ -974,6 +979,77 @@ int omap_gem_put_pages(struct drm_gem_object *obj)
>>       return 0;
>>   }
>> +struct sg_table *omap_gem_get_sg(struct drm_gem_object *obj)
>> +{
>> +    struct omap_gem_object *omap_obj = to_omap_bo(obj);
>> +    dma_addr_t addr;
>> +    struct sg_table *sgt;
>> +    struct scatterlist *sg;
>> +    unsigned int count, len, stride, i;
>> +    int ret;
>> +
>> +    ret = omap_gem_pin(obj, &addr);
>> +    if (ret)
>> +        return ERR_PTR(ret);
>> +
>> +    mutex_lock(&omap_obj->lock);
>> +
>> +    sgt = omap_obj->sgt;
>> +    if (sgt)
>> +        goto out;
>> +
>> +    sgt = kzalloc(sizeof(*sgt), GFP_KERNEL);
>> +    ret = -ENOMEM;
>> +    if (!sgt)
>> +        goto out_unpin;
> 
> I think you can move the ret = ... to be inside the if block.
> 

Will do.

>> +
>> +    if (omap_obj->flags & OMAP_BO_TILED_MASK) {
>> +        enum tiler_fmt fmt = gem2fmt(omap_obj->flags);
>> +
>> +        len = omap_obj->width << (int)fmt;
>> +        count = omap_obj->height;
>> +        stride = tiler_stride(fmt, 0);
>> +    } else {
>> +        len = obj->size;
>> +        count = 1;
>> +        stride = 0;
>> +    }
>> +
>> +    ret = sg_alloc_table(sgt, count, GFP_KERNEL);
>> +    if (ret)
>> +        goto out_free;
>> +
>> +    for_each_sg(sgt->sgl, sg, count, i) {
>> +        sg_set_page(sg, phys_to_page(addr), len, offset_in_page(addr));
>> +        sg_dma_address(sg) = addr;
>> +        sg_dma_len(sg) = len;
>> +
>> +        addr += stride;
>> +    }
>> +
>> +    omap_obj->sgt = sgt;
>> +out:
>> +    mutex_unlock(&omap_obj->lock);
>> +    return sgt;
>> +
>> +out_free:
>> +    kfree(sgt);
>> +out_unpin:
> 
> There are errors handlers, I suggest err_ prefix.
> 

ok

>> +    mutex_unlock(&omap_obj->lock);
>> +    omap_gem_unpin(obj);
>> +    return ERR_PTR(ret);
>> +}
>> +
>> +void omap_gem_put_sg(struct drm_gem_object *obj, struct sg_table *sgt)
>> +{
>> +    struct omap_gem_object *omap_obj = to_omap_bo(obj);
>> +
>> +    if (WARN_ON(omap_obj->sgt != sgt))
>> +        return;
>> +
>> +    omap_gem_unpin(obj);
>> +}
>> +
>>   #ifdef CONFIG_DRM_FBDEV_EMULATION
>>   /*
>>    * Get kernel virtual address for CPU access.. this more or less only
>> diff --git a/drivers/gpu/drm/omapdrm/omap_gem.h 
>> b/drivers/gpu/drm/omapdrm/omap_gem.h
>> index eda9b48..3b61cfc 100644
>> --- a/drivers/gpu/drm/omapdrm/omap_gem.h
>> +++ b/drivers/gpu/drm/omapdrm/omap_gem.h
>> @@ -77,10 +77,11 @@ void omap_gem_dma_sync_buffer(struct 
>> drm_gem_object *obj,
>>   int omap_gem_get_pages(struct drm_gem_object *obj, struct page 
>> ***pages,
>>           bool remap);
>>   int omap_gem_put_pages(struct drm_gem_object *obj);
>> -
> 
> Extra change here.
> 

will remove that.

>>   u32 omap_gem_flags(struct drm_gem_object *obj);
>>   int omap_gem_rotated_dma_addr(struct drm_gem_object *obj, u32 orient,
>>           int x, int y, dma_addr_t *dma_addr);
>>   int omap_gem_tiled_stride(struct drm_gem_object *obj, u32 orient);
>> +struct sg_table *omap_gem_get_sg(struct drm_gem_object *obj);
>> +void omap_gem_put_sg(struct drm_gem_object *obj, struct sg_table *sgt);
>>   #endif /* __OMAPDRM_GEM_H__ */
>> diff --git a/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c 
>> b/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c
>> index f4cde3a..9650416 100644
>> --- a/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c
>> +++ b/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c
>> @@ -21,45 +21,21 @@ static struct sg_table *omap_gem_map_dma_buf(
>>   {
>>       struct drm_gem_object *obj = attachment->dmabuf->priv;
>>       struct sg_table *sg;
>> -    dma_addr_t dma_addr;
>> -    int ret;
>> -
>> -    sg = kzalloc(sizeof(*sg), GFP_KERNEL);
>> -    if (!sg)
>> -        return ERR_PTR(-ENOMEM);
>> -
>> -    /* camera, etc, need physically contiguous.. but we need a
>> -     * better way to know this..
>> -     */
>> -    ret = omap_gem_pin(obj, &dma_addr);
>> -    if (ret)
>> -        goto out;
>> -
>> -    ret = sg_alloc_table(sg, 1, GFP_KERNEL);
>> -    if (ret)
>> -        goto out;
>> -
>> -    sg_init_table(sg->sgl, 1);
>> -    sg_dma_len(sg->sgl) = obj->size;
>> -    sg_set_page(sg->sgl, pfn_to_page(PFN_DOWN(dma_addr)), obj->size, 0);
>> -    sg_dma_address(sg->sgl) = dma_addr;
>> +    sg = omap_gem_get_sg(obj);
>> +    if (IS_ERR(sg))
>> +        return sg;
>>       /* this must be after omap_gem_pin() to ensure we have pages 
>> attached */
>>       omap_gem_dma_sync_buffer(obj, dir);
>>       return sg;
>> -out:
>> -    kfree(sg);
>> -    return ERR_PTR(ret);
>>   }
>>   static void omap_gem_unmap_dma_buf(struct dma_buf_attachment 
>> *attachment,
>>           struct sg_table *sg, enum dma_data_direction dir)
>>   {
>>       struct drm_gem_object *obj = attachment->dmabuf->priv;
>> -    omap_gem_unpin(obj);
>> -    sg_free_table(sg);
>> -    kfree(sg);
>> +    omap_gem_put_sg(obj, sg);
>>   }
>>   static int omap_gem_dmabuf_begin_cpu_access(struct dma_buf *buffer,
>>

Thanks and regards,
Ivo
