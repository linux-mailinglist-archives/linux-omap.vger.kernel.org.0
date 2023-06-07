Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC1DD7255E5
	for <lists+linux-omap@lfdr.de>; Wed,  7 Jun 2023 09:37:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238315AbjFGHhY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 7 Jun 2023 03:37:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239324AbjFGHgb (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 7 Jun 2023 03:36:31 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C352810D5
        for <linux-omap@vger.kernel.org>; Wed,  7 Jun 2023 00:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686123339;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=rVXKtyFuQelZnCduaFGaTWYRY9d93/7uXkVVq77/kek=;
        b=CwuqI489c8L2M/pXFsPxJ8FXHy7FRAPQ+5n02PDCFmeiHqWFqFi2M8YzgbPSY4TyapaQj1
        3PSa0wp1HVdsq3BoVKyhSOY3YbrEp1NCQnZb4tYX3IYR+Dq/ZTv4h0i0AT9NUtHWrnse77
        nGp7wWjNeuPoUoiUnSqCmWf2Q2WBagQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-65-NJuy0fijMRyLmdMDOwuPGw-1; Wed, 07 Jun 2023 03:35:38 -0400
X-MC-Unique: NJuy0fijMRyLmdMDOwuPGw-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-30ae4ed92eeso3064362f8f.1
        for <linux-omap@vger.kernel.org>; Wed, 07 Jun 2023 00:35:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686123337; x=1688715337;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rVXKtyFuQelZnCduaFGaTWYRY9d93/7uXkVVq77/kek=;
        b=CGiA5e4AEaBHUXTP5x0YKGGYtFPYq3rHntNEeHCFcN9i19zpa9DzENF/ltPrSPPv8j
         pgtWriJIWyEFg0KhMxKpD9qjYPW/QQdq8eCLtT6yBPw6Tk7TTCLPc2vwmA55xBLAaxa2
         e4K1TuLexf2AVc7YC8it8Li2D2S1pVJIyfvn18f0r1t1B6khtNUqYBrtYpCDxeWpPts3
         oVC0sBjwPFKGWsYJBhfwuj6lHwB0Wsza0+ZuVVCnN6HNV8s/9T4sG+g69zOmlZAFJGlw
         co2v+/XtjPhN5NBl2XXKqUZhOtizaa7WLd2KtQWfzb4uPnVPtNpkl6qVRx7UwqqN3Xy4
         Fhew==
X-Gm-Message-State: AC+VfDy+5YJIBfWlJ82YMQzVF7osE6n7I+lQJf2lAK73VknSdfPMv4FI
        vpxNTb8erKJrEXWIJxswwrgBsisKqzEQEwkOO7/AhxrFa8VhBR7tQkrs99ci5+9RAhuxYy1v3dk
        jTGuqEt4hVSlPSPGRLLW6LA==
X-Received: by 2002:adf:e94c:0:b0:30e:3ccf:d4b1 with SMTP id m12-20020adfe94c000000b0030e3ccfd4b1mr3545203wrn.4.1686123337741;
        Wed, 07 Jun 2023 00:35:37 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7c4uJeHgefHAPZBCPOj0COJN3FPjwSoURcR8FFlOhwLdItHYCa5GZjGrjPHZg2iimtHbMokg==
X-Received: by 2002:adf:e94c:0:b0:30e:3ccf:d4b1 with SMTP id m12-20020adfe94c000000b0030e3ccfd4b1mr3545188wrn.4.1686123337473;
        Wed, 07 Jun 2023 00:35:37 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id s15-20020a5d69cf000000b0030af31c8c63sm14618215wrw.47.2023.06.07.00.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 00:35:37 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
        sam@ravnborg.org, deller@gmx.de, geert+renesas@glider.be,
        lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com
Cc:     linux-fbdev@vger.kernel.org, Rich Felker <dalias@libc.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        linux-sh@vger.kernel.org, linux-staging@lists.linux.dev,
        dri-devel@lists.freedesktop.org,
        Thomas Zimmermann <tzimmermann@suse.de>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        linux-omap@vger.kernel.org
Subject: Re: [PATCH 03/30] backlight/lv5207lp: Compare against struct
 fb_info.device
In-Reply-To: <20230605144812.15241-4-tzimmermann@suse.de>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-4-tzimmermann@suse.de>
Date:   Wed, 07 Jun 2023 09:35:36 +0200
Message-ID: <875y7zhghj.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Struct lv5207lp_platform_data refers to a platform device within
> the Linux device hierarchy. The test in lv5207lp_backlight_check_fb()
> compares it against the fbdev device in struct fb_info.dev, which
> is different. Fix the test by comparing to struct fb_info.device.
>
> Fixes a bug in the backlight driver and prepares fbdev for making
> struct fb_info.dev optional.
>

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

