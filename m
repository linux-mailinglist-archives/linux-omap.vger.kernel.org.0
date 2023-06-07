Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F107726464
	for <lists+linux-omap@lfdr.de>; Wed,  7 Jun 2023 17:26:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240625AbjFGP0E convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-omap@lfdr.de>); Wed, 7 Jun 2023 11:26:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241079AbjFGPZd (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 7 Jun 2023 11:25:33 -0400
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 388A72715;
        Wed,  7 Jun 2023 08:25:11 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-ba8151a744fso8656731276.2;
        Wed, 07 Jun 2023 08:25:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686151462; x=1688743462;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EQN/vgm9QEjhz2CmAuEj3hHoQIOxHnpZb3XEwqj7JAE=;
        b=BhoJONJB89aWQLa8PPpUz7j2h1iUSUQgV28+VYxYzxmPQSep/0bBOErdHW1zHLr5tR
         /HwC4h2nm78YvOPiDlq4ecZ+oa16McDI6XodAI8M5cr7dpoIOe+sqkYnMYlWH0ucdzzG
         9EcF7C0bdindUAl4UbIjQ0Ulqvw8nF3fxMVa5zacA4wMjY2f9eWPO53DoCVH+fNnrVOJ
         poaLyrgdXIXJexhTQaWAbTvuKWIEbMn7MsleUtD3+fG/dzCMxXj+a91TECwtG0k8LPvw
         3GWBGW2ypDU+cLy4AZqhsKPTa0S8E+khIMGAfTcpJ8pGp68GX75XBs3nwuShDg07Yap6
         R8sg==
X-Gm-Message-State: AC+VfDxJCZBuX65sDCpEgWDUrdRZ8thNxUVqkEQMAGZndAziuRAUgxIC
        +fOAn0E5RNvCAXFZezlz16I01sAfdx7s+g==
X-Google-Smtp-Source: ACHHUZ4hZ5mQV9UZxtOfx7Xp52RJIhgGUFeWy1THCvMb3QQmVkJx6lBLEdNQIkLBlEfHNPn6TtQBTw==
X-Received: by 2002:a0d:d7cf:0:b0:565:dff1:d1e2 with SMTP id z198-20020a0dd7cf000000b00565dff1d1e2mr7634371ywd.18.1686151462189;
        Wed, 07 Jun 2023 08:24:22 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id j188-20020a0df9c5000000b0055a07e36659sm4777371ywf.145.2023.06.07.08.24.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jun 2023 08:24:21 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-565ba53f434so84021437b3.3;
        Wed, 07 Jun 2023 08:24:21 -0700 (PDT)
X-Received: by 2002:a0d:d44b:0:b0:565:8c16:a0e1 with SMTP id
 w72-20020a0dd44b000000b005658c16a0e1mr8139475ywd.13.1686151460917; Wed, 07
 Jun 2023 08:24:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230605144812.15241-1-tzimmermann@suse.de> <20230605144812.15241-31-tzimmermann@suse.de>
 <CAMuHMdVP2hrgXaZvASnHJ4M+VXaTCtfbeVXrq2dsEJqcs3G6ZA@mail.gmail.com> <e5d88ca8-66fe-b5ee-cb6b-2dc8f3a3fb26@suse.de>
In-Reply-To: <e5d88ca8-66fe-b5ee-cb6b-2dc8f3a3fb26@suse.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 7 Jun 2023 17:24:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWBUKTgfCD9VLDFh_Tm1J-NJQHpxODs-TuYM7V-dtmGjA@mail.gmail.com>
Message-ID: <CAMuHMdWBUKTgfCD9VLDFh_Tm1J-NJQHpxODs-TuYM7V-dtmGjA@mail.gmail.com>
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
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Thomas,

On Wed, Jun 7, 2023 at 5:15 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Am 07.06.23 um 10:48 schrieb Geert Uytterhoeven:
> > On Mon, Jun 5, 2023 at 4:48 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> >> --- a/drivers/video/fbdev/Kconfig
> >> +++ b/drivers/video/fbdev/Kconfig
> >> @@ -57,6 +57,15 @@ config FIRMWARE_EDID
> >>            combination with certain motherboards and monitors are known to
> >>            suffer from this problem.
> >>
> >> +config FB_DEVICE
> >> +        bool "Provide legacy /dev/fb* device"
> >
> > Perhaps "default y if !DRM", although that does not help for a
> > mixed drm/fbdev kernel build?
>
> We could simply set it to "default y".  But OTOH is it worth making it a
> default? Distributions will set it to the value they need/want. The very
> few people that build their own kernels to get certain fbdev drivers
> will certainly be able to enable the option by hand as well.

Defaulting to "n" (the default) means causing regressions when these
few people use an existing defconfig.

> > Or reserve "FB" for real fbdev drivers, and introduce a new FB_CORE,
> > to be selected by both FB and DRM_FBDEV_EMULATION?
> > Then FB_DEVICE can depend on FB_CORE, and default to y if FB.
>
> That wouldn't work. In Tumbleweed, we still have efifb and vesafb
> enabled under certain conditions; merely for the kernel console. We'd
> have to enable CONFIG_FB, which would bring back the device.

"Default y" does not mean that you cannot disable FB_DEVICE, so
you are not forced to bring back the device?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
