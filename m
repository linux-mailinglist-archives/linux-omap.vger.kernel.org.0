Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36B6445002B
	for <lists+linux-omap@lfdr.de>; Mon, 15 Nov 2021 09:43:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230191AbhKOIpw (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 15 Nov 2021 03:45:52 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:38320 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236993AbhKOIpp (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 15 Nov 2021 03:45:45 -0500
Received: from [192.168.1.111] (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A475D9CA;
        Mon, 15 Nov 2021 09:42:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1636965766;
        bh=R5m7krlEredtuMgQMY3FQqbB6SYhti84Tpe3/vW7WBk=;
        h=To:Cc:References:From:Subject:Date:In-Reply-To:From;
        b=N5IdQ4rc2A0y/7/pfdgbWDRhjbcgqljuAM/uiZQVreuFpTLvO6UzQ1nhDb7DWHWzz
         CMsvRg0hDlgPk5dR2VyjWkhxq34k3gfBmtBrscX7OHS7Fu2W54lIrpLW9pIXpEn4rA
         uNOsk2Vrr/70q/dMeeT47QtiB9SMLWnfjITrFZpc=
To:     Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Cc:     matthijsvanduin@gmail.com, airlied@linux.ie, daniel@ffwll.ch,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <1636796417-5997-1-git-send-email-ivo.g.dimitrov.75@gmail.com>
 <1636797239-6384-1-git-send-email-ivo.g.dimitrov.75@gmail.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v2] drm: omapdrm: Export correct scatterlist for TILER
 backed BOs
Message-ID: <36598203-eced-131d-85ef-f4940872e751@ideasonboard.com>
Date:   Mon, 15 Nov 2021 10:42:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1636797239-6384-1-git-send-email-ivo.g.dimitrov.75@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

On 13/11/2021 11:53, Ivaylo Dimitrov wrote:
> Memory of BOs backed by TILER is not contiguous, but omap_gem_map_dma_buf()
> exports it like it is. This leads to (possibly) invalid memory accesses if
> another device imports such a BO.

This is one reason why TILER hasn't been officially supported. But the 
above is not exactly right, or at least not the whole truth.

A BO's memory via the TILER memory is contiguous, although with 
consistent gaps of memory that should not be accessed. That point is 
important, as the IPs that might use TILER backed BOs only support 
contiguous memory.

This means that the drivers for such IPs cannot use the BOs exported 
like you do in this patch. I believe the drivers could be improved by 
writing a helper function which studies the sg_table and concludes that 
it's actually contiguous. I think we should have at least one such 
driver fixed along with this patch so that we can be more confident that 
this actually works.

But I'm not sure what that driver would be on droid4. I have DRA7 boards 
which have VIP, CAL and VPE that I can use here. Perhaps it wouldn't be 
too much effort for me to extend my tests a bit to include CAL, and try 
to fix the driver. I just fear the driver changes won't be trivial.

Did you test this somehow?

Did you look at the userspace mmap of TILER buffers? I wonder if that 
goes correctly or not. Isn't memory to userspace mapped per page, and 
lengths of the TILER lines are not page aligned?

> Fix that by providing a scatterlist that correctly describes TILER memory
> layout.
> 
> Suggested-by: Matthijs van Duin <matthijsvanduin@gmail.com>
> Signed-off-by: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
> ---
>   drivers/gpu/drm/omapdrm/omap_gem.c        | 76 +++++++++++++++++++++++++++++++
>   drivers/gpu/drm/omapdrm/omap_gem.h        |  3 +-
>   drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c | 32 ++-----------
>   3 files changed, 82 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/omap_gem.c b/drivers/gpu/drm/omapdrm/omap_gem.c
> index 97e5fe6..2ffcc37 100644
> --- a/drivers/gpu/drm/omapdrm/omap_gem.c
> +++ b/drivers/gpu/drm/omapdrm/omap_gem.c
> @@ -862,6 +862,11 @@ static void omap_gem_unpin_locked(struct drm_gem_object *obj)
>   		return;
>   
>   	if (refcount_dec_and_test(&omap_obj->dma_addr_cnt)) {
> +		if (omap_obj->sgt) {
> +			sg_free_table(omap_obj->sgt);
> +			kfree(omap_obj->sgt);
> +			omap_obj->sgt = NULL;
> +		}

This behavior is different than before, isn't it? The commit desc only 
mentions changing the construction of the sg-list, not how they're 
allocated and freed.

>   		ret = tiler_unpin(omap_obj->block);
>   		if (ret) {
>   			dev_err(obj->dev->dev,
> @@ -974,6 +979,77 @@ int omap_gem_put_pages(struct drm_gem_object *obj)
>   	return 0;
>   }
>   
> +struct sg_table *omap_gem_get_sg(struct drm_gem_object *obj)
> +{
> +	struct omap_gem_object *omap_obj = to_omap_bo(obj);
> +	dma_addr_t addr;
> +	struct sg_table *sgt;
> +	struct scatterlist *sg;
> +	unsigned int count, len, stride, i;
> +	int ret;
> +
> +	ret = omap_gem_pin(obj, &addr);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	mutex_lock(&omap_obj->lock);
> +
> +	sgt = omap_obj->sgt;
> +	if (sgt)
> +		goto out;
> +
> +	sgt = kzalloc(sizeof(*sgt), GFP_KERNEL);
> +	ret = -ENOMEM;
> +	if (!sgt)
> +		goto out_unpin;

I think you can move the ret = ... to be inside the if block.

> +
> +	if (omap_obj->flags & OMAP_BO_TILED_MASK) {
> +		enum tiler_fmt fmt = gem2fmt(omap_obj->flags);
> +
> +		len = omap_obj->width << (int)fmt;
> +		count = omap_obj->height;
> +		stride = tiler_stride(fmt, 0);
> +	} else {
> +		len = obj->size;
> +		count = 1;
> +		stride = 0;
> +	}
> +
> +	ret = sg_alloc_table(sgt, count, GFP_KERNEL);
> +	if (ret)
> +		goto out_free;
> +
> +	for_each_sg(sgt->sgl, sg, count, i) {
> +		sg_set_page(sg, phys_to_page(addr), len, offset_in_page(addr));
> +		sg_dma_address(sg) = addr;
> +		sg_dma_len(sg) = len;
> +
> +		addr += stride;
> +	}
> +
> +	omap_obj->sgt = sgt;
> +out:
> +	mutex_unlock(&omap_obj->lock);
> +	return sgt;
> +
> +out_free:
> +	kfree(sgt);
> +out_unpin:

There are errors handlers, I suggest err_ prefix.

> +	mutex_unlock(&omap_obj->lock);
> +	omap_gem_unpin(obj);
> +	return ERR_PTR(ret);
> +}
> +
> +void omap_gem_put_sg(struct drm_gem_object *obj, struct sg_table *sgt)
> +{
> +	struct omap_gem_object *omap_obj = to_omap_bo(obj);
> +
> +	if (WARN_ON(omap_obj->sgt != sgt))
> +		return;
> +
> +	omap_gem_unpin(obj);
> +}
> +
>   #ifdef CONFIG_DRM_FBDEV_EMULATION
>   /*
>    * Get kernel virtual address for CPU access.. this more or less only
> diff --git a/drivers/gpu/drm/omapdrm/omap_gem.h b/drivers/gpu/drm/omapdrm/omap_gem.h
> index eda9b48..3b61cfc 100644
> --- a/drivers/gpu/drm/omapdrm/omap_gem.h
> +++ b/drivers/gpu/drm/omapdrm/omap_gem.h
> @@ -77,10 +77,11 @@ void omap_gem_dma_sync_buffer(struct drm_gem_object *obj,
>   int omap_gem_get_pages(struct drm_gem_object *obj, struct page ***pages,
>   		bool remap);
>   int omap_gem_put_pages(struct drm_gem_object *obj);
> -

Extra change here.

>   u32 omap_gem_flags(struct drm_gem_object *obj);
>   int omap_gem_rotated_dma_addr(struct drm_gem_object *obj, u32 orient,
>   		int x, int y, dma_addr_t *dma_addr);
>   int omap_gem_tiled_stride(struct drm_gem_object *obj, u32 orient);
> +struct sg_table *omap_gem_get_sg(struct drm_gem_object *obj);
> +void omap_gem_put_sg(struct drm_gem_object *obj, struct sg_table *sgt);
>   
>   #endif /* __OMAPDRM_GEM_H__ */
> diff --git a/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c b/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c
> index f4cde3a..9650416 100644
> --- a/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c
> +++ b/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c
> @@ -21,45 +21,21 @@ static struct sg_table *omap_gem_map_dma_buf(
>   {
>   	struct drm_gem_object *obj = attachment->dmabuf->priv;
>   	struct sg_table *sg;
> -	dma_addr_t dma_addr;
> -	int ret;
> -
> -	sg = kzalloc(sizeof(*sg), GFP_KERNEL);
> -	if (!sg)
> -		return ERR_PTR(-ENOMEM);
> -
> -	/* camera, etc, need physically contiguous.. but we need a
> -	 * better way to know this..
> -	 */
> -	ret = omap_gem_pin(obj, &dma_addr);
> -	if (ret)
> -		goto out;
> -
> -	ret = sg_alloc_table(sg, 1, GFP_KERNEL);
> -	if (ret)
> -		goto out;
> -
> -	sg_init_table(sg->sgl, 1);
> -	sg_dma_len(sg->sgl) = obj->size;
> -	sg_set_page(sg->sgl, pfn_to_page(PFN_DOWN(dma_addr)), obj->size, 0);
> -	sg_dma_address(sg->sgl) = dma_addr;
> +	sg = omap_gem_get_sg(obj);
> +	if (IS_ERR(sg))
> +		return sg;
>   
>   	/* this must be after omap_gem_pin() to ensure we have pages attached */
>   	omap_gem_dma_sync_buffer(obj, dir);
>   
>   	return sg;
> -out:
> -	kfree(sg);
> -	return ERR_PTR(ret);
>   }
>   
>   static void omap_gem_unmap_dma_buf(struct dma_buf_attachment *attachment,
>   		struct sg_table *sg, enum dma_data_direction dir)
>   {
>   	struct drm_gem_object *obj = attachment->dmabuf->priv;
> -	omap_gem_unpin(obj);
> -	sg_free_table(sg);
> -	kfree(sg);
> +	omap_gem_put_sg(obj, sg);
>   }
>   
>   static int omap_gem_dmabuf_begin_cpu_access(struct dma_buf *buffer,
> 
