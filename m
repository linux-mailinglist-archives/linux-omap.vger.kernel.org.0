Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42A05729120
	for <lists+linux-omap@lfdr.de>; Fri,  9 Jun 2023 09:31:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236808AbjFIHaV convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-omap@lfdr.de>); Fri, 9 Jun 2023 03:30:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238846AbjFIH37 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 9 Jun 2023 03:29:59 -0400
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB0C82D7C;
        Fri,  9 Jun 2023 00:29:56 -0700 (PDT)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-462e3a806cbso574345e0c.3;
        Fri, 09 Jun 2023 00:29:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686295795; x=1688887795;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/f/KLwj3+JtPFJyQSR7kV5ZARQVx9rMOW7yyOQY55Ks=;
        b=X/VYIUWf4OF2uIWO8U1+VAsOzP2S/uXs2sx1CLQHewHlX9dapGZ7KFJG26EQHk1TxK
         mGe1ZENnMlg7WNyCUq9TzHvU31Wg8aZPmrwrhg/THIRV82ue50wUoTpgVRzMoUlQMv2b
         zM1c0qKDaH/xVpxRloq42pjI74W6+A6mnqU6YmhlnOTqKWdF+6y2VcY7wX5anGSE/qVA
         Br7XlfWRr6uzACDDmxaN8glSJw5zOfZq8y/aMl9snehX6w+JPXjwrWp39qiMalAjCXox
         yhRvH0VmeVlRstQQxPjSHPsrrAu4h+bEiShflWeG3OmdYJtiETxC5RuD0z5NLbvSCS0H
         zsEw==
X-Gm-Message-State: AC+VfDzWFn8gHePUbV+nQro2IoWc5XKcvC4X+eId/2U1yn1FfmbDbXDd
        WoJSMgFjUrZ2bzjzz3l2elK4msmnuFtB2g==
X-Google-Smtp-Source: ACHHUZ6W2+qcWyua9w5NR4Nxgx8dhXhzDKbUSCzvTKKxEzZC9MrUsDU0RcYi8/IfyBBwsAL0K94vYQ==
X-Received: by 2002:a1f:6057:0:b0:464:6036:604f with SMTP id u84-20020a1f6057000000b004646036604fmr520743vkb.7.1686295793944;
        Fri, 09 Jun 2023 00:29:53 -0700 (PDT)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com. [209.85.219.170])
        by smtp.gmail.com with ESMTPSA id y62-20020a0dd641000000b00568938ca41bsm452429ywd.53.2023.06.09.00.29.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jun 2023 00:29:50 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-bbc0168b02bso1146877276.3;
        Fri, 09 Jun 2023 00:29:49 -0700 (PDT)
X-Received: by 2002:a05:6902:3cb:b0:bb3:9329:608b with SMTP id
 g11-20020a05690203cb00b00bb39329608bmr355653ybs.51.1686295789563; Fri, 09 Jun
 2023 00:29:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230605144812.15241-1-tzimmermann@suse.de> <20230605144812.15241-31-tzimmermann@suse.de>
 <CAMuHMdVP2hrgXaZvASnHJ4M+VXaTCtfbeVXrq2dsEJqcs3G6ZA@mail.gmail.com>
 <e5d88ca8-66fe-b5ee-cb6b-2dc8f3a3fb26@suse.de> <CAMuHMdWBUKTgfCD9VLDFh_Tm1J-NJQHpxODs-TuYM7V-dtmGjA@mail.gmail.com>
 <873532eurg.fsf@minerva.mail-host-address-is-not-set> <77252bc9-e08e-fcee-d140-2b78ab768b42@suse.de>
In-Reply-To: <77252bc9-e08e-fcee-d140-2b78ab768b42@suse.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 9 Jun 2023 09:29:37 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWUkZDcYfndf1A+cgcN5Fz1hmst4LrpA7iYCFqWSRTNDA@mail.gmail.com>
Message-ID: <CAMuHMdWUkZDcYfndf1A+cgcN5Fz1hmst4LrpA7iYCFqWSRTNDA@mail.gmail.com>
Subject: Re: [PATCH 30/30] fbdev: Make support for userspace interfaces configurable
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     Javier Martinez Canillas <javierm@redhat.com>,
        daniel.thompson@linaro.org, linux-staging@lists.linux.dev,
        linux-sh@vger.kernel.org, jingoohan1@gmail.com, deller@gmx.de,
        lee@kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-omap@vger.kernel.org,
        sam@ravnborg.org
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

