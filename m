Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA70D72595C
	for <lists+linux-omap@lfdr.de>; Wed,  7 Jun 2023 11:05:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239324AbjFGJEn (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 7 Jun 2023 05:04:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239446AbjFGJEJ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 7 Jun 2023 05:04:09 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 040462137
        for <linux-omap@vger.kernel.org>; Wed,  7 Jun 2023 02:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686128505;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Dioh0Uh8M64nhVsxEDgz6W+eW/pWMCOha9EWfOMUYLQ=;
        b=VSEnU5gvIaJsiOBfsy2vUg5bvd4f2ul3+gFs81IdOAPJKyny02GvBDS0o2H1FaV7op1u2I
        BiHsvgJD3zsyy0lGng4iX2iWD11gVp9hBEukkTKiNT1PldWHJzX6b+W/YrJJaZI/hMdmEp
        GGGyn8Mz6Ix2m1oh3P7rHDeSxppToi0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-436-mRRtXdplOM6mszA2uXTqlg-1; Wed, 07 Jun 2023 05:01:43 -0400
X-MC-Unique: mRRtXdplOM6mszA2uXTqlg-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-3f7e6582938so46027755e9.0
        for <linux-omap@vger.kernel.org>; Wed, 07 Jun 2023 02:01:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686128502; x=1688720502;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Dioh0Uh8M64nhVsxEDgz6W+eW/pWMCOha9EWfOMUYLQ=;
        b=Wh+x74fko95PAXdgZhQ1EU3DTTQviSAb+FGQj6YG6q/XpA8PcuYmazQwZOd3BKg0GP
         b8FcwdMpJuWl7KeX5i6Stppbi3RwoX1MYpuT0ybM6YA25VIqA1+VuheKUhXZdLoxciI6
         UoimY490Jd2ubQzjUk7Vm7SrlgiR8ak5uAGhbRXIK7jllctGJPg+HeF1arzKMSZRQ+Xg
         lCVnZYwkzqvl0Yvq4R+tx4NgZDALeUX0SiFg8t/YmGC3TlHDMVpBsAxULKRk1O40Lz7a
         uX4sBzxd59deOgh6P1laPlEuL9fDgdmQzCqBQxsfnC3CGM5P8vwVtxfnfZsbIWjS/6B3
         PJ4g==
X-Gm-Message-State: AC+VfDwleq3ZEbckB3tXnrHAOLEr4xhLVaKaWteKaCIjtfQv7GSdDACy
        nZ0LRv4TyDl3EcXv0N+0N6rrt1IL5zKqUkD3jTCds43mJhfOGEcE36bvTJ/u8OYjkRwIGc1EXAv
        YpeVzSocHEvnJt++WP9kqGQ==
X-Received: by 2002:a05:600c:22c4:b0:3f7:f398:e1cc with SMTP id 4-20020a05600c22c400b003f7f398e1ccmr353836wmg.36.1686128502807;
        Wed, 07 Jun 2023 02:01:42 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ72JJUmKTY0S/fTapCQpRDv/nnMwi2EWc1cCGgNDHz8vB5pxi81zoyZxiDc07QRDM6iPj/yxA==
X-Received: by 2002:a05:600c:22c4:b0:3f7:f398:e1cc with SMTP id 4-20020a05600c22c400b003f7f398e1ccmr353823wmg.36.1686128502608;
        Wed, 07 Jun 2023 02:01:42 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id q12-20020a05600000cc00b003093a412310sm14814796wrx.92.2023.06.07.02.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 02:01:42 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
        sam@ravnborg.org, deller@gmx.de, geert+renesas@glider.be,
        lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-sh@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-staging@lists.linux.dev,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 13/30] fbdev/metronomefb: Use hardware device for dev_err()
In-Reply-To: <20230605144812.15241-14-tzimmermann@suse.de>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-14-tzimmermann@suse.de>
Date:   Wed, 07 Jun 2023 11:01:41 +0200
Message-ID: <87cz27fxxm.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Replace the use of the fbdev software device, stored in struct
> fb_info.dev, with the hardware device from struct fb_info.device
> in load_waveform(). The device is only used for printing errors
> with dev_err().
>
> This change aligns load_waveform() with the rest of the driver and
> prepares fbdev for making struct fb_info.dev optional.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

