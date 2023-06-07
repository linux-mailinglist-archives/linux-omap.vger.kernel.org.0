Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE5847272B6
	for <lists+linux-omap@lfdr.de>; Thu,  8 Jun 2023 01:08:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230099AbjFGXIc (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 7 Jun 2023 19:08:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229958AbjFGXIb (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 7 Jun 2023 19:08:31 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3CF010DE
        for <linux-omap@vger.kernel.org>; Wed,  7 Jun 2023 16:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686179270;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=CzPJdjd02VNeNLl14O4tReNjsYBGUu/pZADGgCv1i2o=;
        b=P0B575QpeGCgdIRunxcKZOFm3Srw3NZJdBG4UNe9tWC2u2lcF5yYG3+G6farNIgqgzFUDT
        tBZ1J+52yQ3TCH0HgMhVLtGBpAzdtVq3x5ysno9LcwRsBFS8ctknPCjWBp1HcYhio7ncd2
        08gPqcJuDCYimYEjKS8jnw915vzNqzc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-659-vtPURXhWNFCmk0Xgt1AQYg-1; Wed, 07 Jun 2023 19:07:49 -0400
X-MC-Unique: vtPURXhWNFCmk0Xgt1AQYg-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-3f5fc8581a9so39389665e9.0
        for <linux-omap@vger.kernel.org>; Wed, 07 Jun 2023 16:07:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686179268; x=1688771268;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CzPJdjd02VNeNLl14O4tReNjsYBGUu/pZADGgCv1i2o=;
        b=Po7rxdInePDPUKYAxV305kO7s2gOgojSZmDyiz7eR0zr6oTYlSNOFzsweFt9JITDvP
         H+mefYVBdSQ5fBkxYc/yuqlyy5g1Jr11JlMUXaYMWrOslGk6Ng9JCDuvycaI/XRrb2W7
         /f6vfW5rbJvPtwHWB2HrRGyjrgqoPlDwZoxTT6ey6QJqU4m8bRUyuITg2FiNyH8lOPfl
         dyhKhRv8197vGBi5slHwC7zDIijRtXDNns+Ylw2fd8DqqRAscM5tZIqxgpO9ZbxCcrz/
         SpCWt7GvqQKxTCR847WQAuZlPMJa6kIaxIGWNh64Xc7z38Wds68hPCrKncxKeDdEqN9G
         gw8A==
X-Gm-Message-State: AC+VfDx2oy3EnLbJbucihb3G+a5xfFMqReq52yT5NXtCAakSw7voEj33
        BAOGzPfvZMYsQg+RZgpslqHSd20SewtizqjtVdm1TAYHTdUNAakgLaDN6Jx1HVxiFJF0gxJyLH3
        KFkogbS4yf0MDJV2mnrJZXg==
X-Received: by 2002:a05:600c:287:b0:3f6:f7c:b3fa with SMTP id 7-20020a05600c028700b003f60f7cb3famr5617454wmk.31.1686179268612;
        Wed, 07 Jun 2023 16:07:48 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7yuzlNYlFd9At+efr6s7V++AJjpo4wp6t37d3PBdQ42FjEQ40JOh3bqJjvNUUJHF19hKrWRw==
X-Received: by 2002:a05:600c:287:b0:3f6:f7c:b3fa with SMTP id 7-20020a05600c028700b003f60f7cb3famr5617443wmk.31.1686179268312;
        Wed, 07 Jun 2023 16:07:48 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id l8-20020a7bc448000000b003f42328b5d9sm96487wmi.39.2023.06.07.16.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 16:07:47 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc:     daniel.thompson@linaro.org, linux-staging@lists.linux.dev,
        linux-sh@vger.kernel.org, jingoohan1@gmail.com, deller@gmx.de,
        lee@kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-omap@vger.kernel.org,
        sam@ravnborg.org
Subject: Re: [PATCH 30/30] fbdev: Make support for userspace interfaces
 configurable
In-Reply-To: <CAMuHMdWBUKTgfCD9VLDFh_Tm1J-NJQHpxODs-TuYM7V-dtmGjA@mail.gmail.com>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-31-tzimmermann@suse.de>
 <CAMuHMdVP2hrgXaZvASnHJ4M+VXaTCtfbeVXrq2dsEJqcs3G6ZA@mail.gmail.com>
 <e5d88ca8-66fe-b5ee-cb6b-2dc8f3a3fb26@suse.de>
 <CAMuHMdWBUKTgfCD9VLDFh_Tm1J-NJQHpxODs-TuYM7V-dtmGjA@mail.gmail.com>
Date:   Thu, 08 Jun 2023 01:07:47 +0200
Message-ID: <873532eurg.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Geert Uytterhoeven <geert@linux-m68k.org> writes:

Hello Geert and Thomas,

> Hi Thomas,
>
> On Wed, Jun 7, 2023 at 5:15=E2=80=AFPM Thomas Zimmermann <tzimmermann@sus=
e.de> wrote:
>> Am 07.06.23 um 10:48 schrieb Geert Uytterhoeven:
>> > On Mon, Jun 5, 2023 at 4:48=E2=80=AFPM Thomas Zimmermann <tzimmermann@=
suse.de> wrote:
>> >> --- a/drivers/video/fbdev/Kconfig
>> >> +++ b/drivers/video/fbdev/Kconfig
>> >> @@ -57,6 +57,15 @@ config FIRMWARE_EDID
>> >>            combination with certain motherboards and monitors are kno=
wn to
>> >>            suffer from this problem.
>> >>
>> >> +config FB_DEVICE
>> >> +        bool "Provide legacy /dev/fb* device"
>> >
>> > Perhaps "default y if !DRM", although that does not help for a
>> > mixed drm/fbdev kernel build?
>>
>> We could simply set it to "default y".  But OTOH is it worth making it a
>> default? Distributions will set it to the value they need/want. The very
>> few people that build their own kernels to get certain fbdev drivers
>> will certainly be able to enable the option by hand as well.
>
> Defaulting to "n" (the default) means causing regressions when these
> few people use an existing defconfig.
>

Having "dfault y if !DRM" makes sense to me. I guess is a corner case but
at least it won't silently be disabled for users that only want fbdev as
Geert mentioned.

I wouldn't call it a regression though, because AFAIK the Kconfig options
are not a stable API ?

>> > Or reserve "FB" for real fbdev drivers, and introduce a new FB_CORE,
>> > to be selected by both FB and DRM_FBDEV_EMULATION?
>> > Then FB_DEVICE can depend on FB_CORE, and default to y if FB.

Funny that you mention because it's exactly what I attempted in the past:

https://lore.kernel.org/all/20210827100531.1578604-1-javierm@redhat.com/T/#u

>>
>> That wouldn't work. In Tumbleweed, we still have efifb and vesafb
>> enabled under certain conditions; merely for the kernel console. We'd
>> have to enable CONFIG_FB, which would bring back the device.
>
> "Default y" does not mean that you cannot disable FB_DEVICE, so
> you are not forced to bring back the device?
>

I think we can have both to make the kernel more configurable:

1) Allow to only disable fbdev user-space APIs (/dev/fb?, /proc/fb, etc),
   which is what the series is doing with the new FB_DEVICE config symbol.

2) Allow to disable all "native" fbdev drivers and only keep the DRM fbdev
   emulation layer. That's what my series attempted to do with the FB_CORE
   Kconfig symbol.

I believe that there are use cases for both, for example as Thomas' said
many distros are disabling all the fbdev drivers and their user-space only
requires DRM/KMS, so makes sense to not expose any fbdev uAPI at all.

But may be that other users want the opposite, they have an old user-space
that requires fbdev, but is running on newer hardware that only have a DRM
driver. So they will want DRM fbdev emulation but none fbdev driver at all.

That's why I think that FB_DEVICE and FB_CORE are complementary and we can
support any combination of the two, if you agree there are uses for either.

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

