Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3874843CA03
	for <lists+linux-omap@lfdr.de>; Wed, 27 Oct 2021 14:46:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242008AbhJ0MtM (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 27 Oct 2021 08:49:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240356AbhJ0MtL (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 27 Oct 2021 08:49:11 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51E9AC061570
        for <linux-omap@vger.kernel.org>; Wed, 27 Oct 2021 05:46:46 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id 131-20020a1c0489000000b0032cca9883b5so4876472wme.0
        for <linux-omap@vger.kernel.org>; Wed, 27 Oct 2021 05:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MpaJyX5zCorSGoJdZD4lCOmC8oZ3HzkpJbp1UDR5foE=;
        b=Dju3GL58M2PKH/L0/11HSg8MvprD+864BIxCnhj9V8CrNHMVTfxPh2/mk9i9bD85iQ
         5GTSVDg8d5QTOiwNavha2AfB1oVD5hDwo0uScRqq5h6qROjQCvfO6Yjs78Lgdpoo7pj7
         vXpHGx4N/qyWTequyJJJfjQIXCbQv5i8Yc6KS1AVXPVdT62kUkLsAnyj34fwaQlEZ8kz
         q/chbg+9P2h9byKvCgnM7rm5xviv2bqqJPA8mBNvBV7T2H0PYGIPiT0zlgBPQeJBYzjq
         /9wBl4ygPVO/ht78eB6rPRNjQuK/YwNufA2HXrz1bRkW62YBI19gXTCc+fe9wIVtFxov
         tKcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=MpaJyX5zCorSGoJdZD4lCOmC8oZ3HzkpJbp1UDR5foE=;
        b=Hr9ElnP8fl+lSIXQpJUtGfFDF5Pjw87JBXhttUBo8cAqH0+rJSnGPh7p90S4xSl+Vh
         Ks4ii+N3hU4MQcEPo/7m13ghQ0FhsP2HMNhnLGMtNZiUyJqxkbPH3ocMt+MMoJKTKqk2
         TuhspwspdbTI+aid0BhvusKwFtoM1bHVvrnccWW0/RS2C1dIBnG7Ot/J8/MROtclmACw
         HweRB0c+TEZ+BdQbm5dc0SvgCVgpJV9klnRy4AxYVAqOanwNMTsGXtX7M/GJB8VD/rsQ
         gJXj8JnGPX1PepeEzFtemoGYHxtcpi2izFK2G+aNVifKvAj+nWGimEKaHfLEsBtsgfYA
         FCJA==
X-Gm-Message-State: AOAM531qyBtqOxUFklapbMZXWVH6Tquk8WdX4llGLLJd71p+SzznOtG7
        qungrxc/2Oh012oyqIMv8xmecw==
X-Google-Smtp-Source: ABdhPJyiQ/EmFf+jGp17AcccZjBNXoKSkOzJQ4YBkjnhw0iz/D9HlEXnnj8X7t7V+Qp/nBD3AYIYrA==
X-Received: by 2002:a05:600c:19d3:: with SMTP id u19mr5315391wmq.164.1635338804779;
        Wed, 27 Oct 2021 05:46:44 -0700 (PDT)
Received: from [172.20.10.7] ([37.166.181.245])
        by smtp.gmail.com with ESMTPSA id z6sm4185332wmp.1.2021.10.27.05.46.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Oct 2021 05:46:44 -0700 (PDT)
Subject: Re: [PATCH v6 8/9] drm/omap: add plane_atomic_print_state support
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, khilman@baylibre.com,
        Benoit Parrot <bparrot@ti.com>
References: <20211018142842.2511200-1-narmstrong@baylibre.com>
 <20211018142842.2511200-9-narmstrong@baylibre.com>
 <70a29d4d-eaab-5162-58b7-df9d9d3e7a9b@ideasonboard.com>
From:   Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <0423c635-7121-b603-a52c-c68dde4c8c30@baylibre.com>
Date:   Wed, 27 Oct 2021 14:46:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <70a29d4d-eaab-5162-58b7-df9d9d3e7a9b@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 27/10/2021 14:23, Tomi Valkeinen wrote:
> On 18/10/2021 17:28, Neil Armstrong wrote:
>> From: Benoit Parrot <bparrot@ti.com>
>>
>> Now that we added specific item to our subclassed drm_plane_state
>> we can add omap_plane_atomic_print_state() helper to dump out our own
>> driver specific plane state.
>>
>> Signed-off-by: Benoit Parrot <bparrot@ti.com>
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>> ---
>>   drivers/gpu/drm/omapdrm/omap_plane.c | 16 ++++++++++++++++
>>   1 file changed, 16 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/omapdrm/omap_plane.c b/drivers/gpu/drm/omapdrm/omap_plane.c
>> index ce5ed45401fb..5001c8354e4f 100644
>> --- a/drivers/gpu/drm/omapdrm/omap_plane.c
>> +++ b/drivers/gpu/drm/omapdrm/omap_plane.c
>> @@ -348,6 +348,21 @@ omap_plane_atomic_duplicate_state(struct drm_plane *plane)
>>       return &state->base;
>>   }
>>   +static void omap_plane_atomic_print_state(struct drm_printer *p,
>> +                      const struct drm_plane_state *state)
>> +{
>> +    struct omap_plane_state *omap_state = to_omap_plane_state(state);
>> +
>> +    drm_printf(p, "\toverlay=%s\n", omap_state->overlay ?
>> +                    omap_state->overlay->name : "(null)");
>> +    if (omap_state->overlay) {
>> +        drm_printf(p, "\t\tidx=%d\n", omap_state->overlay->idx);
>> +        drm_printf(p, "\t\toverlay_id=%d\n",
>> +               omap_state->overlay->id);
>> +        drm_printf(p, "\t\tcaps=0x%x\n", omap_state->overlay->caps);
>> +    }
>> +}
> 
> This prints:
> 
>         overlay=gfx
>                 idx=0
>                 overlay_id=0
>                 caps=0x3e
> 
> I'm not sure if some of these details are needed. The name ("gfx") and overlay_id refer to the same thing, and while idx is in theory a different value, in practice it's always the same as overlay_id. And even if it was a different number, I think idx is kind of irrelevant, isn't it?
> 
> caps can be figured out from the name of the overlay, but perhaps it doesn't hurt to print them here. Then again, if none of the other debug prints show the cap values (e.g. "requires cap 0x4), maybe printing the caps value is not really useful here.
> 
> Maybe this could be just a single line, say:
> 
> overlay=gfx
> 
> or if caps is useful:
> 
> overlay=gfx (caps=0x3e)
> 
> What do you think?

I'm ok with that.

Thanks,
Neil

> 
>  Tomi

