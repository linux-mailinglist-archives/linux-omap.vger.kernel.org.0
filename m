Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0EAF6729677
	for <lists+linux-omap@lfdr.de>; Fri,  9 Jun 2023 12:13:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238390AbjFIKNC (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 9 Jun 2023 06:13:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230323AbjFIKMc (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 9 Jun 2023 06:12:32 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E46BF527C
        for <linux-omap@vger.kernel.org>; Fri,  9 Jun 2023 03:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686304785;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Ro28qLwMycjBPd4B2CfnKUVLQYPM9zhy62Il4fiHOKA=;
        b=Ez3kqZMfSnmemSoJQ310mBXayNO3wvlwN77EFNXOGDcrH82UxMOj9Sx6XyCnZT7I1jvB7C
        Ee6pUCKT6//BU6tjM2/eMjV0cBEMbhfPkMQir6NtdMyekcR66akdGIkAmEgKkqbaaPjKj0
        lKtLUs4vLZahRnCMbxmB4UxHRT/6U0s=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-53-We7YizmDM8-rz7PTwGoTdQ-1; Fri, 09 Jun 2023 05:59:43 -0400
X-MC-Unique: We7YizmDM8-rz7PTwGoTdQ-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-30ae9958ff6so679776f8f.1
        for <linux-omap@vger.kernel.org>; Fri, 09 Jun 2023 02:59:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686304782; x=1688896782;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ro28qLwMycjBPd4B2CfnKUVLQYPM9zhy62Il4fiHOKA=;
        b=L13+218dk1DkuG56PnZQTO5M1H5jYp7TgqY9RIw2RzrRfvY2mklIws0uNp9fvayvKh
         uMDCrA/wkqgnPeXaKff9mqOlQLKOBAqKSWkBtLQkymcvf6RZhaNIbULRNpTx/lI18Nj+
         N7ZIJ81eS1NqNMu38hcIlzXKMKcLZ/AvnBWfZOKcj0DBK7L1YmSAKR9ToN0bqfIMEDSB
         NIVl7ntrw9B4iscoE9YGXmJ59i6SMQCfY8U/5kIXgUqqImq8/sFBpue16KxvRKhsiAyy
         DtjiJ/lKd7/elsVJLlK+eGA8uJ8pxJQ8AVQ6bTkRarJCHS1+pUQnKA0zd43yD4d4xM9a
         waIw==
X-Gm-Message-State: AC+VfDzSDRY73ANNSzs7C3jZw93xq8t9kM4bn2JuMjAVgG06Jq3U06Om
        6rAtCI2bk2DaO5Yrt5ExMpPOOw8iRZjVnyd0mhYILAp+SE3woQscNOFo7SfReABE6eGc3I2b315
        DVlakdTzPBlZOk9MqdkcH0Q==
X-Received: by 2002:a05:6000:1cc1:b0:30d:981d:a049 with SMTP id bf1-20020a0560001cc100b0030d981da049mr475563wrb.4.1686304782623;
        Fri, 09 Jun 2023 02:59:42 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5mbChq3eZ0n/KPDmx58FVgNTALqSeH3ETuPMsy/BuQZAfQWRgbheMcufPP8W0/LTSPFhyPxg==
X-Received: by 2002:a05:6000:1cc1:b0:30d:981d:a049 with SMTP id bf1-20020a0560001cc100b0030d981da049mr475549wrb.4.1686304782266;
        Fri, 09 Jun 2023 02:59:42 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id d17-20020a5d6dd1000000b003095bd71159sm4029755wrz.7.2023.06.09.02.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 02:59:41 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     daniel.thompson@linaro.org, linux-staging@lists.linux.dev,
        linux-sh@vger.kernel.org, jingoohan1@gmail.com, deller@gmx.de,
        lee@kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-omap@vger.kernel.org,
        sam@ravnborg.org
Subject: Re: [PATCH 30/30] fbdev: Make support for userspace interfaces
 configurable
In-Reply-To: <4df23439-462f-47da-890d-2dd2092eea35@suse.de>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-31-tzimmermann@suse.de>
 <CAMuHMdVP2hrgXaZvASnHJ4M+VXaTCtfbeVXrq2dsEJqcs3G6ZA@mail.gmail.com>
 <e5d88ca8-66fe-b5ee-cb6b-2dc8f3a3fb26@suse.de>
 <CAMuHMdWBUKTgfCD9VLDFh_Tm1J-NJQHpxODs-TuYM7V-dtmGjA@mail.gmail.com>
 <873532eurg.fsf@minerva.mail-host-address-is-not-set>
 <77252bc9-e08e-fcee-d140-2b78ab768b42@suse.de>
 <CAMuHMdWUkZDcYfndf1A+cgcN5Fz1hmst4LrpA7iYCFqWSRTNDA@mail.gmail.com>
 <4df23439-462f-47da-890d-2dd2092eea35@suse.de>
Date:   Fri, 09 Jun 2023 11:59:41 +0200
Message-ID: <87h6rh552q.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Thomas Zimmermann <tzimmermann@suse.de> writes:

Hello Thomas,

> Hi
>

[...]
 
>>> I'd also question the argument that there's even fbdev userspace out
>>> there. It was never popular in it's heyday and definitely hasn't
>>> improved since then. Even the 3 people who still ask for fbdev support
>> 
>> There's X.org, DirectFB, SDL, ...
>
> None of these examples has a dependency on fbdev. They can freely switch 
> backends and have moved to DRM. Anything program utilizing these 
> examples has no dependency on fbdev either.
>
> When I say "userspace" in this context, it's the one old program that 
> supports nothing but fbdev. TBH I'm having problems to come up with 
> examples.
>

I personally have two real world examples that can give to you :)

1) I've a IoT device at home that has a bunch of sensors (temperatury,
   humidity, etc) and a SSD1306 display panel to report that. It just
   has small fbdev program to print that info. I could probably port
   to KMS but didn't feel like it. Found a fbdev program that I could
   modify and got the job done.

2) I built a portable retro console for my kids, that uses a ST7735R
   LCD panel. The software I use is https://www.retroarch.com/ which
   uses fbdev by default (I believe that supports a KMS mode but out
   of the box it works with fbdev and that's better tested by them.
   
So even when I'm not interested and don't want to enable any of the
fbdev drivers, I want to use the ssd130x and st7735r DRM drivers and
the DRM fbdev emulation layer.

In other words, there's real use cases for supporting fbdev programs
with DRM drivers. Now, I agree with this patch-set and probably will
disable the user-space fbdev interface in Fedora, but on my embedded
projects I will probably keep it enabled.

That's why I think that we should support the following combinations:

* fbdev drivers + DRM fbdev emulation + fbdev user-space
* only DRM drivers without fbdev emulation nor fbdev user-space (your series)
* only DRM fbdev emulation + fbdev user-space enabled (FB_CORE)

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

