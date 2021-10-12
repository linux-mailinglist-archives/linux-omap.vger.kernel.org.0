Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7348F429FF0
	for <lists+linux-omap@lfdr.de>; Tue, 12 Oct 2021 10:32:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235058AbhJLIen (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 12 Oct 2021 04:34:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235038AbhJLIen (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 12 Oct 2021 04:34:43 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8463C06174E
        for <linux-omap@vger.kernel.org>; Tue, 12 Oct 2021 01:32:41 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id e12so64425553wra.4
        for <linux-omap@vger.kernel.org>; Tue, 12 Oct 2021 01:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=TUvSIx+nrfyYPNGrlh+HEvhLQMqFyypCkatTEBOgC1A=;
        b=yvLDtbHxxo/J71nwnAee2wOclnpODr0EGWyoNPotvIbZ01dnNmh8F4PsNCEsJL6S0w
         W5A6sGO9XV56ftXcfCFAInVUWO3VeaWdlokptY3TkG9cJVhxe+mMqsKliFGWLTGNdxzi
         akzQUhlPYRlpf/1J1rrPLdDjVMamHMYH0mAqr6EuNmvble4oq2vPEASYB+myF60EMMmo
         KMhns8x9qWt90hituMBKT2nXgGaFjFCTcZs+5sndsvNCIqtIsQ0FRETtnbkUKk9qEPvV
         i7824IGJnTE4QigqBP/2sRzhbJakYfaCKBqFFteTMfZyueIzTVuSc6bxWkxApHSjuQ66
         wnjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=TUvSIx+nrfyYPNGrlh+HEvhLQMqFyypCkatTEBOgC1A=;
        b=PX1Jt2Scpte0FiGJR9lDoOMHZHQTpOl7oBtD+Uhkqxwn88pTR02iMSe7t7ir+k1xFQ
         WwR+jO+O9gpmMgG7xZwE898CnfTh9gYLwG1jgb8zXRy/W59JaAFhEgobMACkD0JKLuqZ
         MS4R5lG4rYnNloQwyEOOZJfy3mOOZHzqZCVFYK+UjSeMEXAnl9rHh/BKd4WS7IdWCCZ1
         zNmNeaDIva1P8s2fQgin6gJ7DQDtsXBwVIjBPYtKJmk33LNYLvd6PDl6VlwiKI+RpJqj
         SnfAKhBHXXkw6diO9YFrTXGT6jdTTqtMVK58p6KtajeAO8hEg7lmYcgbqADSWTZqVqx+
         36eA==
X-Gm-Message-State: AOAM532etyz/XVV8EpfMfvLzv1F3a9k3bJ2wmob7dHyrWZ8swD1Q1Bvk
        /ltZKp7wbuYr9lwNdHEKT6Ywvw==
X-Google-Smtp-Source: ABdhPJys+AfHSh2FLnnU4+TSJPZxDv4GfchwIW+uyZysUWlrSxNUDLydalAPW7Dgjtwxm/PJmSSzPw==
X-Received: by 2002:a5d:47ad:: with SMTP id 13mr29068984wrb.385.1634027559992;
        Tue, 12 Oct 2021 01:32:39 -0700 (PDT)
Received: from ?IPv6:2001:861:44c0:66c0:4e93:9fa7:4d66:4f5c? ([2001:861:44c0:66c0:4e93:9fa7:4d66:4f5c])
        by smtp.gmail.com with ESMTPSA id s186sm2031249wme.14.2021.10.12.01.32.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Oct 2021 01:32:39 -0700 (PDT)
Subject: Re: [PATCH v5 1/8] drm/omap: Add ability to check if requested plane
 modes can be supported
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, khilman@baylibre.com,
        Benoit Parrot <bparrot@ti.com>
References: <20210923070701.145377-1-narmstrong@baylibre.com>
 <20210923070701.145377-2-narmstrong@baylibre.com>
 <e69a1c23-3ea2-9777-c251-b5afd1cf4590@ideasonboard.com>
From:   Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <b2a7d92a-7e9d-14e2-387f-beaf589f360a@baylibre.com>
Date:   Tue, 12 Oct 2021 10:32:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <e69a1c23-3ea2-9777-c251-b5afd1cf4590@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 12/10/2021 09:21, Tomi Valkeinen wrote:
> Hi,
> 
> On 23/09/2021 10:06, Neil Armstrong wrote:
>> From: Benoit Parrot <bparrot@ti.com>
>>
>> We currently assume that an overlay has the same maximum width and
>> maximum height as the overlay manager. This assumption is incorrect. On
>> some variants the overlay manager maximum width is twice the maximum
>> width that the overlay can handle. We need to add the appropriate data
>> per variant as well as export a helper function to retrieve the data so
>> check can be made dynamically in omap_plane_atomic_check().
>>
>> Signed-off-by: Benoit Parrot <bparrot@ti.com>
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>> ---
>>   drivers/gpu/drm/omapdrm/dss/dispc.c  | 22 ++++++++++++++++++++++
>>   drivers/gpu/drm/omapdrm/dss/dss.h    |  2 ++
>>   drivers/gpu/drm/omapdrm/omap_plane.c | 14 ++++++++++++++
>>   3 files changed, 38 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/omapdrm/dss/dispc.c b/drivers/gpu/drm/omapdrm/dss/dispc.c
>> index 3c4a4991e45a..bdecec8f4d88 100644
>> --- a/drivers/gpu/drm/omapdrm/dss/dispc.c
>> +++ b/drivers/gpu/drm/omapdrm/dss/dispc.c
>> @@ -92,6 +92,8 @@ struct dispc_features {
>>       u8 mgr_height_start;
>>       u16 mgr_width_max;
>>       u16 mgr_height_max;
>> +    u16 ovl_width_max;
>> +    u16 ovl_height_max;
>>       unsigned long max_lcd_pclk;
>>       unsigned long max_tv_pclk;
>>       unsigned int max_downscale;
>> @@ -2599,6 +2601,12 @@ static int dispc_ovl_calc_scaling(struct dispc_device *dispc,
>>       return 0;
>>   }
>>   +void dispc_ovl_get_max_size(struct dispc_device *dispc, u16 *width, u16 *height)
>> +{
>> +    *width = dispc->feat->ovl_width_max;
>> +    *height = dispc->feat->ovl_height_max;
>> +}
>> +
>>   static int dispc_ovl_setup_common(struct dispc_device *dispc,
>>                     enum omap_plane_id plane,
>>                     enum omap_overlay_caps caps,
>> @@ -4240,6 +4248,8 @@ static const struct dispc_features omap24xx_dispc_feats = {
>>       .mgr_height_start    =    26,
>>       .mgr_width_max        =    2048,
>>       .mgr_height_max        =    2048,
>> +    .ovl_width_max        =    2048,
>> +    .ovl_height_max        =    2048,
>>       .max_lcd_pclk        =    66500000,
>>       .max_downscale        =    2,
>>       /*
>> @@ -4278,6 +4288,8 @@ static const struct dispc_features omap34xx_rev1_0_dispc_feats = {
>>       .mgr_height_start    =    26,
>>       .mgr_width_max        =    2048,
>>       .mgr_height_max        =    2048,
>> +    .ovl_width_max        =    2048,
>> +    .ovl_height_max        =    2048,
>>       .max_lcd_pclk        =    173000000,
>>       .max_tv_pclk        =    59000000,
>>       .max_downscale        =    4,
>> @@ -4313,6 +4325,8 @@ static const struct dispc_features omap34xx_rev3_0_dispc_feats = {
>>       .mgr_height_start    =    26,
>>       .mgr_width_max        =    2048,
>>       .mgr_height_max        =    2048,
>> +    .ovl_width_max        =    2048,
>> +    .ovl_height_max        =    2048,
>>       .max_lcd_pclk        =    173000000,
>>       .max_tv_pclk        =    59000000,
>>       .max_downscale        =    4,
>> @@ -4348,6 +4362,8 @@ static const struct dispc_features omap36xx_dispc_feats = {
>>       .mgr_height_start    =    26,
>>       .mgr_width_max        =    2048,
>>       .mgr_height_max        =    2048,
>> +    .ovl_width_max        =    2048,
>> +    .ovl_height_max        =    2048,
>>       .max_lcd_pclk        =    173000000,
>>       .max_tv_pclk        =    59000000,
>>       .max_downscale        =    4,
>> @@ -4383,6 +4399,8 @@ static const struct dispc_features am43xx_dispc_feats = {
>>       .mgr_height_start    =    26,
>>       .mgr_width_max        =    2048,
>>       .mgr_height_max        =    2048,
>> +    .ovl_width_max        =    2048,
>> +    .ovl_height_max        =    2048,
>>       .max_lcd_pclk        =    173000000,
>>       .max_tv_pclk        =    59000000,
>>       .max_downscale        =    4,
>> @@ -4418,6 +4436,8 @@ static const struct dispc_features omap44xx_dispc_feats = {
>>       .mgr_height_start    =    26,
>>       .mgr_width_max        =    2048,
>>       .mgr_height_max        =    2048,
>> +    .ovl_width_max        =    2048,
>> +    .ovl_height_max        =    2048,
>>       .max_lcd_pclk        =    170000000,
>>       .max_tv_pclk        =    185625000,
>>       .max_downscale        =    4,
>> @@ -4457,6 +4477,8 @@ static const struct dispc_features omap54xx_dispc_feats = {
>>       .mgr_height_start    =    27,
>>       .mgr_width_max        =    4096,
>>       .mgr_height_max        =    4096,
>> +    .ovl_width_max        =    2048,
>> +    .ovl_height_max        =    4096,
>>       .max_lcd_pclk        =    170000000,
>>       .max_tv_pclk        =    192000000,
>>       .max_downscale        =    4,
>> diff --git a/drivers/gpu/drm/omapdrm/dss/dss.h b/drivers/gpu/drm/omapdrm/dss/dss.h
>> index a547527bb2f3..14c39f7c3988 100644
>> --- a/drivers/gpu/drm/omapdrm/dss/dss.h
>> +++ b/drivers/gpu/drm/omapdrm/dss/dss.h
>> @@ -397,6 +397,8 @@ int dispc_get_num_mgrs(struct dispc_device *dispc);
>>   const u32 *dispc_ovl_get_color_modes(struct dispc_device *dispc,
>>                           enum omap_plane_id plane);
>>   +void dispc_ovl_get_max_size(struct dispc_device *dispc, u16 *width, u16 *height);
>> +
>>   u32 dispc_read_irqstatus(struct dispc_device *dispc);
>>   void dispc_clear_irqstatus(struct dispc_device *dispc, u32 mask);
>>   void dispc_write_irqenable(struct dispc_device *dispc, u32 mask);
>> diff --git a/drivers/gpu/drm/omapdrm/omap_plane.c b/drivers/gpu/drm/omapdrm/omap_plane.c
>> index 512af976b7e9..d0a67b7ed1a0 100644
>> --- a/drivers/gpu/drm/omapdrm/omap_plane.c
>> +++ b/drivers/gpu/drm/omapdrm/omap_plane.c
>> @@ -109,11 +109,18 @@ static int omap_plane_atomic_check(struct drm_plane *plane,
>>   {
>>       struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
>>                                            plane);
>> +    struct omap_drm_private *priv = plane->dev->dev_private;
>>       struct drm_crtc_state *crtc_state;
>> +    u16 width, height;
>> +    u32 width_fp, height_fp;
> 
> I think naming these max_w/max_width etc. would be better.

Ack

Neil

> 
>  Tomi

