Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1DCBE7255CF
	for <lists+linux-omap@lfdr.de>; Wed,  7 Jun 2023 09:36:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239329AbjFGHgL (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 7 Jun 2023 03:36:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239786AbjFGHfq (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 7 Jun 2023 03:35:46 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4CFC270B
        for <linux-omap@vger.kernel.org>; Wed,  7 Jun 2023 00:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686123063;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=86qJ/vtJ5+0COg+eCE9cC1XNW8WWzhrqJj3XV1HnHmU=;
        b=cC85HVmSd57663wHKBzWS660CqmmQp21p51no3stSxMP1joBJwL+j1rDuj3KBPHgE9C8YC
        AHhZIfxb1dr/P5PNEZ2xva+git0HZGVNSbC/q/PicG03FiL7ER2x4Qh3B7EgHN9NR0oyju
        TWaBRAGWIafnocXcHzQ+MwWwxUqQOtg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-146-xA4gYbzNOFyQdx77x4Ojfw-1; Wed, 07 Jun 2023 03:31:02 -0400
X-MC-Unique: xA4gYbzNOFyQdx77x4Ojfw-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-3f5df65f9f4so33536285e9.2
        for <linux-omap@vger.kernel.org>; Wed, 07 Jun 2023 00:31:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686123060; x=1688715060;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=86qJ/vtJ5+0COg+eCE9cC1XNW8WWzhrqJj3XV1HnHmU=;
        b=URvBP0AeeG0PmY/97T8nPkxR1NGhpdQbJztaqm2ZW/rNDIQR10fKy8TZPnTt9V1e/4
         wgmwqnSPAaAN7MSsRFtba9hn9wPLtBsP/6pAbBQ0GcbN4PH2EZyCo0yuUpTxc5B672+t
         MiJnWRqimdJaWqSeyRRN+bQ1O1rrQfsptyTvsPLnGMjBjZHvAv44jeeI7F8Sa+1vL9jF
         vYZbjFRz7DPzAxDEWVnq+dWdiLd06C0yI8p53jshQZhN/VgcXQaIKgEcY/IuD6NEA6VF
         9J1yhWnRwdU1sdw+ysqdnCGxbm+2lGosK0LrYQGLge/TcewOkPfO4Nb8iF4HL+L7P6zM
         MnaA==
X-Gm-Message-State: AC+VfDyO7og3kfVViBpSaZO7L1DBynZkZlIrlRJgUWzLc2yNTt5f/uYf
        cTSMXlJqdbhqgU2JaLqDP7Q+4uv4zNymYgangI2uSbBIH2h+M+i4YJcyc7ympSD2hAYIBCqn4IU
        0I6enBD6es3ACbFPwUttfWg==
X-Received: by 2002:a05:600c:2117:b0:3f4:2328:b5c2 with SMTP id u23-20020a05600c211700b003f42328b5c2mr3787352wml.35.1686123060797;
        Wed, 07 Jun 2023 00:31:00 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5uGo6zRkvpQ5estM3pdndUe5o7FAstx3xMsdIS0ZhyvoEoxkSKZkfhbKkJxPjpvFo09QUYlQ==
X-Received: by 2002:a05:600c:2117:b0:3f4:2328:b5c2 with SMTP id u23-20020a05600c211700b003f42328b5c2mr3787327wml.35.1686123060473;
        Wed, 07 Jun 2023 00:31:00 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id y6-20020a7bcd86000000b003f4ddde398csm1142560wmj.21.2023.06.07.00.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 00:31:00 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
        sam@ravnborg.org, deller@gmx.de, geert+renesas@glider.be,
        lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-sh@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-staging@lists.linux.dev,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 01/30] backlight/bd6107: Compare against struct
 fb_info.device
In-Reply-To: <20230605144812.15241-2-tzimmermann@suse.de>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-2-tzimmermann@suse.de>
Date:   Wed, 07 Jun 2023 09:30:59 +0200
Message-ID: <87bkhrhgp8.fsf@minerva.mail-host-address-is-not-set>
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

> Struct bd6107_platform_data refers to a platform device within
> the Linux device hierarchy. The test in bd6107_backlight_check_fb()
> compares it against the fbdev device in struct fb_info.dev, which
> is different. Fix the test by comparing to struct fb_info.device.
>
> Fixes a bug in the backlight driver and prepares fbdev for making
> struct fb_info.dev optional.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Lee Jones <lee@kernel.org>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

