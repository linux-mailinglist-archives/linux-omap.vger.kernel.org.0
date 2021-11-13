Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F01AB44F25A
	for <lists+linux-omap@lfdr.de>; Sat, 13 Nov 2021 10:49:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235040AbhKMJwg (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 13 Nov 2021 04:52:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234951AbhKMJwg (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 13 Nov 2021 04:52:36 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05630C061766;
        Sat, 13 Nov 2021 01:49:44 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id v11so47924885edc.9;
        Sat, 13 Nov 2021 01:49:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=914JQcVroJbpZYKQ4Jy9MJ/ZR0rlLirnVaDTtJoUeSk=;
        b=khX0C+MDsB5fjI3RF3CB7Sb3hZOD+o+UAcbadbLusVg9DsggfVyoiJlyWkdfngIuCJ
         /Oe+qMvTDHbv/bHWMwjm/ijv76PGXnI7ktZUzlvcrLnS5grZuvKOecSs8Qswlat1UH+3
         4mwYDB8HKK0Akb8wKqgSMArp/0kms9Z7NEZnTEIXLrR65KCWVegEo065ZPHRRQjm2gEn
         o0nCUSiOi6gH1NRBcH1+7t3nsANqihHYpyq1UppRH1KJ4N+zznCx0K6aomwbnGt62QCf
         eiUEspFN6K0X3iuz6324JURS1M0Av0W+QK65PmKzv+V235Fl547Nt5ebkmO2N+6H1QIj
         PbCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=914JQcVroJbpZYKQ4Jy9MJ/ZR0rlLirnVaDTtJoUeSk=;
        b=j+y2xSjkJ+I1JPIH61a7yxRSibSNdN33WUydMopluO+9t2H8zpRDa3Hd8mv1nx1pkZ
         bbVeG46AGCkf8+aL2/ujkdGcH46/3n6rIlZUigP2GeQZNQ+d/DpYzgXks0QaWZruX/Mk
         y7ghM/XM21BSPYoo1WNpuGFpYrOUS1v3UFey5HsTqLpfWHkdSVo0/a/+4GdQXSP7hqMs
         E5e/SvIUNWsAYldNOU/NkXuILIOOv1bH9uIq1p3EBXnU+z08Mcwn8SwG9XNUsfU8Dw7l
         bslnoXYKDEjA9v+ZKOaiCd73lEuRitoHZ4Fq7oi43Q9JIiwMETJ0+iSDBXRyGXxILqD1
         hdXA==
X-Gm-Message-State: AOAM533JT2GfFC47pR6E/Jlvt8SunQv0T/m0EnfyfU/JNOYrQn87w0rM
        XVOuUqeNhyfSgogMD4K28o6PWWpQ5FY=
X-Google-Smtp-Source: ABdhPJwPp5anwiNlgY1l+0IHQiB2pV6VaVSst1Iu2ZlHRPD6w1FSaScAT016N3IbKfgIvs4wBlu1YQ==
X-Received: by 2002:a17:906:6087:: with SMTP id t7mr28088858ejj.206.1636796982565;
        Sat, 13 Nov 2021 01:49:42 -0800 (PST)
Received: from [192.168.1.10] ([46.249.74.23])
        by smtp.googlemail.com with ESMTPSA id h6sm2660473edz.40.2021.11.13.01.49.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 13 Nov 2021 01:49:42 -0800 (PST)
Subject: Re: [PATCH] drm: omapdrm: Export correct scatterlist for TILER backed
 BOs
To:     tomba@kernel.org
Cc:     matthijsvanduin@gmail.com, airlied@linux.ie, daniel@ffwll.ch,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
References: <1636796417-5997-1-git-send-email-ivo.g.dimitrov.75@gmail.com>
From:   Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Message-ID: <97d93e97-8a54-c8f8-f235-c84e11f83d9c@gmail.com>
Date:   Sat, 13 Nov 2021 11:45:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Firefox/60.0 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1636796417-5997-1-git-send-email-ivo.g.dimitrov.75@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 13.11.21 г. 11:40 ч., Ivaylo Dimitrov wrote:
> Memory of BOs backed by TILER is not contiguous, but omap_gem_map_dma_buf()
> exports it like it is. This leads to (possibly) invalid memory accesses if
> another device imports such a BO.
> 
> Fix that by providing a scatterlist that correctly describes TILER memory
> layout.
> 
> Suggested-by: Matthijs van Duin <matthijsvanduin@gmail.com>
> Signed-off-by: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
> ---
>   drivers/gpu/drm/omapdrm/omap_gem.c        | 78 ++++++++++++++++++++++++++++++-
>   drivers/gpu/drm/omapdrm/omap_gem.h        |  3 +-
>   drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c | 32 ++-----------
>   3 files changed, 83 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/omap_gem.c b/drivers/gpu/drm/omapdrm/omap_gem.c
> index 97e5fe6..a1a18bb 100644
> --- a/drivers/gpu/drm/omapdrm/omap_gem.c
> +++ b/drivers/gpu/drm/omapdrm/omap_gem.c
> @@ -48,7 +48,7 @@ struct omap_gem_object {
>   	 *   OMAP_BO_MEM_DMA_API flag set)
>   	 *
>   	 * - buffers imported from dmabuf (with the OMAP_BO_MEM_DMABUF flag set)
> -	 *   if they are physically contiguous (when sgt->orig_nents == 1)
> +	 *   if they are physically contiguous (when sgt->nents == 1)
>   	 *

Ugh, this should not be here, will send new patch

>   	 * - buffers mapped through the TILER when dma_addr_cnt is not zero, in
>   	 *   which case the DMA address points to the TILER aperture
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
