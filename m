Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDBFD45D615
	for <lists+linux-omap@lfdr.de>; Thu, 25 Nov 2021 09:24:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348915AbhKYI1T (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 25 Nov 2021 03:27:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236936AbhKYIZT (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 25 Nov 2021 03:25:19 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 335FAC061759;
        Thu, 25 Nov 2021 00:22:07 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id 133so4855043wme.0;
        Thu, 25 Nov 2021 00:22:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=GLnm9zi48i6/vG3St69nSlo/eKNitOKOAXWlfhs3Yao=;
        b=dihoeS8MGh2Mpd5to4xDsIP9dyxZQyxLj1Ig5fd0aT4HpS09kSRIoHFrWKKIe3pnct
         7I/w6lI969DswbK2O4joolAuqdm6LYgHYlV4Tv2cTdXgYeYl81JROq71M8Suc4Mjf/RX
         R2lILO1vQuSM73MUGlRjKWDEbbnJ9801Mpmq03OMSZXydTfDxgoGuDzvIw+hnJFZTQLI
         gfhjyFqSQXbwJzsiNoIjkKWDizFngAY9PAzLNmJ4xlUV91tMSK58DoiDdaBRA6aYS4ye
         17/91zaRsN7Yxd24E0nFvEPFOC2aCYqrAb+j9u5d3RxXH0Sx36BRpzq0EfZJm7DZYnWn
         txMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GLnm9zi48i6/vG3St69nSlo/eKNitOKOAXWlfhs3Yao=;
        b=MDEfc+syBOhT9zNEFiPj0KezSuJVrC9Tkhk1Z7aWfj9Y0VTLQgPYj6HI8c5F+mV7Ot
         Z0rWTB0qCUTnhjABIhtglqbPhmOANex6H8uYdXF7ujxGP7njS/xPrkiHeueO7NoWN4Hb
         1trTLzxK2xCX7RKSNmgskVYV/b3p2mfedFEsxLhrWtXWfm9P7MT1AyJRbaYRyND33/7c
         juFuuby26oNI7OSbIim1QJdPhVT3P+DJKU/mAJ+QgvmhNHQJGLdLyGd/q7/unekn5q5A
         IzDxPkMXsiM6azbSjkCNxyjZsuEhJExyZf9MpDL9Cth/Hs8QeA7t7K5CSB1pdzC3J83d
         Lupw==
X-Gm-Message-State: AOAM533uAdbqE6Vv4BqxYYZftZYpPBDk9v78HEveuxi359BDRjnzs0O4
        rmw5xVHfTfwhDFeNbr8LFkg=
X-Google-Smtp-Source: ABdhPJzSYdaR/Z8PUuErDvdEOPTJ0kHaZGX3i7xTy7iDmRH0S0x6gxbd7vK6rd4yxWFBXnjR0EFWCA==
X-Received: by 2002:a05:600c:500d:: with SMTP id n13mr5044020wmr.174.1637828525725;
        Thu, 25 Nov 2021 00:22:05 -0800 (PST)
Received: from [192.168.1.10] ([46.249.74.23])
        by smtp.googlemail.com with ESMTPSA id n32sm9902900wms.1.2021.11.25.00.22.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 25 Nov 2021 00:22:05 -0800 (PST)
Subject: Re: [PATCH v3] drm: omapdrm: Export correct scatterlist for TILER
 backed BOs
To:     tomba@kernel.org, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     matthijsvanduin@gmail.com, airlied@linux.ie, daniel@ffwll.ch,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        merlijn@wizzup.org, philipp@uvos.xyz,
        laurent.pinchart@ideasonboard.com
References: <3e9307e5-1f03-9854-2b2b-859173e8f2ae@gmail.com>
 <1637309180-31032-1-git-send-email-ivo.g.dimitrov.75@gmail.com>
From:   Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Message-ID: <bf38f5c4-06d7-a140-4f25-38887f7781f3@gmail.com>
Date:   Thu, 25 Nov 2021 10:17:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Firefox/60.0 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1637309180-31032-1-git-send-email-ivo.g.dimitrov.75@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Gentle ping.

On 19.11.21 г. 10:06 ч., Ivaylo Dimitrov wrote:
> Memory of BOs backed by TILER is not contiguous, but omap_gem_map_dma_buf()
> exports it like it is. This leads to (possibly) invalid memory accesses if
> another device imports such a BO.
> 
> Fix that by providing sg that correctly describes TILER memory layout.
> Align TILER allocations to page, so importer to be able to correctly set
> its MMU if have one. Set export size accounting for the alignment. Also,
> make sure to destroy sg on unpin, as it is no longer valid.
> 
> Tested on Motorola Droid4 by using GPU (sgx540) to render.
> 
> Suggested-by: Matthijs van Duin <matthijsvanduin@gmail.com>
> Signed-off-by: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
> ---
>   drivers/gpu/drm/omapdrm/omap_gem.c        | 79 ++++++++++++++++++++++++++++++-
>   drivers/gpu/drm/omapdrm/omap_gem.h        |  2 +
>   drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c | 34 ++-----------
>   3 files changed, 85 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/omap_gem.c b/drivers/gpu/drm/omapdrm/omap_gem.c
> index 97e5fe6..54cb6ce 100644
> --- a/drivers/gpu/drm/omapdrm/omap_gem.c
> +++ b/drivers/gpu/drm/omapdrm/omap_gem.c
> @@ -800,7 +800,7 @@ int omap_gem_pin(struct drm_gem_object *obj, dma_addr_t *dma_addr)
>   			if (omap_obj->flags & OMAP_BO_TILED_MASK) {
>   				block = tiler_reserve_2d(fmt,
>   						omap_obj->width,
> -						omap_obj->height, 0);
> +						omap_obj->height, PAGE_SIZE);
>   			} else {
>   				block = tiler_reserve_1d(obj->size);
>   			}
> @@ -862,6 +862,11 @@ static void omap_gem_unpin_locked(struct drm_gem_object *obj)
>   		return;
>   
>   	if (refcount_dec_and_test(&omap_obj->dma_addr_cnt)) {
> +		if (omap_obj->sgt) {
> +			sg_free_table(omap_obj->sgt);
> +			kfree(omap_obj->sgt);
> +			omap_obj->sgt = NULL;
> +		}
>   		ret = tiler_unpin(omap_obj->block);
>   		if (ret) {
>   			dev_err(obj->dev->dev,
> @@ -974,6 +979,78 @@ int omap_gem_put_pages(struct drm_gem_object *obj)
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
> +	if (!sgt) {
> +		ret = -ENOMEM;
> +		goto err_unpin;
> +	}
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
> +		goto err_free;
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
> +err_free:
> +	kfree(sgt);
> +err_unpin:
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
> index eda9b48..19209e3 100644
> --- a/drivers/gpu/drm/omapdrm/omap_gem.h
> +++ b/drivers/gpu/drm/omapdrm/omap_gem.h
> @@ -82,5 +82,7 @@ int omap_gem_get_pages(struct drm_gem_object *obj, struct page ***pages,
>   int omap_gem_rotated_dma_addr(struct drm_gem_object *obj, u32 orient,
>   		int x, int y, dma_addr_t *dma_addr);
>   int omap_gem_tiled_stride(struct drm_gem_object *obj, u32 orient);
> +struct sg_table *omap_gem_get_sg(struct drm_gem_object *obj);
> +void omap_gem_put_sg(struct drm_gem_object *obj, struct sg_table *sgt);
>   
>   #endif /* __OMAPDRM_GEM_H__ */
> diff --git a/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c b/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c
> index f4cde3a..95a9a89 100644
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
> @@ -112,7 +88,7 @@ struct dma_buf *omap_gem_prime_export(struct drm_gem_object *obj, int flags)
>   	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
>   
>   	exp_info.ops = &omap_dmabuf_ops;
> -	exp_info.size = obj->size;
> +	exp_info.size = omap_gem_mmap_size(obj);
>   	exp_info.flags = flags;
>   	exp_info.priv = obj;
>   
> 
