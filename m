Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03C67729813
	for <lists+linux-omap@lfdr.de>; Fri,  9 Jun 2023 13:22:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236470AbjFILWp convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-omap@lfdr.de>); Fri, 9 Jun 2023 07:22:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229808AbjFILWo (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 9 Jun 2023 07:22:44 -0400
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33E3F2712;
        Fri,  9 Jun 2023 04:22:42 -0700 (PDT)
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-6b2b7ca1c5eso595358a34.0;
        Fri, 09 Jun 2023 04:22:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686309761; x=1688901761;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xadRBA7ym6NtI+c99cDpm8sxh6Is5YguQpKNeHDLZ5g=;
        b=VijEYZz1uMHl1bsaZHfKdZzymWe9wZKiF2U1BaznI4akVZBGqzu1jRk0X2m0MOImYY
         EgutJR2qoso8tDNhEKYGkJts1g2Yu05OCum/RPYiwVbmd+xJvSYJfh6gLDpeD4PdsAQQ
         1UE5TchOmdnySCFtFqrSyPHrJlsvqUwUydu8x1qJPZlM1K/H+5KtO7w4M/WyjWUH79QP
         jIODKEqbDegmSDyY5VFgd0FQZQsLSsSWffCxDDGUIYVfENv/Nk7BKkq7Eyo5WaOWrFAe
         wuYbTVZM7Wm3fB4tI1gS/5os5I19VRYEc3hncNt/0vjxoJfgPvIIJ2oZKJ4GoNwdVL0V
         164Q==
X-Gm-Message-State: AC+VfDzJ9i4wRwTXD9GuicNn3dJqml7zJcNB4y5fHOxwNUp0HrClvnmF
        iLVKwwLfMNBHT9ICrQmQPRaGlCpVSC2Gaw==
X-Google-Smtp-Source: ACHHUZ45C7vpZyhY5f+aQDgaBqv97EB9SDjFr/U6fPF7/GDU0rdC8MKkrgj+C/PnuJyNJDJFAoYx9A==
X-Received: by 2002:a05:6830:145:b0:6b2:94a2:2236 with SMTP id j5-20020a056830014500b006b294a22236mr918734otp.29.1686309761282;
        Fri, 09 Jun 2023 04:22:41 -0700 (PDT)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com. [209.85.160.41])
        by smtp.gmail.com with ESMTPSA id w1-20020a9d77c1000000b006b29c5fdeb2sm144104otl.57.2023.06.09.04.22.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jun 2023 04:22:39 -0700 (PDT)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-1a27ffe9dcdso574886fac.2;
        Fri, 09 Jun 2023 04:22:38 -0700 (PDT)
X-Received: by 2002:a05:6870:d450:b0:1a2:7f63:9920 with SMTP id
 j16-20020a056870d45000b001a27f639920mr911793oag.26.1686309758094; Fri, 09 Jun
 2023 04:22:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230605144812.15241-1-tzimmermann@suse.de> <20230605144812.15241-31-tzimmermann@suse.de>
 <CAMuHMdVP2hrgXaZvASnHJ4M+VXaTCtfbeVXrq2dsEJqcs3G6ZA@mail.gmail.com>
 <e5d88ca8-66fe-b5ee-cb6b-2dc8f3a3fb26@suse.de> <CAMuHMdWBUKTgfCD9VLDFh_Tm1J-NJQHpxODs-TuYM7V-dtmGjA@mail.gmail.com>
 <873532eurg.fsf@minerva.mail-host-address-is-not-set> <77252bc9-e08e-fcee-d140-2b78ab768b42@suse.de>
 <CAMuHMdWUkZDcYfndf1A+cgcN5Fz1hmst4LrpA7iYCFqWSRTNDA@mail.gmail.com>
 <4df23439-462f-47da-890d-2dd2092eea35@suse.de> <CAMuHMdWrTairp5h-fmkG9+xwzna+T4QmPuMeshd0UB8ZhQF8Sg@mail.gmail.com>
 <66548126-e39f-72a6-60bc-ed6d0cc82ae7@suse.de>
In-Reply-To: <66548126-e39f-72a6-60bc-ed6d0cc82ae7@suse.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 9 Jun 2023 13:22:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWP7BBPZuJDzRs9Fvhqq7eO30poZoJRgLCPyoamUkfANg@mail.gmail.com>
Message-ID: <CAMuHMdWP7BBPZuJDzRs9Fvhqq7eO30poZoJRgLCPyoamUkfANg@mail.gmail.com>
Subject: Re: [PATCH 30/30] fbdev: Make support for userspace interfaces configurable
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     daniel.thompson@linaro.org, lee@kernel.org,
        linux-sh@vger.kernel.org, jingoohan1@gmail.com, deller@gmx.de,
        linux-staging@lists.linux.dev,
        Javier Martinez Canillas <javierm@redhat.com>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-omap@vger.kernel.org, sam@ravnborg.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Thomas,

On Fri, Jun 9, 2023 at 1:04 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Am 09.06.23 um 11:14 schrieb Geert Uytterhoeven:
> [...]
> >
> >>> What do you think low-end embedded devices with an out-of-tree[*]
> >>> fbdev driver are using?
> >>
> >> And those do not count either. IIRC Android used to be built on top of
> >> fbdev devices. I'm not sure if they have moved to DRM by now. But
> >> embedded uses dedicated kernels and kernel configs.  It's easy for them
> >> to set FB_DEVICE=y.  We're not going to take away the fbdev device entirely.
> >
> > The point is that we do not suddenly disable functionality that users
> > may depend on. While "make oldconfig" will show users the new
> > FB_DEVICE question, (and hopefully they'll notice), "make olddefconfig"
> > and "make <foo>_defconfig" won't, possibly causing regressions.
> > Without a suitable default, you should IMHO at least update all
> > defconfigs that enable any fbdev drivers.
>
> Didn't I already say that we should make it "default y" if that's
> preferable in practice?

OK, sorry, I seem to have missed that part.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
