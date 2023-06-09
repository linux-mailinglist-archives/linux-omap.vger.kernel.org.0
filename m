Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D65F7296B3
	for <lists+linux-omap@lfdr.de>; Fri,  9 Jun 2023 12:20:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231708AbjFIKUc convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-omap@lfdr.de>); Fri, 9 Jun 2023 06:20:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241676AbjFIKTt (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 9 Jun 2023 06:19:49 -0400
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A6BA72A5;
        Fri,  9 Jun 2023 03:11:12 -0700 (PDT)
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-6b291d55f52so502777a34.2;
        Fri, 09 Jun 2023 03:11:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686305464; x=1688897464;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8JNw6xq3QFRhZzqNc9XYPo1ExQ/ZW3vKLniJaHHIba4=;
        b=LI4qKsoHUpTWo/+mHHBiP0yUaFHqkwaK+kszOVdSetdSSZFpVDumHLprWjGxXImlYS
         /zAi/plXvndks1EaSgWbk3vDC+GkAad1rc1xjTWW/wOBHuoIHzFULqn5vZhSN1hybg8W
         Ca6xWIfAfkaKlTtARcDrf7t+jl6+YP05aziKc7Ot4gU/hUJAE3OcO3+v8qN9R/gCA4ii
         31nJ8Twopv+tgDz8w4GDYgVfZfrD0CgYK2ghR5Foi4tzt1cPh4DxKiZ++z34M9CQE7P2
         hOaLAd2vWnJwQDzi/ZJdbaZ6uQAYd+OWEpk+O/JnFK6kCp5nWAQLee+nZCOnFLayMnDt
         P9EQ==
X-Gm-Message-State: AC+VfDzPGANHh+9slZsRkyjyuSh4ou/RhSoldFIgRsPCPu2oyC1Yu4x/
        dJELnpjhy5bRe9xxXlMv4KJlASZ5m6NkAw==
X-Google-Smtp-Source: ACHHUZ4i+2Oe+cywJ8ana03+xa9ayYjlj8UyHI8rhFaHcyX6Wx4SGZ+07s3oi37WgbHIsOvOKAqoaw==
X-Received: by 2002:a9d:6851:0:b0:6ac:a677:9dff with SMTP id c17-20020a9d6851000000b006aca6779dffmr877356oto.4.1686305463872;
        Fri, 09 Jun 2023 03:11:03 -0700 (PDT)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com. [209.85.167.175])
        by smtp.gmail.com with ESMTPSA id o1-20020a9d7641000000b006a3f4c6f138sm1260651otl.36.2023.06.09.03.11.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jun 2023 03:11:01 -0700 (PDT)
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-390723f815fso456956b6e.3;
        Fri, 09 Jun 2023 03:11:01 -0700 (PDT)
X-Received: by 2002:a05:6808:20aa:b0:39a:a92b:c546 with SMTP id
 s42-20020a05680820aa00b0039aa92bc546mr1301127oiw.19.1686305461101; Fri, 09
 Jun 2023 03:11:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230605144812.15241-1-tzimmermann@suse.de> <20230605144812.15241-31-tzimmermann@suse.de>
 <CAMuHMdVP2hrgXaZvASnHJ4M+VXaTCtfbeVXrq2dsEJqcs3G6ZA@mail.gmail.com>
 <e5d88ca8-66fe-b5ee-cb6b-2dc8f3a3fb26@suse.de> <CAMuHMdWBUKTgfCD9VLDFh_Tm1J-NJQHpxODs-TuYM7V-dtmGjA@mail.gmail.com>
 <873532eurg.fsf@minerva.mail-host-address-is-not-set> <77252bc9-e08e-fcee-d140-2b78ab768b42@suse.de>
 <CAMuHMdWUkZDcYfndf1A+cgcN5Fz1hmst4LrpA7iYCFqWSRTNDA@mail.gmail.com>
 <4df23439-462f-47da-890d-2dd2092eea35@suse.de> <87h6rh552q.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <87h6rh552q.fsf@minerva.mail-host-address-is-not-set>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 9 Jun 2023 12:10:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU27OK1=B6Qgwd+tyda=MmN0EiC8taUpvAJJOYUFcm88A@mail.gmail.com>
Message-ID: <CAMuHMdU27OK1=B6Qgwd+tyda=MmN0EiC8taUpvAJJOYUFcm88A@mail.gmail.com>
Subject: Re: [PATCH 30/30] fbdev: Make support for userspace interfaces configurable
To:     Javier Martinez Canillas <javierm@redhat.com>
Cc:     Thomas Zimmermann <tzimmermann@suse.de>,
        daniel.thompson@linaro.org, linux-staging@lists.linux.dev,
        linux-sh@vger.kernel.org, jingoohan1@gmail.com, deller@gmx.de,
        lee@kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-omap@vger.kernel.org,
        sam@ravnborg.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Javier,

On Fri, Jun 9, 2023 at 11:59 AM Javier Martinez Canillas
<javierm@redhat.com> wrote:
> Thomas Zimmermann <tzimmermann@suse.de> writes:
> >>> I'd also question the argument that there's even fbdev userspace out
> >>> there. It was never popular in it's heyday and definitely hasn't
> >>> improved since then. Even the 3 people who still ask for fbdev support
> >>
> >> There's X.org, DirectFB, SDL, ...
> >
> > None of these examples has a dependency on fbdev. They can freely switch
> > backends and have moved to DRM. Anything program utilizing these
> > examples has no dependency on fbdev either.
> >
> > When I say "userspace" in this context, it's the one old program that
> > supports nothing but fbdev. TBH I'm having problems to come up with
> > examples.
> >
>
> I personally have two real world examples that can give to you :)
>
> 1) I've a IoT device at home that has a bunch of sensors (temperatury,
>    humidity, etc) and a SSD1306 display panel to report that. It just
>    has small fbdev program to print that info. I could probably port
>    to KMS but didn't feel like it. Found a fbdev program that I could
>    modify and got the job done.
>
> 2) I built a portable retro console for my kids, that uses a ST7735R
>    LCD panel. The software I use is https://www.retroarch.com/ which
>    uses fbdev by default (I believe that supports a KMS mode but out
>    of the box it works with fbdev and that's better tested by them.
>
> So even when I'm not interested and don't want to enable any of the
> fbdev drivers, I want to use the ssd130x and st7735r DRM drivers and
> the DRM fbdev emulation layer.
>
> In other words, there's real use cases for supporting fbdev programs
> with DRM drivers. Now, I agree with this patch-set and probably will
> disable the user-space fbdev interface in Fedora, but on my embedded
> projects I will probably keep it enabled.
>
> That's why I think that we should support the following combinations:
>
> * fbdev drivers + DRM fbdev emulation + fbdev user-space

"fbdev drivers + fbdev user-space", I assume?

> * only DRM drivers without fbdev emulation nor fbdev user-space (your series)

Thomas' series includes fbdev emulation here, for the text console.

> * only DRM fbdev emulation + fbdev user-space enabled (FB_CORE)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