On Fri, Jun 9, 2023 at 9:09 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Am 08.06.23 um 01:07 schrieb Javier Martinez Canillas:
> > Geert Uytterhoeven <geert@linux-m68k.org> writes:
> >> On Wed, Jun 7, 2023 at 5:15 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> >>> Am 07.06.23 um 10:48 schrieb Geert Uytterhoeven:
> >>>> On Mon, Jun 5, 2023 at 4:48 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> >>>>> --- a/drivers/video/fbdev/Kconfig
> >>>>> +++ b/drivers/video/fbdev/Kconfig
> >>>>> @@ -57,6 +57,15 @@ config FIRMWARE_EDID
> >>>>>             combination with certain motherboards and monitors are known to
> >>>>>             suffer from this problem.
> >>>>>
> >>>>> +config FB_DEVICE
> >>>>> +        bool "Provide legacy /dev/fb* device"
> >>>>
> >>>> Perhaps "default y if !DRM", although that does not help for a
> >>>> mixed drm/fbdev kernel build?
> >>>
> >>> We could simply set it to "default y".  But OTOH is it worth making it a
> >>> default? Distributions will set it to the value they need/want. The very
> >>> few people that build their own kernels to get certain fbdev drivers
> >>> will certainly be able to enable the option by hand as well.
> >>
> >> Defaulting to "n" (the default) means causing regressions when these
> >> few people use an existing defconfig.
> >>
> >
> > Having "dfault y if !DRM" makes sense to me. I guess is a corner case but
> > at least it won't silently be disabled for users that only want fbdev as
> > Geert mentioned.
>
> IMHO the rational behind such conditionals are mostly what "we make up
> here in the discussion", but not something based on real-world feedback.
> So I'd strongly prefer a clear n or y setting here.
>
> >
> > I wouldn't call it a regression though, because AFAIK the Kconfig options
> > are not a stable API ?
>
> IIRC in the past there have been concerns about changing Kconfig
> defaults. If we go with "default n", we'd apparently do something similar.
>
> >
> >>>> Or reserve "FB" for real fbdev drivers, and introduce a new FB_CORE,
> >>>> to be selected by both FB and DRM_FBDEV_EMULATION?
> >>>> Then FB_DEVICE can depend on FB_CORE, and default to y if FB.
> >
> > Funny that you mention because it's exactly what I attempted in the past:
> >
> > https://lore.kernel.org/all/20210827100531.1578604-1-javierm@redhat.com/T/#u
> >
> >>>
> >>> That wouldn't work. In Tumbleweed, we still have efifb and vesafb
> >>> enabled under certain conditions; merely for the kernel console. We'd
> >>> have to enable CONFIG_FB, which would bring back the device.
> >>
> >> "Default y" does not mean that you cannot disable FB_DEVICE, so
> >> you are not forced to bring back the device?
> >
> > I think we can have both to make the kernel more configurable:
> >
> > 1) Allow to only disable fbdev user-space APIs (/dev/fb?, /proc/fb, etc),
> >     which is what the series is doing with the new FB_DEVICE config symbol.
> >
> > 2) Allow to disable all "native" fbdev drivers and only keep the DRM fbdev
> >     emulation layer. That's what my series attempted to do with the FB_CORE
> >     Kconfig symbol.
> >
> > I believe that there are use cases for both, for example as Thomas' said
> > many distros are disabling all the fbdev drivers and their user-space only
> > requires DRM/KMS, so makes sense to not expose any fbdev uAPI at all.
> >
> > But may be that other users want the opposite, they have an old user-space
> > that requires fbdev, but is running on newer hardware that only have a DRM
> > driver. So they will want DRM fbdev emulation but none fbdev driver at all.
> >
> > That's why I think that FB_DEVICE and FB_CORE are complementary and we can
> > support any combination of the two, if you agree there are uses for either.
>
> I still don't understand the value of such an extra compile-time option?
>   Either you have fbdev userspace, then you want the device; or you
> don't then it's better to disable it entirely. I don't see much of a
> difference between DRM and fbdev drivers here.

If you have DRM and are running a Linux desktop, you are probably
using DRM userspace.
If you have fbdev, and are using graphics, you have no choice but
using an fbdev userspace.

So with FB_CORE, you can have default y if you have a real fbdev driver,
and default n if you have only DRM drivers.

> I'd also question the argument that there's even fbdev userspace out
> there. It was never popular in it's heyday and definitely hasn't
> improved since then. Even the 3 people who still ask for fbdev support

There's X.org, DirectFB, SDL, ...

What do you think low-end embedded devices with an out-of-tree[*]
fbdev driver are using?

[*] There's been a moratorium on new fbdev drivers for about a decade.

> here only seem to care about the performance of the framebuffer console,
> but never about userspace.

Unless you go for heavy graphics and 3D, a simple GUI with some
buttons and text requires less performance than scrolling a full-screen
graphical text console...

> So I'd like to propose a different solution: on top of the current
> patchset, let's make an fbdev module option that enables the device. If
> CONFIG_FB_DEVICE has been enabled, the option would switch the
> functionality on and off. A Kconfig option would set the default.  With
> such a setup, distributions can disable the fbdev device by default.
> And the few users with the odd system that has fbdev userspace can still
> enable the fbdev device at boot time.

Hmm... That makes it even more complicated...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
