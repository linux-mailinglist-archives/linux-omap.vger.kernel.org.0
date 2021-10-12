Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2881242A584
	for <lists+linux-omap@lfdr.de>; Tue, 12 Oct 2021 15:23:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236640AbhJLNZG (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 12 Oct 2021 09:25:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236692AbhJLNZF (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 12 Oct 2021 09:25:05 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E266BC06161C
        for <linux-omap@vger.kernel.org>; Tue, 12 Oct 2021 06:23:03 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id r10so66999443wra.12
        for <linux-omap@vger.kernel.org>; Tue, 12 Oct 2021 06:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YTaDn2p7VZ92sBtgQtYNbQCTZ1WpJ/csOglKb3v7qtk=;
        b=qFdM3wTDBfuNv5JxSuq6lSdFJrwntH4ICGRNfvUUktT+fPFwZj49/CcIKO+D08vGjb
         O9Z8e+DnniJm1vkFiKiDwOsWxPJMdq0S6moTaqYQw+ztEZ6ujf2sYcPQIADPzmPO+WHl
         z4ebD2YVQVi/wkg6Jc57cJrnMZGzUuz3nad75nU8Zh7d9yt4IsVDRs1SjyZFH53orTrR
         KmHmTlfqlQ3CkWdD2p3v5PWu12C4VfYCSBy8KR/IAZ+scqWumsFGpXigJoWV5u9Y3mm5
         v5lwk0zTJNC6UHXVn/6f+7VEaGk6u8uK7KBDJeDt3Ga7yZYMsNHeVWPbTvMjVjYhoNs5
         IreQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=YTaDn2p7VZ92sBtgQtYNbQCTZ1WpJ/csOglKb3v7qtk=;
        b=tt0KiifTX++D3GoQIuH69H9d5hX1P5XLped22tSKvzzvJcHFWEMiEci3315jUdV5CV
         uh8pOMbQZsS9qYl9OisgaBaPzQNSg+sCUDy/8WWhE0mhf4sgOPo6j2OCrQBztEVI90eV
         jB/iFx9Q2s5zaxdxGOW265hxUPZZ2BxcNnRwTNVbxp2cQaLHM9Oebu2gT4B7lcCco+jm
         TxTfh994jRyO/RsdhU7QS/pPrpCAb1YblgOAa82TwLcHNcO55ZNNxqp30LbhEGh3OWen
         4peifvEh91Mqrt83FiW3FBp/Y7nye3MT0BgHc89Y7i1zxbJXriaQhCvpUWsR9uqvXANN
         Et2w==
X-Gm-Message-State: AOAM530y4EfvWj5HaalO4pAcU64pnw6bUfk+x8OlqQLnx2/ZznVBo+ke
        xDLH+VXzPmQxESgS/V54ZDo3HMml0bkZQA==
X-Google-Smtp-Source: ABdhPJz6RBo0jNXjVfPu1Mtxy4onFJopYOBEsV1SiaFxd5M+Y3ynxZphwdmFy7PyBzahcNwdTQ+xbQ==
X-Received: by 2002:a1c:751a:: with SMTP id o26mr5746307wmc.94.1634044982250;
        Tue, 12 Oct 2021 06:23:02 -0700 (PDT)
Received: from ?IPv6:2001:861:44c0:66c0:4e93:9fa7:4d66:4f5c? ([2001:861:44c0:66c0:4e93:9fa7:4d66:4f5c])
        by smtp.gmail.com with ESMTPSA id z6sm6628205wro.25.2021.10.12.06.23.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Oct 2021 06:23:01 -0700 (PDT)
Subject: Re: [PATCH v5 5/8] drm/omap: Add global state as a private atomic
 object
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, khilman@baylibre.com,
        Benoit Parrot <bparrot@ti.com>
References: <20210923070701.145377-1-narmstrong@baylibre.com>
 <20210923070701.145377-6-narmstrong@baylibre.com>
 <2609ca32-90e8-1335-2769-14dcbcdfafde@ideasonboard.com>
From:   Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <ab06e379-1579-2352-3525-dbdca6a94f9b@baylibre.com>
Date:   Tue, 12 Oct 2021 15:23:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <2609ca32-90e8-1335-2769-14dcbcdfafde@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

On 12/10/2021 12:44, Tomi Valkeinen wrote:
> On 23/09/2021 10:06, Neil Armstrong wrote:
>> From: Benoit Parrot <bparrot@ti.com>
>>
>> Global shared resources (like hw overlays) for omapdrm are implemented
>> as a part of atomic state using the drm_private_obj infrastructure
>> available in the atomic core.
>>
>> omap_global_state is introduced as a drm atomic private object. The two
>> funcs omap_get_global_state() and omap_get_existing_global_state() are
>> the two variants that will be used to access omap_global_state.
>>
>> drm_mode_config_init() needs to be called earlier because it
>> creates/initializes the private_obj link list maintained by the atomic
>> framework. The private_obj link list has to exist prior to calling
>> drm_atomic_private_obj_init(). Similarly the cleanup handler are
>> reordered appropriately.
> 
> I'm not really familiar with the private object. Did you check how current drivers use it? These patches are 3 years old, and things might have changed around the private object.

Indeed, I checked and this is used in vc4/tegra/arm/amd & msm in the same as way.

> 
>> Signed-off-by: Benoit Parrot <bparrot@ti.com>
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>> ---
>>   drivers/gpu/drm/omapdrm/omap_drv.c | 91 +++++++++++++++++++++++++++++-
>>   drivers/gpu/drm/omapdrm/omap_drv.h | 21 +++++++
>>   2 files changed, 109 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm/omap_drv.c
>> index b994014b22e8..c7912374d393 100644
>> --- a/drivers/gpu/drm/omapdrm/omap_drv.c
>> +++ b/drivers/gpu/drm/omapdrm/omap_drv.c
>> @@ -128,6 +128,82 @@ static const struct drm_mode_config_funcs omap_mode_config_funcs = {
>>       .atomic_commit = drm_atomic_helper_commit,
>>   };
>>   +/* Global/shared object state funcs */
>> +
>> +/*
>> + * This is a helper that returns the private state currently in operation.
>> + * Note that this would return the "old_state" if called in the atomic check
>> + * path, and the "new_state" after the atomic swap has been done.
>> + */
>> +struct omap_global_state *
>> +omap_get_existing_global_state(struct omap_drm_private *priv)
>> +{
>> +    return to_omap_global_state(priv->glob_obj.state);
>> +}
>> +
>> +/*
>> + * This acquires the modeset lock set aside for global state, creates
>> + * a new duplicated private object state.
>> + */
>> +struct omap_global_state *__must_check
>> +omap_get_global_state(struct drm_atomic_state *s)
>> +{
>> +    struct omap_drm_private *priv = s->dev->dev_private;
>> +    struct drm_private_state *priv_state;
>> +
>> +    priv_state = drm_atomic_get_private_obj_state(s, &priv->glob_obj);
>> +    if (IS_ERR(priv_state))
>> +        return ERR_CAST(priv_state);
>> +
>> +    return to_omap_global_state(priv_state);
>> +}
>> +
>> +static struct drm_private_state *
>> +omap_global_duplicate_state(struct drm_private_obj *obj)
>> +{
>> +    struct omap_global_state *state;
>> +
>> +    state = kmemdup(obj->state, sizeof(*state), GFP_KERNEL);
>> +    if (!state)
>> +        return NULL;
>> +
>> +    __drm_atomic_helper_private_obj_duplicate_state(obj, &state->base);
>> +
>> +    return &state->base;
>> +}
>> +
>> +static void omap_global_destroy_state(struct drm_private_obj *obj,
>> +                      struct drm_private_state *state)
>> +{
>> +    struct omap_global_state *omap_state = to_omap_global_state(state);
>> +
>> +    kfree(omap_state);
>> +}
>> +
>> +static const struct drm_private_state_funcs omap_global_state_funcs = {
>> +    .atomic_duplicate_state = omap_global_duplicate_state,
>> +    .atomic_destroy_state = omap_global_destroy_state,
>> +};
>> +
>> +static int omap_global_obj_init(struct drm_device *dev)
>> +{
>> +    struct omap_drm_private *priv = dev->dev_private;
>> +    struct omap_global_state *state;
>> +
>> +    state = kzalloc(sizeof(*state), GFP_KERNEL);
>> +    if (!state)
>> +        return -ENOMEM;
>> +
>> +    drm_atomic_private_obj_init(dev, &priv->glob_obj, &state->base,
>> +                    &omap_global_state_funcs);
>> +    return 0;
>> +}
>> +
>> +static void omap_global_obj_fini(struct omap_drm_private *priv)
>> +{
>> +    drm_atomic_private_obj_fini(&priv->glob_obj);
>> +}
>> +
>>   static void omap_disconnect_pipelines(struct drm_device *ddev)
>>   {
>>       struct omap_drm_private *priv = ddev->dev_private;
>> @@ -231,8 +307,6 @@ static int omap_modeset_init(struct drm_device *dev)
>>       if (!omapdss_stack_is_ready())
>>           return -EPROBE_DEFER;
>>   -    drm_mode_config_init(dev);
>> -
>>       ret = omap_modeset_init_properties(dev);
>>       if (ret < 0)
>>           return ret;
>> @@ -583,10 +657,16 @@ static int omapdrm_init(struct omap_drm_private *priv, struct device *dev)
>>         omap_gem_init(ddev);
>>   -    ret = omap_hwoverlays_init(priv);
>> +    drm_mode_config_init(ddev);
>> +
>> +    ret = omap_global_obj_init(ddev);
>>       if (ret)
>>           goto err_gem_deinit;
>>   +    ret = omap_hwoverlays_init(priv);
>> +    if (ret)
>> +        goto err_free_priv_obj;
>> +
>>       ret = omap_modeset_init(ddev);
>>       if (ret) {
>>           dev_err(priv->dev, "omap_modeset_init failed: ret=%d\n", ret);
>> @@ -624,7 +704,10 @@ static int omapdrm_init(struct omap_drm_private *priv, struct device *dev)
>>       omap_modeset_fini(ddev);
>>   err_free_overlays:
>>       omap_hwoverlays_destroy(priv);
>> +err_free_priv_obj:
>> +    omap_global_obj_fini(priv);
>>   err_gem_deinit:
>> +    drm_mode_config_cleanup(ddev);
>>       omap_gem_deinit(ddev);
>>       destroy_workqueue(priv->wq);
>>       omap_disconnect_pipelines(ddev);
>> @@ -649,6 +732,8 @@ static void omapdrm_cleanup(struct omap_drm_private *priv)
>>         omap_modeset_fini(ddev);
>>       omap_hwoverlays_destroy(priv);
>> +    omap_global_obj_fini(priv);
>> +    drm_mode_config_cleanup(ddev);
>>       omap_gem_deinit(ddev);
>>         destroy_workqueue(priv->wq);
>> diff --git a/drivers/gpu/drm/omapdrm/omap_drv.h b/drivers/gpu/drm/omapdrm/omap_drv.h
>> index b4d9c2062723..280cdd27bc8e 100644
>> --- a/drivers/gpu/drm/omapdrm/omap_drv.h
>> +++ b/drivers/gpu/drm/omapdrm/omap_drv.h
>> @@ -14,6 +14,7 @@
>>   #include "dss/omapdss.h"
>>   #include "dss/dss.h"
>>   +#include <drm/drm_atomic.h>
>>   #include <drm/drm_gem.h>
>>   #include <drm/omap_drm.h>
>>   @@ -41,6 +42,15 @@ struct omap_drm_pipeline {
>>       unsigned int alias_id;
>>   };
>>   +/*
>> + * Global private object state for tracking resources that are shared across
>> + * multiple kms objects (planes/crtcs/etc).
>> + */
>> +#define to_omap_global_state(x) container_of(x, struct omap_global_state, base)
> 
> Add empty line here.

Ack

> 
>> +struct omap_global_state {
>> +    struct drm_private_state base;
>> +};
>> +
>>   struct omap_drm_private {
>>       struct drm_device *ddev;
>>       struct device *dev;
>> @@ -61,6 +71,13 @@ struct omap_drm_private {
>>       unsigned int num_ovls;
>>       struct omap_hw_overlay *overlays[8];
>>   +    /*
>> +     * Global private object state, Do not access directly, use
>> +     * omap_global_get_state()
>> +     */
>> +    struct drm_modeset_lock glob_obj_lock;
> 
> This is not used... What am I missing?

It's a leftover from v4, now the lock has been moved into drm_atomic_get_private_obj_state()

> 
>> +    struct drm_private_obj glob_obj;
>> +
>>       struct drm_fb_helper *fbdev;
>>         struct workqueue_struct *wq;
>> @@ -88,5 +105,9 @@ struct omap_drm_private {
>>       void omap_debugfs_init(struct drm_minor *minor);
>> +struct omap_global_state *__must_check
>> +omap_get_global_state(struct drm_atomic_state *s);
>> +struct omap_global_state *
>> +omap_get_existing_global_state(struct omap_drm_private *priv);
> 
> These could also be separated by empty lines. At least to my eyes it gets confusing if those declarations are not separated.

Atomic states can be extremely confusing, and hard to track.
I checked and they do what they are documented for...

The omap_get_existing_global_state() is the most confusing since the result depends if
we are in an atomic transaction of not.

Neil

> 
>  Tomi

