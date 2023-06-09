Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D39C87296EF
	for <lists+linux-omap@lfdr.de>; Fri,  9 Jun 2023 12:33:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239970AbjFIKdR (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 9 Jun 2023 06:33:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240040AbjFIKcr (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 9 Jun 2023 06:32:47 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6657B468D
        for <linux-omap@vger.kernel.org>; Fri,  9 Jun 2023 03:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686306280;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=mMg53JOrE7LdjfO2Cif2xn5d4s7Q5BrveDabIgOUiSQ=;
        b=gdRy1DbMh/dkWMrEuGnXxjFvvC17t200P9NUQY4QQkjDn0pf7kR7d/fWNu4MCT4ek8LWrt
        E7GoGUsIhYicAF3X/Jx/bzETSnnw7hti9S3B6lBc6pPBXC5JfnPpBXxlFyH0yZXT7Pk5kB
        SEyODphYfGAI5Lqrx6Yv7QNboOsQI8Q=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-316-5oaAKgVkOq-s64gfLYL2wg-1; Fri, 09 Jun 2023 06:24:39 -0400
X-MC-Unique: 5oaAKgVkOq-s64gfLYL2wg-1
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-4f60dd5ab21so1324066e87.3
        for <linux-omap@vger.kernel.org>; Fri, 09 Jun 2023 03:24:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686306278; x=1688898278;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mMg53JOrE7LdjfO2Cif2xn5d4s7Q5BrveDabIgOUiSQ=;
        b=PyJTf1kx1UbM2CzNdvUNJOu4BfCxOj2EHL4HDwg7c5RlxIE36pPHdntJqhw8H5n3yt
         rNr7AABaLfx2AAhkeWHcky1HsyqU+CiRHx48RkQBqv5VkFknMGOExSvmo4U+X7IR/X07
         RP9v2C0KB0X79wW6rw+ZE8kI/wyT0IOT5jA3xFpwKKR0M2qWs2PwtQFtiuEnBK81wh1g
         Wv5h/wXveI4VyvvHs8US7Cxs3DGhkgishn8fcX4KjfbMpAGphPZ3ZgwdLnXOwMCw/ByB
         vzjQfEttT4Lnew8po+ey5WiDNYfT9iA5Wsy7zadwmxOK1hh318tiSt4ISvDZ6uT4t0kR
         jamQ==
X-Gm-Message-State: AC+VfDwOFFpHzDvkLxUIiBIoFOq+MWWS/SsAa0L8Z1Gn6kZFYWcAW5xG
        KqAjshoAYlQCVyfVn2NgKj+1W9/f9JNPV7STY9uhX5OUPUzEilTHkwqakJOUr30zArHyI5S7j8d
        1BfFE8/WYjvgEz0RlqY9BQQ==
X-Received: by 2002:a19:914f:0:b0:4f3:a483:557 with SMTP id y15-20020a19914f000000b004f3a4830557mr619114lfj.5.1686306277832;
        Fri, 09 Jun 2023 03:24:37 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6S3RszxExiKf60rjrxsF2OLyJFkoRpusOuEfLcjyVkibfQrgNaGV/G0ODH5bqwWreayNq8WQ==
X-Received: by 2002:a19:914f:0:b0:4f3:a483:557 with SMTP id y15-20020a19914f000000b004f3a4830557mr619101lfj.5.1686306277475;
        Fri, 09 Jun 2023 03:24:37 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id y14-20020adfdf0e000000b003063772a55bsm4046255wrl.61.2023.06.09.03.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 03:24:37 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Thomas Zimmermann <tzimmermann@suse.de>,
        daniel.thompson@linaro.org, linux-staging@lists.linux.dev,
        linux-sh@vger.kernel.org, jingoohan1@gmail.com, deller@gmx.de,
        lee@kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-omap@vger.kernel.org,
        sam@ravnborg.org
Subject: Re: [PATCH 30/30] fbdev: Make support for userspace interfaces
 configurable
In-Reply-To: <CAMuHMdU27OK1=B6Qgwd+tyda=MmN0EiC8taUpvAJJOYUFcm88A@mail.gmail.com>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-31-tzimmermann@suse.de>
 <CAMuHMdVP2hrgXaZvASnHJ4M+VXaTCtfbeVXrq2dsEJqcs3G6ZA@mail.gmail.com>
 <e5d88ca8-66fe-b5ee-cb6b-2dc8f3a3fb26@suse.de>
 <CAMuHMdWBUKTgfCD9VLDFh_Tm1J-NJQHpxODs-TuYM7V-dtmGjA@mail.gmail.com>
 <873532eurg.fsf@minerva.mail-host-address-is-not-set>
 <77252bc9-e08e-fcee-d140-2b78ab768b42@suse.de>
 <CAMuHMdWUkZDcYfndf1A+cgcN5Fz1hmst4LrpA7iYCFqWSRTNDA@mail.gmail.com>
 <4df23439-462f-47da-890d-2dd2092eea35@suse.de>
 <87h6rh552q.fsf@minerva.mail-host-address-is-not-set>
 <CAMuHMdU27OK1=B6Qgwd+tyda=MmN0EiC8taUpvAJJOYUFcm88A@mail.gmail.com>
Date:   Fri, 09 Jun 2023 12:24:36 +0200
Message-ID: <87edml53x7.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Geert Uytterhoeven <geert@linux-m68k.org> writes:


>> * fbdev drivers + DRM fbdev emulation + fbdev user-space
>
> "fbdev drivers + fbdev user-space", I assume?
>

Right, I meant to also include "only fbdev drivers + fbdev user-space"
but forgot :)

>> * only DRM drivers without fbdev emulation nor fbdev user-space (your series)
>
> Thomas' series includes fbdev emulation here, for the text console.
>

Yes, I meant fbdev emulation for user-space. Probably should had included
fbcon in the options too...

But what I tried to say is that we need all combination of DRM drivers,
fbdev drivers, DRM emulation for fbcon and emulation for fbdev user-space.

And I think that Thomas' series + a FB_CORE as you suggested and done in
my old series should be enough to have that.

--
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

