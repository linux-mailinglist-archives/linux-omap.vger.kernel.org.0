Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B67972586E
	for <lists+linux-omap@lfdr.de>; Wed,  7 Jun 2023 10:48:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239301AbjFGIsb convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-omap@lfdr.de>); Wed, 7 Jun 2023 04:48:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237815AbjFGIsa (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 7 Jun 2023 04:48:30 -0400
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C759172E;
        Wed,  7 Jun 2023 01:48:29 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-56896c77434so71644347b3.0;
        Wed, 07 Jun 2023 01:48:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686127708; x=1688719708;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dsdNCkGUa6qXmdS3+Kos2M1YnKfMadh9WwIme7Xf08U=;
        b=GlNTBVC49xkQu7KDxZxpUdPnEpPO5URfSeivOlB86cH/WM0bfSpfg6GdaZ17VYqWRN
         T6Dqki5rBFk2hDIGVoBsa6af4Tx146IPJMgalgVgw2dtPRJ0DBmI5ZeBOKgP/HY3HsJm
         B4FFU9une4gdhYby0+ZUWupiw1yVFlf2RFqrIvtibqY0xjb7j2ZR6nVzvPSU73mRFQqG
         69Y3cZHZjlx3z8q1KuoqLazmhjm79sx9h6RoD+rGjOOhhbHlxyL0GTUDvGTKmRcgKfdd
         3JabCn3S+VANbJIG8fIRu7QSYS2ZSjZo5S/gOVPxWj6UpoczuYhtUkQhGB3O/umG6qtw
         FkUA==
X-Gm-Message-State: AC+VfDzE4hPdXCla2U8XUsDFnGLeXx0QYIP2bZbsv63ZBP/y8IAF65PI
        F7oH+T0gu/yTpejflDLhv3ecqisUWeRMNQ==
X-Google-Smtp-Source: ACHHUZ7Hb00PHfNC5XKrCGT5gwHuNE+WdhI+bZTVDasN+9XWbc+ctchvX7qZMn/tvgnqn3IoxQIjoQ==
X-Received: by 2002:a81:494c:0:b0:561:a123:1041 with SMTP id w73-20020a81494c000000b00561a1231041mr5537668ywa.29.1686127708189;
        Wed, 07 Jun 2023 01:48:28 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id w9-20020a0dd409000000b00569e7cbcd56sm1101892ywd.69.2023.06.07.01.48.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jun 2023 01:48:27 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-565ba2c7554so71319407b3.3;
        Wed, 07 Jun 2023 01:48:27 -0700 (PDT)
X-Received: by 2002:a81:7d41:0:b0:561:e2df:c4d1 with SMTP id
 y62-20020a817d41000000b00561e2dfc4d1mr5101826ywc.9.1686127706917; Wed, 07 Jun
 2023 01:48:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230605144812.15241-1-tzimmermann@suse.de> <20230605144812.15241-31-tzimmermann@suse.de>
In-Reply-To: <20230605144812.15241-31-tzimmermann@suse.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 7 Jun 2023 10:48:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVP2hrgXaZvASnHJ4M+VXaTCtfbeVXrq2dsEJqcs3G6ZA@mail.gmail.com>
Message-ID: <CAMuHMdVP2hrgXaZvASnHJ4M+VXaTCtfbeVXrq2dsEJqcs3G6ZA@mail.gmail.com>
Subject: Re: [PATCH 30/30] fbdev: Make support for userspace interfaces configurable
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
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Thomas,

Thanks for your patch!

On Mon, Jun 5, 2023 at 4:48 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Add Kconfig option CONFIG_FB_DEVICE and make the virtual fbdev
> device optional. If the new option has not been selected, fbdev
> does not create a files in devfs or sysfs.
>
> Most modern Linux systems run a DRM-based graphics stack that uses
> the kernel's framebuffer console, but has otherwise deprecated fbdev
> support. Yet fbdev userspace interfaces are still present.
>
> The option makes it possible to use the fbdev subsystem as console
> implementation without support for userspace. This closes potential
> entry points to manipulate kernel or I/O memory via framebuffers. It

I'd leave out the part about manipulating kernel memory, as that's a
driver bug, if possible.

> also prevents the execution of driver code via ioctl or sysfs, both
> of which might allow malicious software to exploit bugs in the fbdev
> code.

Of course disabling ioctls reduces the attack surface, and this is not
limited to fbdev... ;-)

I'm wondering if it would be worthwhile to optionally provide a more
limited userspace API for real fbdev drivers:
  1. No access to MMIO, only to the mapped frame buffer,
  2. No driver-specific ioctls, only the standard ones.

> A small number of fbdev drivers require struct fbinfo.dev to be
> initialized, usually for the support of sysfs interface. Make these
> drivers depend on FB_DEVICE. They can later be fixed if necessary.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

> --- a/drivers/video/fbdev/Kconfig
> +++ b/drivers/video/fbdev/Kconfig
> @@ -57,6 +57,15 @@ config FIRMWARE_EDID
>           combination with certain motherboards and monitors are known to
>           suffer from this problem.
>
> +config FB_DEVICE
> +        bool "Provide legacy /dev/fb* device"

Perhaps "default y if !DRM", although that does not help for a
mixed drm/fbdev kernel build?

Or reserve "FB" for real fbdev drivers, and introduce a new FB_CORE,
to be selected by both FB and DRM_FBDEV_EMULATION?
Then FB_DEVICE can depend on FB_CORE, and default to y if FB.

> +        depends on FB
> +        help
> +         Say Y here if you want the legacy /dev/fb* device file. It's
> +         only required if you have userspace programs that depend on
> +         fbdev for graphics output. This does not effect the framebuffer

affect

> +         console.
> +
>  config FB_DDC
>         tristate
>         depends on FB

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
