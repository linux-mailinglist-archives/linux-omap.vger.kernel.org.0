Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 975BA7257E6
	for <lists+linux-omap@lfdr.de>; Wed,  7 Jun 2023 10:35:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238224AbjFGIf2 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-omap@lfdr.de>); Wed, 7 Jun 2023 04:35:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234168AbjFGIfZ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 7 Jun 2023 04:35:25 -0400
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4DD41982;
        Wed,  7 Jun 2023 01:35:14 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-565a022ef06so87636017b3.3;
        Wed, 07 Jun 2023 01:35:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686126914; x=1688718914;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tl7bhCDuACQlGnVS8msclVNyzt7m2ZyWzQXQ4o8Ijq4=;
        b=kc12nZ0zzhD/mWcBpuVb6YSqQF3J58KU1mN4x4APVAPx+qrbT4GWlaTZ8iGcKEti+s
         0Cr8CaDVrFfpwxGlqK6j4fAM6dWPVrrq+S7ge2aruSiKEYgMklgG4ytZVC72b2JpvKHh
         /Y9aO2rtRFLVbgTwKDYt4c1ieaNs5sMcpsKsZ/sy/p1XjkylChGYogpdAcmbzrWpePXz
         t+Q7D3nDoCDHfNOKaXDwYzytHY4Nwk5/EYGU1w/twEPtjL2oemX+JsMiYTD1S0FuOzvX
         Z1bH+e4hmKmbAe8XBEnFVuYyIMsaq8KG3q5Dqpp1uGEmTcu+f//m9ONxy0apjQ0fCJhH
         /5gw==
X-Gm-Message-State: AC+VfDzpa1Es2PTfkjV+eI9Wz0p9OZvY/yGvPEjWMpRbaaw7z0Mr9biw
        DtH0E5gYGQL/gF9SPCK4OO17uYg+0kTd5A==
X-Google-Smtp-Source: ACHHUZ6+q+bWGCCNEb7LRIE8rPHQsuEMz5nwVgDOkemeqltn8GraLgqFrW3C0Bha67iP8R0QwF/YTQ==
X-Received: by 2002:a81:a190:0:b0:561:e2dc:fc60 with SMTP id y138-20020a81a190000000b00561e2dcfc60mr5774362ywg.25.1686126913731;
        Wed, 07 Jun 2023 01:35:13 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id h66-20020a0dde45000000b0055d7f00d4f7sm4609617ywe.22.2023.06.07.01.35.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jun 2023 01:35:12 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-565a022ef06so87635367b3.3;
        Wed, 07 Jun 2023 01:35:12 -0700 (PDT)
X-Received: by 2002:a0d:eac5:0:b0:568:f2c:ee40 with SMTP id
 t188-20020a0deac5000000b005680f2cee40mr4715739ywe.3.1686126912094; Wed, 07
 Jun 2023 01:35:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230605144812.15241-1-tzimmermann@suse.de>
In-Reply-To: <20230605144812.15241-1-tzimmermann@suse.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 7 Jun 2023 10:35:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUNAg5MYQVOnVhYeHKnciHci1Ly6v8DbdBp_P_9YEu=Zg@mail.gmail.com>
Message-ID: <CAMuHMdUNAg5MYQVOnVhYeHKnciHci1Ly6v8DbdBp_P_9YEu=Zg@mail.gmail.com>
Subject: Re: [PATCH 00/30] fbdev: Make userspace interfaces optional
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     daniel@ffwll.ch, javierm@redhat.com, sam@ravnborg.org,
        deller@gmx.de, lee@kernel.org, daniel.thompson@linaro.org,
        jingoohan1@gmail.com, linux-fbdev@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-sh@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Thomas,

Thanks for your series!

Over the past few days, I have been giving this some thought, that's
why I am replying only now...

On Mon, Jun 5, 2023 at 4:48 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Add the new config option FB_DEVICE. If enabled, fbdev provides
> traditional userspace interfaces in devfs, sysfs and procfs, such
> as /dev/fb0 or /proc/fb.
>
> Modern Linux distrobutions have adopted DRM drivers for graphics
> output and use fbdev only for the kernel's framebuffer console.
> Userspace has also moved on, with no new fbdev code being written
> and existing support being removed.
>
> OTOH, fbdev provides userspace a way of accessing kernel or I/O
> memory, which might compromise the system's security. See the recent

True, in some form...
The amount of "kernel memory" that can be accessed is controlled by
the fbdev driver (or by the DRM fbdev emulation). Nothing unsafe here.
The I/O memory that can be accessed (if any) is controlled by the
fbdev driver, and the full capabilities (e.g. DMA to random addresses)
exported depend on the actual hardware.

> commit c8687694bb1f ("drm/fbdev-generic: prohibit potential
> out-of-bounds access") for an example. Disabling fbdev userspace

IMHO that's not a good example for the point you're trying to make,
but merely bad bounds checking in kernel copying code...

> interfaces is therefore a useful feature to limit unecessary
> exposure of fbdev code to processes of low privilegues.

This actually depends on the permissions on /dev/fb*...

BTW, I am wondering if it would be possible to write a DRM emulation
layer on top of (basic, e.g. no MMIO, just fb) fbdev?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
