Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E059344AEC8
	for <lists+linux-omap@lfdr.de>; Tue,  9 Nov 2021 14:31:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236686AbhKINeM (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 9 Nov 2021 08:34:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231612AbhKINeM (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 9 Nov 2021 08:34:12 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19253C061764
        for <linux-omap@vger.kernel.org>; Tue,  9 Nov 2021 05:31:26 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id d5so33031518wrc.1
        for <linux-omap@vger.kernel.org>; Tue, 09 Nov 2021 05:31:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=86AV8AGEuTtJ4QffylmpIPKjMvHuoI8bxs5hQf8llAY=;
        b=w9xzeAza8KlZFaX42qelc+S/cMdIW6ChIbaV1DojbWJGCo6izMck9QurORlvxNYCGl
         jUG7+qdVbnEaYxkBaAXheWPGbGsDPYH/kbaagSlzq9BG79Lnt1ocOi8Ou3GmDpjayisw
         7SXG4PPXVrnUvmFxtKSrq0S+/rGxj7Aptr29Oa/CjB9cvy+heJnXM6xzReA2FEWbPilU
         cNdI+hjqzrLnfjP/IWqqQc2lWFHhLhXpBcL9Frbe5GwnUd0Y54OkUzcj/9tAeOG8Meq3
         mJz5xRvEGLni6IiihikoAWsjrFuQMLrHW6g4fbUEQ6zKTDy0OwXJ7ADJFRvqzOyfJEdk
         AcJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=86AV8AGEuTtJ4QffylmpIPKjMvHuoI8bxs5hQf8llAY=;
        b=R6xgxQsaKKcKHZPzrmUboKSucJ6/c7mnnq3m6eKw7ijj/WmSxH1/UhEoaDWimVQB9O
         iY5Nhzpd7sHHFT0S9iwSSR2/+tjfVqUt4RNaFE0XYHGPh2DNsP3rt+o0rJk/Od2RPuPk
         Fdbz6MYVxoEcgLRoMn/LoZEQq896Xk7fobMci5yS1JftulIqRf8TMfmuB2j7lRuaTp1z
         WK2Kp6OOgdyK5iK46XoZsTLIY2joX1FBJoGjV1LphfDy5E3s6VGg3tOQKpRKPSorHtPV
         cG80dzNCEZzSReH6yeYJvMcNneT0f7c+920/fimIBZlMF/NC3kp8c59rEamM/Wj6MEb9
         v4XA==
X-Gm-Message-State: AOAM533QA9dBoEsnrlzkLdrYhUWUU7F18ZBi4qAxNWhIpI17ZHZtbxJp
        EY/LDE0/y34v/mX0bgT6Zim3OA==
X-Google-Smtp-Source: ABdhPJyGHoEJzjWdRkYqJG2Ek7+KWBAquFYh3T0VagyVJWHMCZtR7xbZfgCkAvAlNmTBhjyD2W3fUw==
X-Received: by 2002:adf:f90a:: with SMTP id b10mr9613473wrr.255.1636464684324;
        Tue, 09 Nov 2021 05:31:24 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:d284:de3f:b3d6:f714? ([2001:861:44c0:66c0:d284:de3f:b3d6:f714])
        by smtp.gmail.com with ESMTPSA id c15sm19538391wrs.19.2021.11.09.05.31.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Nov 2021 05:31:23 -0800 (PST)
Subject: Re: [PATCH v6 9/9] drm/omap: Add a 'right overlay' to plane state
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, khilman@baylibre.com,
        Benoit Parrot <bparrot@ti.com>
References: <20211018142842.2511200-1-narmstrong@baylibre.com>
 <20211018142842.2511200-10-narmstrong@baylibre.com>
 <8fbf92ae-3802-94b6-6ad8-af669974aaf1@ideasonboard.com>
From:   Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <ed30f74f-033f-6e53-9873-ac2abb7ece12@baylibre.com>
Date:   Tue, 9 Nov 2021 14:31:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <8fbf92ae-3802-94b6-6ad8-af669974aaf1@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

On 27/10/2021 14:50, Tomi Valkeinen wrote:
> On 18/10/2021 17:28, Neil Armstrong wrote:
>> From: Benoit Parrot <bparrot@ti.com>
>>
>> If the drm_plane has a source width that's greater than the max width
>> supported by a single hw overlay, then we assign a 'r_overlay' to it in
>> omap_plane_atomic_check().
>>
>> Both overlays should have the capabilities required to handle the source
>> framebuffer. The only parameters that vary between the left and right
>> hwoverlays are the src_w, crtc_w, src_x and crtc_x as we just even chop
>> the fb into left and right halves.
>>
>> We also take care of not creating odd width size when dealing with YUV
>> formats.
>>
>> Since both halves need to be 'appear' side by side the zpos is
>> recalculated when dealing with dual overlay cases so that the other
>> planes zpos is consistent.
>>
>> Depending on user space usage it is possible that on occasion the number
>> of requested planes exceeds the numbers of overlays required to display
>> them. In that case a failure would be returned for the plane that cannot
>> be handled at that time. It is up to user space to make sure the H/W
>> resource are not over-subscribed.
>>
>> Signed-off-by: Benoit Parrot <bparrot@ti.com>
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>> ---
>>   drivers/gpu/drm/omapdrm/omap_drv.c     |  91 ++++++++++++++++++-
>>   drivers/gpu/drm/omapdrm/omap_fb.c      |  33 ++++++-
>>   drivers/gpu/drm/omapdrm/omap_fb.h      |   4 +-
>>   drivers/gpu/drm/omapdrm/omap_overlay.c |  23 ++++-
>>   drivers/gpu/drm/omapdrm/omap_overlay.h |   3 +-
>>   drivers/gpu/drm/omapdrm/omap_plane.c   | 120 +++++++++++++++++++++++--
>>   drivers/gpu/drm/omapdrm/omap_plane.h   |   1 +
>>   7 files changed, 263 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm/omap_drv.c
>> index c7912374d393..f088b6313950 100644
>> --- a/drivers/gpu/drm/omapdrm/omap_drv.c
>> +++ b/drivers/gpu/drm/omapdrm/omap_drv.c
>> @@ -117,6 +117,95 @@ static void omap_atomic_commit_tail(struct drm_atomic_state *old_state)
>>       dispc_runtime_put(priv->dispc);
>>   }
>>   +static int drm_atomic_state_normalized_zpos_cmp(const void *a, const void *b)
>> +{
>> +    const struct drm_plane_state *sa = *(struct drm_plane_state **)a;
>> +    const struct drm_plane_state *sb = *(struct drm_plane_state **)b;
>> +
>> +    if (sa->normalized_zpos != sb->normalized_zpos)
>> +        return sa->normalized_zpos - sb->normalized_zpos;
>> +    else
>> +        return sa->plane->base.id - sb->plane->base.id;
>> +}
> 
> I think this, or the function below, needs a comment. I don't think it's obvious what's the logic here. It's mostly a copy of drm_atomic_normalize_zpos and drm_atomic_helper_crtc_normalize_zpos, if I'm not mistaken, it migth be good to point out what the difference is.

It's explained in the commit message:
>> Since both halves need to be 'appear' side by side the zpos is
>> recalculated when dealing with dual overlay cases so that the other
>> planes zpos is consistent.

Not sure what to add more, should I add it as comment in the code ?

> 
> I'm also wondering if these normalize_zpos functions should be split to a separate patch (without the is_omap_plane_dual_overlay call part).

It's tied to the introduction of 'right overlay', impossible to implement it without the
dual overlays functions and variables.

> 
>> +static int omap_atomic_update_normalize_zpos(struct drm_device *dev,
>> +                         struct drm_atomic_state *state)
>> +{
>> +    struct drm_crtc *crtc;
>> +    struct drm_crtc_state *old_state, *new_state;
>> +    struct drm_plane *plane;
>> +    int c, i, n, inc;
>> +    int total_planes = dev->mode_config.num_total_plane;
>> +    struct drm_plane_state **states;
>> +    int ret = 0;
>> +
>> +    states = kmalloc_array(total_planes, sizeof(*states), GFP_KERNEL);
>> +    if (!states)
>> +        return -ENOMEM;
>> +
>> +    for_each_oldnew_crtc_in_state(state, crtc, old_state, new_state, c) {
>> +        if (old_state->plane_mask == new_state->plane_mask &&
>> +            !new_state->zpos_changed)
>> +            continue;
>> +
>> +        /* Reset plane increment and index value for every crtc */
>> +        n = 0;
>> +
>> +        /*
>> +         * Normalization process might create new states for planes
>> +         * which normalized_zpos has to be recalculated.
>> +         */
>> +        drm_for_each_plane_mask(plane, dev, new_state->plane_mask) {
>> +            struct drm_plane_state *plane_state =
>> +                drm_atomic_get_plane_state(new_state->state,
>> +                               plane);
>> +            if (IS_ERR(plane_state)) {
>> +                ret = PTR_ERR(plane_state);
>> +                goto done;
>> +            }
>> +            states[n++] = plane_state;
>> +        }
>> +
>> +        sort(states, n, sizeof(*states),
>> +             drm_atomic_state_normalized_zpos_cmp, NULL);
>> +
>> +        for (i = 0, inc = 0; i < n; i++) {
>> +            plane = states[i]->plane;
>> +
>> +            states[i]->normalized_zpos = i + inc;
>> +            DRM_DEBUG_ATOMIC("[PLANE:%d:%s] updated normalized zpos value %d\n",
>> +                     plane->base.id, plane->name,
>> +                     states[i]->normalized_zpos);
>> +
>> +            if (is_omap_plane_dual_overlay(states[i]))
>> +                inc++;
>> +        }
>> +        new_state->zpos_changed = true;
>> +    }
>> +
>> +done:
>> +    kfree(states);
>> +    return ret;
>> +}
>> +
>> +static int omap_atomic_check(struct drm_device *dev,
>> +                 struct drm_atomic_state *state)
>> +{
>> +    int ret;
>> +
>> +    ret = drm_atomic_helper_check(dev, state);
>> +    if (ret)
>> +        return ret;
>> +
>> +    if (dev->mode_config.normalize_zpos) {
>> +        ret = omap_atomic_update_normalize_zpos(dev, state);
>> +        if (ret)
>> +            return ret;
>> +    }
>> +
>> +    return 0;
>> +}
>> +

[...]

Thanks,
Neil
