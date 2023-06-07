Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3CD22725932
	for <lists+linux-omap@lfdr.de>; Wed,  7 Jun 2023 11:02:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239281AbjFGJCd (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 7 Jun 2023 05:02:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239324AbjFGJCC (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 7 Jun 2023 05:02:02 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDAB826B9
        for <linux-omap@vger.kernel.org>; Wed,  7 Jun 2023 01:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686128373;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=jAHIJ4eh7v+dqxg6uWyXvuAZ3noGOIESAVR0yVwLrLw=;
        b=AwE/1Lz7S9+DISUHrdxHlFzrjHflccu3Vy1k2uMBfgPNiDPS12KeWvAUpTN3eOhmPmyglg
        QTSS726axtlmvIOvRBZ8ngELeHZT9/SvdBC/baNX7H88E2xV3SkauI5GFuPjULAR44WB4Q
        UobZbpwLqVsKs/BqSpnDd3N/ZkvrttI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-376-ozaIcVVYMmGnn9u6abPTyg-1; Wed, 07 Jun 2023 04:59:31 -0400
X-MC-Unique: ozaIcVVYMmGnn9u6abPTyg-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-3f603fed174so40248825e9.2
        for <linux-omap@vger.kernel.org>; Wed, 07 Jun 2023 01:59:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686128370; x=1688720370;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jAHIJ4eh7v+dqxg6uWyXvuAZ3noGOIESAVR0yVwLrLw=;
        b=Zu+f3MtpRAV46P+8GBoHYXhnZ6gRzgq+uwp1TsK+Zq5otuYMD+DEEumHNZxAZ4Ab8u
         Fl03hsdPqLD28MDbqYE4wfHCnNXLLM7c9g1huxAMijwv5yfK4DWiit63cl+uS90M1QTW
         uQGYVTAtkkxKd1xM0Z4AcjBJnToBNQXGf8W6ST+nKpOQvKjhFJK0HHYfbve7roNfCuoQ
         4mbhMvCp8r5a3Rdg6s/th8iq7w5o4HBcL8q4uJDsySrhaAL/EfJBe4Jxjc7GtFA3nMcb
         0C2RxAJH/TYU2indD7URipkYh4z4w/o5GvHJ7prrVI2/3Qekum11DB6sK81za/YNeDQe
         OIZQ==
X-Gm-Message-State: AC+VfDzvYDRnTPuyiB+68PuIWbgsm/eF4iZXHOiUBgjpLeuKzN62iJ0D
        U5rz4DeTyxAQuWiu+OQ7SSUC3u8x+jBV0VolgF3mkvmrskEboAiE44a5itH6j2ffFCs1FGVJA2F
        LnkWT3ZZnfmqgt9KRJpBIHA==
X-Received: by 2002:a1c:4b0d:0:b0:3f7:5e07:ea54 with SMTP id y13-20020a1c4b0d000000b003f75e07ea54mr4233929wma.13.1686128370565;
        Wed, 07 Jun 2023 01:59:30 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4Qn3iTdYPwZ2PEqyICfVMTtkj5C/L8grzoRqC+iaiUjGk+XghGobRkAfICwnQ/2eAeuKuydg==
X-Received: by 2002:a1c:4b0d:0:b0:3f7:5e07:ea54 with SMTP id y13-20020a1c4b0d000000b003f75e07ea54mr4233912wma.13.1686128370260;
        Wed, 07 Jun 2023 01:59:30 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id v10-20020a05600c470a00b003f1978bbcd6sm6448319wmo.3.2023.06.07.01.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 01:59:30 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
        sam@ravnborg.org, deller@gmx.de, geert+renesas@glider.be,
        lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-sh@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-staging@lists.linux.dev,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 10/30] fbdev/ep93xx-fb: Output messages with fb_info()
 and fb_err()
In-Reply-To: <20230605144812.15241-11-tzimmermann@suse.de>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-11-tzimmermann@suse.de>
Date:   Wed, 07 Jun 2023 10:59:29 +0200
Message-ID: <87legvfy1a.fsf@minerva.mail-host-address-is-not-set>
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

> Fix cases were output helpers are called with struct fb_info.dev.
> Use fb_info() and fb_err() instead.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

